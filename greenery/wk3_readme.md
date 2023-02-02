
# Week 3 SQL Project Solutions:

##  What is our overall conversion rate ? 
```
   select 
         div0(sum(checkout), count(distinct session_id)) as conversion_rate
   from 
        DEV_DB.DBT_ORLERYINKERGMAILCOM.INT_SESSION_EVENTS_AGG;
```

 - 0.62

##  What orders changed between week 2 to week 3 ? 
```
   select 
      order_id
from 
     DEV_DB.DBT_ORLERYINKERGMAILCOM.ORDERS_SNAPSHOT
where 
     dbt_valid_to < '2023-01-30' ;
```

 - 3 orders were changed between week 2 to 3
