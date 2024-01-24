# SQL Queries Interview Q&A

EmployeeInfo Table:
-
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/tbl-empInfo.png?raw=true)

EmployeePosition Table:
-
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/tbl-empPosition.png?raw=true)


# SQL Queries Interview Q&A

- Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.

```SELECT UPPER(EmpFname) AS EmpName FROM EmployeeInfo;```
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q1.png?raw=true)


- Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

```SELECT SUBSTRING(EmpLname, 1, 4) FROM EmployeeInfo;```
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q4.png?raw=true)


- Q6. Write a query to create a new table which consists of data and structure copied from the other table.

```CREATE TABLE NewTable AS SELECT * FROM EmployeeInfo;```
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q6.png?raw=true)


- Q7. Write q query to find all the employees whose salary is between 50000 to 100000.
```SELECT * FROM EmployeePosition WHERE Salary BETWEEN '50000' AND '100000';```

-Q8. Write a query to find the names of employees that begin with ‘S’
```SELECT * FROM EmployeeInfo WHERE EmpFname LIKE 'S%';```


- Q10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.

```SELECT CONCAT(EmpFname, ' ', EmpLname) AS 'FullName' FROM EmployeeInfo;```
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q10.png?raw=true)


- Q11. Write a query find number of employees whose DOB is between '1960-05-02' to '1999-12-11' and are grouped according to gender
```
SELECT COUNT(*), Gender FROM EmployeeInfo 
WHERE DOB BETWEEN '1960-05-02' AND '1999-12-11' 
GROUP BY Gender;
```
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q11.png?raw=true)


- Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.

```SELECT * FROM EmployeeInfo ORDER BY EmpFname desc, Department asc;```


- Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

```SELECT * FROM EmployeeInfo WHERE EmpLname LIKE '____a';```


- Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
```SELECT * FROM EmployeeInfo WHERE EmpFname NOT IN ('Sanjay','Sonia');```


- Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
```SELECT * FROM EmployeeInfo WHERE Address LIKE 'DELHI(DEL)%';```


- Q16. Write a query to fetch all employees who also hold the managerial position.
```
SELECT E.EmpFname, E.EmpLname, P.EmpPosition 
FROM EmployeeInfo E INNER JOIN EmployeePosition P ON
E.EmpID = P.EmpID AND P.EmpPosition IN ('Manager');
```

![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q16_1.png?raw=true)

![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q16_2.png?raw=true)

![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q16_3.png?raw=true)


- Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
```
SELECT Department, count(EmpID) AS EmpDeptCount 
FROM EmployeeInfo GROUP BY Department 
ORDER BY EmpDeptCount ASC;
```

- Subquery
- Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
```
SELECT * FROM EmployeeInfo E 
WHERE EXISTS 
(SELECT * FROM EmployeePosition P WHERE E.EmpId = P.EmpId);
```
![alt text](https://github.com/aa-nadim/dbms/blob/main/sql-queries-interview-q-a/images/q19.png?raw=true)