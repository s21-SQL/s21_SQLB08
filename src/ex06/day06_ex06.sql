CREATE SEQUENCE IF NOT EXISTS seq_person_discounts AS bigint START WITH 1 INCREMENT BY 1;
SELECT setval(
    'seq_person_discounts',
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_discounts));
ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

/*
INSERT INTO person_discounts(person_id, pizzeria_id, discount)
VALUES (2, 3, 11);
*/
/*
DELETE FROM person_discounts
WHERE id > 15;
*/

/*
ALTER TABLE person_discounts
ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS seq_person_discounts;
*/

/*

SELECT count (*)=1 AS check1,
max ("start_value") = 1 AS check2,
max ("last_value") > 5 AS check3
FROM pg_sequences
WHERE sequencename = 'seq_person_discounts'
*/