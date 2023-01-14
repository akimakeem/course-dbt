{% snapshot orders_snapshot %}

{{
  config(
    target_database = target.database,
    target_schema = target.schema,
    strategy='check',
    unique_key='order_id',
    check_cols=['status'],
   )
}}

with src_orders as (

    select * from  {{ source('postgres', 'orders') }} 
), 
renamed_order as (
    select
             
        order_id,
        user_id,
        promo_id,
        address_id,
        created_at,
        order_cost,
        shipping_cost,
        order_total,
        tracking_id,
        shipping_service,
        estimated_delivery_at,
        delivered_at,
        status
      FROM 
          src_orders
)

select * FROM renamed_order

{% endsnapshot %}