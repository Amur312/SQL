SELECT po.order_date,
       pv.name || ' (age:' || pv.age || ')' AS person_information
FROM person_order po
         JOIN
     person pv ON po.person_id = pv.id
ORDER BY po.order_date ASC,
         person_information ASC;
