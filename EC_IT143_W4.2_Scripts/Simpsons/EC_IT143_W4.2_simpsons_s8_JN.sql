-- Q: How many family members work in each department?

-- A: Let's group SimpsonsFamily by Department and count how many members belong to each...

EXEC dbo.usp_simpsons_members_per_dept_load;
