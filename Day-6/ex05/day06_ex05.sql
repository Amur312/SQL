COMMENT ON TABLE person_discounts IS 'Эта таблица хранит информацию о скидках, предоставляемых различным клиентам в разных пиццериях. Она содержит идентификаторы клиентов, пиццерий и информацию о размере скидки.';
COMMENT ON COLUMN person_discounts.id IS 'Идентификатор id в таблице';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, получающего скидку.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, предоставляющей скидку.';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки, предоставляемой клиенту, в процентах.';