-- PostgreSQL | Inventory & Order Management Database
-- Portfolio adaptation of a relational database coursework project.
-- Uses synthetic demonstration data only.

--1) A simple query that pulls all columns and rows from a table
select * from customer;
select * from explosion;
select * from inventory;
select * from order_details;
select * from orders;
select * from product;

--2) A query that displays a subset of columns
select customer_name from customer;
select part_description from explosion;
select inventory_date from inventory;
select price from order_details;
select order_date from orders;
select product_code from product;

--3) A query that displays a subset of columns with a single clause (predicate) WHERE statement
--pulling data from customer table where customer id is 12
select customer_name, shipping_address, mailing_address from customer
where customer_id = 12;

--4) A query that displays a subset of columns with a multi-clause (predicate) WHERE statement using AND/OR
--selecting data from order_details table where quantity is order 1 and price is greater than 50
select quantity, price from order_details
where quantity = 1 and price >= 50.00;

--5) A query that performs a single table join.  In other words, you are joining 2 tables.
--joining customer and order table 
select customer.customer_name, customer.shipping_address, customer.mailing_address, orders.customer_id  from customer
join orders
on customer.customer_id = orders.customer_id;

--6) A query that performs a multi-table join. In other words, you are joining 3 or more tables
--joining inventory, order_details and order table to see order date, quantity are on hand , quantity are backordered and if order is backordered or not
select inventory.quantity_on_hand, inventory.quantity_backordered, order_details.backordered, orders.order_date 
from inventory
join order_details
on inventory.product_code = order_details.product_code
join orders
on orders.order_number = order_details.order_number;

--7) A query that performs an aggregate (count, min, max, sum, avg, etc.).
--counting avg price for order_details
select avg(price) AS average_unit_price
from order_details;

--8) A query that performs an aggregate (count, min, max, sum, avg, etc.) with a GROUP BY.
--a query where it shows what amount of order and how many order had been fulfilled or not from order_details table 
select filled, count(*) AS line_item_count, sum(price * quantity) AS order_value
from order_details
group by filled;

--9) A query that performs an aggregate (count, min, max, sum, avg, etc.). with a GROUP BY and a HAVING clause
--select minimum price for both order fulfullied or not
select filled, min(price) AS minimum_price
from order_details
group by filled
having min(price)<100.00;

--10) A query that performs a subquery either as part of the WHERE clause or as a derived/virtual table.

SELECT Customer_Id, Customer_Name
FROM Customer
WHERE Customer_Id IN (
    SELECT Customer_Id
    FROM Orders
);

--11) A query that performs an aggregate with a join and a group by.

select customer.customer_name, customer.shipping_address, customer.mailing_address, count(orders.customer_id ) as order_count 
from customer
join orders
on customer.customer_id = orders.customer_id
group by customer.customer_name, customer.shipping_address, customer.mailing_address;
