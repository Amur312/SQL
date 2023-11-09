SELECT DISTINCT po.order_date as action_date, (SELECT name FROM person WHERE id = po.person_id) AS person_name
FROM person_order po
WHERE EXISTS (SELECT 1
              FROM person_visits pv
              WHERE pv.visit_date = po.order_date
                AND pv.person_id = po.person_id)

ORDER BY action_date, person_name DESC;
