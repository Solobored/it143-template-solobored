-- ============================================================================
-- NAME:    EC_IT143_6.3_materialize_w3_customers_jn
-- PURPOSE: Materialize the W3 Schools - Customers view into a table
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

-- If dbo.t_w3_schools_customers already exists from the SSMS Primer assignment,
-- this step does not need to be repeated.

USE EC_IT143_DA;
GO

DROP TABLE IF EXISTS dbo.t_w3_schools_customers;
GO

SELECT *
INTO dbo.t_w3_schools_customers
FROM dbo.v_w3_schools_customers;
GO

SELECT TOP 10 * FROM dbo.t_w3_schools_customers;
