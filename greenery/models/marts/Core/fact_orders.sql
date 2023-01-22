{{
  config(
    materialized='table'
  )
}}
SELECT 
      order_guid,
      promo_desc,
      user_guid,
      address_guid,
      created_at_utc,
      order_cost,
      shipping_cost,
      order_total,
      tracking_id,
      shipping_service,
      estimated_delivery_at_utc,
      delivered_at_utc,
      datediff('hour',created_at_utc,delivered_at_utc) as hours_till_delivery,
      status
FROM 
    {{ ref ('stg_postgres__orders')}}
