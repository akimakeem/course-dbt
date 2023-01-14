with src_order_item as (

    select * from  {{ source('postgres', 'order_items') }} 
), 
final as (
    select
          order_id as order_guid, 
          product_id,
          quantity
      FROM 
          src_order_item
)

select * FROM final