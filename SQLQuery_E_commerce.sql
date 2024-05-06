UPDATE e_commerce_data
SET Ord_ID = CAST(SUBSTRING(Ord_ID, 5, LEN(Ord_ID) - 4) AS INT)
UPDATE e_commerce_data
SET Cust_ID = CAST(SUBSTRING(Cust_ID, 6, LEN(Cust_ID) - 5) AS INT)
UPDATE e_commerce_data
SET Prod_ID = CAST(SUBSTRING(Prod_ID, 6, LEN(Prod_ID) - 4) AS INT)
UPDATE e_commerce_data
SET Ship_ID = CAST(SUBSTRING(Ship_ID, 6, LEN(Ship_ID) - 4) AS INT)



SELECT * FROM e_commerce_data

---- 1. Find the top 3 customers who have the maximum count of orders.----

SELECT TOP 3 Customer_Name, COUNT(Ord_ID) orders_count FROM e_commerce_data
GROUP BY Customer_Name
ORDER BY orders_count DESC

---- 2. Find the customer whose order took the maximum time to get shipping.----

SELECT TOP 1 Customer_Name, DATEDIFF(day, Order_Date, Ship_Date) max_ship_time
FROM e_commerce_data
GROUP BY Customer_Name, Ship_Date, Order_Date
ORDER BY max_ship_time DESC;

---- 3. Count the total number of unique customers in January and how many of them came back again in the each one months of 2011.----

SELECT DISTINCT Customer_Name FROM e_commerce_data
WHERE MONTH(Order_Date) = 01

SELECT 