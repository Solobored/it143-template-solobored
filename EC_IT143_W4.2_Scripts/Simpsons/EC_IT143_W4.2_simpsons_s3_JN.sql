-- Q: How many family members work in each department?

-- A: Let's group SimpsonsFamily by Department and count how many members belong to each...

SELECT f.Department AS department_name
    , COUNT(f.Member_ID) AS member_count
FROM dbo.SimpsonsFamily AS f
GROUP BY f.Department;
