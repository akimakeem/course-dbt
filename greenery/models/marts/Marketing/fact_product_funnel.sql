{{ config(materialized='table') }}
 
    SELECT
     user_id
    ,a.product_id
    ,name as product_name
    ,session_id
    ,count_if(event_type = 'page_view') as page_view
    ,count_if(event_type = 'add_to_cart') as add_to_cart
    ,count_if(event_type = 'checkout') as checkout
FROM 
   {{ ref('int_product_events') }}  a
inner JOIN  {{ ref('dim_products') }}  b on a.product_id = b.product_id

GROUP BY 1,2,3,4