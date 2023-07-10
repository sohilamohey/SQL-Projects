CREATE TABLE flight_delays (
  year INTEGER,
  month INTEGER,
  dayofmonth INTEGER,
  dayofweek INTEGER,
  deptime INTEGER,
  arrtime INTEGER,
  flightnum INTEGER,
  tailnum VARCHAR,
  airtime INTEGER,
  arrdelay INTEGER,
  depdelay INTEGER,
  origin VARCHAR,
  dest VARCHAR,
  distance INTEGER);
  
COPY flight_delays FROM 'E:\Track\Resources\5. SQL Data Analysis\2007.csv' DELIMITER ',' CSV HEADER null 'NA';

SELECT * FROM flight_delays LIMIT 10;

1
SELECT COUNT(*) FROM flight_delays LIMIT 10; 
1048575

SELECT COUNT(arrdelay) FROM flight_delays LIMIT 10;
1011780

2
select distinct (DayOfWeek) from flight_delays;

3
SELECT SUM(airtime) FROM flight_delays;
100492771

4
SELECT AVG(depdelay) FROM flight_delays;
select avg(arrdelay) from flight_delays;

5
select max(distance) from flight_delays;
select min(distance) from flight_delays;

6
SELECT AVG(depdelay), origin FROM flight_delays GROUP BY origin;

7
select sum(airtime), month from flight_delays group by month;

8
select avg (DepDelay), origin from flight_delays where distance >2000 group by origin;

9
SELECT COUNT(*), origin FROM flight_delays GROUP BY origin ORDER BY count desc;

10
select distinct (origin) from flight_delays;
or
SELECT origin FROM flight_delays GROUP BY origin;

Assignment
SELECT
  COUNT(*),
  tailnum
FROM flight_delays
WHERE dayofweek = 7
  AND dest IN ('PHX', 'SEA')
GROUP BY tailnum
ORDER BY count DESC
LIMIT 5

