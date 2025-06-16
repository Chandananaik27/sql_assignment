use ecommerce
create table product_details(sell_date date,product varchar(20))
insert into product_details values('2020-05-30','Headphones')
insert into product_details values('2020-06-01','Pencil')
insert into product_details values('2020-06-02','Mask')
insert into product_details values('2020-05-30','Basketball')
insert into product_details values('2020-06-01','Book')
insert into product_details values('2020-06-02', ' Mask ')
insert into product_details values('2020-05-30','T-Shirt')
select * from product_details

--a query to find for each date the number of different products sold and their names. 
select sell_date,count(product) as num_sold,
STRING_AGG(product,',') as product_list
from product_details
group by sell_date

