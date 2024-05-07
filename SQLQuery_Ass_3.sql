

--- There are 307 different products in the database, 
--- and sales were made by applying certain discounts to these products. 
--- In order to investigate whether the discounts in question have an effect on the sales amount,
--- I found it logical to compare the sales amounts according to the lowest discount applied 
--- to each product and the highest discount, and I based my query on this logic. 
--- The query I made evaluates based on the difference in sales in two discount groups.


WITH T1 AS (
    SELECT 
        product_id,
        MIN(discount) AS min_discount,
        MAX(discount) AS max_discount
    FROM 
        sale.order_item
    GROUP BY 
        product_id
)

SELECT 
    T1.product_id,
    T1.min_discount,
    T1.max_discount,
    SUM(CASE WHEN oi.discount = T1.min_discount THEN oi.quantity ELSE 0 END) AS min_quantity,
    SUM(CASE WHEN oi.discount = T1.max_discount THEN oi.quantity ELSE 0 END) AS max_quantity,
    SUM(CASE WHEN oi.discount = T1.max_discount THEN oi.quantity ELSE 0 END) -   
    SUM(CASE WHEN oi.discount = T1.min_discount THEN oi.quantity ELSE 0 END) AS diff_quantity,
    CASE 
        WHEN SUM(CASE WHEN oi.discount = T1.max_discount THEN oi.quantity ELSE 0 END) - SUM(CASE WHEN oi.discount = T1.min_discount THEN oi.quantity ELSE 0 END) > 0 THEN 'Positive'
        WHEN SUM(CASE WHEN oi.discount = T1.max_discount THEN oi.quantity ELSE 0 END) - SUM(CASE WHEN oi.discount = T1.min_discount THEN oi.quantity ELSE 0 END) < 0 THEN 'Negative'
        ELSE 'Neutral'
    END AS diff_quantity_evaluation
FROM 
     T1
    INNER JOIN sale.order_item oi ON T1.product_id = oi.product_id
GROUP BY 
    T1.product_id, T1.min_discount, T1.max_discount
ORDER BY 
    T1.product_id;




WITH T1 AS (
    SELECT 
        product_id,
        MIN(discount) AS min_discount,
        MAX(discount) AS max_discount
    FROM 
        sale.order_item
    GROUP BY 
        product_id
)

SELECT 
    T1.product_id,
    CASE 
        WHEN SUM(CASE WHEN oi.discount = T1.max_discount THEN oi.quantity ELSE 0 END) - SUM(CASE WHEN oi.discount = T1.min_discount THEN oi.quantity ELSE 0 END) > 0 THEN 'Positive'
        WHEN SUM(CASE WHEN oi.discount = T1.max_discount THEN oi.quantity ELSE 0 END) - SUM(CASE WHEN oi.discount = T1.min_discount THEN oi.quantity ELSE 0 END) < 0 THEN 'Negative'
        ELSE 'Neutral'
    END AS diff_quantity_evaluation
FROM 
     T1
    INNER JOIN sale.order_item oi ON T1.product_id = oi.product_id
GROUP BY 
    T1.product_id, T1.min_discount, T1.max_discount
ORDER BY 
    T1.product_id;



   

