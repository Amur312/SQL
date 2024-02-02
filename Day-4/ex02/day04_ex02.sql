CREATE VIEW v_generated_dates AS
SELECT CAST(generated_date AS DATE) FROM generate_series(
                      '2022-01-01'::DATE,
                      '2022-01-31'::DATE,
                      '1 day'::INTERVAL
              ) AS generated_date
ORDER BY generated_date ASC;
