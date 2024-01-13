# User Roles and Permissions 

Users
-
- Administrator
- Editor
- Employee
- External

Permissions
-
- View
- Access Orinial
- Edit Metadata
- Edit Content
- Manage Permission
- Delete

---

User Table:
-
- UserID (Primary Key)
- UserName
- UserType (Administrator, Editor, Employee, External)


Permission Table:
-
- PermissionID (Primary Key)
- PermissionName (View, Access Original, Edit Metadata, Edit Content, Manage Permission, Delete)


UserPermission Table:
-
- UserPermissionID (Primary Key)
- UserID (Foreign Key referencing User table)
- PermissionID (Foreign Key referencing Permission table)

# ER Diagram

![alt text](https://github.com/aa-nadim/pizzaShop-db-design/blob/main/userRoleAndPermissions/images/user-role-and-permission.png?raw=true)


# DDL

```
-- User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    UserType VARCHAR(20) NOT NULL
);

-- Permission Table
CREATE TABLE Permission (
    PermissionID INT PRIMARY KEY,
    PermissionName VARCHAR(50) NOT NULL
);

-- UserPermission Table
CREATE TABLE UserPermission (
    UserPermissionID INT PRIMARY KEY,
    UserID INT,
    PermissionID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (PermissionID) REFERENCES Permission(PermissionID)
);
```