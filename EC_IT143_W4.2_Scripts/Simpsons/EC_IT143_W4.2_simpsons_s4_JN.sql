DROP VIEW IF EXISTS dbo.v_simpsons_members_per_dept_load;
GO

-- ============================================================================
-- NAME:    dbo.v_simpsons_members_per_dept_load
-- PURPOSE: Create the Simpsons - Members Per Department - Load view
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

CREATE VIEW dbo.v_simpsons_members_per_dept_load
AS
    SELECT f.Department AS department_name
        , COUNT(f.Member_ID) AS member_count
    FROM dbo.SimpsonsFamily AS f
    GROUP BY f.Department;
GO
