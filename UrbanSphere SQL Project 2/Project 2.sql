# Project 2

#1 What is the total number of unique customers who placed an order in the last calendar year?
USE UrbanSphere;

SELECT * FROM customers;
SELECT * FROM orders;

SELECT distinct
	COUNT(customer_id) AS unique_customers
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

#2 Which product category generated the highest total revenue in the last six months?
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT MAX(order_date) FROM orders;

SELECT 
	p.category,
    SUM(pa.final_amount) as total_revenue
FROM products as p
JOIN orders as o
ON p.product_id = o.product_id
JOIN payments as pa
ON o.order_id = pa.order_id
WHERE order_date >= DATE_SUB('2025-06-24', INTERVAL 6 MONTH)
GROUP BY p.category
ORDER BY SUM(pa.final_amount) DESC LIMIT 1;

#3 List all customers who have not placed a single order in the last three months.
SELECT * FROM orders;
SELECT * FROM customers;

SELECT
	c.customer_id,
    c.customer_name
FROM customers as c
LEFT JOIN orders as o
ON c.customer_id = o.customer_id
AND o.order_date >= DATE_SUB('2025-06-24', INTERVAL 3 MONTH)
WHERE o.order_id IS NULL;

#4 For each customer, show their most recent order date along with the total number of orders they have placed so far.
SELECT
    c.customer_name,
    c.customer_id,
    COUNT(o.order_id) AS total_orders,
    MAX(o.order_date) AS most_recent_order
FROM orders as o
LEFT JOIN customers as c
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY c.customer_id ASC;

#5 Which products have never been sold, and what is their category?
SELECT * FROM products;
SELECT * FROM orders;

SELECT 
    p.product_id,
    p.product_name,
    p.category
FROM products AS p
LEFT JOIN orders AS o
ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

#6 For each region, what is the total revenue generated in the last year?
SELECT * FROM regions;
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM orders;

SELECT 
	r.region_name,
    SUM(pa.final_amount) AS total_revenue_2024
FROM payments AS pa
LEFT JOIN orders as o
ON pa.order_id = o.order_id
LEFT JOIN customers AS c
ON c.customer_id = o.customer_id
LEFT JOIN regions AS r
ON c.region_id = r.region_id
WHERE o.order_date >= '2024-01-01' AND o.order_date <= '2024-12-31'
GROUP BY r.region_name
ORDER BY SUM(pa.final_amount) DESC;

#7 Show the top 3 customers (by total spend) for each region.
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM regions;

SELECT 
customer_name,
region_name,
total_spend
FROM (
	SELECT 
	c.customer_name,
    r.region_name,
    SUM(pa.final_amount) AS total_spend,
    ROW_NUMBER() OVER (PARTITION BY r.region_name ORDER BY SUM(pa.final_amount) DESC) AS rn
	FROM customers AS c
	JOIN orders as o
	ON c.customer_id = o.customer_id
	JOIN regions as r
	ON c.region_id = r.region_id
	JOIN payments AS pa
	ON o.order_id = pa.order_id 
	GROUP BY c.customer_id, c.customer_name, r.region_name)t
WHERE rn <= 3
ORDER BY region_name, total_spend DESC;

#8 Which customers have never purchased an Electronics product?
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;

SELECT 
c.customer_id, 
c.customer_name
FROM customers c
WHERE c.customer_id NOT IN (
    SELECT o.customer_id
    FROM orders o
    JOIN products p 
    ON o.product_id = p.product_id
    WHERE p.category = 'Electronics'
);

#9 For each month in the past year, display the total number of orders and the running total of orders up to that month.
SELECT * FROM orders;

SELECT
month,
total_orders,
SUM(total_orders) OVER (ORDER BY month) AS running_total
FROM (
    SELECT
        MONTH(order_date) AS month,
        SUM(quantity) AS total_orders
    FROM orders
    WHERE order_date <= '2024-12-31'
    GROUP BY MONTH(order_date)
) t
ORDER BY month;

#10 For each customer, calculate the average time gap (in days) between their consecutive orders.
SELECT
customer_id,
AVG(days_gap) AS avg_days_between_orders
FROM (
    SELECT
	customer_id,
	DATEDIFF(order_date, LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date ASC)) AS days_gap
    FROM orders
) t
WHERE days_gap IS NOT NULL  
GROUP BY customer_id;

#11 For each product, show the total quantity sold in each month and a rolling 3-month total of quantity sold for that product.
SELECT * FROM products;
SELECT * FROM payments;
SELECT * FROM orders;

SELECT
    product_name,
    total_quantity,
    SUM(total_quantity) OVER (
        PARTITION BY product_name
        ORDER BY order_year, order_month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_month_total
FROM (
    SELECT
        p.product_name,
        YEAR(o.order_date) AS order_year,
        MONTH(o.order_date) AS order_month,
        SUM(o.quantity) AS total_quantity
    FROM products AS p
    LEFT JOIN orders AS o ON p.product_id = o.product_id
    WHERE o.order_date >= '2024-01-01' AND o.order_date <= '2024-12-31'
    GROUP BY p.product_name, YEAR(o.order_date), MONTH(o.order_date)
) t
ORDER BY product_name, order_year, order_month;

#12 Display each order’s date and the running total revenue generated across all orders up to that date.
SELECT * FROM orders;
SELECT * FROM payments;

SELECT
    o.order_date,
    SUM(p.final_amount) AS daily_revenue,
    SUM(SUM(p.final_amount)) OVER (ORDER BY o.order_date) AS running_total  #SUM(daily_revenue) written as SUM(SUM(p.final_amount))
FROM orders AS o
LEFT JOIN payments AS p ON o.order_id = p.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

#13 Rank all products by total revenue generated, showing the product name, total revenue, and their overall rank.
SELECT * FROM products;
SELECT * FROM payments;
SELECT * FROM orders;

SELECT
	p.product_name,
    SUM(pa.final_amount) AS total_revenue,
    RANK() OVER(ORDER BY SUM(pa.final_amount) DESC) 
FROM products AS p
LEFT JOIN orders AS o
ON p.product_id = o.product_id
LEFT JOIN payments as pa
ON o.order_id = pa.order_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

#14 For each customer, display their name and the date of their most recent order (latest order date).
SELECT * FROM customers;
SELECT * FROM orders;

SELECT
    c.customer_name,
    MAX(o.order_date) AS most_recent_order
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

#15 For each order, show the order ID, customer name, and the average order value of all orders placed by that customer
SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM payments;

SELECT 
	c.customer_name,
    o.order_id,
	p.final_amount,
    AVG(p.final_amount) OVER(PARTITION BY c.customer_id) AS avg_order
FROM orders AS o
JOIN customers AS c
ON o.customer_id = c.customer_id
JOIN payments AS p
ON o.order_id = p.order_id;    
   
#16 For each customer, classify them as ‘High Value’, ‘Medium Value’, or ‘Low Value’ based on their total spend
#(e.g., High Value: >$500, Medium: $200–$500, Low: <$200). 
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM orders;

SELECT 
	c.customer_name,
    SUM(p.final_amount) AS total_spend,
    CASE 
    WHEN SUM(p.final_amount) > 500 THEN 'High Value'
    WHEN SUM(p.final_amount) BETWEEN 200 AND 500 THEN 'MEDIUM VALUE'
    WHEN SUM(p.final_amount) <= 200 THEN 'LOW VALUE'
    END AS ValueLoaded
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
JOIN payments AS p
ON o.order_id = p.order_id
GROUP BY c.customer_name
ORDER BY total_spend DESC;

#17 For each product, show the product name and a flag called ‘is_popular’ which is ‘Yes’ if the product has been sold more than 20 times, else ‘No’.
SELECT * FROM products;
SELECT * FROM orders;

SELECT 
	p.product_name,
    SUM(o.quantity) total_quantity,
    CASE
    WHEN SUM(o.quantity) >= 20 THEN 'Popular'
    ELSE 'No'
    END AS FlagNote
FROM products AS p
JOIN orders as o
ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

