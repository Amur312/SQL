WITH OrderStats AS (SELECT pz.name,
                           COUNT(*) AS total_count
                    FROM pizzeria AS pz
                             JOIN menu AS m ON pz.id = m.pizzeria_id
                             JOIN person_order AS po ON po.menu_id = m.id
                    GROUP BY pz.name),
     VisitStats AS (SELECT pz2.name,
                           COUNT(*) AS total_count
                    FROM pizzeria AS pz2
                             JOIN person_visits AS pv2 ON pv2.pizzeria_id = pz2.id
                    GROUP BY pz2.name)
SELECT COALESCE(OrderStats.name, VisitStats.name)                                AS name,
       COALESCE(OrderStats.total_count, 0) + COALESCE(VisitStats.total_count, 0) as total_count
FROM OrderStats
         FULL JOIN VisitStats ON OrderStats.name = VisitStats.name
ORDER BY total_count DESC;
