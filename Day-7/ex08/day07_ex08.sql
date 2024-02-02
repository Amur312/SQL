SELECT address, pz.name, COUNT(pz.name) AS count_of_orders
FROM person AS p
         JOIN person_order AS po ON p.id = po.person_id
         JOIN menu AS m ON po.menu_id = m.id
         JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
GROUP BY p.address, pz.name
ORDER BY p.address, pz.name
