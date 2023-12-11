--1.Simple Subquery: Write a query to find all courses with a duration longer than the average course duration
select *
from Course
where Crs_Duration > 
	(select avg(Crs_Duration)
	  from Course)

--2.Correlated Subquery: Find the names of students who are older than the average age of students in their department
SELECT s.*
FROM student s
WHERE s.St_Age > (
  SELECT AVG(s2.St_Age)
  FROM student s2
  WHERE s2.Dept_Id = s.Dept_Id
);
--3.Subquery in FROM Clause: Create a list of departments and the number of instructors in each, using a subquery
select Dept_Name, count(*) as Number_Of_Instractors
from (select distinct dept_id from Instructor) as inst
join Department dep 
	on inst.Dept_Id = dep.Dept_Id
group by dep.Dept_Name
--4.Subquery in SELECT Clause: For each student, display their name and the number of courses they are enrolled in.
select st.St_Fname + ' ' + st.St_Lname as Name, 
      (select count(distinct(stcr.Crs_Id)) from Stud_Course stcr) as Number_Of_Courses
from Student st
--5.Multiple Subqueries: Find the name and salary of the instructor who earns 
--more than the average salary of their department
select inst.Ins_Name, inst.Salary 
from Instructor inst
where inst.Salary > (select AVG(inst2.Salary) 
			from Instructor inst2 
			where inst2.Dept_Id = inst.Dept_Id  
			group by Dept_Id
			)
--6.UNION: Combine the names of all students and instructors into a single list.
select St_Fname
from Student
union 
select Ins_Name
from Instructor
--7.UNION with Condition: Create a list of courses that either have a duration longer than 50 hours or
--are taught by an instructor named 'Ahmed'.
select Crs_Name
from Course
where Crs_Duration > 50
union 
select crs.Crs_Name
from Ins_Course inscur
join Instructor inst
on inst.Ins_Id = inscur.Ins_Id
join Course crs
on crs.Crs_Id = inscur.Crs_Id
where inst.Ins_Name = 'Ahmed'
--8.Subquery with EXISTS: List all departments that have at least one course with a duration over 60 hours.
SELECT DISTINCT dep.Dept_Name
FROM department dep
WHERE dep.Dept_Id in (
  SELECT distinct dep.Dept_Id
  FROM Department dep   
  join Student std on dep.Dept_Id = std.Dept_Id 
join Stud_Course stdcrs on std.St_Id = stdcrs.St_Id 
join Course crs on crs.Crs_Id = stdcrs.Crs_Id
  WHERE crs.Crs_Duration > 60
);

--9.Nested Subqueries: Display the names of students who are taking courses in the same department they belong to

SELECT DISTINCT std.St_Fname, dep.Dept_Name
FROM student std
 join Department dep on dep.Dept_Id = std.Dept_Id 
WHERE std.Dept_Id IN (
  SELECT std.Dept_Id
  FROM course c
  join Department dep on dep.Dept_Id = std.Dept_Id 
  join Stud_Course stdcrs on std.St_Id = stdcrs.St_Id 
  join Course crs on crs.Crs_Id = stdcrs.Crs_Id
  WHERE crs.Crs_Id IN (
    SELECT enroll.Crs_Id
    FROM Stud_Course enroll
    WHERE enroll.St_Id = std.St_Id
  )
)
order by dep.Dept_Name;

--10.TOP Clause: Select the top 5 highest-graded students in the 'SQL Server' course.
select top(5) stdcrs.Grade,  std.St_Fname
from Stud_Course stdcrs
join Student std
on std.St_Id = stdcrs.St_Id
join Course crs
on stdcrs.Crs_Id = crs.Crs_Id
where crs.Crs_Name = 'SQL Server'
order by stdcrs.Grade desc
--11.TOP with Ties: Show the top 3 departments with the most courses, including ties.
select top(5) with ties dep.Dept_Name
from Department dep
join Student std
on dep.Dept_Id = std.Dept_Id
join Stud_Course stdcrs 
on stdcrs.St_Id = std.St_Id
join Course crs
on crs.Crs_Id = stdcrs.Crs_Id
order by count(c)
--12.Subquery with IN: Find all students who are enrolled in 'C Programming' or 'Java'.
select std.St_Fname, crs.Crs_Name
from Student std
join Stud_Course stdcrs
on std.St_Id = stdcrs.St_Id
join Course crs 
on stdcrs.Crs_Id = crs.Crs_Id
where crs.Crs_Name in ('C Progamming',  'Java')
-- 13.Complex UNION: Create a list of all courses and instructors, showing course names and instructor names in 
--separate columns.
select crs.Crs_Name, Null
from Course crs
select NULL,   ins.Ins_Name
from Instructor ins
--14.	Subquery in WHERE Clause: Identify students who are taking courses that are longer than the average 
--duration of all courses.
SELECT std.St_Fname
FROM Student std
JOIN Stud_Course stdcrs ON std.St_Id = stdcrs.St_Id
JOIN Course crs ON crs.Crs_Id = stdcrs.Crs_Id
WHERE crs.Crs_Duration > (SELECT AVG(Crs_Duration) FROM Course);

--15.Combining TOP and Subquery: Display the top 10% of courses based on the number of students enrolled
SELECT TOP 10 PERCENT crs.Crs_Name, COUNT(stdcrs.St_Id) AS nuber_of_student
FROM Course crs
JOIN Stud_Course stdcrs ON crs.Crs_Id = stdcrs.Crs_Id
GROUP BY crs.Crs_Name
ORDER BY COUNT(stdcrs.St_Id) DESC;
