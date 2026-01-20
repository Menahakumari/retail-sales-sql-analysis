-- ============================================
-- Retail Sales Data Analysis SQL Script
-- ============================================
-- Database: SQLite
-- Table   : retail_sales
-- Purpose : Data exploration, verification, and analysis
-- ============================================

-- 1. View sample records to understand dataset structure
SELECT *
FROM retail_sales
LIMIT 10;

-- 2. Verify total number of records (CSV row count check)
SELECT COUNT(*) AS total_records
FROM retail_sales;

-- 3. Filter records by product category (example: Electronics)
SELECT *
FROM retail_sales
WHERE product_category = 'Electronics';

-- 4. Sort transactions to find top 5 highest sales values
SELECT transaction_id, customer_id, product_category, total_amount
FROM retail_sales
ORDER BY total_amount DESC
LIMIT 5;

-- 5. Calculate total sales grouped by product category
SELECT product_category,
       SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY product_category;

-- 6. Calculate average sales per transaction for each category
SELECT product_category,
       AVG(total_amount) AS average_sales
FROM retail_sales
GROUP BY product_category;

-- 7. Count number of transactions grouped by gender
SELECT gender,
       COUNT(*) AS transaction_count
FROM retail_sales
GROUP BY gender;

-- 8. Use HAVING to show only categories with sales greater than 100000
SELECT product_category,
       SUM(total_amount) AS total_sales
FROM retail_sales
GROUP BY product_category
HAVING total_sales > 100000;

-- 9. Monthly sales report using date range (BETWEEN)
SELECT SUM(total_amount) AS monthly_sales
FROM retail_sales
WHERE transaction_date BETWEEN '2023-01-01' AND '2023-01-31';

-- 10. Pattern matching using LIKE to find specific customers
SELECT *
FROM retail_sales
WHERE customer_id LIKE 'CUST%';

-- 11. Data validation: check if total_amount matches quantity * price_per_unit
SELECT *
FROM retail_sales
WHERE total_amount != quantity * price_per_unit;

-- ============================================
-- End of SQL Script
-- ============================================
