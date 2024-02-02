WITH visits AS (SELECT visit_date
                FROM person_visits
                WHERE person_id IN (1, 2)
                  AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'),
DateSeries AS (SELECT generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day'::INTERVAL) AS day)
SELECT ds.day::DATE
FROM DateSeries ds
LEFT JOIN visits ON  ds.day = visit_date
WHERE visit_date IS NULL
ORDER BY ds.day;

