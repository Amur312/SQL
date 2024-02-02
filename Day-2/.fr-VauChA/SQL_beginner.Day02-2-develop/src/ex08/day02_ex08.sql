SELECT DISTINCT pe.name
FROM person pe
         JOIN person_order po ON pe.id = po.person_id
         JOIN menu m ON po.menu_id = m.id
WHERE pe.gender = 'male'
  AND pe.address IN ('Moscow', 'Samara')
  AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY pe.name DESC;
