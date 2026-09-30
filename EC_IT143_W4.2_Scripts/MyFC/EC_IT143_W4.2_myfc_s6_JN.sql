-- Q: How many players are on each team?

-- A: Let's count players in tblPlayerDim, grouped by team, and join to tblTeamDim for the team code...


-- 1) Reload data

TRUNCATE TABLE dbo.t_myfc_players_per_team;

INSERT INTO dbo.t_myfc_players_per_team
    SELECT v.team_code
        , v.player_count
    FROM dbo.v_myfc_players_per_team_load AS v;


-- 2) Review results

SELECT t.*
  FROM dbo.t_myfc_players_per_team AS t;
