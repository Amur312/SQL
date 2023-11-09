SELECT po.name
FROM pizzeria po
WHERE po.id NOT IN (SELECT DISTINCT pv.pizzeria_id FROM person_visits pv);

SELECT po.name
FROM pizzeria po
WHERE NOT EXISTS (SELECT 1 FROM person_visits pv WHERE pv.pizzeria_id = po.id);
