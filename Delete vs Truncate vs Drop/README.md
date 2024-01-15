# Delete vs Truncate vs Drop

Delete
-
- removes rows one by one
- slower than Truncate
- DML
- Transactions can be Rollback.
- Does not remove record permanently.
- Trigger is fired.
- we can use Where clause.
- Example: `DELETE FROM table_name WHERE Condition;`

Truncate
-
- DDL
- removes all data from the table in one operation.
- Rollback Transactions --> No.
- Trigger ---> No
- Faster than Delete
- we can not use Where clause.
- Example: `TRUNCATE TABLE table_name;`

Drop
-
- DDL
- Remove all records, indexes, structure and privileges permanently.
- Rollback Transactions --> No.
- Performance --> Quick but some complications.
- we can not use Where clause.
- Example: `DROP TABLE table_name;`