SET enable_seqscan = OFF;
CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);
EXPLAIN ANALYZE
SELECT p.name,
       m.pizza_name,
       m.price,
       m.price - (m.price * pd.discount / 100) AS discount_price,
       pz.name
FROM person_order AS po
         JOIN person AS p
              ON po.person_id = p.id
         JOIN menu AS m ON po.menu_id = m.id
         JOIN person_discounts AS pd ON po.person_id = pd.person_id AND po.person_id = pd.pizzeria_id
         JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
ORDER BY p.name, m.pizza_name;
