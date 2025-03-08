-- 1. Count total employees
SELECT COUNT(*) as TotalEmployees FROM Employees;

-- 2. Count employees per department
SELECT d.Name, COUNT(e.ID) as EmpCount 
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.ID
GROUP BY d.Name;

-- 3. Count employees with BonusPerc
SELECT COUNT(*) as BonusEmployees 
FROM Employees 
WHERE BonusPerc IS NOT NULL;

-- 4. Total salary across all employees
SELECT SUM(MonthlySalary) as TotalMonthlySalary FROM Employees;

-- 5. Total salary per department
SELECT d.Name, SUM(e.MonthlySalary) as Total_SalaryPerDept
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.ID
GROUP BY d.Name;

-- 6. Average salary of all employees
SELECT AVG(MonthlySalary) as AvgMonthlySalary FROM Employees;

-- 7. Country with shortest name
SELECT Name 
FROM Countries 
WHERE LEN(Name) = (SELECT MIN(LEN(Name)) FROM Countries);

-- 8. Departments per country
SELECT c.Name, COUNT(DISTINCT e.ID) as DeptPerCountry
FROM Employees e
JOIN Countries c ON e.CountryID = c.ID
GROUP BY c.Name;

-- 9. Average salary per department
SELECT d.Name, AVG(e.MonthlySalary) as AvgDeptMonthlySalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.ID
GROUP BY d.Name;

-- 10. Lowest salary
SELECT MIN(MonthlySalary) as LowestMonthlySalary FROM Employees;

-- 11. Department with lowest average salary
SELECT TOP 1 d.Name, AVG(e.MonthlySalary) as AvgMonthlySalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.ID
GROUP BY d.Name
ORDER BY AvgMonthlySalary ASC;

-- 12. Highest salary
SELECT MAX(MonthlySalary) as HighestMonthlySalary FROM Employees;

-- 13. Department with highest total salary
SELECT TOP 1 d.Name, SUM(e.MonthlySalary) as TotalMonthlySalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.ID
GROUP BY d.Name
ORDER BY TotalMonthlySalary DESC;

-- 14. Employees hired per country per year
SELECT c.Name, DATEPART(YEAR, e.HireDate) as HireYear, COUNT(*) as HiredCount
FROM Employees e
JOIN Countries c ON e.CountryID = c.ID
GROUP BY c.Name, DATEPART(YEAR, e.HireDate);

-- 15. Employees with ExitDate per country
SELECT c.Name, COUNT(*) as ExitedCount
FROM Employees e
JOIN Countries c ON e.CountryID = c.ID
WHERE e.ExitDate IS NOT NULL
GROUP BY c.Name;

-- 16. Countries with NULL names replaced
SELECT ISNULL(Name, 'Unknown') as Name
FROM Countries;
