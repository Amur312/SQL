-- CTE для получения последних курсов валют
WITH currency_rates AS (
    SELECT id,
           name,
           rate_to_usd,
           updated
    FROM (
             SELECT id,
                    name,
                    rate_to_usd,
                    updated,
                    ROW_NUMBER() OVER (PARTITION BY id, name ORDER BY updated DESC) AS rn
             FROM currency
         ) ranked
    WHERE rn = 1
),
-- CTE для сбора информации о транзакциях
     full_transaction_info AS (
         SELECT
             COALESCE(u.name, 'not defined') AS user_name,
             COALESCE(u.lastname, 'not defined') AS user_lastname,
             b.type AS balance_type,
             COALESCE(SUM(COALESCE(b.money, 0)), 0) AS transaction_volume,
             COALESCE(c.name, 'not defined') AS currency_name,
             COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd
         FROM
             balance b
                 FULL JOIN "user" u ON b.user_id = u.id
                 FULL JOIN currency_rates c ON b.currency_id = c.id
         GROUP BY
             u.name, u.lastname, b.type, c.name, c.rate_to_usd
     ),
-- Вывод результатов без сортировки
     unsorted_results AS (
         SELECT
             user_name AS name,
             user_lastname AS lastname,
             balance_type AS type,
             transaction_volume AS volume,
             currency_name,
             last_rate_to_usd,
             TRIM_SCALE(transaction_volume * last_rate_to_usd) AS total_volume_in_usd
         FROM
             full_transaction_info
     )
-- Вывод результатов с сортировкой
SELECT
    name,
    lastname,
    type,
    volume,
    currency_name,
    last_rate_to_usd,
    total_volume_in_usd
FROM
    unsorted_results
ORDER BY
    name DESC,
    lastname ASC,
    type ASC;
