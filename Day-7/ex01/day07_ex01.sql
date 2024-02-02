SELECT
    name,
    COUNT(*) AS count_of_visits
FROM
    person AS p
JOIN person_visits AS pv ON p.id = pv.person_id
GROUP BY
    name
ORDER BY
    count_of_visits DESC,
    name ASC
LIMIT 4;;

