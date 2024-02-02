CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS trigger AS $trg_person_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (
               now(),
               CASE
                   WHEN TG_OP = 'DELETE' THEN 'D'
                   WHEN TG_OP = 'UPDATE' THEN 'U'
                   WHEN TG_OP = 'INSERT' THEN 'I'
                   END,
               COALESCE(NEW.id, OLD.id),
               COALESCE(NEW.name, OLD.name),
               COALESCE(NEW.age, OLD.age),
               COALESCE(NEW.gender, OLD.gender),
               COALESCE(NEW.address, OLD.address)
           );

    RETURN NULL;
END;
$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
    AFTER DELETE OR UPDATE OR INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();


INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
