--------------------------------------
-- Dashboard 2 - Inventory Management
-- ----------------------------------
-- This will be a lot more complicated than the orders. Mainly because we need to calculate how much inventory we're using and then identify inventory that needs reordering. We also want to calculate how much each pizza costs to make based on the cost of the ingredients so we can keep an eye on pricing and P/L.
--========================================================
-- Here is what we need:
--======================
-- 1. Total quantity by ingredient 
-- 				(No. of orders X ingredient quantity in recipe)
-- 2. Total cost of ingredients
-- 3. Calculated cost of pizza
-- 4. Precentage stock remaining by ingredient
--==============================================

select 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	r.quantity as recipe_quantity,
	sum(o.quantity) as order_quantity
from
	orders o 
	left join item i on o.item_id = i.item_id 
	left join recipe r on sku = r.recipe_id 
group by 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	r.quantity

	--=================================================

select 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	ing.ing_name,
	r.quantity as recipe_quantity,
	sum(o.quantity) as order_quantity
from
	orders o 
	left join item i on o.item_id = i.item_id 
	left join recipe r on sku = r.recipe_id 
	left join ingredient ing on ing.ing_id = r.ing_id 
group by 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	r.quantity,
	ing.ing_name

--======================================================

select * from (select 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	ing.ing_name,
	r.quantity as recipe_quantity,
	sum(o.quantity) as order_quantity
from
	orders o 
	left join item i on o.item_id = i.item_id 
	left join recipe r on sku = r.recipe_id 
	left join ingredient ing on ing.ing_id = r.ing_id 
group by 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	r.quantity,
	ing.ing_name) s1

--===================================================

select * from (select 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	ing.ing_name,
	r.quantity as recipe_quantity,
	sum(o.quantity) as order_quantity,
	ing.ing_weight,
	ing.ing_price
from
	orders o 
	left join item i on o.item_id = i.item_id 
	left join recipe r on sku = r.recipe_id 
	left join ingredient ing on ing.ing_id = r.ing_id 
group by 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	r.quantity,
	ing.ing_name,
	ing.ing_weight,
	ing.ing_price) s1;

--======================================================

select 
 s1.item_name,
 s1.ing_id,
 s1.ing_name,
 s1.ing_weight,
 s1.ing_price,
 s1.order_quantity,
 s1.recipe_quantity,
 s1.order_quantity*s1.recipe_quantity as ordered_weight,
 s1.ing_price/s1.ing_weight as unit_cost,
 (s1.order_quantity*s1.recipe_quantity)*(s1.ing_price/s1.ing_weight) as ingredient_cost
from (select 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	ing.ing_name,
	r.quantity as recipe_quantity,
	sum(o.quantity) as order_quantity,
	ing.ing_weight,
	ing.ing_price
from
	orders o 
	left join item i on o.item_id = i.item_id 
	left join recipe r on sku = r.recipe_id 
	left join ingredient ing on ing.ing_id = r.ing_id 
group by 
	o.item_id,
	i.sku,
	i.item_name,
	r.ing_id,
	r.quantity,
	ing.ing_name,
	ing.ing_weight,
	ing.ing_price) s1;