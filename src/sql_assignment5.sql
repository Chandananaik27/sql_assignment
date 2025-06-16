use ecommerce
create table sales_data (product_id int, sale_date date, quantity_sold int)
insert into sales_data values (1, '2022-01-01', 20),
   		(2, '2022-01-01', 15),
   		(1, '2022-01-02', 10),
        (2, '2022-01-02', 25),
    	(1, '2022-01-03', 30),
    	(2, '2022-01-03', 18),
    	(1, '2022-01-04', 12),
    	(2, '2022-01-04', 22)

select * from sales_data

--Assign rank by partition based on product_id and find the latest product_id sold
SELECT 
    product_id,
    sale_date,
    quantity_sold,
    RANK() OVER (PARTITION BY product_id ORDER BY sale_date DESC) AS sale_rank
FROM sales_data;

--Retrieve quantity_sold from Previous Row and Compare
SELECT *,
       LAG(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS prev_qty_sold,
       quantity_sold - LAG(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS diff_qty
FROM sales_data;
 
--Return First and Last Quantity Sold (per product_id partition)
SELECT *,
       FIRST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date) AS first_qty_sold,
       LAST_VALUE(quantity_sold) OVER (PARTITION BY product_id ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_qty_sold
FROM sales_data;
 