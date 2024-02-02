SELECT m.pizza_name, m.price, p.name AS pizzeria_name, pv.visit_date
FROM person pe
JOIN  person_visits pv ON pe.id = pv.person_id
JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
JOIN pizzeria p ON m.pizzeria_id = p.id
WHERE pe.name = 'Kate'
AND m.price BETWEEN 800 AND 1000
ORDER BY  m.pizza_name, m.price, p.name;