drop function if exists fnc_persons_female();
drop function if exists fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender varchar default 'female')
RETURNS SETOF person AS $$
    SELECT *
    FROM person
    WHERE gender = pgender;
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();