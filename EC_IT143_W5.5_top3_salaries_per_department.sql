-- ============================================================================
-- NAME:    EC_IT143_W5.5_top3_salaries_per_department
-- PURPOSE: SQL Interview Demonstration #4 - Find the top three employees with
--          the highest salary in each department
-- AUTHOR:  Josue Neiculeo
-- ============================================================================


-- Table setup and sample data load

CREATE TABLE employee_salary (
    employee_id        int,
    employee_name       varchar(50),
    department_id       int,
    employee_salary     int
);

INSERT INTO employee_salary (employee_id, employee_name, department_id, employee_salary) VALUES
(1, 'Rowan Shepherd', 1, 1000),
(2, 'Rimsha Melendez', 1, 900),
(3, 'Tiah Sanford', 1, 900),
(4, 'Cayden Mcclure', 1, 700),
(5, 'Ellena Dyer', 2, 1200),
(6, 'Marcus Knox', 2, 800),
(7, 'Tashan Dalby', 2, 700),
(8, 'Arif Sutherland', 2, 500);


-- Solution query: top 3 highest-paid employees per department

SELECT
    employee_id
    , employee_name
    , department_id
    , employee_salary
FROM (
    SELECT
        employee_id
        , employee_name
        , department_id
        , employee_salary
        , RANK() OVER (PARTITION BY department_id ORDER BY employee_salary DESC) AS salary_rank
    FROM employee_salary
) AS ranked_salaries
WHERE salary_rank <= 3
ORDER BY department_id, employee_salary DESC;
