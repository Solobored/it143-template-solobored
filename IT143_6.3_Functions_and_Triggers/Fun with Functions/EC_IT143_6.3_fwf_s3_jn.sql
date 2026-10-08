-- Q1: How do we get a customer's first name?
-- A1: ContactName is stored as "First Last". The first name is everything
--     before the first space.

SELECT
    ContactName
    , LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM dbo.t_w3_schools_customers;
