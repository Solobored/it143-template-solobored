-- ============================================================================
-- NAME:    EC_IT143_W5.2_MyFC_JN
-- PURPOSE: Answer four questions about the MyFC community data set
-- AUTHOR:  Josue Neiculeo
-- ============================================================================


-- Q1 - Author: Me
-- How many players are on each team?

SELECT
    t.t_code AS team_code
    , COUNT(p.pl_id) AS player_count
FROM dbo.tblTeamDim AS t
INNER JOIN dbo.tblPlayerDim AS p
    ON t.t_id = p.t_id
GROUP BY t.t_code
ORDER BY t.t_code;


-- Q2 - Author: Aigbubhalu Thank-God Itua
-- Can you determine the total monthly salary for players on each team?

SELECT
    t.t_code AS team_code
    , f.as_of_date
    , SUM(f.mtd_salary) AS total_team_salary
FROM dbo.tblPlayerFact AS f
INNER JOIN dbo.tblPlayerDim AS p
    ON f.pl_id = p.pl_id
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
WHERE f.as_of_date = (SELECT MAX(as_of_date) FROM dbo.tblPlayerFact)
GROUP BY t.t_code, f.as_of_date
ORDER BY total_team_salary DESC;


-- Q3 - Author: Me
-- Which teams currently have the most Forwards versus Defenders?

SELECT
    t.t_code AS team_code
    , pos.p_name AS position_name
    , COUNT(*) AS player_count
FROM dbo.tblPlayerDim AS p
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
INNER JOIN dbo.tblPositionDim AS pos
    ON p.p_id = pos.p_id
GROUP BY t.t_code, pos.p_name
ORDER BY t.t_code, pos.p_name;


-- Q4 - Author: Me
-- Who are the top 5 highest-paid players, including their team and position?

SELECT TOP 5
    p.pl_name AS player_name
    , t.t_code AS team_code
    , pos.p_name AS position_name
    , f.mtd_salary
FROM dbo.tblPlayerFact AS f
INNER JOIN dbo.tblPlayerDim AS p
    ON f.pl_id = p.pl_id
INNER JOIN dbo.tblTeamDim AS t
    ON p.t_id = t.t_id
INNER JOIN dbo.tblPositionDim AS pos
    ON p.p_id = pos.p_id
WHERE f.as_of_date = (SELECT MAX(as_of_date) FROM dbo.tblPlayerFact)
ORDER BY f.mtd_salary DESC;
