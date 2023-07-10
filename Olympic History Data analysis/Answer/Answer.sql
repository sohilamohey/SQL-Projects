create table Athlete_Events(
id integer ,
name varchar(1000),
gender varchar(1),
age integer,
height integer,
weight float,
team varchar(100),
noc varchar(3),
games varchar(14),
year integer,
season varchar(7),
city varchar(50),
sport varchar(50),
event varchar(100),
medal varchar(10)
);

copy Athlete_Events from 'E:\Track\Data analysis\SQL Project 3\athlete_events.csv' DELIMITER ',' CSV HEADER null 'NA';
select * from Athlete_Events;

create table noc_regions(
noc varchar(3),
regoin varchar(50),
note text
);
copy noc_regions from 'E:\Track\Data analysis\SQL Project 3\noc_regions.csv'  DELIMITER ',' CSV HEADER null 'NA';
select * from noc_regions;
select regoin from noc_regions;

-----------------------------------------------------------
#Group 1:
---------

---1. What is the beginning and ending years?
select max(year) as Beginning_year , min(year) as Ending_year 
from Athlete_Events;

---2. How many Olympics have been held in 120 years?
select count(distinct(games)) from Athlete_Events;

---3. What are total number of medals by season?
--Seasons in total--

select season,medal , count(medal)
from Athlete_Events
where medal is not null
group by season,medal;

--Season with year(game)--
select games,medal , count(medal)
from Athlete_Events
where medal is not null
group by games,medal;

-----------------------------------------------------------
#Group 2:
---------

---1. What is gender ratio over seasons?
select  round (100 * cast (sum(case when gender = 'M' then 1 else 0 end) as numeric) /  count(gender),2)as Male,
	    round (100 *  cast (sum(case when gender = 'F' then 1 else 0 end) as numeric) /  count(gender), 2)as Female, 
		season, year
from Athlete_Events
group by season, year;

---2. What is gender number over medal?
select medal, gender, count(medal)
from Athlete_Events
where medal is not null
group by medal, gender;

-----------------------------------------------------------
#Group 3:
---------

---1. Which country has the most athletes?
select noc_regions.regoin , count(Athlete_Events.noc)
from Athlete_Events 
inner join noc_regions 
on Athlete_Events.noc = noc_regions.noc
group by noc_regions.regoin 
order by count desc
limit 1;

---2. What is the medal count by country?
select noc_regions.noc, medal, count(medal)
from Athlete_Events
join noc_regions on Athlete_Events.noc = noc_regions.noc
where medal is not null
group by noc_regions.noc,medal
order by noc;

select noc_regions.noc,  noc_regions.regoin, Athlete_Events.medal, count(Athlete_Events.medal)
from noc_regions
join Athlete_Events on  noc_regions.noc = Athlete_Events.noc
where medal is not null
group by noc_regions.noc,Athlete_Events.medal, noc_regions.regoin
order by noc_regions.noc;

-----------------------------------------------------------
#Group 4:
---------

---1. Who has participated in the most Olympic Games?
select name, id,noc,count(distinct(games))
from Athlete_Events
group by name ,id , noc
order by count desc
limit 1;

---2. Who are top athletes by medal?
select name,sport, count(medal) as NumberOfMedals
from Athlete_Events
group by name,sport
order by NumberOfMedals desc
