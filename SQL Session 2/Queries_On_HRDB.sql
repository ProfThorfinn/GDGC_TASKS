-- Select all Employees
SELECT * FROM Employees;

-- Select employees from a specific country (e.g., Egypt - CountryID = 1)
SELECT * FROM Employees WHERE CountryID = 1;

-- Select employees working in a specific department (e.g., IT - Department ID = 3)
SELECT * FROM Employees WHERE DepartmentID = 3;

-- Select employees who earn more than 5000
SELECT * FROM Employees WHERE MonthlySalary > 5000;

-- Select employees who were hired after 2020
SELECT * FROM Employees WHERE HireDate > '2020-12-31';

-- Select employees who have exited (i.e., those with an ExitDate set)
SELECT * FROM Employees WHERE ExitDate IS NOT NULL;

-- Select employees with a bonus percentage above 10%
SELECT * FROM Employees WHERE BonusPerc > 10;
