use salestore;
select*from sales;
-- data cleaning
-- to replace values in the category 
/* how to use replace ; replace(column,'the string we want to replace','the new string')  */


update sales
set category=replace(Category,'Ofemalefemaleice Supplies','office_supplies')
where category like '%Ofemalefemaleice Supplies%';


-- to change femaleurniture to furniture
update sales 
set category=replace(category,'femaleurniture','furniture')
where category like '%femaleurniture%';

-- to change malearkers to ,markers 
select*from sales;
update sales
set sub_category=replace(sub_category,'malearkers','markers')
where sub_category like '%malearkers%';
-- to change Sofemaleas to sofas

update sales
set sub_category=replace(sub_category,'Sofemaleas','Sofas')
where sub_category like '%Sofemaleas%';

-- to change maleonitors to monitors
update sales
set sub_category=replace(sub_category,'maleonitors','monitors')
where sub_category like'%maleonitors%';

--  to change Camaleeras to cameras
update sales
set sub_category=replace(sub_category,'Camaleeras','Cameras')
where sub_category like'%Camaleeras%';

-- to rename ship_maleode to ship mode
alter table sales
rename column ship_maleode to ship_mode;


 select*from sales;
-- to change Smaleartwatches to Smartwatches
update sales
set sub_category=replace(sub_category,'Smaleartwatches','Smartwatches')
where sub_category like'%Smaleartwatches%';

-- to change Smaleartphones to Smartphones
update sales
set sub_category=replace(sub_category,'Smaleartphones','Smartphones')
where sub_category like'%Smaleartphones%';


select*from sales;
alter table sales 
drop Product_Refemaleerence;

alter table sales 
rename column profemaleit to profit ;

-- region that had highest and lowest sales 

select region,max(sales) as highest_sales
from sales
group by region
order by highest_sales desc limit 1;


-- region that had the lowest sales
select region,min(sales) as lowest_sales
from sales
group by region
order by lowest_sales asc limit 1;


-- to get the item that had the lowest sales and the region 

select sub_category,region,min(sales) as lowest_sales
from sales 
group by region, sub_category
order by lowest_sales asc limit 5;


-- region that had the highest profit margin and what item 

select region ,max(profit) as max_profit,sub_category
from sales
group by region,sub_category
order by max_profit desc limit 5;


-- to know the categories of the above query
select region ,max(profit) as max_profit,sub_category,category
from sales
group by region,sub_category,category
order by max_profit desc limit 5;

-- THE TWO CATEGORIES WITH MAX PROFIT ARE FURNITURES AND ELECTRONICS IN THE SOUTH AND WEST REGION MOSTLY


-- to get the subcategory that had the highest quantity and sales
select sub_category,max(Quantity) as total_buys,max(sales) as total_sales
from sales
group by sub_category
order by  total_sales desc limit 5;

-- city that had the highest sales and what do they buy most
select state,max(sales) ,sub_category
from sales
group by state,sub_category
order by max(sales) desc;

-- states that had the lowest sales and what isnt selling well  there 
select state,max(sales) ,sub_category
from sales
group by state,sub_category
order by max(sales) asc;

-- find the date where we had high sales
select max(sales), order_date,count(order_date) as no_of_order,sub_category
from sales
group by order_date,sub_category
order by max(sales) desc;

-- IN THE MONTH OF OCTOBER , NOVEMBER,MAY, JUNE WE THERE WAS HIGH SALES 

--  group  our sales by customers gender
select gender,max(sales) ,count(gender) as customers
from sales 
group by gender
order by max(sales) desc;

-- states and the total item purchased
select state,count(sub_category) as item_purchased
from sales 
group by state;
