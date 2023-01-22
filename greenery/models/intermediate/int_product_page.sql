

with 
product as (
    select 
        product_id,
        name, 
        price,
        inventory
    from {{ ref('stg_postgres__products') }}
),

events as (
    SELECT
        event_id,
        session_id,
        user_id,
        event_type,
        page_url,
        created_at,
        order_id,
        product_id
    from {{ ref('stg_postgres__events')}}
)

select 
    p.product_id
    , p.name
    , p.price
    , inventory 
    , count(distinct e.event_id) as total_events
    , count(distinct session_id) as total_sessions
    , count(distinct page_url) as total_pages
from product p 
left join events e using(product_id)
group by 1,2,3,4