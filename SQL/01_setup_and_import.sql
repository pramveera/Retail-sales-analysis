-- ==========================================
-- RETAIL SALES ANALYSIS
--  DATABASE SETUP AND CSV IMPORT
-- ==========================================

CREATE DATABASE IF NOT EXISTS retail_analysis;

USE retail_analysis;

-- Create retail sales table
CREATE TABLE IF NOT EXISTS retail_sales (
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

-- Import CSV data
-- Run this only once for a fresh table.
-- Update the file path if required.

LOAD DATA LOCAL INFILE
'D:/project/SQL/retail project_1/DATA/SQL - Retail Sales Analysis_utf .csv'
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify imported data
SELECT COUNT(*) AS total_records
FROM retail_sales;

SELECT *
FROM retail_sales
LIMIT 10;

-- Check table structure
DESCRIBE retail_sales;