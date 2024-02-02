CREATE OR REPLACE FUNCTION fnc_fibonacci(
    pstop integer DEFAULT 10
)
    RETURNS SETOF integer AS $$
BEGIN
    RETURN QUERY WITH RECURSIVE q(num, prev) AS (
        SELECT 0, 1
        UNION ALL
        SELECT
            q.num + q.prev,
            q.num
        FROM q
        WHERE q.num + q.prev < pstop
    )
                 SELECT
                     num
                 FROM q;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_fibonacci(100);

SELECT *
FROM fnc_fibonacci();
