-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;