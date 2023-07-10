create table international_debt (
country_name varchar(50),
country_code varchar(20),
indicator_name varchar(100) ,
indicator_code varchar(30),
debt float);
COPY international_debt FROM 'E:\Track\Data analysis\SQL project 1\international_debt.csv' DELIMITER ',' CSV HEADER null 'NA';

select * from international_debt;

select count(distinct(country_name))  
from international_debt;


select distinct(debt)
from international_debt;

select sum(debt)
from international_debt;


select country_name ,sum(debt) 
from international_debt 
group by country_name 
order by sum desc
limit 1;

select avg(debt)
from international_debt;

select sum(debt)/ count(debt)
from international_debt;
