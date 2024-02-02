WITH visits AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
      AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
)
SELECT series.day::DATE
FROM (
         SELECT generate_series('2022-01-01'::DATE, '2022-01-10'::DATE, '1 day'::INTERVAL) AS day
     ) AS series
         LEFT JOIN visits ON series.day = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY series.day;

