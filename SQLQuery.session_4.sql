SELECT NULLIF(10, 11)
SELECT ISNUMERIC(456677)

SELECT COUNT(customer_id) FROM sale.customer
WHERE email LIKE '%yahoo.com'

SELECT email, LEFT(email, PATINDEX('%@%', email) - 1) AS characters_before_at
FROM sale.customer;

SELECT street
FROM sale.customer
WHERE ISNUMERIC(SUBSTRING(street, 3, 1)) = 1 


SELECT sf.first_name, sf.last_name, st.store_name FROM sale.staff sf
INNER JOIN sale.store st ON sf.store_id = st.store_id 

SELECT p.product_id, p.product_name, s.store_id, s.product_id, s.quantity FROM product.product p
LEFT JOIN product.stock s ON p.product_id = s.product_id
WHERE p.product_id > 310


SELECT o.* FROM sale.orders o
RIGHT JOIN sale.staff sf ON o.staff_id = sf.staff_id

SELECT A.staff_id, A.first_name, A.last_name, B.*
FROM sale.staff AS A
	LEFT JOIN
	sale.orders AS B
	ON A.staff_id = B.staff_id

SELECT sf.staff_id, sf.first_name, sf.last_name, o.order_id,o.customer_id,o.order_status,
o.order_date, o.required_date, o.shipped_date, o.store_id, o.staff_id
FROM sale.staff as sf
LEFT JOIN sale.orders as o 
ON sf.staff_id = o.staff_id


SELECT p.product_id, oi.order_id, s.store_id, oi.quantity, oi.list_price 
FROM product.product p
FULL JOIN sale.order_item oi ON p.product_id = oi.product_id
FULL OUTER JOIN product.stock s ON oi.product_id = s.product_id

----OUERY 1-------------

SELECT email,
SUBSTRING(email, 1, CHARINDEX('@', email) - 1) AS username,
SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email) - CHARINDEX('@', email)) AS domain
FROM sale.customer;

------Query 2-----------
 
 SELECT street                 -------- REPLACE(street, CHARINDEX(    PATINDEX(%' ', street)
 FROM sale.customer

SELECT street,
    CASE 
        WHEN ISNUMERIC(LEFT(street, 1) + 'e0') = 1 THEN 
            CASE 
                WHEN PATINDEX('%[a-zA-Z]%', SUBSTRING(street, 2, LEN(street))) > 0 THEN 
                    SUBSTRING(street, 1, 1) + SUBSTRING(street, PATINDEX('%[a-zA-Z]%', SUBSTRING(street, 2, LEN(street))), LEN(street))
                ELSE
                    street
            END
        ELSE
            street
    END AS yeni_street
FROM 
    sale.customer;


SELECT street,
    CASE 
        WHEN PATINDEX('%[0-9]%', street) > 0 THEN 
            SUBSTRING(street, PATINDEX('%[0-9]%', street) + PATINDEX('%[a-zA-Z]%', SUBSTRING(street, PATINDEX('%[0-9]%', street), LEN(street))), LEN(street))
        ELSE
            street
    END AS yeni_street
FROM 
    sale.customer;


	----------QUERY 3------------------

-----------Write query that returns both the names of staff and tne names of their 1th and 2nd managers----------












