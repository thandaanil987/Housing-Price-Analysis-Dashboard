CREATE DATABASE housing_analysis;
USE housing_analysis;
CREATE TABLE housing (
longitude FLOAT,
latitude FLOAT,
housing_median_age INT,
total_rooms INT,
total_bedrooms INT,
population INT,
households INT,
median_income FLOAT,
median_house_value INT,
ocean_proximity VARCHAR(50)
);

#retriev table 
select *from housing;

-- 1) Average House Price by Location
select ocean_proximity,round(avg(median_house_value),2)as avg_price
from housing
group by ocean_proximity;

-- 2) Highest House Price
select max(median_house_value)as high_house_price
from housing;

-- 3) Lowest House Price
select min(median_house_value)As lowest_house_price
from housing;

-- 4)Average Income by Location
select ocean_proximity,round(avg(median_income),2)as avg_income
from housing
group by ocean_proximity;

-- 5)Sum of Income by Location
select ocean_proximity,round(sum(median_income),2)as total_income
from housing
group by ocean_proximity;

-- 6) Total Population by Location
select ocean_proximity,sum(population)as total_population
from housing
group by ocean_proximity;

-- 7) Top 10 Expensive Houses
select*from housing 
order by median_house_value desc
limit 10;

-- 8) Average Rooms per Location
select ocean_proximity,round(avg(total_rooms),2)as avg_rooms 
from housing
group by ocean_proximity;

-- 9) Houses with Income greater than 5
select*from housing 
where median_income>5;

-- 10) Houses with Price above Average
select*from housing 
where median_house_value >(
select avg(median_house_value)from housing);

-- 11) Count Houses by Location+
select ocean_proximity,count(*)
from housing 
group by ocean_proximity;