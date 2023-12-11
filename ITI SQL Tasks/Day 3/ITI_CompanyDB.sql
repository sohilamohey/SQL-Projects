use ITI_Company_SD;
-----------------------------
select * from Departments
select * from Employee
select * from Dependent
select * from Project
select * from Works_for
-----------------------------
--1. Display all the employees Data--
select * from Employee

-----------------------------
--2. Display the employee First name, last name, Salary and Department number
select Fname, Lname, Salary, Dno
from Employee
-----------------------------
--3.Display all the projects names, locations and the department which is responsible about it
select Pname as 'Project Name' , 
       Plocation as [Project Location], 
       Dnum as "Department Number" 
from Project

-----------------------------
--4. If you know that the company policy is to pay an annual commission for each employee with specific percent 
--equals 10% of his/her annual salary .
--Display each employee full name and his annual commission in an ANNUAL COMM column (alias).
select  Fname + ' ' + Lname as 'Full Name',
        (Salary * 12) / 10 as 'Annual Commision'
from Employee

-----------------------------
--5. Display the employees Id, name who earns more than 1000 LE monthly.
select ssn, Fname + ' ' + Lname as 'Name'
from Employee
where Salary > 1000

-----------------------------
--6.	Display the employees Id, name who earns more than 10000 LE annually.
select ssn, Fname + ' ' + Lname as 'Name'
from Employee
where salary * 12 > 10000

-----------------------------
--7. Display the names and salaries of the female employees 
select Fname + ' ' + Lname as 'Name', Salary
from employee
where Gender = 'F'

-----------------------------
--8.	Display each department id, name which managed by a manager with id equals 968574.
SELECT Dnum, Dname
from Departments
where MGRSSN = 968574
-----------------------------
-- 9. Dispaly the ids, names and locations of  the pojects which controled with department 10.
select Pnumber, Pname, Plocation
from Project
where Dnum = 10
-----------------------------
--1. Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672,
-- Superssn = 112233, salary=3000.
Insert into Employee values('Sohila', 'Mohey', 102672, 8-4-2001, 'Abo Qurkas, Minia', 'F', 3000, 112233, 30)

-----------------------------
--2. Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, 
--but don’t enter any value for salary or manager number to him.
Insert into Employee values('Nahe', 'Ahmed', 102673, 7-11-2000, 'Minia', 'F', 3100, 112233, 30)

-----------------------------
-- 3.Upgrade your salary by 20 % of its last value.
update employee
set Salary = (salary + (salary /5))
where ssn = 102672
-----------------------------
select * 
from Employee
where ssn = 102672