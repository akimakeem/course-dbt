with src_products as (

    select *
    from {{ source('postgres', 'products') }}

),

final as (

    select
        product_id,
        name,
        price,
        inventory

    from src_products

)

select * from final