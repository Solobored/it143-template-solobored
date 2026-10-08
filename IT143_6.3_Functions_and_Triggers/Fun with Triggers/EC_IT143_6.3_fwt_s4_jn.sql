-- ============================================================================
-- NAME:    dbo.trg_hello_world_last_mod
-- PURPOSE: After-update trigger that stamps who changed a row and when
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

-- Make sure the base table exists (it may not be in this database yet)

IF OBJECT_ID('dbo.t_hello_world', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.t_hello_world (
        my_message          VARCHAR(25) NOT NULL PRIMARY KEY
        , current_date_time DATETIME NOT NULL DEFAULT GETDATE()
    );

    INSERT INTO dbo.t_hello_world (my_message) VALUES ('Hello World');
END
GO

-- Add the tracking columns (skip if they already exist on your table)

IF COL_LENGTH('dbo.t_hello_world', 'last_modified_date') IS NULL
BEGIN
    ALTER TABLE dbo.t_hello_world
    ADD last_modified_date DATETIME NULL
        , last_modified_by VARCHAR(50) NULL;
END
GO

DROP TRIGGER IF EXISTS dbo.trg_hello_world_last_mod;
GO

CREATE TRIGGER dbo.trg_hello_world_last_mod ON dbo.t_hello_world
AFTER UPDATE
AS
BEGIN
    -- A DEFAULT constraint only fires on INSERT, so this trigger is what
    -- keeps last_modified_date and last_modified_by accurate on every UPDATE.
    UPDATE dbo.t_hello_world
    SET last_modified_date = GETDATE()
        , last_modified_by = SUSER_NAME()
    WHERE my_message IN (
        SELECT DISTINCT my_message
        FROM Inserted
    );
END
GO
