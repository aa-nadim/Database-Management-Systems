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