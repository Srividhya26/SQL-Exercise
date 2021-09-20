CREATE DATABASE EmployeeDetails;

CREATE TABLE Employee(
   FirstName varchar(50),
   LastName varchar(50),
   Title varchar (50),
   Age int,
   Salary decimal
);

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Anika','James','Secretary',55,99500.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Peter','Johnson','Programmer',32,45300.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Paul','Ericcson','Programmer II',55,99500.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Ashwini','Vasanth','Assistant Secretary',28,19500.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Athulya','Jayaraj','Tester',30,50000.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Mohan','Deva','Senior Tester',25,30000.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Reshma','Siva','Junior Programmer',21,55000.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Vidhya','Venkatesan','Programmer',21,40000.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Sujiritha','S','Junior Tester',25,25000.00)

INSERT INTO Employee(FirstName,LastName,Title,Age,Salary)
VALUES ('Brian','Thomas','Secretary',30,25000.00)


--Queries

--	Select all columns for everyone with a salary below 50000.
SELECT * FROM Employee WHERE salary < 50000.00;

--	Select Full Name (FirstName, Last Name) for everyone that's above 30 years old.
SELECT FirstName,LastName FROM Employee WHERE age > 30;

--	Select first name, last name, and salary for anyone with "secretary" in their title.
SELECT FirstName,LastName,Salary FROM Employee WHERE Title = 'Secretary';

--	Select all columns for everyone whose last name contains "son".
SELECT * FROM Employee WHERE LastName LIKE '%son';

--	Select everyone whose first name equals "Brian".
SELECT * FROM Employee WHERE FirstName = 'Brian';

--	Select all columns for everyone over 50 years old.
SELECT * FROM Employee WHERE Age > 50;


--UPDATE QUERIES
-- Ashwini Vasanth just got married to Bob Williams. She has requested that her last name be updated to Ashwini-Williams.
UPDATE Employee 
SET LastName = 'Williams'
WHERE FirstName = 'Ashwini';

SELECT FirstName,LastName FROM Employee WHERE FirstName = 'Ashwini';

--	Paul Ericsson’s birthday is today, add 1 to his age.
UPDATE Employee SET Age = Age+1 WHERE FirstName = 'Paul' and LastName = 'Ericcson';

SELECT FirstName,LastName,Age FROM Employee WHERE FirstName = 'Paul' and LastName = 'Ericcson';

--	All secretaries are now called "Admin Assistant". Update all titles accordingly.
UPDATE Employee SET Title = 'Admin Assistant' WHERE Title = 'Secretary';

SELECT FirstName FROM Employee WHERE Title = 'Admin Assistant';

--	All "Programmer II" titles are now promoted to "Programmer III".
UPDATE Employee SET Title = 'Programmer III' WHERE Title = 'Programmer II';

SELECT FirstName FROM Employee WHERE Title = 'Programmer III';

--	All "Programmer" titles are now promoted to "Programmer II".
UPDATE Employee SET Title = 'Programmer II' WHERE Title = 'Programmer';

SELECT FirstName FROM Employee WHERE Title = 'Programmer II';

SELECT * FROM Employee;

--	Everyone that's making under 40000 are to receive a 5300 a year raise.
UPDATE Employee SET Salary = Salary + 5300 WHERE Salary < 40000;

SELECT * FROM Employee;

--	Everyone that's making over 75000 are to receive a 4500 a year raise.
UPDATE Employee SET Salary = Salary + 4500 WHERE Salary > 75000;

SELECT * FROM Employee;

--DELETE QUERY
-- Ashwini Williams just quit, remove her record from the table.
DELETE FROM Employee WHERE FirstName = 'Ashwini' and LastName = 'Williams';

SELECT * FROM Employee;

-- Remove all employees who are making over 70000 as salary.
DELETE FROM Employee WHERE Salary > 70000;

SELECT * FROM Employee;
