create database ZOO_Animals
create table zoo(
	animal varchar(15),
 	uniq_id int,
 	water_need int
);

INSERT INTO zoo (animal,uniq_id,water_need) VALUES
    ('elephant',1001,500),
    ('elephant',1002,600),
    ('elephant',1003,550),
    ('tiger',1004,300),
    ('tiger',1005,320),
    ('tiger',1006,330),
    ('tiger',1007,290),
    ('tiger',1008,310),
    ('zebra',1009,200),
    ('zebra',1010,220),
    ('zebra',1011,240),
    ('zebra',1012,230),
    ('zebra',1013,220),
    ('zebra',1014,100),
    ('zebra',1015,80),
    ('lion',1016,420),
    ('lion',1017,600),
    ('lion',1018,500),
    ('lion',1019,390),
    ('kangaroo',1020,410),
    ('kangaroo',1021,430),
    ('kangaroo',1022,410);



/*1 A)*/
SELECT * 
FROM zoo
WHERE ANIMAL = 'elephant'; 

/*6*/
select *
from zoo
where animal<>'zebra';
/*7*/
select *
from zoo
where water_need< 300;
/*8*/
select *
from zoo
where animal like '%e%';
/*9*/
select *
from zoo
where animal like '%roo';

/*10 solution 1)*/
select *
from zoo
where animal like 't_%';
/*11 solution 2)*/
select *
from zoo
where animal like 't%';
/*12 */
select *
from zoo
where length(animal)<>5;
/*13*/
select *
from zoo
where length(animal)=5 and animal <>'tiger';
/*14*/
select *
from zoo
where length(animal) =5
	  and animal <>'tiger'
	  and water_need > 200; 
/*15*/
select* 
from zoo
where animal ='lion'
	   or water_need < 300;
/*16*/
select* 
from zoo
where uniq_id in(1001,1008,1012,1015,1018);
