-- Q1: How do we get a customer's first name?
-- A1: LEFT() + CHARINDEX() split the string at the first space.
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/left-transact-sql
-- https://stackoverflow.com/questions/14467684/separate-first-and-last-name-sql

-- Q2: How do we get a customer's last name?
-- A2: RIGHT() + LEN() + CHARINDEX() grab everything after the first space.
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/right-transact-sql
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/len-transact-sql
-- https://stackoverflow.com/questions/14467684/separate-first-and-last-name-sql

-- One row (ContactName 'Zbyszek') has no space at all, so plain CHARINDEX()
-- returns 0 and LEFT()/RIGHT() throw "Invalid length parameter". Appending a
-- trailing space before searching guarantees CHARINDEX() always finds one.

SELECT
    ContactName
    , LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
    , CASE
        WHEN CHARINDEX(' ', ContactName) = 0 THEN NULL
        ELSE RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName))
      END AS LastName
FROM dbo.t_w3_schools_customers;
