CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
) RETURNS TABLE (nam VARCHAR) AS $$
BEGIN
    RETURN QUERY
        SELECT piz.name
        FROM pizzeria AS piz
                 JOIN menu AS m ON piz.id = m.pizzeria_id AND m.price < pprice
                 JOIN person_visits AS pv ON piz.id = pv.pizzeria_id AND pv.visit_date = pdate
                 JOIN person AS p ON p.id = pv.person_id AND p.name = pperson;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
