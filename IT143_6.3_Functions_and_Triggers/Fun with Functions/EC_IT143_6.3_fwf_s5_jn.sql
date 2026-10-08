-- ============================================================================
-- NAME:    dbo.fn_get_first_name / dbo.fn_get_last_name
-- PURPOSE: Scalar functions that split a "First Last" contact name
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

DROP FUNCTION IF EXISTS dbo.fn_get_first_name;
GO

CREATE FUNCTION dbo.fn_get_first_name (@ContactName VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    -- Everything before the first space is the first name. Appending a
    -- trailing space before CHARINDEX guards against a name with no space
    -- at all (CHARINDEX would otherwise return 0 and break LEFT).
    RETURN LEFT(@ContactName, CHARINDEX(' ', @ContactName + ' ') - 1);
END
GO

DROP FUNCTION IF EXISTS dbo.fn_get_last_name;
GO

CREATE FUNCTION dbo.fn_get_last_name (@ContactName VARCHAR(100))
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @SpacePos INT = CHARINDEX(' ', @ContactName);

    -- No space means there is no last name to return
    IF @SpacePos = 0
        RETURN NULL;

    RETURN RIGHT(@ContactName, LEN(@ContactName) - @SpacePos);
END
GO

SELECT
    ContactName
    , dbo.fn_get_first_name(ContactName) AS FirstName
    , dbo.fn_get_last_name(ContactName) AS LastName
FROM dbo.t_w3_schools_customers;
