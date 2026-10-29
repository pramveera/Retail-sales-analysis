-- ==========================================
--  DATA QUALITY AND CLEANING
-- ==========================================

USE retail_analysis;

-- 1. Check total records
SELECT COUNT(*) AS total_rows
FROM retail_sales;

-- 2. Check missing values
SELECT
    SUM(transactions_id IS NULL) AS missing_id,
    SUM(sale_date IS NULL) AS missing_date,
    SUM(sale_time IS NULL) AS missing_time,
    SUM(customer_id IS NULL) AS missing_customer,
    SUM(gender IS NULL) AS missing_gender,
    SUM(age IS NULL) AS missing_age,
    SUM(category IS NULL) AS missing_category,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(price_per_unit IS NULL) AS missing_price,
    SUM(cogs IS NULL) AS missing_cogs,
    SUM(total_sale IS NULL) AS missing_sales
FROM retail_sales;

-- 3. Display rows with missing important values
SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- 4. Check duplicate transaction IDs
SELECT
    transactions_id,
    COUNT(*) AS occurrences
FROM retail_sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;

-- 5. Check zero and negative values
SELECT
    SUM(quantity = 0) AS zero_quantity,
    SUM(price_per_unit = 0) AS zero_price,
    SUM(cogs = 0) AS zero_cogs,
    SUM(total_sale = 0) AS zero_sales,
    SUM(quantity < 0) AS negative_quantity,
    SUM(price_per_unit < 0) AS negative_price,
    SUM(cogs < 0) AS negative_cogs,
    SUM(total_sale < 0) AS negative_sales
FROM retail_sales;

-- 6. Inspect potentially invalid rows
SELECT *
FROM retail_sales
WHERE quantity <= 0
   OR price_per_unit <= 0
   OR cogs < 0
   OR total_sale < 0;

-- 7. Inspect rows where all three values are zero
SELECT *
FROM retail_sales
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0;

-- 8. Optional cleaning: delete rows missing required values.
-- Review the affected rows before uncommenting and executing.
/*
DELETE FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
*/

-- 9. Optional cleaning: delete confirmed invalid placeholder rows.
-- Review before executing. Do not run blindly.
/*
DELETE FROM retail_sales
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0;
*/

-- 10. Verify remaining placeholder rows
SELECT COUNT(*) AS remaining_invalid_rows
FROM retail_sales
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0;

-- 11. Final record count
SELECT COUNT(*) AS total_records
FROM retail_sales;