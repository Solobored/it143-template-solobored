-- ============================================================================
-- NAME:    EC_IT143_W4.1_verify_import
-- PURPOSE: Verify successful import of the MyFC and Simpsons data sets by
--          selecting the top 1000 rows from each table
-- AUTHOR:  Josue Neiculeo
-- ============================================================================


-- MyFC community - soccer team data set

SELECT TOP 1000 * FROM dbo.tblTeamDim;
SELECT TOP 1000 * FROM dbo.tblPositionDim;
SELECT TOP 1000 * FROM dbo.tblPlayerDim;
SELECT TOP 1000 * FROM dbo.tblPlayerFact;


-- Simpsons community - consumer credit card transaction data set

SELECT TOP 1000 * FROM dbo.Family_Data;
SELECT TOP 1000 * FROM dbo.FBS_Viza_Costmo;
SELECT TOP 1000 * FROM dbo.Planet_Express;
