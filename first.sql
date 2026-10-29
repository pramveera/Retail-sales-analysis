CREATE DATABASE retail_analysis;

USE retail_analysis;

CREATE TABLE retail_sales (
    transactions_id INT,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(20),
    age INT,
    category VARCHAR(100),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE
'D:\project\SQL\retail project_1\SQL - Retail Sales Analysis_utf .csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

USE retail_analysis;

-- import of csv file---
LOAD DATA LOCAL INFILE
'D:/project/SQL/retail project_1/SQL - Retail Sales Analysis_utf .csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_records
FROM retail_sales;

SELECT *
FROM retail_sales
LIMIT 10;


-- DATA CLEANING 

SELECT * FROM retail_sales
WHERE transactions_id is NULL

SELECT * FROM retail_sales
WHERE sale_date is NULL


SELECT * FROM retail_sales
WHERE
    transactions_id is NULL
    OR
    sale_date is NULL
    or 
    sale_time is NULL
    or 
    gender is NULL
    OR
    category is NULL
    OR
    quantity is NULL
    or 
    cogs is NULL
    or 
    total_sale is null;


-- Table ka structure check karo
DESCRIBE retail_sales;

-- : Duplicate transactions check karo

SELECT
    transactions_id,
    COUNT(*) AS occurrences
FROM retail_sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;



SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN transactions_id IS NULL THEN 1 ELSE 0 END) AS missing_id,
    SUM(CASE WHEN sale_date IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN total_sale IS NULL THEN 1 ELSE 0 END) AS missing_sales
FROM retail_sales;



SELECT *
FROM retail_sales
WHERE quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL;


SELECT *
FROM retail_sales
WHERE quantity = 0
   OR price_per_unit = 0
   OR cogs = 0;

SELECT
    COUNT(*) AS total_rows,
    SUM(quantity IS NULL) AS null_quantity,
    SUM(price_per_unit IS NULL) AS null_price,
    SUM(cogs IS NULL) AS null_cogs,
    SUM(quantity = 0) AS zero_quantity,
    SUM(price_per_unit = 0) AS zero_price,
    SUM(cogs = 0) AS zero_cogs
FROM retail_sales;

SELECT *
FROM retail_sales
ORDER BY transactions_id DESC
LIMIT 10;

SELECT
    transactions_id,
    quantity,
    price_per_unit,
    cogs,
    total_sale
FROM retail_sales
WHERE quantity = 0
   OR price_per_unit = 0
   OR cogs = 0
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL;

SELECT
    SUM(quantity = 0) AS zero_quantity,
    SUM(price_per_unit = 0) AS zero_price,
    SUM(cogs = 0) AS zero_cogs
FROM retail_sales;

SELECT *
FROM retail_sales
WHERE quantity = 0
   OR price_per_unit = 0
   OR cogs = 0;


DELETE FROM retail_sales
WHERE
    transactions_id is NULL
    OR
    sale_date is NULL
    or 
    sale_time is NULL
    or 
    gender is NULL
    OR
    category is NULL
    OR
    quantity is NULL
    or 
    cogs is NULL
    or 
    total_sale is null;


SELECT *
FROM retail_sales
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0;


DELETE FROM retail_sales
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0;


SELECT COUNT(*) AS remaining_invalid_rows
FROM retail_sales
WHERE quantity = 0
  AND price_per_unit = 0
  AND cogs = 0;

SELECT COUNT(*) as total_records
from retail_sales;


SELECT * FROM retail_sales
WHERE quantity <=0
    or price_per_unit <=0
    or cogs < 0
    or total_sale <0;


SELECT
    SUM(transactions_id IS NULL) AS missing_id,
    SUM(sale_date IS NULL) AS missing_date,
    SUM(customer_id IS NULL) AS missing_customer,
    SUM(category IS NULL) AS missing_category,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(price_per_unit IS NULL) AS missing_price,
    SUM(cogs IS NULL) AS missing_cogs,
    SUM(total_sale IS NULL) AS missing_sales
FROM retail_sales;


SELECT
    transactions_id,
    COUNT(*) AS occurrences
FROM retail_sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;





--data exploration

-- how many sales we have ?
SELECT COUNT(*) as total_sale from retail_sales

-- how many  uninque customers we have
SELECT COUNT(DISTINCT customer_id)as total_sale FROM retail_sales

SELECT COUNT(DISTINCT category) FROM retail_sales

-- data analysis 
-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)



-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * from retail_sales 
WHERE sale_date = '2022-11-05'



-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 04 in the month of Nov-2022
-- Q2: Retrieve Clothing transactions with quantity > 4 in November 2022

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01'
  AND quantity >= 4;



-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.


SELECT
category,sum(total_sale) as net_sale
  from retail_sales
  GROUP BY 1

SELECT
category,
sum(total_sale) as net_sale,
COUNT(*) as total_orders
  from retail_sales
  GROUP BY 1



-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
 SELECT 
    ROUND(AVG(age), 2) as av 
from retail_sales
WHERE category = 'Beauty'




-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM retail_sales
WHERE total_sale >1000



-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT
    category,
    gender,
    COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender;



-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT *
FROM (
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY EXTRACT(YEAR FROM sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS sales_rank
    FROM retail_sales
    GROUP BY 1, 2
) AS t1
WHERE sales_rank = 1
ORDER BY year;





-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
    customer_id,
    sum(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5




-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.


SELECT 
    category,
    COUNT(DISTINCT customer_id) as cnt_unique_cs
  
FROM retail_sales
GROUP BY category




-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
with hourly_sale
AS
(
SELECT * ,
    CASE 
        WHEN EXTRACT(hour from sale_time) < 12 THEN 'Morning'  
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 and 17 THEN 'Afternoon'
        ELSE 'Evening' 
    END as shift

FROM retail_sales
)

SELECT 
    shift,
    COUNT(*) as total_orders
from hourly_sale
GROUP BY shift