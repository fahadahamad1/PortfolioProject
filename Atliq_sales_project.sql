-- All Tables

SELECT * FROM customers;

SELECT * FROM date;

SELECT * FROM markets;

SELECT * FROM products;

SELECT * FROM transactions;

-- Rename the Column Name 

ALTER TABLE customers CHANGE custmer_name customer_name VARCHAR(50);

-- find Top 5 customer name  by amount

SELECT c.customer_name, SUM(t.sales_amount) AS total_amount 
FROM customers c 
JOIN transactions t 
ON c.customer_code = t.customer_code
GROUP BY customer_name
ORDER BY total_amount DESC
LIMIT 5;

-- find bottom 5 customer name by amount and Qty

SELECT c.customer_name, SUM(t.sales_amount) AS total_amount, SUM(t.sales_qty) AS total_qty 
FROM customers c 
JOIN transactions t 
ON c.customer_code = t.customer_code
GROUP BY customer_name
ORDER BY total_amount ASC
LIMIT 5;

-- find customer name , market name , zone , order_date from oldest to newest ,Qty and amount 

SELECT c.customer_name, m.markets_name, m.zone, t.order_date, t.sales_qty, t.sales_amount
FROM customers c
JOIN transactions t 
ON c.customer_code = t.customer_code
JOIN markets m
ON t.market_code = m.markets_code
ORDER BY t.order_date ASC;

-- Find Total Amount by zone

SELECT m.zone, SUM(t.sales_amount) AS total_amount 
FROM markets m 
JOIN transactions t 
ON m.markets_code = t.market_code
GROUP BY zone
ORDER BY total_amount DESC;

-- find customer name, customer type , date , cy_date , market name , product type , order date , sales Qty and sales amount

SELECT c.customer_name , c.customer_type , p.product_type,m.markets_name , d.cy_date , t.order_date , t.sales_qty , t.sales_amount 
FROM customers c
JOIN transactions t
ON c.customer_code = t.customer_code
JOIN products p 
ON p.product_code = t.product_code
JOIN markets m
ON m.markets_code = t.market_code
JOIN date d 
ON d.date = t.order_date
ORDER BY cy_date ASC; 

-- find Total Amount for Own Brand

SELECT p.product_type , SUM(t.sales_amount) AS total_amount 
FROM products p
JOIN transactions t 
ON p.product_code = t.product_code
GROUP BY product_type;

-- find the total amount by product type 

SELECT p.product_type , SUM(t.sales_amount) AS Total_Amount 
FROM products p
JOIN transactions t 
ON p.product_code = t.product_code
GROUP BY product_type; 


DELETE FROM transactions
WHERE sales_amount = 0;



