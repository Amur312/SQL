SELECT name, COUNT(name) AS count_of_orders,
            ROUND(AVG(price),2) AS average_price,
            MAX(price) AS max_price,
            MIN(price) AS min_price
FROM pizzeria AS pz
JOIN menu AS m ON pz.id = m.pizzeria_id
JOIN person_order AS po ON m.id = po.menu_id
group by name, pizzeria_id
ORDER BY name;
