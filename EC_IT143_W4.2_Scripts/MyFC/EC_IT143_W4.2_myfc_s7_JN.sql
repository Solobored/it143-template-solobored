-- ============================================================================
-- NAME:    dbo.usp_myfc_players_per_team_load
-- PURPOSE: MyFC - Players Per Team - Load user stored procedure
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

CREATE PROCEDURE dbo.usp_myfc_players_per_team_load
AS
    BEGIN

        -- 1) Reload data

        TRUNCATE TABLE dbo.t_myfc_players_per_team;

        INSERT INTO dbo.t_myfc_players_per_team
            SELECT v.team_code
                , v.player_count
                FROM dbo.v_myfc_players_per_team_load AS v;

        -- 2) Review results

        SELECT t.*
          FROM dbo.t_myfc_players_per_team AS t;

    END;
GO
