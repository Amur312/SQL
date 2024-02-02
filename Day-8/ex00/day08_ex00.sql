-- В сессии #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- В сессии #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- В сессии #1
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';