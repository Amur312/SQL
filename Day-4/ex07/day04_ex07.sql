WITH
    NewID AS (
        SELECT MAX(id) + 1 AS id FROM person_visits
    ), -- Новый ID для вставки
    DmitriyID AS (
        SELECT id AS person_id FROM person WHERE name = 'Dmitriy'
    ), -- ID Дмитрия
    SelectedPizzeria AS (
        SELECT p.id AS pizzeria_id
        FROM pizzeria p
                 JOIN menu m ON p.id = m.pizzeria_id
        WHERE m.price < 800 AND p.id NOT IN (
            SELECT pv.pizzeria_id
            FROM person_visits pv
                     JOIN person pe ON pv.person_id = pe.id
            WHERE pe.name = 'Dmitriy'
        )
        LIMIT 1
    ) -- Выбор подходящей пиццерии

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT NewID.id, DmitriyID.person_id, SelectedPizzeria.pizzeria_id, '2022-01-08'::date
FROM NewID, DmitriyID, SelectedPizzeria;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
