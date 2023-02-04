{{ config(materialized='table') }}



with session_events as (
  select * from {{ ref('stg_postgres__events') }}
)

, final  AS(   
    SELECT
     a.product_id as product_guid,
     name as product_name
     ,session_id
    , sum(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_carts
    , sum(case when event_type = 'checkout' then 1 else 0 end) as checkouts
    , sum(case when event_type = 'package_shipped' then 1 else 0 end) as package_shipped
    , sum(case when event_type = 'page_view' then 1 else 0 end) as page_views
    , min(created_at) as first_session_event_at_utc
    , max(created_at) as last_session_event_at_utc
    
FROM 
    session_events a
inner JOIN {{ ref('dim_products') }} b on a.product_id = b.product_id
GROUP BY 1,2,3
)

SELECT * FROM final
