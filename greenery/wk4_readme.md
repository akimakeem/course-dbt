# Week 4 summary:

##  Which orders changed from week 3 to week 4? 
```
  SELECT 
      ORDER_ID
FROM 
     DEV_DB.DBT_ORLERYINKERGMAILCOM.ORDERS_SNAPSHOT
WHERE 
dbt_valid_from::date >= '2023-02-01'
```
### 6 orders were changed 
 - e2729b7d-e313-4a6f-9444-f7f65ae8db9a
 - 29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6
 - df91aa85-bfc7-4c31-93ef-4cee8d00a343
 - 841074bf-571a-43a6-963c-ba7cbdb26c85
 - c0873253-7827-4831-aa92-19c38372e58d
 - 0e9b8ee9-ad0a-42f4-a778-e1dd3e6f6c51


##  How are users moving through product funnel

    ### Product funnel is defined with 3 levels for our dataset:

         - Sessions with any event of type page_view

         - Sessions with any event of type add_to_cart

         - Sessions with any event of type checkout

Developed a fact_product_funnel model, this contains granular details of 
        - users, products, session, and the three categories of the funnel listed above. The script below will be use by BI tool to visualize the funnel 
```
SELECT 
      user_id,product_id, product_name,
      sum(add_to_cart) as add_to_carts,
      sum(checkout) as checkouts,
      sum(page_view) as page_views
      
FROM 
     DEV_DB.DBT_ORLERYINKERGMAILCOM.fact_product_funnel
group by user_id,product_id, product_name
```
