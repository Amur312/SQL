SELECT pizza_name, price
FROM menu WHERE pizza_name = 'greek pizza';
UPDATE menu SET price = price * 0.9 WHERE pizza_name = 'greek pizza';
SELECT pizza_name, price AS newPrise
FROM menu WHERE pizza_name = 'greek pizza';

-- UPDATE menu
-- SET price = 800
-- WHERE pizzeria_id = 2 AND pizza_name = 'greek pizza';