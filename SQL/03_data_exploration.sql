-- ==========================================
--      DATA EXPLORATION
-- ==========================================

USE retail_analysis;

-- 1. Total transactions
SELECT COUNT(*) AS total_transactions
FROM retail_sales;

-- 2. Number of unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

-- 3. Number of product categories
SELECT COUNT(DISTINCT category) AS total_categories
FROM retail_sales;

-- 4. List all product categories
SELECT DISTINCT category
FROM retail_sales
ORDER BY category;

-- 5. Overall sales summary
SELECT
    SUM(total_sale) AS total_revenue,
    ROUND(AVG(total_sale), 2) AS average_sale,
    MIN(total_sale) AS minimum_sale,
    MAX(total_sale) AS maximum_sale
FROM retail_sales;

-- 6. Sales by category
SELECT
    category,
    SUM(total_sale) AS total_revenue,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- 7. Sales by year
SELECT
    YEAR(sale_date) AS sales_year,
    SUM(total_sale) AS total_revenue,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY YEAR(sale_date)
ORDER BY sales_year;

-- 8. Sales by gender
SELECT
    gender,
    SUM(total_sale) AS total_revenue,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY gender
ORDER BY total_revenue DESC;