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
 
