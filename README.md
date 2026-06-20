# Zepto SQL Data Analysis

A SQL-based exploratory data analysis of product listings from Zepto, a quick-commerce grocery delivery platform. This project covers data cleaning, validation, and business-insight queries written in PostgreSQL.

Dataset

The dataset contains ~3,700 product listings with the following fields:

ColumnDescriptioncategoryProduct category (e.g. Fruits & Vegetables, Snacks)nameProduct namemrpMaximum retail price (paise, converted to rupees during cleaning)discountPercentDiscount applied to MRPavailableQuantityUnits currently availablediscountedSellingPriceFinal selling price after discountweightInGmsProduct weight in gramsoutOfStockStock availability flagquantityOrder quantity

Data file: data/zepto_v2.csv

What this project does

1. Table setup — creates the zept table with appropriate data types and constraints.

2. Data exploration — checks row counts, looks for null values across all columns, finds duplicate product names, and counts in-stock vs out-of-stock items.

3. Data cleaning — removes rows with zero MRP, and converts price columns from paise to rupees.

4. Business insight queries, including:


Top 10 best-value products by discount percentage
High-MRP products that are out of stock
Estimated revenue per category
Products with MRP > ₹500 but discount < 10%
Top 5 categories by average discount
Price-per-gram value analysis for products over 100g
Categorizing products into low / medium / bulk by weight
Total inventory weight per category


Full script: sql/zepto_analysis.sql

Tools used:
PostgreSQL
SQL (DDL, DML, aggregation, CASE statements, window-free analytics)


Author

Pravallika Naraharisetti


How to run


Create a PostgreSQL database.
Run the script in sql/zepto_analysis.sql — it creates the table and runs all queries in order.
Import data/zepto_v2.csv into the zept table (e.g. using psql's \copy command or a GUI tool like pgAdmin/DBeaver).
