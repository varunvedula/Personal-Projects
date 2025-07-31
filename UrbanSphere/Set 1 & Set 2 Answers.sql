# --- SQL USE CASES FOR URBANSPHERE ---

#Q1 What is the total number of orders placed per product category?
USE UrbanSphere;

SELECT * FROM orders;
SELECT * FROM products;

SELECT 
    p.category,
    SUM(o.quantity) AS total_quantity
FROM orders AS o
JOIN products AS p ON o.product_id = p.product_id
GROUP BY p.category;

# Q2 List the top 5 customers by the number of orders they’ve placed.
SELECT * FROM orders;
SELECT * FROM customers;

SELECT 
	customer_id,
	SUM(quantity) as total_orders
FROM orders
GROUP BY customer_id
ORDER BY SUM(quantity) DESC LIMIT 5;

#Q3 What is the total revenue collected for each order status?
SELECT * FROM orders;
SELECT * FROM payments;

SELECT
	o.order_status,
	SUM(p.final_amount) as total_revenue
FROM orders as o
JOIN payments as p
ON o.order_id = p.order_id
GROUP BY o.order_status;

#Q4 Which city has the highest number of customers?
SELECT * FROM customers;

SELECT
	r.city,
    COUNT(c.customer_id) as total_customers
FROM regions AS r
JOIN customers AS c
ON r.region_id = c.region_id
GROUP BY r.city 
ORDER BY total_customers DESC;

#Q5 Which payment method is used most often (excluding NULLs)?
SELECT * FROM payments;

SELECT 
	payment_method,
	COUNT(COALESCE (payment_method, 0)) as count_pm
FROM payments
WHERE payment_method IS NOT NULL
GROUP By payment_method
ORDER BY count_pm DESC;

#Q6 Which orders have NULL final_amount values and their associated customer details?
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM payments;

SELECT 
	c.customer_id,
    c.customer_name,
    o.order_id,
    p.payment_id,
    p.final_amount
FROM customers as c
JOIN orders as o
ON c.customer_id = o.customer_id
JOIN payments as p
ON o.order_id = p.order_id
WHERE p.final_amount IS NULL;

#Q7 Which 3 cities generated the highest total revenue?
SELECT 
    r.city,
	SUM(p.final_amount) AS total_revenue
FROM customers as c
JOIN regions as r
ON c.region_id = r.region_id
JOIN orders as o 
ON c.customer_id = o.customer_id
JOIN payments as p
ON o.order_id = p.order_id
GROUP BY r.city
ORDER BY total_revenue DESC LIMIT 3;

#Q9 Which orders have NULL values in payment_method or final_amount?
SELECT * FROM payments;

SELECT
	payment_id,
	payment_method,
    final_amount
FROM payments
WHERE payment_method IS NULL OR final_amount IS NULL;

#Q10 Rank customers within each region based on total revenue generated.
SELECT * FROM payments;
SELECT * FROM orders;
SELECT * FROM customers;

SELECT 
    r.region_name,
    c.customer_id,
    c.customer_name,
    SUM(p.final_amount) AS total_revenue,
    RANK() OVER (PARTITION BY r.region_name ORDER BY SUM(p.final_amount) DESC) AS revenue_rank
FROM customers AS c
JOIN regions AS r ON c.region_id = r.region_id
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN payments AS p ON o.order_id = p.order_id
GROUP BY r.region_name, c.customer_id, c.customer_name
ORDER BY r.region_name, revenue_rank;

#11 Identify customers who placed orders in both 2024 and 2025.
SELECT 
	o.customer_id,
    c.customer_name
FROM orders AS o
JOIN customers AS c
ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) IN (2024,2025)
GROUP BY o.customer_id, c.customer_name
HAVING COUNT(DISTINCT YEAR(o.order_date)) = 2;

#12 What is the average quantity and average revenue per product category?
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM payments;

SELECT
	p.category,
    AVG(o.quantity) AS average_quantity,
    AVG(pa.final_amount) AS average_revenue
FROM products as p
JOIN orders as o
ON p.product_id = o.product_id
JOIN payments as pa
ON o.order_id = pa.order_id
GROUP BY p.category;

#13 What are the top 3 most returned products?
SELECT * FROM returns;
SELECT * FROM orders;
SELECT * FROM products;

SELECT 
	p.product_name,
	COUNT(r.return_id) as return_counts
FROM products as p
LEFT JOIN orders as o
ON p.product_id = o.product_id
LEFT JOIN returns as r
ON o.order_id = r.order_id
GROUP BY p.product_name
ORDER BY return_counts DESC LIMIT 3;

#14 What percentage of customers in each region belong to the Gold segment?
SELECT * FROM customers;
SELECT * FROM regions;
    
SELECT
	region_name,
	ROUND(COUNT(CASE WHEN segment = 'Gold' THEN 1 END)/COUNT(*) * 100, 0) as percentage_gold
FROM customers
JOIN regions 
ON customers.region_id = regions.region_id
GROUP BY region_name;

#15 Which customer has generated the highest total revenue overall?
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM orders;

SELECT
	c.customer_name,
	SUM(p.final_amount) as total_revenue
FROM customers as c
JOIN orders as o
ON c.customer_id = o.customer_id
JOIN payments as p 
ON o.order_id = p.order_id
GROUP BY c.customer_name
ORDER BY SUM(p.final_amount) DESC LIMIT 1;
    
#16 What is the average final amount paid for each payment method?
SELECT * FROM payments;

SELECT 
	payment_method,
	COALESCE(AVG(final_amount), 0) as avg_amount
FROM payments
WHERE payment_method IS NOT NULL
GROUP BY payment_method;

#17 Which product category generated the highest total revenue?
SELECT * FROM products;
SELECT * FROM payments;
SELECT * FROM orders;

SELECT 
	COALESCE(SUM(pa.final_amount), 0) as total_revenue,
    pr.category
FROM payments as pa
JOIN orders as o
ON pa.order_id = o.order_id
JOIN products as pr
ON o.product_id = pr.product_id
GROUP BY pr.category
ORDER BY COALESCE(SUM(pa.final_amount), 0) DESC LIMIT 1;

#18 Which customers have placed only one order?
SELECT * FROM customers;
SELECT * FROM orders;

SELECT 
    c.customer_id,
    COUNT(o.order_id)
FROM customers AS c
JOIN orders as o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(o.order_id) = 1;

#19 What are the first 10 product names in alphabetical order?
SELECT * FROM products;

SELECT 
	product_name 
FROM products
ORDER BY product_name ASC LIMIT 10;

#20 Classify each product into Budget, Standard, or Premium using a CASE statement.
SELECT * FROM products;

SELECT
	*,
    CASE 
    WHEN price <= 30 THEN 'Budget'
    WHEN price BETWEEN 30 AND 70 THEN 'Standard'
    WHEN price > 70 THEN 'Premium'
    END AS labels
FROM products
ORDER BY price DESC;

#21 Count the number of customers in each segment.
SELECT
	COUNT(customer_id) as number_of_cust,
    segment
FROM customers
GROUP BY segment;

#22 What is the average discount given for each payment method?
SELECT * FROM payments;

SELECT 
	payment_method,
    COALESCE(AVG(discount), 0) as avg_discount
FROM payments 
GROUP BY payment_method;

#23 List the names of customers who placed orders but never had any returns.
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM returns;
    
SELECT DISTINCT 
	c.customer_name
FROM customers as c
JOIN orders as o 
ON c.customer_id = o.customer_id
WHERE o.order_id NOT IN (
    SELECT order_id FROM returns
);

#24 List product categories that had at least one order but zero returns.
SELECT DISTINCT 
	p.category
FROM products p
JOIN orders o ON p.product_id = o.product_id
LEFT JOIN returns r ON o.order_id = r.order_id
WHERE r.return_id IS NULL;

#25 Which product had the highest final amount paid in a single order?
SELECT * FROM products;
SELECT * FROM payments;
    
SELECT 
    p.product_name,
    pa.order_id,
    pa.final_amount
FROM payments pa
JOIN orders o ON pa.order_id = o.order_id
JOIN products p ON o.product_id = p.product_id
ORDER BY pa.final_amount DESC
LIMIT 1;

# ----- END -----