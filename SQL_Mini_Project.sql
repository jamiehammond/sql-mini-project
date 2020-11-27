---------- EXERCISE 1 - NORTHWIND QUERIES ----------

USE Northwind

----- EX1.1 -----
/* Write a query that lists all Customers in either Paris or London. Include
Customer ID, Company Name and all address fields. */

SELECT 
    CustomerID, 
    CompanyName, 
    Address, City, Region, PostalCode, Country
FROM Customers
WHERE City IN('Paris', 'London');

----- EX1.2 -----
-- 1.2	List all products stored in bottles.

SELECT ProductID, ProductName
FROM Products
WHERE CHARINDEX('bottle', QuantityPerUnit) > 0;

----- EX1.3 -----
-- Repeat question above, but add in the Supplier Name and Country.

SELECT p.ProductID, p.ProductName, s.CompanyName, s.Country
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID
WHERE CHARINDEX('bottle', QuantityPerUnit) > 0;

----- EX1.4 -----
/* Write an SQL Statement that shows how many products there are in each category.
Include Category Name in result set and list the highest number first. */

SELECT c.CategoryName, COUNT(p.CategoryID) AS "Total Products for Category"
FROM Products p
INNER JOIN Categories c ON p.CategoryID=c.CategoryID
GROUP BY p.CategoryID, c.CategoryName
ORDER BY COUNT(p.CategoryID) DESC;

----- EX1.5 -----
/* 1.5	List all UK employees using concatenation to join their title of courtesy,
first name and last name together. Also include their city of residence. */

SELECT 
    TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS "Full Name",
    City
FROM Employees
WHERE Country='UK';

----- EX1.6 -----
/* 1.6	List Sales Totals for all Sales Regions (via the Territories table using 4
joins) with a Sales Total greater than 1,000,000. Use rounding or FORMAT to present
the numbers. */

SELECT 
    r.RegionDescription, 
    FORMAT(ROUND(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)), 2), '#.#0') AS "Sales Total"
FROM Region r
INNER JOIN Territories t ON r.RegionID=t.RegionID
INNER JOIN EmployeeTerritories et ON t.TerritoryID=et.TerritoryID
INNER JOIN Employees e ON et.employeeID=e.EmployeeID
INNER JOIN Orders o ON e.EmployeeID=o.EmployeeID
INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
GROUP BY r.RegionDescription
HAVING SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) > 1000000;

----- EX1.7 -----
/* Count how many Orders have a Freight amount greater than 100.00 and either 
USA or UK as Ship Country.*/

SELECT COUNT(*) AS "Orders with Freight > 100.00 and Ship Country of USA or UK"
FROM Orders
WHERE 
    Freight > 100.00 AND
    ShipCountry IN ('USA', 'UK');

----- EX1.8 -----
/* Write an SQL Statement to identify the Order Number of the Order with the 
highest amount(value) of discount applied to that order. */

SELECT
    od.OrderID,
    od.UnitPrice*od.Quantity*od.Discount AS "Discount Amount"
FROM [Order Details] od
WHERE od.UnitPrice*od.Quantity*od.Discount =
    (SELECT 
    MAX(od.UnitPrice*od.Quantity*od.Discount)
    FROM [Order Details] od
    );

---------- EXERCISE 2 - CREATE SPARTANS TABLE ----------

CREATE DATABASE jamie_db;

USE jamie_db;

----- EX2.1 -----
/* Write the correct SQL statement to create the following table:
Spartans Table – include details about all the Spartans on this course. Separate Title,
First Name and Last Name into separate columns, and include University attended, course
taken and mark achieved. Add any other columns you feel would be appropriate. */

CREATE TABLE spartans
(
    id INT IDENTITY PRIMARY KEY,
    title VARCHAR (20),
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    university_attended VARCHAR (100),
    course_taken VARCHAR (100),
    mark_achieved VARCHAR (20),
    favourite_colour VARCHAR(50)
);

SP_HELP spartans;



----- EX2.2 -----
/* Write SQL statements to add the details of the Spartans in your course to the table you
have created */

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Jamie',
    'Hammond',
    'Swansea',
    'Computer Science',
    '1:1',
    'Blue'
);

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Ahmed',
    'Abdul Rahman',
    'Manchester',
    'Computer Science',
    '2:1',
    'Red'
);

INSERT INTO spartans
VALUES 
(
    'Prof.',
    'Alex',
    'Ng',
    'Loughborough',
    'Physics',
    '1:1',
    'Green'
);

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Andrei',
    'Pavel',
    'Cambridge',
    'Maths',
    '2:2',
    'Pink'
);

INSERT INTO spartans
VALUES 
(
    'Hon.',
    'Asakar',
    'Hussain',
    'London',
    'Engineering',
    '2:1',
    'Yellow'
);

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Ben',
    'Middlehurst',
    'Cardiff',
    'Computer Science',
    '1:1',
    'Orange'
);

INSERT INTO spartans
VALUES 
(
    'Sir',
    'Ben',
    'Balls',
    'Bristol',
    'Computer Science',
    '2:1',
    'Blue'
);

INSERT INTO spartans
VALUES 
(
    'Prof.',
    'Daniel',
    'Alldritt',
    'Manchester',
    'French',
    '1:1',
    'Yellow'
);

INSERT INTO spartans
VALUES 
(
    'Dr.',
    'Gregory',
    'Spratt',
    'Oxford',
    'English',
    '2:1',
    'Red'
);

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Ismail',
    'Kadir',
    'London',
    'Computer Science',
    '1:1',
    'Purple'
);

INSERT INTO spartans
VALUES 
(
    'Master',
    'James',
    'Fletcher',
    'Cambridge',
    'Physics',
    '2:2',
    'Yellow'
);

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Josh',
    'Weeden',
    'Sheffield',
    'Psychology',
    '1:1',
    'Blue'
);

INSERT INTO spartans
VALUES 
(
    'Lord',
    'Nathan',
    'Johnston',
    'Cardiff',
    'Maths',
    '2:1',
    'Pink'
);

INSERT INTO spartans
VALUES 
(
    'Sir',
    'Rashawn',
    'Henry',
    'London',
    'English',
    '1:1',
    'Orange'
);

INSERT INTO spartans
VALUES 
(
    'Prof.',
    'Sidhant',
    'Khosla',
    'Birmingham',
    'Politics',
    '2:2',
    'Green'
);

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Timin',
    'Rickaby',
    'Manchester',
    'Physics',
    '1:1',
    'Blue'
);

INSERT INTO spartans
VALUES 
(
    'Mr.',
    'Yusuf',
    'Uddin',
    'Cambridge',
    'Philosophy',
    '2:1',
    'Orange'
);

SELECT * FROM spartans;



---------- EXERCISE 1 - NORTHWIND DATA ANALYSIS LINKED TO EXCEL ----------

USE Northwind

----- EX3.1 -----
/* List all Employees from the Employees table and who they report to. 
No Excel required. */

SELECT 
    e.EmployeeID, e.FirstName + ' ' + e.LastName AS "Employee Name",
    ee.FirstName + ' ' + ee.LastName AS "Reports To"
FROM Employees e
LEFT JOIN Employees ee ON e.ReportsTo=ee.EmployeeID;

----- EX3.2 -----
/* List all Suppliers with total sales over $10,000 in the Order Details table.
Include the Company Name from the Suppliers Table and present as a bar chart as below. */

SELECT 
    s.CompanyName,
    ROUND(SUM(od.UnitPrice*od.Quantity*1-od.Discount), 2) AS "Supplier Total"
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID=p.SupplierID
INNER JOIN [Order Details] od ON p.ProductID=od.ProductID
GROUP BY s.CompanyName
HAVING SUM(od.UnitPrice*od.Quantity*1-od.Discount) > 10000
ORDER BY "Supplier Total" DESC;

----- EX3.3 -----
/* List the Top 10 Customers YTD for the latest year in the Orders file. 
Based on total value of orders shipped. No Excel required. */

SELECT TOP 10
    c.CompanyName,
    ROUND(SUM(od.UnitPrice*od.Quantity*1-od.Discount), 2) AS "Total Value of Orders Shipped"
FROM Customers c
INNER JOIN Orders o ON c.CustomerID=o.CustomerID
INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
WHERE YEAR(o.OrderDate) >= 
    (SELECT
    YEAR(MAX(OrderDate))
    FROM Orders)
GROUP BY c.CompanyName
ORDER BY "Total Value of Orders Shipped" DESC;

----- EX3.4 -----
/* Plot the Average Ship Time by month for all data in the Orders Table using a line
chart as below. */

SELECT
    YEAR(OrderDate) AS "Order Year",
    MONTH(OrderDate) AS "Order Month",
    FORMAT(OrderDate, 'MMM-yy') AS "Month Shipped",
    AVG(DATEDIFF(d, OrderDate, ShippedDate)) AS "Ship Time (Days)"
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate), FORMAT(OrderDate, 'MMM-yy')
ORDER BY YEAR(OrderDate), MONTH(OrderDate);