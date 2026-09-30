-- Q: How many players are on each team?

-- A: Let's count players in tblPlayerDim, grouped by team, and join to tblTeamDim for the team code...

SELECT t.t_code AS team_code
    , COUNT(p.p_id) AS player_count
FROM dbo.tblTeamDim AS t
INNER JOIN dbo.tblPlayerDim AS p
    ON t.t_id = p.t_id
GROUP BY t.t_code;
