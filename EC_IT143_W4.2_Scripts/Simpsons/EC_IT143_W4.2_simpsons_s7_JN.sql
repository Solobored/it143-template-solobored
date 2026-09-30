-- ============================================================================
-- NAME:    dbo.usp_simpsons_members_per_dept_load
-- PURPOSE: Simpsons - Members Per Department - Load user stored procedure
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

CREATE PROCEDURE dbo.usp_simpsons_members_per_dept_load
AS
    BEGIN

        -- 1) Reload data

        TRUNCATE TABLE dbo.t_simpsons_members_per_dept;

        INSERT INTO dbo.t_simpsons_members_per_dept
            SELECT v.department_name
                , v.member_count
                FROM dbo.v_simpsons_members_per_dept_load AS v;

        -- 2) Review results

        SELECT t.*
          FROM dbo.t_simpsons_members_per_dept AS t;

    END;
GO
