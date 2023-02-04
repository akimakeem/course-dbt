with orders as (
    SELECT * FROM {{ ref('stg_postgres__orders') }}
)
, order_items as (
    SELECT * FROM {{ ref('stg_postgres__order_items') }}
)

select
      a.user_guid
    , a.order_guid
    , a.created_at_utc
    , b.product_id
    , b.quantity
from 
     order_items b
left join 
     orders a  on a.order_guid = b.order_guid