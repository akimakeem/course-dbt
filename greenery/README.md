# Week 1 SQL Project Solutions:

## 1) How many users do we have?
```
    select 
         COUNT(DISTINCT USER_ID) AS user_count 
    from 
        DEV_DB.DBT_ORLERYINKERGMAILCOM.STG_POSTGRES__USERS
```

 - 130 users.


## 2) On average, how many orders do we receive per hour?
```
    select 
        count(distinct order_guid) -- order_count  
      / datediff(hour, min(created_at_utc), max(created_at_utc)) --- total hours
    from 
      DEV_DB.DBT_ORLERYINKERGMAILCOM.STG_POSTGRES__ORDERS
```

- Average of 7.68 orders per hour.


## 3) On average, how long does an order take from being placed to being delivered?
```
select avg(days) from (
                select  created_at_utc , delivered_at_utc, status,
                        datediff(day, created_at_utc, delivered_at_utc) as days
                from 
                       DEV_DB.DBT_ORLERYINKERGMAILCOM.STG_POSTGRES__ORDERS 
                where 
                        status = 'delivered' 
                        ) a
```
- Average of 3.89 or ~4 days for an order being placed to be  delivered.



## 5) On average, how many unique sessions do we have per hour ?
```
SELECT 
      count(DISTINCT session_id) --unique session count
	      / datediff(hour, min(created_at), max(created_at)) --total hours captured
	AS hourly_sessions
FROM 
    dev_db.DBT_ORLERYINKERGMAILCOM.stg_postgres__events e
```

- Average of unique sessions per hour is 10.14.




