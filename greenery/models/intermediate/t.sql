{{ config(materialized='table') }}



with session_events as (
  select * from {{ ref('stg_postgres__events') }}
)

, final  AS(   
    SELECT
     a.product_id as product_guid
    ,user_id
    ,session_id
    , count(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_carts
    , count(case when event_type = 'checkout' then 1 else 0 end) as checkouts
    , count(case when event_type = 'package_shipped' then 1 else 0 end) as package_shipped
    , count(case when event_type = 'page_view' then 1 else 0 end) as page_views
    , min(created_at) as first_session_event_at_utc
    , max(created_at) as last_session_event_at_utc
    
FROM 
    session_events a
left  JOIN {{ ref('stg_postgres__order_items') }} b on a.order_id = b.order_guid
where a.product_id is not NULL
GROUP BY 1,2,3
)

SELECT * FROM final
