SELECT pi.name AS pizzeria_name
FROM pizzeria pi
         INNER JOIN person_visits pv ON pi.id = pv.pizzeria_id
         INNER JOIN person p ON pv.person_id = p.id
WHERE p.name = 'Andrey'
  AND NOT EXISTS (SELECT 1
                  FROM person_order po
                           INNER JOIN menu m ON po.menu_id = m.id
                           INNER JOIN person p2 ON po.person_id = p2.id
                  WHERE p2.name = 'Andrey'
                    AND m.pizzeria_id = pi.id)
ORDER BY pi.name;
