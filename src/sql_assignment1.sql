create database ecommerce
use ecommerce
create table gold_members_data
(user_id int primary key,user_name varchar(20),
signup_date date)

create table users 
(user_id int primary key,user_name varchar(20),
signup_date date)

create table sales
(user_id int,user_name varchar(20),
created_date date,product_id int)

create table product
(product_id int,product_name varchar(20),
product_price int)

INSERT INTO gold_members_data values (001, 'chandu', '2024-03-04'),
(002, 'Subam', '2013-04-20'),
(003, 'chai', '2014-06-10'),
(004, 'diva', '2015-05-27'),
(005, 'edwin', '2016-07-15'),
(006, 'shreya', '2017-01-17')

INSERT INTO users VALUES
(001, 'chandu', '2024-03-04'),
(002, 'Subam', '2018-04-20'),
(003, 'chai', '2016-06-10'),
(007, 'Muku', '2018-05-01'),
(008, 'kalai', '2019-03-25'),
(009, 'vidhya', '2020-08-13'),
(010, 'Mani', '2021-09-23'),
(006, 'shreya', '2019-01-17')

Insert into sales values
(001, 'chandu',   '2024-03-10',1),
(001, 'chandu',   '2024-03-15',2),
(002, 'Subam',     '2019-04-20',1),
(003, 'chai',  '2019-06-10',1),
(007, 'Muku',     '2019-05-01',1),
(008, 'kalai',    '2019-12-25',3),
(009, 'vidhya',   '2021-08-13',1),
(010, 'Mani',     '2021-12-23',1),
(006, 'shreya', '2020-05-17',1),
(004, 'diva',   '2015-07-27',2),
(005, 'edwin',    '2017-07-15',2),
(004, 'diva',   '2015-09-27',3),
(005, 'edwin',    '2016-12-15',3),
(002, 'Subam',     '2018-04-20',1),
(003, 'chai',  '2019-06-10',2),
(007, 'Muku',     '2020-05-01',2),
(008, 'kalai',    '2021-03-25',2),
(009, 'vidhya',   '2020-08-03',2),
(010, 'Mani',     '2022-09-23',2),
(006, 'shreya', '2024-01-17',2)

INSERT INTO product values (1, 'mobile',20000),
(2,'laptop',45000),(3,'headset',2000)

select * from gold_members_data
select * from users
drop table users
select * from sales
select * from product

select count(*) as record_count from gold_members_data
union all
select count(*) as record_count from users
union all
select count(*) as record_count from sales
union all
select count(*) as record_count from product

--total amount each customer spent on ecommerce company

select s.user_name,sum(product_price) as total_price
from sales s
join product as p on s.product_id=p.product_id
group by user_name

--distinct dates of each customer visited the website:2 columns date and customer name

SELECT DISTINCT s.created_date AS Date, u.user_name AS CustomerName
FROM sales s
INNER JOIN users u ON s.user_id = u.user_id
ORDER BY Date, CustomerName;

--first product purchased by each customer using 3 tables (users, sales, product)

SELECT u.user_id, u.user_name AS customer_name, p.product_name AS first_product, s.created_date
FROM users u
JOIN sales s ON u.user_id = s.user_id
JOIN product p ON s.product_id = p.product_id
WHERE s.created_date = (
    SELECT MIN(s2.created_date)
    FROM sales s2
    WHERE s2.user_id = u.user_id
);

--the most purchased item of each customer and how many times the customer has purchased it

SELECT s.user_id, u.user_name, p.product_name, COUNT(*) AS item_count
FROM sales s
JOIN users u ON s.user_id = u.user_id
JOIN product p ON s.product_id = p.product_id
GROUP BY s.user_id, u.user_name, p.product_name
ORDER BY s.user_id, item_count DESC;
select user_name,count(product_id) as item_count
from sales
group by user_name

--customer who is not the gold_member_user
select user_name,user_id from users
where user_id not in 
(select user_id from gold_members_data)

--the amount spent by each customer when he was the gold_member user
select u.user_name,sum(p.product_price) as total_amount
from gold_members_data g
join sales s on g.user_id=s.user_id
join product p on s.product_id=p.product_id
join users u on g.user_id=u.user_id
group by u.user_name

--the Customers names whose name starts with M
select user_name from users
where user_name like 'm%'

--the Distinct customer Id of each customer
select distinct user_id ,user_name from sales

--the Column name from product table as price_value from price
exec sp_rename 'dbo.product.product_price','price_value','column';
select * from product

--Change the Column value product_name – Ipad to Iphone from product table
update product
set product_name='iphone'
where product_name='mobile'
select product_name from product

--the table name of gold_member_users to gold_membership_users
exec sp_rename 'gold_members_data', 'gold_membership_users'
select * from gold_membership_users

--Create a new column  as Status in the table crate above gold_membership_users  the 
--Status values should be 2 Yes and No if the user is gold member, then status should be Yes else No.
--step 1:add new column to user table
alter table users
add status varchar(20)
--step 2:update status based on goldmembeship
update users
set status='yes'
where users.user_name in
(select gold_membership_users.user_name from gold_membership_users)
--step 3:set remaining users status "No"
update users
set status='no'
where status is null

--Delete the users_ids 1,2 from users table and roll the back changes once both the rows are deleted one by one
--mention the result when performed roll back

begin transaction
--step 1: delete user_id 1 from users
delete from users where user_id=1
--step 2: delete user_id 2 from users
delete from users where user_id=2
--step 3: check current state
select * from users
--step 4: rollback
rollback
select * from users



--Insert one more record as same (3,'Laptop',330) as product table
insert into product values(4,'dekstop',60000)
select * from product

--query to find the duplicates in product table
insert into product values(5,'dekstop',6500)
insert into product values(5,'dekstop',6500)
select product_id,product_name,price_value,count(*) as duplicate_count
from product
group by product_id,product_name,price_value
having count(*)>1




