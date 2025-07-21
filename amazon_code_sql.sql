create database amazon_projectt;
use amazon_projectt;
select *
from customer;
select *
from review;
select *
from order1;
select *
from order_items;
-- 1.Get all customers from indonesia:
SELECT * 
FROM customer
WHERE country = 'indonesia';

-- 2.List all products in the 'Electronics' category:
SELECT *
FROM product
WHERE category = 'Electronics';

-- 3.Find the total number of orders:
SELECT COUNT(*) AS total_orders
FROM order1;

-- 4.Get top 5 most expensive products:
SELECT * 
FROM product
ORDER BY price DESC
LIMIT 5;
-- 5.Get total sales amount per customer:
SELECT customer_id, SUM(total_amount) AS total_spent
FROM order1
GROUP BY customer_id;

-- 6.Find the average product rating per product:
SELECT product_id, AVG(rating) AS avg_rating
FROM review
GROUP BY product_id;

-- 7.Count number of orders per city:
SELECT  c.country, COUNT(o.order_id) AS order_count
FROM customer as c JOIN order1 as o 
ON c.customer_id = o.customer_id
GROUP BY c.country;

-- 8.List all orders with customer names:
SELECT p.name, SUM(oi.quantity) AS times_sold
FROM product p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.name;

-- 9.Show each product with how many times it was sold:
SELECT p.name, SUM(oi.quantity) AS times_sold
FROM product p
JOIN order_Items oi ON p.product_id = oi.product_id
GROUP BY p.name;

-- 10Get all products that were never ordered:
SELECT p.*
FROM product p
LEFT JOIN order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- 11.Find all orders placed in 2024:
SELECT *
FROM order1
WHERE YEAR(order_date) = 2024;

-- 12.Which product has the highest average rating?
SELECT product_id, AVG(rating) AS average_rating
FROM review
GROUP BY product_id
ORDER BY average_rating DESC
LIMIT 1;
