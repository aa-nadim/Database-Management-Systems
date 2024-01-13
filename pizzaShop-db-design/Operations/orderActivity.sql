-------------------------------------
-- Dashboard 1 - Order activity
-- ----------------------------------
-- For this , we will need a dashboard with the following data:
---===============================================================
-- 1. Total orders
-- 2. Total sales
-- 3. Total items
-- 4. Average order value
-- 5. Sales by category
-- 6. Top selling items
-- 7. Orders by hour
-- 8. Sales by hour
-- 9. Orders by address
-- 10. Orders by delivery/pick up
--====================================================================
-- we're going to need to join the "item data" and the "address data" to the "orders data".
-----------------------------------------------------------------------------------------------

select 
 o.order_id, 
 i.item_price, 
 o.quantity, 
 i.item_cat,
 i.item_name,
 o.created_at,
 a.delivery_address1,
 a.delivery_address2,
 a.delivery_city,
 a.delivery_zipcode,
 o.delivery
from 
	orders o
	left join item i on o.item_id = i.item_id
	left join address a on o.add_id = a.add_id;

 