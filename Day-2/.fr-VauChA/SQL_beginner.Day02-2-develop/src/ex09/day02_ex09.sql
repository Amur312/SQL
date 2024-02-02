SELECT pe.name
FROM person pe
         JOIN person_order po ON pe.id = po.person_id
         JOIN menu m ON po.menu_id = m.id
WHERE pe.gender = 'female'
  AND m.pizza_name IN ('pepperoni pizza', 'cheese pizza')
GROUP BY pe.id, pe.name
HAVING COUNT(DISTINCT m.pizza_name) = 2
ORDER BY pe.name;
