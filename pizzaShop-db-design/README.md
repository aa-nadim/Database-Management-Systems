# pizza-shop-database-design

Link==>[User Roles and Permissions](https://github.com/aa-nadim/dbms/blob/main/userRoleAndPermissions/README.md#user-roles-and-permissions)

Main areas of focus
-
- Orders
- Stock control
- Staff

Orders Data Required
-
- Item name
- Item price
- Quantity
- Customer name
- Delivery address

Orders Data Required details information
-
- Row ID
- Order ID
- Item name
- Item category
- Item size
- Item price
- Quantity
- Customer first name
- Customer last name
- Delivery address 1
- Delivery address 2
- Delivery city
- Delivery zip code

# After Normalization

orders
-
- row_id int pk
- order_id varchar(10)
- created_at datetime FK >- rota.date
- item_id varchar(10) FK >- item.item_id
- quantity int
- cust_id int FK >- customers.cust_id
- delivery boolean
- add_id int FK >- address.add_id

customers
-
- cust_id int pk
- cust_firstname varchar(50)
- cust_lastname varchar(50)

address
-
- add_id int pk
- delivery_address1 varchar(200)
- delivery_address2 varchar(200) NULL
- delivery_city varchar(50)
- delivery_zipcode varchar(20)

item
-
- item_id varchar(10) pk
- sku varchar(20)
- item_name varchar(50)
- item_cat varchar(50)
- item_size varchar(20)
- item_price decimal(5,2)

ingredient
-
- ing_id varchar(10) pk
- ing_name varchar(200)
- ing_weight int
- ing_mess varchar(20)
- ing_price decimal(5,2)

recipe
-
- row_id int pk
- recipe_id varchar(20) FK >- item.sku
- ing_id varchar(10) FK >- ingredient.ing_id
- quantity int

inventory
-
- inv_id int pk
- item_id varchar(10) FK >- recipe.ing_id
- quantity int

rota
-
- row_id int pk
- rota_id varchar(20)
- date datetime
- shift_id varchar(20) FK >- shift.shift_id
- staff_id varchar(20) FK >- staff.staff_id

shift
-
- shift_id varchar(20) pk
- day_of_work varchar(10)
- start_time time
- end_time time

staff
-
- staff_id varchar(20) pk
- first_name varchar(50)
- last_name varchar(50)
- position varchar(100)
- hourly_rate decimal(5,2)

# ER diagram

![alt text](https://github.com/aa-nadim/dbms/blob/main/pizzaShop-db-design/images/ER-diagram-of-PizzaShop.png?raw=true)

![alt text](https://github.com/aa-nadim/dbms/blob/main/pizzaShop-db-design/images/ER-of-BD.png?raw=true)

# DDL & Indexing

```
CREATE TABLE `orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_id` int  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `add_id` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `customers` (
    `cust_id` int  NOT NULL ,
    `cust_firstname` varchar(50)  NOT NULL ,
    `cust_lastname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
    ),
    INDEX `idx_cust_id` (`cust_id`)
);

CREATE TABLE `address` (
    `add_id` int  NOT NULL ,
    `delivery_address1` varchar(200)  NOT NULL ,
    `delivery_address2` varchar(200)  NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_zipcode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `add_id`
    ),
    INDEX `idx_add_id` (`add_id`)
);

CREATE TABLE `item` (
    `item_id` varchar(10)  NOT NULL ,
    `sku` varchar(20)  NOT NULL ,
    `item_name` varchar(50)  NOT NULL ,
    `item_cat` varchar(50)  NOT NULL ,
    `item_size` varchar(20)  NOT NULL ,
    `item_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    ),
    INDEX `idx_item_id` (`item_id`),
    INDEX `idx_sku` (`sku`)
);

CREATE TABLE `ingredient` (
    `ing_id` varchar(10)  NOT NULL ,
    `ing_name` varchar(200)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_mess` varchar(20)  NOT NULL ,
    `ing_price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    ),
    INDEX `idx_ing_id` (`ing_id`)
);

CREATE TABLE `recipe` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(20)  NOT NULL ,
    `ing_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    ),
    INDEX `idx_ing_id` (`ing_id`)
);

CREATE TABLE `inventory` (
    `inv_id` int  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

CREATE TABLE `rota` (
    `row_id` int  NOT NULL ,
    `rota_id` varchar(20)  NOT NULL ,
    `date` datetime  NOT NULL ,
    `shift_id` varchar(20)  NOT NULL ,
    `staff_id` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    ),
    INDEX `idx_date` (`date`)
);

CREATE TABLE `shift` (
    `shift_id` varchar(20)  NOT NULL ,
    `day_of_work` varchar(10)  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    ),
    INDEX `idx_shift_id` (`shift_id`)
);

CREATE TABLE `staff` (
    `staff_id` varchar(20)  NOT NULL ,
    `first_name` varchar(50)  NOT NULL ,
    `last_name` varchar(50)  NOT NULL ,
    `position` varchar(100)  NOT NULL ,
    `hourly_rate` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    ),
    INDEX `idx_staff_id` (`staff_id`)
);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_created_at` FOREIGN KEY(`created_at`)
REFERENCES `rota` (`date`);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_item_id` FOREIGN KEY(`item_id`)
REFERENCES `item` (`item_id`);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_cust_id` FOREIGN KEY(`cust_id`)
REFERENCES `customers` (`cust_id`);

ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_add_id` FOREIGN KEY(`add_id`)
REFERENCES `address` (`add_id`);

ALTER TABLE `recipe` ADD CONSTRAINT `fk_recipe_recipe_id` FOREIGN KEY(`recipe_id`)
REFERENCES `item` (`sku`);

ALTER TABLE `recipe` ADD CONSTRAINT `fk_recipe_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `ingredient` (`ing_id`);

ALTER TABLE `inventory` ADD CONSTRAINT `fk_inventory_item_id` FOREIGN KEY(`item_id`)
REFERENCES `recipe` (`ing_id`);

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `shift` (`shift_id`);

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `staff` (`staff_id`);

```

![alt text](https://github.com/aa-nadim/dbms/blob/main/pizzaShop-db-design/images/DDL-of-PizzaShopDB.png?raw=true)


![alt text](https://github.com/aa-nadim/dbms/blob/main/pizzaShop-db-design/images/pizza-shop-db.png?raw=true)


# Dashboard 1 - Order activity

For this , we will need a dashboard with the following data:

- 1. Total orders
- 2. Total sales
- 3. Total items
- 4. Average order value
- 5. Sales by category
- 6. Top selling items
- 7. Orders by hour
- 8. Sales by hour
- 9. Orders by address
- 10. Orders by delivery/pick up

We're going to need to join the "item data" and the "address data" to the "orders data":

```
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
```

# Dashboard 2 - Inventory Management

We need to calculate how much inventory we're using and then identify inventory that needs reordering. We also want to calculate how much each pizza costs to make based on the cost of the ingredients. So we can keep an eye on pricing.

Here is what we need:

- 1. Total quantity by ingredient(No. of orders X ingredient quantity in recipe)
- 2. Total cost of ingredients
- 3. Calculated cost of pizza
- 4. Precentage stock remaining by ingredient

```
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
```