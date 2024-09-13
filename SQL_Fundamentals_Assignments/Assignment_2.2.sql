/*
2.2. Write the sql queries for the following requirements  by using Group By concept:

	Hint :   -->   Create a table Called "Student"  table with the following columns:
							StudentId,  StudentName,  CourseName,  City Name, ContactNumber
					-->   Insert some 10 rows in the above table. 
	a.   Find out how many Students are joined for "Angular"  Course
	b.   Find out how many Students are joined from  "Hyderabad"  City
	c.    Display No. of Students are join from each  City based 
	
			Sample Output:
						Hyderabad    10
						Mumbai   20
						Pune   5
						.....
	
	d.    Display No. of Students are join from each  Course  based 
			Sample Outupt:
					Angular    10
					React       20
					.NET        30
					....... 
					
	e.     Display the counts  by grouping based on  city, course 
	
*/

CREATE TABLE Students (

	StudentId INT,  
	StudentName varchar(25),  
	CourseName varchar(30),  
	CityName varchar(25), 
	ContactNumber varchar(14)
	);

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(1, 'Alice', 'Angular', 'Hyderabad', '1234567890');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(2, 'Bob', 'Physics', 'Los Angeles', '0987654321');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(3, 'Charlie', 'Angular', 'Hyderabad', '5555555555');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(4, 'David', 'Biology', 'Houston', '4444444444');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(5, 'Eve', 'Computer Science', 'Hyderabad', '3333333333');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(6, 'Frank', 'Angular', 'Philadelphia', '2222222222');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(7, 'Grace', 'History', 'San Antonio', '1111111111');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(8, 'Hank', 'Angular', 'San Diego', '6666666666');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(9, 'Ivy', 'Angular', 'Hyderabad', '7777777777');

INSERT INTO Students (StudentId, StudentName, CourseName, CityName, ContactNumber) VALUES
(10, 'Jack', 'Angular', 'San Jose', '8888888888');
 
-- a.   Find out how many Students are joined for "Angular"  Course
SELECT CourseName, COUNT(*) AS NumberOfStudents
FROM Students
WHERE CourseName = 'Angular'
GROUP BY CourseName;

-- b.   Find out how many Students are joined from  "Hyderabad"  City
SELECT CityName, COUNT(*) AS NumberOfStudents
FROM Students
WHERE CityName = 'Hyderabad'
GROUP BY CityName;

-- c.    Display No. of Students are join from each  City based 
SELECT CityName, COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY CityName;

