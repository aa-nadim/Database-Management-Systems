

--https://app.quickdatabasediagrams.com/#/d/IfqMCS
--pizza-shop

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

