DROP VIEW IF EXISTS dbo.v_myfc_players_per_team_load;
GO

-- ============================================================================
-- NAME:    dbo.v_myfc_players_per_team_load
-- PURPOSE: Create the MyFC - Players Per Team - Load view
-- AUTHOR:  Josue Neiculeo
-- ============================================================================

CREATE VIEW dbo.v_myfc_players_per_team_load
AS
    SELECT t.t_code AS team_code
        , COUNT(p.p_id) AS player_count
    FROM dbo.tblTeamDim AS t
    INNER JOIN dbo.tblPlayerDim AS p
        ON t.t_id = p.t_id
    GROUP BY t.t_code;
GO
