# Inventory & Order Management Database

A **PostgreSQL relational database project** modeling customers, products, stock, orders, order line items, and product components. Adapted from a college database assignment and presented as a reproducible portfolio project.

## What it demonstrates

- Six related tables, including primary keys, composite keys, and foreign keys
- Data integrity through `NOT NULL`, `CHECK`, and referential constraints
- SQL joins, subqueries, aggregates, `GROUP BY`, and `HAVING`
- Two reusable database views
- Practical reporting examples for fulfilled orders, low stock, and backorders
- Synthetic sample data for exploration

## Tech stack

**PostgreSQL / SQL**. Scripts use PostgreSQL-compatible features such as `SERIAL` and `BOOLEAN`.

## Quick start

Install PostgreSQL and create an empty database. From this repository's root, run:

```bash
createdb inventory_demo
psql -v ON_ERROR_STOP=1 -d inventory_demo -f sql/schema.sql
psql -v ON_ERROR_STOP=1 -d inventory_demo -f sql/seed_data.sql
psql -v ON_ERROR_STOP=1 -d inventory_demo -f sql/views.sql
psql -v ON_ERROR_STOP=1 -d inventory_demo -f sql/queries.sql
psql -v ON_ERROR_STOP=1 -d inventory_demo -f sql/business_reports.sql
```

For Windows, run the commands in a terminal where PostgreSQL's `bin` directory is on your `PATH`. If your database username or host differs, add the appropriate `-U` and `-h` options.

**Important:** Run the setup scripts on a fresh empty database. They are not designed to be rerun unchanged against existing tables.

## Repository structure

```text
sql/
  schema.sql           Table definitions and constraints
  seed_data.sql        Synthetic example records
  views.sql            Reusable SQL views
  queries.sql          Core SQL exercises and joins
  business_reports.sql Additional business-oriented examples
docs/
  schema.md            Entity relationships and design notes
README.md
.gitignore
LICENSE
```

## Database overview

The schema includes `customer`, `product`, `inventory`, `orders`, `order_details`, and `explosion` (product components). See [schema documentation](docs/schema.md) for relationships and design considerations.

## Example analysis

- Which customers have the highest value of fulfilled order lines?
- Which products are running low on stock?
- Which order lines are backordered?
- What is the minimum line-unit price by fulfillment status?

Run `sql/business_reports.sql` to explore the first three questions.

## Notes

- The sample records are synthetic; product descriptions have been made human-readable for the portfolio edition.
- The queries and views are derived from the submitted coursework, with clearer output aliases and a quantity-aware order-value calculation.
- This repository is a learning and portfolio demonstration, **not a production-ready inventory platform**.
- Automated execution against a live PostgreSQL server has not been verified in this environment.
- Review your institution's rules before publishing coursework-derived solutions.
