{{ config(materialized='table') }}



with session_events as (
  select * from {{ ref('stg_postgres__events') }}
)

, final  AS(   
    SELECT
    coalesce(a.product_id, b.product_id) as product_id
    ,user_id
    ,session_id
    ,event_type
    
FROM 
    session_events a
left  JOIN {{ ref('stg_postgres__order_items') }} b on a.order_id = b.order_guid
)

SELECT * FROM final
