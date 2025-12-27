DROP INDEX IF EXISTS idx_person_discounts_unique;
CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);
SET enable_seqscan TO OFF;

SELECT person.name, pizzeria_id, discount
FROM person_discounts
JOIN person ON person_discounts.person_id = person.id;

EXPLAIN ANALYSE 
SELECT person.name, pizzeria_id, discount
FROM person_discounts
JOIN person ON person_discounts.person_id = person.id;
