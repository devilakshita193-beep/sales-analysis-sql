-- SALES ANALYSIS PROJECT
-- MySQL queries for sales, profit, products, categories, regions

-- 1. Create table
CREATE TABLE sales_data (
    order_id INT,
    product VARCHAR(100),
    category VARCHAR(50),
    region VARCHAR(50),
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),
    quantity INT,
    order_date DATE
);

-- 2. Total sales and profit
SELECT SUM(sales) AS total_sales, SUM(profit) AS total_profit FROM sales_data;

-- 3. Profit by Category
SELECT category, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM sales_data GROUP BY category ORDER BY total_profit DESC;

-- 4. Sales by Region
SELECT region, SUM(sales) AS total_sales
FROM sales_data GROUP BY region ORDER BY total_sales DESC;

-- 5. Top 10 Products by Sales
SELECT product, SUM(sales) AS total_sales
FROM sales_data GROUP BY product ORDER BY total_sales DESC LIMIT 10;

-- 6. Monthly Sales Trend
SELECT MONTH(order_date) AS month, SUM(sales) AS monthly_sales
FROM sales_data GROUP BY MONTH(order_date) ORDER BY month;

-- 7. Profit Margin by Product
SELECT product, SUM(profit)/SUM(sales)*100 AS profit_margin
FROM sales_data GROUP BY product ORDER BY profit_margin DESC;

-- 8. Region with highest profit
SELECT region, SUM(profit) AS profit FROM sales_data GROUP BY region ORDER BY profit DESC LIMIT 1;
