-- Q: How many players are on each team?

-- A: Let's count players in tblPlayerDim, grouped by team, and join to tblTeamDim for the team code...

EXEC dbo.usp_myfc_players_per_team_load;
