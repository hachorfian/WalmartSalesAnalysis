select * 
from walmart..Sales

--Generic Question
--1.How many unique cities does the data have?
select distinct(city)
from walmart..Sales

--2.Which city has which branch?
select distinct city ,branch 
from walmart..Sales

-- --------------------------------------------------------------------
-- ---------------------------- Product -------------------------------
-- --------------------------------------------------------------------

-- 1.How many unique product lines does the data have?
select distinct [Product line]
from walmart..Sales

--2. What is the most selling product line
select count([Product line]) as cnt,[Product line] 
from walmart..Sales
group by [Product line]
order by cnt desc

-- 3.-- What product line had the largest revenue?
select sum(Total) as totalrevenue,[Product line]
from walmart..Sales
group by [Product line]
order by totalrevenue desc

--4. What is the city with the largest revenue?
select branch,city,sum(total) as totalrevenue
from walmart..Sales
group by city,Branch
order by totalrevenue desc

-- 5.What product line had the largest VAT?
select avg(Tax) as avg_tax,[Product line]
from walmart..Sales
group by [Product line]
order by avg_tax desc

--6. Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales
select avg(quantity) as avg_selling_qnty
from walmart..Sales;

select [Product line],
case 
       when sum(Quantity)>5.51 then 'GOOD'
	   else 'BAD'
end as Remark   
from walmart..Sales
group by [Product line]

--7. Which branch sold more products than average product sold?
select avg(quantity) 
from walmart..Sales
 
 select branch,sum(quantity) as qnty
 from walmart..Sales
 group by branch
 having avg(Quantity)>(select avg(quantity) from walmart..Sales)
   
select avg(quantity) as qty,Branch
from walmart..Sales
group by Branch

--8. What is the most common product line by gender
select gender,count(gender) as cnt,[Product line]
from walmart..Sales
group by Gender,[Product line]
order by cnt 

--9. What is the average rating of each product line
select AVG(rating) as avgrating,[product line]
from walmart..Sales
group by [Product line]
order by avgrating desc

--10.What is the most common payment method?
select count(payment) as paymethod,payment
from walmart..Sales
group by Payment
order by paymethod desc

-- --------------------------------------------------------------------
-- ---------------------------- Sales ---------------------------------
-- --------------------------------------------------------------------

--1. Which of the customer types brings the most revenue?
select [Customer type],sum(total) as totalrevenue
from walmart..Sales
group by [Customer type]
order by totalrevenue desc

--2. Which city has the largest tax/VAT percent?
select AVG(tax) as avgtax,city
from walmart..Sales
group by City
order by avgtax desc

--3. Which customer type pays the most in VAT?
select [customer type],AVG(tax) as avgtax
from walmart..Sales
group by [Customer type]
order by avgtax desc

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------

--1. How many unique customer types does the data have?
select distinct([customer type])
from walmart..Sales

--2. How many unique payment methods does the data have?
select distinct([payment])
from walmart..Sales

--3. What is the most common customer type?
select count([customer type])as num,[Customer type]
from walmart..Sales
group by [Customer type]
order by num desc

--4.What is the gender of most of the customers?
select count(gender) as cnt,Gender
from walmart..Sales
group by Gender
order by cnt desc

--5. What is the gender distribution per branch?
select count(gender) as cnt,Gender,Branch
from walmart..Sales
group by Gender,Branch
order by Branch ,cnt desc

-----------------------------------------------------------
------------------------------Revenue----------------------
-----------------------------------------------------------

--Which branch generates most turnover?
select sum(total) as totalturnover,Branch
from walmart..Sales
group by Branch
order by totalturnover desc

--MOst revenue generating product line?
select sum(total) as revenue,[Product line]
from walmart..Sales
group by [Product line]
order by revenue desc









