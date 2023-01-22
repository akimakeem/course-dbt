

{{
  config(
    materialized='table'
  )
}}
select 
      product_id
    , name
    , price
    , inventory 
    , total_events
    , total_sessions
    , total_pages as page_views
from {{ref('int_product_page')}}