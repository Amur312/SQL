CREATE UNIQUE INDEX IF NOT EXISTS idx_menu_unique ON menu (pizzeria_id, pizza_name);
EXPLAIN ANALYSE
SELECT * FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza';