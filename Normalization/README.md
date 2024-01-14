# Normalization

- 1NF (1st NormalForm) --> remove Repeating Groups
  |
  |2NF must be in 1NF.
  |
- 2NF (2nd NormalForm) --> remove Fnctional Dependancy
  |
  |3NF must be in 2NF.
  |
- 3NF (3rd NormalForm) --> remove Transitive Partial Dependancy
  |
  |BCNF must be in 3NF.
  |
- BCNF (Boyce Codd NormalForm) --> in every Functional Dependancy where 'X -> Y'; X must be Super Key
  |
  |4NF must be in 3NF.
  |
- 4NF (4th NormalForm) --> remove Multivalued Dependancy
  |
  |5NF must be in 4NF.
  |
- 5NF (4th NormalForm) --> remove Join Dependancy