-- ============================================================================
-- NAME:    EC_IT143_W6.4_performance_analysis_missing_indexes_jn
-- PURPOSE: Performance analysis - missing index recommendations and index
--          creation on two different tables in AdventureWorks2025
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

USE AdventureWorks2025;
GO


-- ============================================================================
-- TABLE 1: Person.Address
-- ============================================================================

SELECT
    AddressID
    , AddressLine1
    , City
    , StateProvinceID
    , PostalCode
FROM Person.Address
WHERE City = 'Bothell';

CREATE NONCLUSTERED INDEX IX_Address_City
ON Person.Address (City);
GO

SELECT
    AddressID
    , AddressLine1
    , City
    , StateProvinceID
    , PostalCode
FROM Person.Address
WHERE City = 'Bothell';


-- ============================================================================
-- TABLE 2: Production.TransactionHistory
-- ============================================================================

SELECT
    TransactionID
    , ProductID
    , TransactionType
    , Quantity
    , TransactionDate
FROM Production.TransactionHistory
WHERE TransactionType = 'P';

CREATE NONCLUSTERED INDEX IX_TransactionHistory_TransactionType
ON Production.TransactionHistory (TransactionType)
INCLUDE (ProductID, TransactionDate, Quantity);
GO

SELECT
    TransactionID
    , ProductID
    , TransactionType
    , Quantity
    , TransactionDate
FROM Production.TransactionHistory
WHERE TransactionType = 'P';
