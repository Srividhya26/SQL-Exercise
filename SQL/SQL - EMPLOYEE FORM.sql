CREATE DATABASE EmployeeEffortForm;

--creating roles table

CREATE TABLE Roles(
   RoleId int,
   RoleName varchar(50),
   PRIMARY KEY (RoleId)
);

INSERT INTO Roles (RoleId,RoleName)
VALUES (1 , 'Developer');

INSERT INTO Roles (RoleId,RoleName)
VALUES (2 , 'Tester');

INSERT INTO Roles (RoleId,RoleName)
VALUES (3 , 'Management');

--creating employee table 

CREATE TABLE Employee(
   EmpId int,
   EmpNo int,
   EmpName varchar(50),
   ChargeHour int,
   PRIMARY KEY (EmpId)
);

INSERT INTO Employee(EmpId,EmpNo,EmpName,ChargeHour)
VALUES (1,224,'Madhan Kumar',15);

INSERT INTO Employee(EmpId,EmpNo,EmpName,ChargeHour)
VALUES (2,225,'Jeeva',16);

INSERT INTO Employee(EmpId,EmpNo,EmpName,ChargeHour)
VALUES (3,226,'Vishnu',8);

INSERT INTO Employee(EmpId,EmpNo,EmpName,ChargeHour)
VALUES (4,227,'Vanitha',15);

--creating Amounts table

CREATE TABLE Amount(
   SI_No int,
   EmpId int,
   RoleId int,
   HourSpent int,
   TotalAmount int,
   PRIMARY KEY (SI_No),
   FOREIGN KEY (EmpId) REFERENCES Employee(EmpId),
   FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
);

INSERT INTO Amount (SI_No,EmpId,RoleId,HourSpent,TotalAmount) 
VALUES (1,1,1,10,150);

INSERT INTO Amount (SI_No,EmpId,RoleId,HourSpent,TotalAmount) 
VALUES (2,2,1,10,160);

INSERT INTO Amount (SI_No,EmpId,RoleId,HourSpent,TotalAmount) 
VALUES (3,3,2,10,80);

INSERT INTO Amount (SI_No,EmpId,RoleId,HourSpent,TotalAmount) 
VALUES (4,4,3,10,150);

--displaying the tables 

SELECT * FROM Employee;
SELECT * FROM Roles;
SELECT * FROM Amoount;
