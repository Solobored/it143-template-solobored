-- Compare the ad hoc query results to the user-defined function results, side by side

SELECT
    ContactName
    , LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHocFirstName
    , dbo.fn_get_first_name(ContactName) AS UDFFirstName
    , CASE
        WHEN CHARINDEX(' ', ContactName) = 0 THEN NULL
        ELSE RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName))
      END AS AdHocLastName
    , dbo.fn_get_last_name(ContactName) AS UDFLastName
FROM dbo.t_w3_schools_customers;
