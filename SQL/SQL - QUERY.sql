CREATE DATABASE EmployeeTable;

CREATE TABLE employee(
   empName varchar(50) NOT NULL,
   street varchar(50),
   city varchar(25),
   PRIMARY KEY( empName )
);

CREATE TABLE work
(
   empName varchar(50) NOT NULL,
   companyName varchar(50),
   salary int,
   PRIMARY KEY(companyName),
   FOREIGN KEY( empName ) REFERENCES employee(empName)
);

CREATE TABLE company
(
   companyName varchar(50),
   city varchar(50),
   FOREIGN KEY( companyName ) REFERENCES work(companyName)
);

CREATE TABLE manager
(
   empName varchar(50),
   managerName varchar(50),
   city varchar(50),
   street varchar(50),
   FOREIGN KEY( empName ) REFERENCES employee(empName)
);

ALTER database [dbo.company] SET city = varchar(50);

SELECT * FROM employee

-- 1st Question
SELECT employee.empName,street,city from employee 
JOIN work ON employee.empName = work.empName
WHERE work.companyName = 'First Bank Corporation' AND salary > 10000;
 -- OR

--SELECT employee.empName,street,city from employee 
--WHERE (empName) IN 
--(SELECT empName from work where companyName = 'First Bank Corporation' and salary > 10000);

--4th Question
SELECT employee.empName FROM employee 
JOIN work 
ON employee.empName = work.empName
WHERE companyName != 'First Bank Corporation';

--7th Question
SELECT TOP 1 companyName
FROM work
GROUP BY companyName
ORDER BY sum(salary)

--2nd Question
SELECT employee.empName from employee
JOIN work on employee.empName = work.empName
JOIN company on work.companyName = company.companyName 
where employee.city = company.city;

--3rd Question
SELECT employee.empName from employee
JOIN manager on employee.empName = manager.empName
where employee.city = manager.city and employee.street = manager.street;

--5th Question
SELECT companyName,city from company where companyName = 'Small Bank Corporation';

--6th Question
SELECT empName from work group by empName having avg(salary) > (select avg(salary) from work);