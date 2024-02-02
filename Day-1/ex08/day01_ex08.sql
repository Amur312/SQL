SELECT po.order_date,
       pv.name || ' (age:' || pv.age || ')' AS person_information
FROM person_order po
         NATURAL JOIN
         (SELECT id AS person_id, name, age FROM person) AS pv
ORDER BY po.order_date, pv.name;
