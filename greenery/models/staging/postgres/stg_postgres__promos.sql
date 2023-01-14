with src_promo as (

    select *
    from {{ source('postgres', 'promos') }}

),

final as (

    select
        promo_id,
        discount,
        status

    from src_promo

)

select * from final