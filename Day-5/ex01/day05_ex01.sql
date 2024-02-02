EXPLAIN ANALYZE
SELECT menu.pizza_name, p.name AS pizzeria_name
FROM menu
         JOIN pizzeria p ON menu.pizzeria_id = p.id;
