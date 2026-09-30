-- ============================================================================
-- NAME:    EC_IT143_W5.2_Simpsons_JN
-- PURPOSE: Answer four questions about the Simpsons community data set
-- AUTHOR:  Josue Neiculeo
-- ============================================================================


-- Q1 - Author: Tamunotonye Gogo
-- As a finance manager, how much did each department spend across the FBS_Viza_Costmo and
-- Planet_Express accounts?

SELECT
    fd.Department
    , SUM(combined.SpendAmount) AS total_spending
FROM (
    SELECT Member_Name AS MemberName, Debit AS SpendAmount
    FROM dbo.FBS_Viza_Costmo
    WHERE Debit IS NOT NULL

    UNION ALL

    SELECT Card_Member AS MemberName, Amount AS SpendAmount
    FROM dbo.Planet_Express
) AS combined
INNER JOIN dbo.Family_Data AS fd
    ON UPPER(combined.MemberName) = UPPER(fd.Name)
GROUP BY fd.Department
ORDER BY total_spending DESC;


-- Q2 - Author: Me
-- How many family members work in each department?

SELECT
    Department AS department_name
    , COUNT(Member_ID) AS member_count
FROM dbo.Family_Data
GROUP BY Department
ORDER BY department_name;


-- Q3 - Author: Me
-- What is the total spending by category in Planet_Express?

SELECT
    Category
    , SUM(Amount) AS total_spending
FROM dbo.Planet_Express
GROUP BY Category
ORDER BY total_spending DESC;


-- Q4 - Author: Me
-- Which family members have the longest tenure, and how does that compare with their total spending?

SELECT
    fd.Name
    , fd.Hire_Date
    , SUM(combined.SpendAmount) AS total_spending
FROM dbo.Family_Data AS fd
LEFT JOIN (
    SELECT Member_Name AS MemberName, Debit AS SpendAmount
    FROM dbo.FBS_Viza_Costmo
    WHERE Debit IS NOT NULL

    UNION ALL

    SELECT Card_Member AS MemberName, Amount AS SpendAmount
    FROM dbo.Planet_Express
) AS combined
    ON UPPER(fd.Name) = UPPER(combined.MemberName)
GROUP BY fd.Name, fd.Hire_Date
ORDER BY fd.Hire_Date ASC;
