# SQL Assignment 1
 
This repository contains solutions for **SQL Assignment 1** focused on creating and querying an e-commerce database using SQL.
 
## Objective
 
The goal of this assignment is to practice SQL concepts such as:
 
- Database creation
- Table creation and insertion
- Data querying and aggregation
- Joins, subqueries, and conditional logic
- Data manipulation and rollback operations
 
## Database Structure
 
**Database Name:** `ecommerce`
 
### 1. `users`
| Column        | Data Type |
|---------------|-----------|
| userid        | INTEGER   |
| username      | VARCHAR   |
| signup_date   | DATE      |
 
### 2. `gold_member_users`
| Column        | Data Type |
|---------------|-----------|
| user_id       | INTEGER   |
| user_name     | VARCHAR   |
| signup_date   | DATE      |
 
### 3. `sales`
| Column        | Data Type |
|---------------|-----------|
| userid        | INTEGER   |
| username      | VARCHAR   |
| created_date  | DATE      |
| product_id    | INTEGER   |
 
### 4. `product`
| Column        | Data Type |
|---------------|-----------|
| product_id    | INTEGER   |
| product_name  | VARCHAR   |
| price_value   | INTEGER   |
 
## Tasks Completed
 
1. Created the `ecommerce` database and tables
2. Inserted provided sample data into the tables
3. Fetched data using various SQL queries:
   - Count queries
   - Join operations
   - Aggregation and grouping
   - Subqueries
   - Update and rename columns
   - Rollback after delete
4. Added logic to find:
   - Total spent per customer
   - Non-gold members
   - First and most purchased items
   - Duplicate records
   - Customers with specific name patterns
  
 
# SQL Assignment 2 – Product Aggregation by Date
 
## Objective
To find, for each sell date, the number of different products sold and a comma-separated list of product names.
 
## Table: `product_details`
| Column     | Data Type |
|------------|-----------|
| sell_date  | DATE      |
| products   | VARCHAR   |
 
## Tasks Performed
- Created the `product_details` table.
- Inserted product sale records with respective sell dates.
- Queried data to count distinct products sold per date.
- Aggregated product names as a list using `STRING_AGG`.
 
 
# SQL Assignment 3 – Department Salary Aggregation
 
## Objective
To compute the total salary paid to each department by extracting department names from combined identifiers.
 
## Table: `dept_tbl`
| Column        | Data Type |
|---------------|-----------|
| id_deptname   | VARCHAR   |
| emp_name      | VARCHAR   |
| salary        | INT       |
 
## Tasks Performed
- Created the `dept_tbl` table.
- Inserted employee salary data with combined department IDs and names.
- Used string functions to extract department name.
- Aggregated total salary for each department.
 
 
# SQL Assignment 4 – Gmail Signup Date Analysis
 
## Objective
- To identify Gmail accounts from the email list.
- Calculate first and last signup dates.
- Compute the number of days between them.
- Replace null signup dates with a default value.
 
## Table: `email_signup`
| Column       | Data Type |
|--------------|-----------|
| id           | INT       |
| email_id     | VARCHAR   |
| signup_date  | DATE      |
 
## Tasks Performed
- Created the `email_signup` table.
- Inserted various email entries.
- Filtered Gmail domain entries.
- Used `DATEDIFF` to calculate the range.
- Applied `ISNULL` for null replacement.
 
 
# SQL Assignment 5 – Window Functions on Sales Data
 
## Objective
To use SQL window functions for analyzing product sales trends over time.
 
## Table: `sales_data`
| Column        | Data Type |
|---------------|-----------|
| product_id    | INT       |
| sale_date     | DATE      |
| quantity_sold | INT       |
 
## Tasks Performed
- Created the `sales_data` table.
- Inserted sales records across multiple dates.
- Used `RANK()` to determine latest sales by product.
- Applied `LAG()` to compare quantity sold with the previous entry.
- Extracted first and last quantity sold using `FIRST_VALUE()` and `LAST_VALUE()`.
 
 
 
 
