# TRIGGER
`special type of stored procedure that is invoked automatically in response to an event.`
- INSERT, UPDATE, or DELETE

triggers are of two types:
-
- row-level triggers
- statement-level triggers

# Example
- Create table:
-
```
CREATE TABLE employee(  
    name varchar(45) NOT NULL,    
    occupation varchar(35) NOT NULL,    
    working_date date,  
    working_hours varchar(10)  
);  
```
- Insert data:
-
```
INSERT INTO employee VALUES    
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);  
```
- Create *TRIGGER:
-
- `we will create a BEFORE INSERT trigger. This trigger is invoked automatically insert the working_hours = 0 if someone tries to insert working_hours < 0.`
```
DELIMITER //  
Create Trigger before_insert_empworkinghours  
BEFORE INSERT ON employee FOR EACH ROW  
BEGIN  
	IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;  
END IF;  
END // 
```

- NOW insert data:
-
```
INSERT INTO employee VALUES    ('Markus', 'Former', '2020-10-08', 14); 
--=========>Markus	Former	2020-10-08	14

INSERT INTO employee VALUES    ('Alexander', 'Actor', '2020-10-012', -13);
--=========>Alexander	Actor	2020-10-12	0
```
![alt text](https://github.com/aa-nadim/dbms/blob/main/TRIGGER/trigger.png?raw=true)

