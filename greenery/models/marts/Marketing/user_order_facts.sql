{{
  config(
    materialized='table'
  )
}}

with order_stats as 
(
select user_guid,
       count(distinct o.order_guid) as order_count, 
       min(created_at_utc) as first_order,
       max(created_at_utc) as last_order,
       sum(order_total) as total_spend 
from 
    {{ref('stg_postgres__orders')}} o
group by user_guid
)

select 
       order_count,
       first_order,
       last_order,
       total_spend,
       user_id, 
       first_name, 
       last_name,
       email, 
       phone_number, 
       created_At, 
       updated_at,
       address_id

from 
    {{ref('stg_postgres__users')}}  a
left join
     order_stats o on a.user_id = o.user_guid



