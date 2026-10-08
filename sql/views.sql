-- PostgreSQL | Inventory & Order Management Database
-- Portfolio adaptation of a relational database coursework project.
-- Uses synthetic demonstration data only.

--Views

--A dynamic view for A query that displays a subset of columns with a multi-clause (predicate) WHERE statement using AND/OR

create view view_order_qty_price as
select quantity, price from order_details
where quantity = 1 and price >= 50.00;

--A dynamic view for A query that performs an aggregate (count, min, max, sum, avg, etc.). with a GROUP BY and a HAVING clause

create view view_min_price_for_filled_order as
select filled, min(price) AS minimum_price
from order_details
group by filled
having min(price)<100.00;
