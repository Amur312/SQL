-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;
UPDATE pizzeria SET rating = 1.0 WHERE id = 2;
COMMIT;

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;
UPDATE pizzeria SET rating = 1.0 WHERE id = 2;
COMMIT;