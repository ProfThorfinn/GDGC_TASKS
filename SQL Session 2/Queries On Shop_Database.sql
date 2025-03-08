-- All possible combinations of customers and orders
SELECT c.Name, o.OrderID
FROM Customers c
CROSS JOIN Orders o;

-- Get all orders with the customer names.
SELECT o.OrderID, c.Name, o.Amount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Get all customers, even if they haven’t placed an order.
SELECT c.Name, o.OrderID
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Get all orders, even if the customer is missing in the Customers table.
SELECT o.OrderID, c.Name, o.Amount
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID;

-- Get all orders and customers, even if they don’t have a match.
SELECT c.Name, o.OrderID, o.Amount
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Find customers who have the same name as another customer (for duplicate detection).
SELECT Name
FROM Customers
GROUP BY Name
HAVING COUNT(*) > 1;

-- Retrieve orders with amounts greater than 500 along with customer names.
SELECT o.OrderID, c.Name, o.Amount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Amount > 500;

-- Find Customers Without Orders
SELECT c.Name
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Count Orders Per Customer
SELECT c.Name, COUNT(o.OrderID) as OrderCount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

-- Get the Total Amount Spent by Each Customer
SELECT c.Name, SUM(o.Amount) as TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

-- Update Orders Based on Customer Information Increase the amount of all orders placed by "John Doe" by 10%.
UPDATE o
SET o.Amount = o.Amount * 1.10
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
WHERE c.Name = 'John Doe';

-- Delete Orders of Customers Who No Longer Exist
DELETE o
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;
