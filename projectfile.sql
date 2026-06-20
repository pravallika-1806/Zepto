create table zept(
id serial primary key,
category varchar(120),
name varchar(150) Not null,
mrp numeric(8,2),
discountPercent Numeric(5,2),
availableQunatity INT,
discountedSellingPrice Numeric(8,2),
weightInGms Int,
outofstock Boolean,
quantity int
);

-- data exploration


-- checking all rows are imported
select count(*) from zept;

select * from zept
limit 10;

select * from zept
where id = null or category = null or name = null or mrp = null 
		or discountpercent = null or availableQunatity = null or discountedSellingPrice = null
		or weightInGms = null or outofstock = null or quantity = null;


select distinct(category) from zept;

select count(distinct(category)) from zept;

-- product in stock vs out of stock
select outofstock,count(id) from zept
group by outofstock;


select category,count(name) from zept
group by category;

-- product names present multiple times
select name,count(id) from zept
group by name
having count(id) > 1
order by count(id) desc;


-- data cleaning
select count(*) as cnt from zept;


select * from zept
where mrp = 0 or discountedSellingPrice=0;

delete from zept
where mrp =0 ;

-- convert paise to rupees
update zept
set mrp = mrp/100.0,discountedSellingPrice=discountedSellingPrice/100.00;

select mrp,discountedSellingPrice from zept;

-- business insights
-- 1.find the top 10 best-value products based on the discountpercentage
select distinct name,mrp ,discountPercent from zept
order by discountPercent desc
limit 10;

-- 2.what are the products with high mrp but out of stock
select distinct(name) ,mrp from zept
where outofstock = True and mrp > 300
order by mrp desc;

-- 3.Calculate estimated revenue for each category
select category,sum(discountedSellingPrice * availableQunatity) as total_revenue
from zept
group by category
order by total_revenue;

-- 4.find all products where mrp is greater than  rs.500 and discount is less than 10%.
select distinct name ,mrp , discountPercent from zept
where mrp > 500 and discountPercent < 10
order by mrp desc,discountPercent desc;

--5.identify the top 5 categories offering the highest average discount percentage.
select  category,round(avg(discountPercent),2) from zept
group by category 
order by avg(discountPercent) desc
limit 5;

--6.find the price per gram for products above 100g and sort by best value

select distinct name,weightInGms ,discountedSellingPrice,round(discountedSellingPrice/weightInGms) as price_per_gram from zept
where weightInGms >= 100
order by price_per_gram;

-- 7.group the products into categories like low,medium,bulk.
select distinct name,weightInGms, 
CASE WHEN weightInGms < 1000 THEN 'low'
	 WHEN weightInGms < 5000 THEN 'medium'
	 ELSE 'bulk'
	 end as category_product
from zept;

-- 8.what is the total inventory weight per category
select category,
sum(weightInGms * availableQunatity) as total_weight
from zept
group by category
order by total_weight;
