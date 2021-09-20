CREATE DATABASE Student;


--1)Creating Course Table
CREATE TABLE CourseInfo(
   CourseId int NOT NULL,
   CourseName varchar(50) NOT NULL,
   Price decimal NOT NULL,
   PRIMARY KEY (CourseId)
)

--2)Creating Student table
CREATE TABLE StudentInfo(
   StudentId int NOT NULL,
   StudentName varchar(50) NOT NULL,
   Place varchar(50) NOT NULL,
   Qualification varchar(25) NOT NULL,
   PRIMARY KEY (StudentId)
)

UPDATE StudentInfo SET DateOfJoining = '1995-09-05' WHERE StudentName = 'Sriram';

CREATE TABLE Enrolled(
  StudentId int NOT NULL,
  CourseId int NOT NULL,
  Marks int,
  MoneyPaid decimal,
  Performance varchar(50),
  FOREIGN KEY (StudentId) REFERENCES StudentInfo(StudentId),
  FOREIGN KEY (CourseId) REFERENCES CourseInfo(CourseId)
)

--3)Adding values to course table
INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (101,'C++',6000.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (102,'Visual Basic',8000.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (103,'Web Development',5500.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (104,'Azure',4500.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (105,'Python',3000.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (106,'Digital Marketing',2500.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (107,'AutoCAD',9000.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (108,'Ethical Hacking',4500.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (109,'Machine Learning',10000.00);

INSERT INTO CourseInfo (CourseId,CourseName,Price)
VALUES (110,'Data Science',70000.00);

--4)Inserting values to student table
INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (01,'Vinodhini','Triplicane','BA');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (02,'Hariharan','KKNagar','ME');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (03,'Prabu','Anna nagar','BE');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (04,'Samuel','Mylapore','Bcom');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (05,'Harivignesh','Egmore','Mechanical');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (06,'Priya','Anna nagar','BE');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (07,'Vasundhara','Ashok nagar','BE');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (08,'Vinitha','Pallavaram','MCA');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (09,'Sriram','Tambaram','ME');

INSERT INTO StudentInfo (StudentId,StudentName,Place,Qualification)
VALUES (10,'Joseph','Egmore','MCA');

--5)Adding DOJ to student table
ALTER TABLE StudentInfo ADD DateOfJoining date;

--6)Display all courses along with their prices
SELECT CourseName,Price FROM CourseInfo;

--7)Show the names and qualification of students who joined after 1-Aug-09
SELECT StudentName,Qualification FROM StudentInfo WHERE DateOfJoining >= '2009-08-01';

--8)Find the students from Triplicane, Egmore and Mylapore
SELECT StudentName FROM StudentInfo WHERE Place IN ('Mylapore','Egmore','Triplicane');

--9)Show the course in descending order with price
SELECT Price FROM CourseInfo ORDER BY Price DESC;

--10)Find the students whose name starts with ‘Hari’
SELECT StudentName FROM StudentInfo WHERE StudentName LIKE 'Hari%';

--11)Display the students whose performance has not been evaluated yet
SELECT StudentInfo.StudentId,StudentInfo.StudentName FROM StudentInfo INNER JOIN Enrolled 
ON Enrolled.StudentId = StudentInfo.StudentId
WHERE Enrolled.Performance IS NULL;

--12)Show the course is 5000 to 10000 price range?
SELECT CourseName FROM CourseInfo WHERE Price BETWEEN 5000 AND 10000;

--13)Set Samuel’s marks to 82
UPDATE Enrolled
SET Marks = 82
FROM StudentInfo
JOIN Enrolled ON StudentInfo.StudentId = Enrolled.StudentId
WHERE StudentInfo.StudentName = 'Samuel';

SELECT * FROM Enrolled;


--14)Increase the price of all courses by a factor of 10%
UPDATE CourseInfo SET Price = (Price + Price * 0.1);

SELECT CourseName,Price FROM CourseInfo;

--15)Set back Samuel’s marks to NULL
UPDATE Enrolled
SET Marks = NULL
FROM StudentInfo
JOIN Enrolled ON StudentInfo.StudentId = Enrolled.StudentId
WHERE StudentInfo.StudentName = 'Samuel';

SELECT * FROM Enrolled;

--16)Delete course with less than 5000
DELETE FROM CourseInfo WHERE Price < 5000;

SELECT CourseName,Price FROM CourseInfo;

--17)Show the places from where there have been enrolments?
SELECT Place FROM StudentInfo GROUP BY Place;

--18)Find the no of days each student has been with the institute
SELECT StudentName,"No of days in a institute" =  DATEDIFF(DAY,DateOfJoining,GETDATE()) FROM StudentInfo;

--19)Find the price of the least expensive course
SELECT Min(Price) AS Leastprice FROM CourseInfo;

--20)What are the average marks of MCA students with their marks?
SELECT AVG(Marks) as "Average Mark" from Enrolled E
inner join StudentInfo S
on E.StudentID = S.StudentID
where S.Qualification = 'MCA'
group by S.Qualification


--21)When was the last time a student joined a course?
SELECT MAX(DateOfJoining) AS LastJoinedDate FROM StudentInfo;

--22)Find the number of BE and Anna nagar students that this institute has attracted
SELECT COUNT(StudentName) FROM StudentInfo WHERE Qualification = 'BE' AND Place = 'Anna nagar';

--23)Among the students how many have received their final marks?
SELECT StudentName FROM StudentInfo INNER JOIN Enrolled
ON Enrolled.StudentId = StudentInfo.StudentId
WHERE Enrolled.Marks is not null;

--24)How many places do the students come from?
SELECT Count(Place) AS TotalNoOfPlace FROM (SELECT Place FROM StudentInfo GROUP BY Place) AS Number;

--25)Display course, enrolments report
SELECT CourseName,COUNT(Enrolled.StudentId)As [No of students enrolled], Enrolled.CourseId
FROM [Enrolled]
INNER JOIN CourseInfo
ON Enrolled.CourseId = CourseInfo.CourseId
GROUP BY Enrolled.CourseId,CourseName

--26)Display Education, place and Average marks
SELECT Qualification,Place,AVG(Marks)As [Avg Marks] 
FROM StudentInfo
Inner join Enrolled
on StudentInfo.StudentId = Enrolled.StudentId
Group By Qualification,Place

--27)Show the course with more than 2 enrolments
SELECT C.CourseName,E.CourseId,COUNT(E.StudentId) AS MoreThan2Enrollment FROM Enrolled E
JOIN CourseInfo C ON E.CourseId = C.CourseId
GROUP BY E.CourseId,C.CourseName
HAVING COUNT(E.StudentId) = (SELECT MAX(ProdCount.Products)  FROM (SELECT E.CourseId, COUNT(E.StudentId) AS Products FROM Enrolled E
JOIN CourseInfo C ON E.CourseId = C.CourseId
GROUP BY E.CourseId,C.CourseName) AS ProdCount);

--28)Show the places where at least 2 students enrolled before 1 Aug 99
SELECT StudentName,Place FROM StudentInfo WHERE DateOfJoining < '1999-08-01';

--29)Who are the course mates of Samuel?
SELECT StudentName FROM StudentInfo INNER JOIN Enrolled 
ON StudentInfo.StudentId = Enrolled.StudentId
WHERE Enrolled.CourseId = 
(SELECT CourseInfo.CourseId FROM CourseInfo INNER JOIN Enrolled 
ON CourseInfo.CourseId = Enrolled.CourseId
WHERE Enrolled.StudentId = (SELECT StudentId FROM StudentInfo WHERE StudentName = 'Samuel'));

--30)List all C++ Students
SELECT StudentName,CourseId FROM StudentInfo INNER JOIN Enrolled
ON StudentInfo.StudentId = Enrolled.StudentId
WHERE Enrolled.CourseId = (SELECT CourseId FROM CourseInfo WHERE CourseName = 'C++')

--31)Give the names and marks of below avg student?
SELECT S.StudentName, EID.Marks FROM StudentInfo S
JOIN(
SELECT E.StudentID, Marks FROM Enrolled E
WHERE E.Marks < 40) AS EID ON EID.StudentID = S.StudentId;

--32)Show the students who ended up paying more than 5000 for the course
SELECT StudentName,MoneyPaid FROM StudentInfo INNER JOIN Enrolled
ON StudentInfo.StudentId = Enrolled.StudentId
WHERE Enrolled.MoneyPaid > 5000;

--33)Show the marks of students who joined after any anna nagar students


--34)Find the course cum place mates of Prabu
SELECT StudentName FROM StudentInfo INNER JOIN Enrolled 
ON StudentInfo.StudentId = Enrolled.StudentId
WHERE Enrolled.CourseId =
(SELECT CourseInfo.CourseId FROM CourseInfo INNER JOIN Enrolled 
ON CourseInfo.CourseId = Enrolled.CourseId
WHERE Enrolled.StudentId = (SELECT StudentId FROM StudentInfo WHERE StudentName = 'Prabu'))


--35)Find the students who have the same education as those who have taken the VB
SELECT StudentName,Qualification FROM StudentInfo INNER JOIN Enrolled
ON StudentInfo.StudentId = Enrolled.StudentId
WHERE StudentInfo.StudentName = (SELECT CourseName FROM CourseInfo WHERE CourseName = 'Visual Basic')