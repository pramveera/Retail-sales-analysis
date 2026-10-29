# 🛍️ Retail Sales Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing retail sales data using **MySQL** to uncover meaningful business insights related to sales performance, customer purchasing behavior, product categories, and transaction patterns.

The project involves data cleaning, data exploration, and business-oriented SQL analysis to answer important questions that can support data-driven decision-making.

## 🎯 Objectives

- Clean and validate retail transaction data.
- Analyze overall sales performance and transaction trends.
- Identify high-performing product categories.
- Understand customer purchasing behavior.
- Find top customers based on total sales.
- Analyze monthly sales patterns.
- Examine transaction distribution across different time-of-day shifts.

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **SQL Concepts:** Filtering, aggregation, `GROUP BY`, `HAVING`, subqueries, Common Table Expressions (CTEs), window functions, and `CASE` statements
- **Development Environment:** Visual Studio Code
- **Dataset Format:** CSV

## 📂 Dataset Description

The dataset contains retail transaction records with the following columns:

| Column | Description |
|---|---|
| `transactions_id` | Unique transaction identifier |
| `sale_date` | Date of the sale |
| `sale_time` | Time of the sale |
| `customer_id` | Customer identifier |
| `gender` | Customer gender |
| `age` | Customer age |
| `category` | Product category |
| `quantity` | Quantity sold |
| `price_per_unit` | Price per unit |
| `cogs` | Cost of goods sold |
| `total_sale` | Total value of the transaction |

## 🔄 Project Workflow

### 1. Database Setup and Data Import

- Created the `retail_analysis` database.
- Designed the `retail_sales` table.
- Imported the CSV dataset into MySQL.

### 2. Data Cleaning

Performed data-quality checks to identify:

- Missing values in important columns.
- Duplicate transaction IDs.
- Zero and negative values in sales-related columns.
- Potentially invalid placeholder records.

Reviewed suspicious records before deciding whether to remove them.

### 3. Data Exploration

Explored the dataset to determine:

- Total number of transactions.
- Number of unique customers.
- Number of product categories.
- Overall revenue and average transaction value.

### 4. Business Analysis

Used SQL queries to answer ten business questions.

## 📊 Business Questions Answered

| No. | Business Question | SQL Techniques |
|---:|---|---|
| 1 | Retrieve all sales made on November 5, 2022. | `WHERE`, date filtering |
| 2 | Find Clothing transactions with quantities greater than 10 during November 2022. | Multiple conditions, date ranges |
| 3 | Calculate total sales and transaction counts for each category. | `SUM()`, `COUNT()`, `GROUP BY` |
| 4 | Calculate the average age of customers purchasing Beauty products. | `AVG()`, `ROUND()` |
| 5 | Find transactions with total sales greater than 1,000. | Filtering, sorting |
| 6 | Calculate transaction counts by gender and category. | `COUNT()`, `GROUP BY` |
| 7 | Identify the month with the highest average transaction value in each year. | CTEs, `AVG()`, `RANK()` |
| 8 | Find the top five customers based on total sales. | `SUM()`, `ORDER BY`, `LIMIT` |
| 9 | Count unique customers for each product category. | `COUNT(DISTINCT ...)` |
| 10 | Calculate the number of orders during morning, afternoon, and evening shifts. | `CASE`, CTEs, aggregation |

## 💡 Key SQL Concepts Demonstrated

- Data retrieval and filtering using `SELECT` and `WHERE`
- Aggregation using `SUM()`, `AVG()`, `COUNT()`, `MIN()`, and `MAX()`
- Grouping and sorting using `GROUP BY` and `ORDER BY`
- Duplicate detection using `GROUP BY` and `HAVING`
- Date and time analysis using `YEAR()`, `MONTH()`, and date ranges
- Conditional categorization using `CASE`
- Common Table Expressions using `WITH`
- Ranking results using `RANK()` and window functions
- Data validation using `IS NULL` and conditional expressions

## 📁 Project Structure

```text
retail-sales-analysis/
│
├── README.md
├── data/
│   └── retail_sales.csv
│
└── sql/
    ├── 01_setup_and_import.sql
    ├── 02_data_quality_and_cleaning.sql
    ├── 03_data_exploration.sql
    └── 04_business_analysis.sql
```

*Note: Include the dataset only if its license permits redistribution. Otherwise, provide instructions for obtaining it.*

## 🚀 How to Run the Project

1. Install MySQL Server and a MySQL client, such as the VS Code MySQL extension.
2. Clone or download this repository.
3. Open the SQL scripts in your SQL editor.
4. Run `01_setup_and_import.sql` to create the database and table.
5. Configure CSV import permissions and update the file path to match your local system.
6. Run `02_data_quality_and_cleaning.sql` to inspect data-quality issues and apply any approved cleaning steps.
7. Run `03_data_exploration.sql` to explore the dataset.
8. Run `04_business_analysis.sql` to execute the business queries.

**Important:** Run the CSV import only once for a fresh table. Review the cleaning queries before executing any `DELETE` statements.

## 📈 Results and Insights

This project establishes a SQL-based workflow for analyzing retail transactions and answering business questions.

The final findings can be documented here after running the queries, including:

- Highest-revenue product category.
- Month with the highest total revenue.
- Top five customers by total sales.
- Most active time-of-day shift.
- Differences in purchasing patterns across product categories and customer groups.

*Actual numerical findings should be added after validating the query results.*

## 🎓 Learning Outcomes

Through this project, I practiced:

- Writing structured SQL queries for business analysis.
- Identifying and investigating data-quality issues.
- Aggregating transactional data into meaningful metrics.
- Using CTEs and window functions for analytical problems.
- Translating business questions into SQL queries.
- Organizing a reproducible SQL project for version control.

## 🔮 Future Improvements

- Build an interactive sales dashboard using Power BI or Tableau.
- Add visualizations for monthly revenue and category performance.
- Perform deeper customer segmentation.
- Analyze revenue, order volume, and average transaction value together.
- Automate data-quality checks and reporting.

## 👨‍💻 Author

**Pramveer Kumar**

B.Tech — Computer Science and Engineering (Artificial Intelligence)

Interested in Data Analytics, Data Science, and Machine Learning.

---

⭐ If you find this project useful, feel free to explore the SQL queries and share feedback.
