WITH OrderStats AS (
    SELECT
        pz.name,
        COUNT(*) AS count,
        'order' AS action_type,
        ROW_NUMBER() OVER (PARTITION BY 'order' ORDER BY COUNT(*) DESC) AS rn
    FROM
        pizzeria AS pz
            JOIN menu AS m ON pz.id = m.pizzeria_id
            JOIN person_order AS po ON po.menu_id = m.id
    GROUP BY
        pz.name
), VisitStats AS (
    SELECT
        pz2.name,
        COUNT(*) AS count,
        'visit' AS action_type,
        ROW_NUMBER() OVER (PARTITION BY 'visit' ORDER BY COUNT(*) DESC) AS rn
    FROM
        pizzeria AS pz2
            JOIN person_visits AS pv2 ON pv2.pizzeria_id = pz2.id
    GROUP BY
        pz2.name
)
SELECT
    name,
    count,
    action_type
FROM
    (
        SELECT * FROM OrderStats WHERE rn <= 3
        UNION ALL
        SELECT * FROM VisitStats WHERE rn <= 3
    ) AS CombinedStats
ORDER BY
    action_type,
    count DESC,
    name;
