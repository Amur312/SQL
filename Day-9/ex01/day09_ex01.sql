-- Функция триггера
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
  RETURNS trigger AS
$func$
BEGIN
  IF (TG_OP = 'UPDATE') THEN

    INSERT INTO person_audit (
      created, type_event, row_id, name, age, gender, address
    ) VALUES (
      now(),
      'U',
      OLD.id,
      OLD.name,
      OLD.age,
      OLD.gender,
      OLD.address
    );

  END IF;

  RETURN NULL;
END;
$func$ LANGUAGE plpgsql;

-- Триггер
CREATE TRIGGER trg_person_update_audit
  AFTER UPDATE ON person
  FOR EACH ROW
  EXECUTE FUNCTION fnc_trg_person_update_audit();

-- Тестирование
BEGIN;

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

COMMIT;


