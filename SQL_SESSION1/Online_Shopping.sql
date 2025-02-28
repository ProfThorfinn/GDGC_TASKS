CREATE DATABASE OnlineShoppingSystem;
USE OnlineShoppingSystem;

CREATE TABLE Supplier (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(200) NOT NULL
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Category VARCHAR(50) DEFAULT 'new',
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(ID)
);

CREATE TABLE Customer (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    Address TEXT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status ENUM('Pending', 'Shipped', 'Delivered') DEFAULT 'Pending',
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(ID)
);

CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Supplier (Name, ContactInfo) VALUES
('Tech Supplies', 'techsupplies@email.com, (555) 123-4567'),
('Fashion Supplies', 'fashionsupplies@email.com, (555) 789-0123');

INSERT INTO Product (Name, Description, Price, Category, SupplierID) VALUES
('Laptop', 'High-performance laptop', 999.99, 'Electronics', 1),
('T-Shirt', 'Comfortable cotton t-shirt', 19.99, 'Clothing', 2);

INSERT INTO Customer (Name, Email, PhoneNumber, Address) VALUES
('Prof', 'prof@hotmail.com', '0103-066-4607', 'Dairout, Asyut, Village'),
('Roma', 'roma@hotmail.com', '010-123-4567', 'Dairout, Asyut, Village');

INSERT INTO Orders (CustomerID, TotalAmount) VALUES
(1, 1019.98), 
(2, 39.98);    

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 999.99),
(2, 1, 3,19.99);  

-- queries to check relationships
-- (1): Check Suppliers
SELECT * FROM Supplier;

-- (2): Check Products and  suppliers
SELECT p.ProductID, p.Name, p.Price, s.Name AS SupplierName
FROM Product p
LEFT JOIN Supplier s ON p.SupplierID = s.ID;

-- (3): Check Customers
SELECT * FROM Customer;

-- (4): Check Orders and their customers
SELECT o.OrderID, o.OrderDate, o.TotalAmount, c.Name AS CustomerName
FROM Orders o
JOIN Customer c ON o.CustomerID = c.ID;

-- (5): Check OrderDetails with related products and orders
SELECT od.OrderDetailsID, od.Quantity, od.Price, p.Name AS ProductName, o.OrderID
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID;

-- DDL

-- 1. Add a new column named rating to the Products table with an appropriate data type and a default value of 0.
ALTER TABLE Product
ADD rating DECIMAL(2,1) DEFAULT 0;

-- 2. Modify the Category column (or the relevant table/column as applicable) to have a default value of 'new'.
ALTER TABLE Product
MODIFY COLUMN Category VARCHAR(50) DEFAULT 'new';

-- 3. Drop the rating column from the Products table.
ALTER TABLE Product
DROP COLUMN rating;

-- 4. Delete the Users table from the Social Media Platform database.
DROP TABLE IF EXISTS SocialMediaPlatform.Users;

-- 5. Drop the entire Social Media Platform database
DROP DATABASE IF EXISTS SOCIAL_MEDIA;

-- DML

-- 1. Update the order date to the current date for all records where OrderID is greater than 0
UPDATE Orders
SET OrderDate = CURRENT_TIMESTAMP
WHERE OrderID > 0;

-- 2. Delete all rows from the Products table where ProductName is not null and not equal to "Null"
DELETE FROM Product
WHERE Name IS NOT NULL AND Name != 'Null';

-- Final verification after DML operations
SELECT * FROM Product;
SELECT * FROM Orders;
