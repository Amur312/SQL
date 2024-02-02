-- DROP FUNCTION fnc_trg_person_delete_audit CASCADE;

CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger AS $func$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP, 'D', OLD.* FROM OLD;
    END IF;

    RETURN NULL;
END;
$func$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit
    AFTER DELETE
    ON person
    FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_delete_audit();


DELETE FROM person WHERE id = 10;