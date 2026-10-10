-- ============================================================================
-- NAME:    EC_IT143_W6.4_SQL_interview_demo5_jn
-- PURPOSE: SQL Interview Demonstration #5 - supporting examples for keys,
--          join types, and data integrity, used alongside the verbal answers
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

USE AdventureWorks2025;
GO


-- ============================================================================
-- KEYS: primary key, foreign key, and a unique key example
-- ============================================================================

-- Primary key: uniquely identifies each row in Production.Product
SELECT ProductID, Name
FROM Production.Product;

-- Foreign key: Production.Product.ProductSubcategoryID references
-- Production.ProductSubcategory.ProductSubcategoryID, enforcing that every
-- product points to a subcategory that actually exists
SELECT p.ProductID, p.Name, p.ProductSubcategoryID, s.Name AS Subcategory
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID;

-- Unique key: Production.Product.ProductNumber must be unique, but it is
-- not the primary key used to relate this table to others
SELECT ProductID, ProductNumber
FROM Production.Product
ORDER BY ProductNumber;


-- ============================================================================
-- JOINS: INNER, LEFT OUTER, RIGHT OUTER, FULL OUTER
-- ============================================================================

-- INNER JOIN: only products that have a matching subcategory
SELECT p.Name AS ProductName, s.Name AS Subcategory
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID;

-- LEFT OUTER JOIN: all products, including ones with no subcategory assigned
SELECT p.Name AS ProductName, s.Name AS Subcategory
FROM Production.Product AS p
LEFT OUTER JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID;

-- RIGHT OUTER JOIN: all subcategories, including ones with no products yet
SELECT p.Name AS ProductName, s.Name AS Subcategory
FROM Production.Product AS p
RIGHT OUTER JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID;

-- FULL OUTER JOIN: every product and every subcategory, matched where
-- possible, with NULLs on either side where there is no match
SELECT p.Name AS ProductName, s.Name AS Subcategory
FROM Production.Product AS p
FULL OUTER JOIN Production.ProductSubcategory AS s
    ON p.ProductSubcategoryID = s.ProductSubcategoryID;


-- ============================================================================
-- DATA INTEGRITY: the foreign key constraint below is what stops a product
-- from being linked to a subcategory that does not exist
-- ============================================================================

SELECT
    fk.name AS ForeignKeyName
    , OBJECT_NAME(fk.parent_object_id) AS TableName
    , OBJECT_NAME(fk.referenced_object_id) AS ReferencedTable
FROM sys.foreign_keys AS fk
WHERE OBJECT_NAME(fk.parent_object_id) = 'Product';
