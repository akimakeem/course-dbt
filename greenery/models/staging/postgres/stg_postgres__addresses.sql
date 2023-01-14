with src_address as (

    select * from  {{ source('postgres', 'addresses') }} 
), 
final as (
    select
          address_id , 
          address,
          zipcode,
          state,
          country
      FROM 
          src_address
)

select * FROM final