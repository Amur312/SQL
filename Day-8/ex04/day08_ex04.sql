-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
