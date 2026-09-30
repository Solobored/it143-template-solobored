DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

-- ============================================================================
-- NAME:    dbo.v_hello_world_load
-- PURPOSE: Create the Hello World - Load view
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

CREATE VIEW dbo.v_hello_world_load
AS
    SELECT 'Hello World' AS my_message
        , GETDATE() AS current_date_time;
GO
