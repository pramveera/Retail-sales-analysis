-- ==========================================
--  BUSINESS ANALYSIS
-- Questions 1 to 10
-- ==========================================

USE retail_analysis;


-- Q1. Retrieve all sales made on 2022-11-05

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';


-- Q2. Clothing transactions with quantity > 10
-- during November 2022

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantity > 10
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01';


-- Q3. Total sales for each category

SELECT
    category,
    SUM(total_sale) AS net_sales,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category
ORDER BY net_sales DESC;


-- Q4. Average age of customers purchasing Beauty products

SELECT
    ROUND(AVG(age), 2) AS average_age
FROM retail_sales
WHERE category = 'Beauty';


-- Q5. Transactions where total sale > 1000

SELECT *
FROM retail_sales
WHERE total_sale > 1000
ORDER BY total_sale DESC;


-- Q6. Number of transactions by gender in each category

SELECT
    category,
    gender,
    COUNT(DISTINCT transactions_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category, gender;


-- Q7. Best month in each year by average transaction value

WITH monthly_sales AS (
    SELECT
        YEAR(sale_date) AS sales_year,
        MONTH(sale_date) AS sales_month,
        AVG(total_sale) AS avg_sale
    FROM retail_sales
    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
),
ranked_months AS (
    SELECT
        sales_year,
        sales_month,
        avg_sale,
        RANK() OVER (
            PARTITION BY sales_year
            ORDER BY avg_sale DESC
        ) AS sales_rank
    FROM monthly_sales
)
SELECT
    sales_year,
    sales_month,
    ROUND(avg_sale, 2) AS avg_sale
FROM ranked_months
WHERE sales_rank = 1
ORDER BY sales_year;


-- Q8. Top 5 customers by total sales

SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


-- Q9. Number of unique customers in each category

SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category
ORDER BY unique_customers DESC;


-- Q10. Number of orders by time-of-day shift
-- Morning: before 12:00
-- Afternoon: 12:00 to before 18:00
-- Evening: 18:00 onward

WITH hourly_sales AS (
    SELECT
        transactions_id,
        CASE
            WHEN sale_time < '12:00:00'
                THEN 'Morning'
            WHEN sale_time < '18:00:00'
                THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT
    shift,
    COUNT(DISTINCT transactions_id) AS total_orders
FROM hourly_sales
GROUP BY shift
ORDER BY
    CASE shift
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
    END;