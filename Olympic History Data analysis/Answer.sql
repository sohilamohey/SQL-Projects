Select * from olympic_history limit 10;

Select * from noc_regions limit 10;

*******************************************
* G1: Olympic History General Information *
*******************************************
Q1: What is the beginning and ending years?
Select Min(Year) AS Beginning_years,MAX(Year) AS Ending_year 
From olympic_history;

Q2: How many Olympics have been held in 120 years?
Select Count(Distinct games)
From olympic_history;

Q3: What are total number of medals by season?
???
select season, count (medal)
from olympic_history
Where medal <> 'NA'
group by season;

???
select games, count (medal)
from olympic_history
Where medal <> 'NA'
group by games;

???///////////////////////////////////////
SELECT
 games, COUNT(CASE WHEN medal = 'Gold' THEN ID END) Gold,
 COUNT( CASE WHEN medal = 'Silver' THEN ID END) Silver,
 COUNT( CASE WHEN medal = 'Bronze' THEN ID END) Bronze
FROM
	olympic_history
group by olympic_history.games;
//////////////////////////////
*******************************
* G2: Gender In Olympic Games *
*******************************
Q1: What is gender ratio over seasons?
SELECT
 games, COUNT(CASE WHEN gender = 'M' THEN ID END) Male_Count,
 COUNT( CASE WHEN gender = 'F' THEN ID END) Female_Count
FROM
	olympic_history
group by olympic_history.games;

??? (Ahd, Shaza)
SELECT 100*sum(case when gender = 'M' then 1 else 0 end)/count(*) as male_ratio,
       100*sum(case when gender = 'F' then 1 else 0 end)/count(*) as female_ratio
FROM olympic_history

??? (Asmaa)
select 100* cast(sum(case when Gender = 'M' then 1 else 0 end) as float) /count(*) as male ,
       100* cast(sum(case when Gender = 'F' then 1 else 0 end) as float)/count(*) as famale
	   from olympic_history ;

??? (Rowida)
SELECT season , 100 * cast (sum(case when gender = 'M' then 1 else 0 end)as float)/ count(*) as male_ratio,
       100 * cast (sum(case when gender = 'F' then 1 else 0 end)as float)/ count(*) as female_ratio
FROM olympic_history group by season;

??? (Abdullah)
select  round (100 * cast (sum(case when gender = 'M' then 1 else 0 end) as numeric) /  count(gender),2)as Male,
	    round (100 *  cast (sum(case when gender = 'F' then 1 else 0 end) as numeric) /  count(gender), 2)as Female, 
		season, 
		year
from olympic_history
group by season, year;


Q2: What is gender number over medal?
SELECT
 medal, COUNT(CASE WHEN gender = 'M' THEN ID END) Male_Count,
 COUNT( CASE WHEN gender = 'F' THEN ID END) Female_Count
FROM
	olympic_history
group by olympic_history.medal;

???/////////////////////////////
SELECT
 gender, COUNT(CASE WHEN medal = 'Gold' THEN ID END) Gold,
 COUNT( CASE WHEN medal = 'Silver' THEN ID END) Silver,
 COUNT( CASE WHEN medal = 'Bronze' THEN ID END) Bronze
FROM
	olympic_history
group by olympic_history.gender;
/////////////////////////
**********************
* G3: Region Analyze *
**********************
Q1: Which country has the most athletes?
Select NOC_Regions.regions,
Count(Distinct olympic_history.Name) AS num_of_athletes
From olympic_history 
INNER JOIN NOC_Regions ON NOC_Regions.NOC = olympic_history.NOC
Group By NOC_Regions.regions
ORDER BY num_of_athletes DESC
Limit 10;

Q2: What is the medal count by country?
Select noc_regions.regions,
count(olympic_history.medal) as Medals_Count,
 COUNT(CASE WHEN medal = 'Gold' THEN ID END) Gold,
 COUNT( CASE WHEN medal = 'Silver' THEN ID END) Silver,
 COUNT( CASE WHEN medal = 'Bronze' THEN ID END) Bronze
FROM olympic_history
INNER JOIN noc_regions
ON olympic_history.NOC=noc_regions.NOC
group by regions
order by Medals_Count desc;

***************************
* G4: Athlete Performance *
***************************
Q1: Who has participated in the most Olympic Games?
select name, gender, count (distinct games) as Participation_Count
from olympic_history
group by name, gender
order by Participation_Count desc;

Q2: Who are top athletes by medal?
select name, gender, sport, count (medal) as Medal_Count
from olympic_history
group by name, gender, sport
order by Medal_Count desc;