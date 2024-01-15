# Role Based Access Control

`Role Based Access Control (RBAC) Database Schema Design and ER Diagram`

resource
-
- id
- resource_name

role
-
- id 
- role_name

users
-
- id
- user_name
- password 

users_role
-
- id 
- user_id 
- role_id

resource_role
-
- id 
- resource_id
- role_id
- can_add 
- can_edit
- can_view
- can_delete

# ER Diagram

![alt text](https://github.com/aa-nadim/dbms/blob/main/role-based-access-control/ER-of-roleBasedAccessControl.png?raw=true)

# DDL

```
create table resource (id int primary key auto_increment, resource_name varchar(50) not null);

create table role (id int primary key auto_increment, role_name varchar(50) not null);

create table users (id int primary key auto_increment, user_name varchar(45) not null, password varchar(255) not null);

create table users_role (id int primary key auto_increment, user_id int, foreign key(user_id) references users(id), role_id int, foreign key(role_id) references role(id));

create table resource_role (id int primary key auto_increment, resource_id int, foreign key(resource_id) references resource(id), role_id int, foreign key(role_id) references role(id), can_add char(1), can_edit char(1), can_view char(1), can_delete char(1));
```

