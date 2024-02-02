SELECT
    address,
    ROUND(CAST(MAX(age) AS numeric(5,2)) - (CAST(MIN(age) AS numeric(5,2)) / CAST(MAX(age) AS numeric(5,2))), 2) AS formula,
    ROUND(CAST(AVG(age) AS numeric(5,2)), 2) AS average,
    CASE WHEN MAX(age) - (MIN(age) / MAX(age)) > AVG(age) THEN 'true' ELSE 'false' END AS comparison
FROM
    person
GROUP BY
    address
ORDER BY
    address;
