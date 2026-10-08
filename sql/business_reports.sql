-- Additional example reporting queries for the portfolio version.
-- Revenue here means the value of order lines marked as filled; no payment data is modeled.

-- Value of filled order lines by customer
SELECT c.customer_id, c.customer_name,
       SUM(od.quantity * od.price) AS fulfilled_order_value
FROM customer AS c
JOIN orders AS o ON o.customer_id = c.customer_id
JOIN order_details AS od ON od.order_number = o.order_number
WHERE od.filled = TRUE
GROUP BY c.customer_id, c.customer_name
ORDER BY fulfilled_order_value DESC;

-- Products with fewer than 75 units available
SELECT p.product_code, p.description, i.quantity_on_hand
FROM product AS p
JOIN inventory AS i ON i.product_code = p.product_code
WHERE i.quantity_on_hand < 75
ORDER BY i.quantity_on_hand ASC;

-- Backordered order lines and affected products
SELECT o.order_number, o.order_date, p.description,
       od.quantity, od.price
FROM orders AS o
JOIN order_details AS od ON od.order_number = o.order_number
JOIN product AS p ON p.product_code = od.product_code
WHERE od.backordered = TRUE
ORDER BY o.order_date, o.order_number;
