-- DROP FUNCTION fnc_trg_person_update_audit CASCADE;
-- DROP FUNCTION fnc_trg_person_insert_audit CASCADE;
-- DROP FUNCTION fnc_trg_person_delete_audit CASCADE;

CREATE TABLE person_audit(

                             created timestamp with time zone default CURRENT_TIMESTAMP NOT NULL,
                             type_event char(1) NOT NULL default 'I',
                             row_id bigint NOT NULL,
                             name varchar NOT NULL,
                             age integer NOT NULL,
                             gender varchar NOT NULL,
                             address varchar,
                             constraint ch_type_event check (type_event = 'I' OR
                                                             type_event = 'U' OR
                                                             type_event = 'D')
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger AS $trg_person_insert_audit$
BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I',
                                        NEW.id,
                                        NEW.name, NEW.age, NEW.gender, NEW.address;
    END IF;
    RETURN NULL;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
--
-- SELECT * FROM person WHERE id = 10;
-- DELETE FROM person
-- WHERE id = 10;
