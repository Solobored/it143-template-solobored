-- "0 results expected" test - if the functions are working correctly, this
-- query should return zero rows, since the ad hoc result and the UDF result
-- should always match.

WITH comparison AS (
    SELECT
        ContactName
        , LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHocFirstName
        , dbo.fn_get_first_name(ContactName) AS UDFFirstName
        , CASE
            WHEN CHARINDEX(' ', ContactName) = 0 THEN NULL
            ELSE RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName))
          END AS AdHocLastName
        , dbo.fn_get_last_name(ContactName) AS UDFLastName
    FROM dbo.t_w3_schools_customers
)
SELECT *
FROM comparison
WHERE AdHocFirstName <> UDFFirstName
    OR ISNULL(AdHocLastName, '') <> ISNULL(UDFLastName, '');
