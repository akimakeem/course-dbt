select 
  user_id, 
 -- first_name, 
 -- last_name, 
  CONCAT(first_name, ' ', last_name) as fullname,
  email, 
  phone_number, 
  created_at, 
  updated_at, 
  u.address_id,
  address,
  zipcode,
  state,
  country
 
from 
  {{ref('stg_postgres__users')}} u
left join 
  {{ref('stg_postgres__addresses')}} a on u.address_id = a.address_id