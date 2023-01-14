with src_orders as (

    select * from  {{ source('postgres', 'orders') }} 
), 
renamed_order as (
    select
          order_id as order_guid, 
          user_id as user_guid,
          promo_id as promo_desc,
          address_id as address_guid,
          created_at::timestampntz as created_at_utc,
          order_cost,
          shipping_cost,
          order_total,
          tracking_id, 
          shipping_service,
          estimated_delivery_at::timestampntz as estimated_delivery_at_utc,
          delivered_at::timestampntz as delivered_at_utc,
          status
      FROM 
          src_orders
)

select * FROM renamed_order