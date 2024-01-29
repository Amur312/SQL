-- Вставка данных о курсе валюты
-- INSERT INTO currency (id, name, rate_to_usd, updated)
-- VALUES
--     (100, 'EUR', 0.85, '2022-01-01 13:29'),
--     (100, 'EUR', 0.79, '2022-01-08 13:29');

-- Функция для поиска курса валюты в прошлом
CREATE OR REPLACE FUNCTION get_past_exchange_rate(
    current_currency_id BIGINT,
    balance_updated TIMESTAMP
)
    RETURNS NUMERIC AS
$$
BEGIN
    RETURN (
        SELECT rate_to_usd
        FROM currency
        WHERE id = current_currency_id AND updated < balance_updated
        ORDER BY balance_updated - updated
        LIMIT 1
    );
END;
$$ LANGUAGE plpgsql;

-- Функция для поиска курса валюты в будущем
CREATE OR REPLACE FUNCTION get_future_exchange_rate(
    current_currency_id BIGINT,
    balance_updated TIMESTAMP
)
    RETURNS NUMERIC AS
$$
BEGIN
    RETURN (
        SELECT rate_to_usd
        FROM currency
        WHERE id = current_currency_id AND updated >= balance_updated
        ORDER BY updated - balance_updated
        LIMIT 1
    );
END;
$$ LANGUAGE plpgsql;

-- Функция для определения ближайшего курса валюты
CREATE OR REPLACE FUNCTION get_nearest_exchange_rate(
    current_currency_id BIGINT,
    balance_updated TIMESTAMP
)
    RETURNS NUMERIC AS
$$
DECLARE
    past_rate NUMERIC := get_past_exchange_rate(current_currency_id, balance_updated);
BEGIN
    IF past_rate IS NOT NULL THEN
        RETURN past_rate;
    END IF;
    RETURN get_future_exchange_rate(current_currency_id, balance_updated);
END;
$$ LANGUAGE plpgsql;

-- Запрос для получения информации о пользователях и транзакциях баланса
WITH currency_info AS (
    SELECT DISTINCT id AS currency_id, name
    FROM currency
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    ci.name AS currency_name,
    (get_nearest_exchange_rate(b.currency_id, b.updated) * b.money)::REAL AS currency_in_usd
FROM
    balance b
        JOIN currency_info ci ON b.currency_id = ci.currency_id
        LEFT JOIN "user" AS u ON u.id = b.user_id
ORDER BY
    name DESC, lastname ASC, currency_name ASC;