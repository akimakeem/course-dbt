with src_users as (

    select * from  {{ source('postgres', 'users') }} 
), 
final as (
    select
       
      USER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, CREATED_AT, UPDATED_AT, ADDRESS_ID
      FROM 
          src_users
)

select * FROM final