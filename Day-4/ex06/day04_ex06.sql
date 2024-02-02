CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT p.name
FROM person_visits pv
         JOIN pizzeria p ON pv.pizzeria_id = p.id
         JOIN menu m ON p.id = m.pizzeria_id
         JOIN person pe ON pv.person_id = pe.id
WHERE pe.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800;

