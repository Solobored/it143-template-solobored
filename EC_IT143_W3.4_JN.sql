-- NAME:    EC_IT143_W3.4_JN
-- PURPOSE: Answer eight AdventureWorks business and metadata questions using SQL, as part of W3.4 assignment.
-- MODIFICATION LOG:
-- 1.0     09/15/2026   Josue Neiculeo   1. Built this script for EC IT143 W3.4
-- NOTES:
-- This script answers eight AdventureWorks questions submitted during assignment W3.3, two from each of the
-- four categories: Business User Marginal, Business User Moderate, Business User Increased, and Metadata.
-- Two questions are my own (both Marginal); the remaining six were submitted by classmates Gabrielle Dance
-- and Franco Tapia. Each question is documented above its corresponding answer, including the original author.
-- Verified against AdventureWorks2025 on 09/15/2026 - all referenced tables and columns confirmed to exist,
-- and all queries execute successfully against the loaded dataset.
-- Q1 (Marginal complexity) - Author: Me
-- What are the names and list prices of all active products we currently sell?
-- ================================================================================================================
-- A1: This returns all products where the SellEndDate is NULL, meaning the product is still actively sold.
SELECT Name,
    ListPrice
FROM Production.Product
WHERE SellEndDate IS NULL
ORDER BY Name;
-- Q2 (Marginal complexity) - Author: Me
-- Which five cities have the highest number of registered customer billing addresses?
-- ================================================================================================================
-- A2: This joins Address to BusinessEntityAddress and AddressType, filters to only 'Billing' type addresses,
-- then groups by city and returns the five cities with the most billing addresses on file.
SELECT TOP 5 a.City,
    COUNT(*) AS BillingAddressCount
FROM Person.Address a
    INNER JOIN Person.BusinessEntityAddress bea ON a.AddressID = bea.AddressID
    INNER JOIN Person.AddressType at ON bea.AddressTypeID = at.AddressTypeID
WHERE at.Name = 'Billing'
GROUP BY a.City
ORDER BY COUNT(*) DESC;
-- ================================================================================================================
-- Q3 (Moderate complexity) - Author: Gabrielle Dance
-- Which product subcategories have the highest average list price? Include the subcategory name and average price.
-- ================================================================================================================
-- A3: This joins Product to ProductSubcategory, groups by subcategory, and returns the five subcategories
-- with the highest average list price.
SELECT TOP 5 ps.Name AS SubcategoryName,
    AVG(p.ListPrice) AS AverageListPrice
FROM Production.Product p
    INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.Name
ORDER BY AVG(p.ListPrice) DESC;
-- ================================================================================================================
-- Q4 (Moderate complexity) - Author: Franco Tapia
-- Which department does each employee currently work in, and what job title does that employee have?
-- ================================================================================================================
-- A4: This joins Employee, Person, EmployeeDepartmentHistory, and Department, filtering to only current
-- department assignments (EndDate IS NULL), to show each employee's current department and job title.
SELECT p.FirstName + ' ' + p.LastName AS EmployeeName,
    e.JobTitle,
    d.Name AS DepartmentName
FROM HumanResources.Employee e
    INNER JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
    INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
    INNER JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
WHERE edh.EndDate IS NULL
ORDER BY DepartmentName,
    EmployeeName;
-- ================================================================================================================
-- Q5 (Increased complexity) - Author: Gabrielle Dance
-- AdventureWorks management wants to understand which products generated the most revenue. Using product,
-- sales detail, and sales order information, which five products produced the highest total sales amount in 2013?
-- ================================================================================================================
-- A5: This joins SalesOrderDetail, SalesOrderHeader, and Product, filters orders placed in 2013, then groups
-- by product to return the five products with the highest total sales amount (LineTotal).
SELECT TOP 5 p.Name AS ProductName,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM Sales.SalesOrderDetail sod
    INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
    INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
WHERE YEAR(soh.OrderDate) = 2013
GROUP BY p.Name
ORDER BY SUM(sod.LineTotal) DESC;
-- ================================================================================================================
-- Q6 (Increased complexity) - Author: Franco Tapia
-- The inventory team is checking products that may be getting low on stock. Which products have a total
-- inventory quantity below their safety stock level, and how much inventory does each product currently have?
-- ================================================================================================================
-- A6: This joins Product to ProductInventory, sums on-hand quantity per product across all locations, and
-- returns only products where that total falls below the product's SafetyStockLevel.
SELECT p.Name AS ProductName,
    SUM(pi.Quantity) AS TotalOnHandQuantity,
    p.SafetyStockLevel
FROM Production.Product p
    INNER JOIN Production.ProductInventory pi ON p.ProductID = pi.ProductID
GROUP BY p.Name,
    p.SafetyStockLevel
HAVING SUM(pi.Quantity) < p.SafetyStockLevel
ORDER BY p.Name;
-- ================================================================================================================
-- Q7 (Metadata) - Author: Gabrielle Dance
-- What data type is the Name column in the Production.Product table?
-- ================================================================================================================
-- A7: This queries INFORMATION_SCHEMA.COLUMNS to return the data type of the Name column in Production.Product.
SELECT COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
    AND TABLE_NAME = 'Product'
    AND COLUMN_NAME = 'Name';
-- ================================================================================================================
-- Q8 (Metadata) - Author: Franco Tapia
-- Using INFORMATION_SCHEMA.COLUMNS, which columns in the Person.Person table allow NULL values, and what data
-- type does each column use?
-- ================================================================================================================
-- A8: This queries INFORMATION_SCHEMA.COLUMNS, filtered to the Person.Person table, returning only columns
-- where IS_NULLABLE is 'YES', along with each column's data type.
SELECT COLUMN_NAME,
    IS_NULLABLE,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Person'
    AND TABLE_NAME = 'Person'
    AND IS_NULLABLE = 'YES';