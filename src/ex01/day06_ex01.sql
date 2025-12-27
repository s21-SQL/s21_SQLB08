INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER () AS id, 
    SUBCHIK.person_id, 
    SUBCHIK.pizzeria_id,
    (CASE 
    WHEN SUBCHIK.order_count = 1 THEN 10.50
    WHEN SUBCHIK.order_count = 2 THEN 22
    ELSE 30
    END) AS discount
FROM (
    SELECT
        person_id,
        pizzeria_id,
        COUNT(person_id) AS order_count
    FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    GROUP BY po.person_id, m.pizzeria_id
) AS SUBCHIK;


