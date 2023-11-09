SELECT
    IFNULL(p.name, '-') AS person_name,
    pv.visit_date,
    IFNULL(pi.name, '-') AS pizzeria_name
FROM
    (SELECT id, name FROM person UNION SELECT NULL, NULL) p
        CROSS JOIN
    (SELECT id, name FROM pizzeria UNION SELECT NULL, NULL) pi
        LEFT JOIN
    person_visits pv ON p.id = pv.person_id AND pi.id = pv.pizzeria_id AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
ORDER BY
    visit_date DESC, person_name, pizzeria_name;
