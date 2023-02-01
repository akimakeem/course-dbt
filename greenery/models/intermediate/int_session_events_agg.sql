{{ config(materialized='table') }}

-- Calling our macro with unique event types
{% set unique_types = unique_event_types() %}


with session_events as (
  select * from {{ ref('stg_postgres__events') }}
)

, session_events_agg as (
  select
      user_id
    , session_id

   -- , sum(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_carts
    --, sum(case when event_type = 'checkout' then 1 else 0 end) as checkouts
    --, sum(case when event_type = 'package_shipped' then 1 else 0 end) as package_shippeds
    --, sum(case when event_type = 'page_view' then 1 else 0 end) as page_views
     {%- for unique_type in unique_types %}
      , sum(case when event_type = '{{unique_type}}' then 1 else 0 end) as {{unique_type}}
     {%- endfor %}
    , min(created_at) as first_session_event_at_utc
    , max(created_at) as last_session_event_at_utc
  from session_events
 {{ dbt_utils.group_by(n=2) }}

)

select * from session_events_agg