-- Session #1
-- уровень изоляции REPEATABLE READ
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;


SELECT * FROM pizzeria WHERE name = 'Pizza Hut';


BEGIN;
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';


SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

COMMIT;
-- Session #2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

BEGIN;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';


COMMIT;