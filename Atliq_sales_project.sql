select * from customers;

select * from date;

select * from markets;

select * from products;

select * from transactions;

alter table customers change custmer_name customer_name varchar(50);

## find Top 5 customer name  by amount

select c.customer_name , sum(t.sales_amount) as Total_Amount from customers c
join transactions t
on c.customer_code = t.customer_code
group by customer_name
order by Total_Amount desc
limit 5;

## find bottom 5 customer name by amount and Qty

select c.customer_name , sum(t.sales_amount) as Total_Amount , sum(t.sales_qty) as Total_Qty from customers c
join transactions t
on c.customer_code = t.customer_code
group by customer_name
order by Total_Amount asc
limit 5;

## find customer name , market name , zone , order_date from oldest to newest ,Qty and amount 

select c. customer_name , m.markets_name , m.zone , t.Order_date , t.sales_qty , t.sales_amount from customers c
join transactions t 
on c.customer_code = t.customer_code
join markets m 
on t.market_code = m.markets_code
order by t.order_date Asc;

## Find Total Amount by zone

select m.zone , Sum(t.sales_amount) as Total_Amount from markets m
join transactions t
on m.markets_code = t.market_code
group by zone 
order by Total_Amount Desc;



