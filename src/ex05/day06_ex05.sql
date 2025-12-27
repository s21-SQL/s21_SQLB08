COMMENT ON TABLE person_discounts IS
'Таблица хранит информацию о персональных скидках, предоставляемых клиентам в конкретных пиццериях.
 Каждая строка описывает размер скидки для определённого человека в определённой пиццерии, и зависит от количества купленных ранее пицц в данной пицерии';
COMMENT ON COLUMN person_discounts.id IS
'Уникальный идентификатор записи.';
COMMENT ON COLUMN person_discounts.person_id IS
'Идентификатор покупателя, которому назначена скидка. Ссылается на таблицу person.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS
'Идентификатор пиццерии, в которой действует персональная скидка. Ссылается на таблицу pizzeria.';
COMMENT ON COLUMN person_discounts.discount IS
'Размер персональной скидки в процентах (от 0.00 до 100.00). Округляет до сотых долей процента';

SELECT obj_description('person_discounts'::regclass) AS person_discounts;
SELECT pg_attribute.attname AS column_name_person_discounts, pg_description.description AS column_comment
FROM pg_attribute 
JOIN pg_class ON pg_attribute.attrelid = pg_class.oid
LEFT JOIN pg_description ON pg_class.oid = pg_description.objoid AND pg_attribute.attnum = pg_description.objsubid
WHERE pg_class.relname = 'person_discounts' AND pg_description.description IS NOT NULL;