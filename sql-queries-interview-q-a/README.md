# SQL Queries Interview Q&A

# DDL

```
-- EmployeeInfo Table
CREATE TABLE EmployeeInfo (
    EmpID INT PRIMARY KEY,
    EmpFname VARCHAR(50),
    EmpLname VARCHAR(50),
    Department VARCHAR(50),
    Address VARCHAR(255),
    DOB DATE,
    Gender CHAR(1) -- Assuming 'M' or 'F' for Male or Female
);

-- EmployeePosition Table
CREATE TABLE EmployeePosition (
    EmpPosID INT PRIMARY KEY,
    EmpID INT,
    EmpPosition VARCHAR(50),
    DateOfJoining DATE,
    Salary DECIMAL(10, 2), -- Adjust the precision and scale as needed
    FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);
```

![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/tbl-empinfo.png?raw=true)

![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/tbl-empPosition.png?raw=true)


# SQL Queries Interview Q&A

- Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.
`SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;`


- Q2. Write a query to fetch the number of employees working in the department ‘HR’.
`SELECT COUNT(*) FROM EmployeeInfo WHERE Department = 'HR';`


- Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
`SELECT SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfo;`

- Q5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
`SELECT MID(Address, 0, LOCATE('(',Address)) FROM EmployeeInfo;`


- Q6. Write a query to create a new table which consists of data and structure copied from the other table.
- Using the SELECT INTO command:
`SELECT * INTO NewTable FROM EmployeeInfo WHERE 1 = 0;`

- Using the CREATE command in MySQL:
`CREATE TABLE NewTable AS SELECT * FROM EmployeeInfo;`

