USE [Employee Payroll]
 --CREATING TABLES
CREATE TABLE EMPLOYEE(
EMP_ID INT IDENTITY(1001, 1) PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
DOB DATE,
GENDER VARCHAR(15),
EMP_ADDRESS VARCHAR(150),
CONTACT_NUMBER VARCHAR(15),
EMAIL VARCHAR(25),
HIREDATE DATE
);

ALTER TABLE EMPLOYEE
ADD DEPARTMENT_ID INT,
FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (DEPARTMENT_ID)

ALTER TABLE EMPLOYEE
ADD DESIGNATION_ID INT,
FOREIGN KEY (DESIGNATION_ID) REFERENCES DESIGNATION (DESIGNATION_ID)

SELECT * FROM EMPLOYEE

CREATE TABLE DEPARTMENT(
DEPARTMENT_ID INT IDENTITY(2001, 1) PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(35),
MANAGER_ID INT,
FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEE (EMP_ID)
);

CREATE TABLE DESIGNATION(
DESIGNATION_ID INT IDENTITY(3001, 1) PRIMARY KEY,
DESIGNATION_NAME VARCHAR(35),
);

CREATE TABLE SALARY(
SALARY_ID INT IDENTITY(4001, 1) PRIMARY KEY,
EMPLOYEE_ID INT,
PAYROLL_PERIOD_ID INT,
FOREIGN KEY (PAYROLL_PERIOD_ID) REFERENCES PAYROLL_PERIOD (PAYROLL_PERIOD_ID),
BASIC_SALARY DECIMAL(10,2),
ALLOWANCES DECIMAL(10,2),
DEDUCTIONS DECIMAL(10,2),
NETSALARY DECIMAL(10,2)
);

CREATE TABLE PAYROLL_PERIOD(
PAYROLL_PERIOD_ID INT IDENTITY(5001, 1) PRIMARY KEY,
STARTDATE DATE,
ENDDATE DATE
);

CREATE TABLE ATTENDANCE(
ATTENDANCE_ID INT IDENTITY(6001, 1) PRIMARY KEY,
EMPLOYEE_ID INT,
ATTENDANCE_DATE DATE,
CLOCK_IN TIME,
CLOCK_OUT TIME,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE (EMP_ID)
);

CREATE TABLE LEAVE(
LEAVE_ID INT IDENTITY(7001, 1) PRIMARY KEY,
EMPLOYEE_ID INT,
LEAVE_TYPE VARCHAR(20),
STARTDATE DATE,
ENDDATE DATE,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE (EMP_ID)
);

CREATE TABLE TRAINING(
TRAINING_ID INT IDENTITY(8001, 1) PRIMARY KEY,
TRAINING_NAME VARCHAR(50),
TRAINING_DESCRIPTION VARCHAR(500),
TRAINER VARCHAR(50),
STARTDATE DATE,
ENDDATE DATE,
EMPLOYEE_ID INT,
FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE (EMP_ID)
);

/***********************************************************************************************/

--INSERTING DATA
SELECT * FROM EMPLOYEE
INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, DOB, GENDER, EMP_ADDRESS, CONTACT_NUMBER, EMAIL, HIREDATE) 
VALUES
('SAI PAVAN', 'GANESH', '1999-01-11', 'MALE', 'HYDERABAD', '9876543210', 'saipavanganesh@email.com', '2021-09-07'),
('RAJ', 'KUMAR', '1998-06-06', 'MALE', 'NALGONDA', '7896514010', 'rajkumar@email.com', '2021-09-17'),
('SAI KIRAN', 'BOLLA', '1999-02-10', 'MALE', 'SURYAPET', '8754210369', 'saikiranbolla@email.com', '2021-06-11'),
('NATASHA', 'ROMANOFF', '1983-12-12', 'FEMALE', 'MOSCOW', '6321450789', 'natrom@email.com', '2019-01-20'),
('PRADEEP', 'BALUPATI', '1997-12-28', 'MALE', 'HYDERABAD', '7539518460', 'pradeepbalupati@email.com', '2020-03-20'),
('SRINIVAS', 'MEGAVATH', '1999-04-01', 'MALE', 'MIYAPUR', '7512489603', 'srinumegavath@email.com', '2020-03-20'),
('MIKASA', 'ACKERMAN', '1970-06-14', 'FEMALE', 'SHIGANSHINA', '7436128905', 'mikakerman@email.com', '2021-09-14'),
('BARRY', 'ALLEN', '1983-07-15', 'MALE', 'CENTRAL CITY', '7496850132', 'barryallen@email.com', '2015-07-15'),
('OLIVER', 'QUEEN', '1980-06-28', 'MALE', 'STARING CITY', '6576850132', 'iamoliverqueen@email.com', '2022-12-13'),
('MICHAEL', 'SCOTT', '1970-02-21', 'MALE', 'SCRANTON', '7415900132', 'mikescott@email.com', '2015-06-13'),
('JIM', 'HALPERT', '1976-11-19', 'MALE', 'MUMBAI', '6548520132', 'halpertjim@email.com', '2017-12-17'),
('CHRIS', 'NOLAN', '1989-08-27', 'MALE', 'HYDERABAD', '6753950132', 'chrisnolan@email.com', '2016-01-17'),
('HERMOINE', 'GRANGER', '2001-02-14', 'FEMALE', 'CHENNAI', '8754960123', 'hermoinegrange@email.com', '2022-08-13'),
('MASOODA', 'BEGUM', '1990-06-28', 'FEMALE', 'HYDERABAD', '7866850132', 'masoodabegum@email.com', '2020-04-13')


select * from DEPARTMENT

INSERT INTO DEPARTMENT (DEPARTMENT_NAME, MANAGER_ID)
VALUES
('FINANCE', 1012),
('HUMAN RESOURCES', 1010),
('SALES', 1011),
('MARKETING', 1001),
('PRODUCTION', 1008),
('ACCOUNTING', 1009)

select * from DESIGNATION

INSERT INTO DESIGNATION (DESIGNATION_NAME)
VALUES
('CEO'),
('SENIOR DIRECTOR'),
('MANAGING DIRECTOR'),
('MANAGER'),
('ASSISTANT MANAGER'),
('FRONTLINE EMPLOYEES')

SELECT * FROM PAYROLL_PERIOD
INSERT INTO PAYROLL_PERIOD (STARTDATE, ENDDATE)
VALUES
('2023-07-01','2023-07-31'),
('2023-07-01','2023-07-15'),
('2023-07-01','2023-09-30')

SELECT * FROM DEPARTMENT
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID IS NULL

UPDATE EMPLOYEE SET DEPARTMENT_ID = 2001 WHERE EMP_ID IN (1003,1012);
UPDATE EMPLOYEE SET DEPARTMENT_ID = 2002 WHERE EMP_ID IN (1005,1010);
UPDATE EMPLOYEE SET DEPARTMENT_ID = 2003 WHERE EMP_ID IN (1006,1011);
UPDATE EMPLOYEE SET DEPARTMENT_ID = 2004 WHERE EMP_ID IN (1007,1004);
UPDATE EMPLOYEE SET DEPARTMENT_ID = 2005 WHERE EMP_ID IN (1013,1008);
UPDATE EMPLOYEE SET DEPARTMENT_ID = 2006 WHERE EMP_ID IN (1014,1009);
UPDATE EMPLOYEE SET DEPARTMENT_ID = 2004 WHERE EMP_ID = 1001;
UPDATE EMPLOYEE SET DEPARTMENT_ID = 2005 WHERE EMP_ID = 1002;
UPDATE EMPLOYEE SET DEPARTMENT_ID = NULL WHERE EMP_ID IN (1014,1001);
UPDATE DEPARTMENT SET MANAGER_ID = 1004 WHERE DEPARTMENT_ID = 2001;

SELECT * FROM DESIGNATION
SELECT * FROM EMPLOYEE WHERE DESIGNATION_ID = 3006
UPDATE EMPLOYEE SET DESIGNATION_ID = 3003 WHERE EMP_ID = 1001;
UPDATE EMPLOYEE SET DESIGNATION_ID = 3002 WHERE EMP_ID = 1002;
UPDATE EMPLOYEE SET DESIGNATION_ID = 3006 WHERE DESIGNATION_ID IS NULL;
UPDATE EMPLOYEE SET DESIGNATION_ID = 3004 WHERE EMP_ID IN (1004, 1008, 1009, 1010, 1011, 1012)
 
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 2001
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 2002
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 2003
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 2004
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 2005
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 2006
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID IS NULL

SELECT * FROM PAYROLL_PERIOD
SELECT * FROM SALARY

CREATE TRIGGER TR_NETSAL_CALC ON SALARY
FOR INSERT 
AS
BEGIN
	UPDATE SALARY SET NETSALARY = BASIC_SALARY + ALLOWANCES - DEDUCTIONS
	WHERE SALARY_ID IN (SELECT SALARY_ID FROM INSERTED)
END

SELECT * FROM DESIGNATION
SELECT * FROM EMPLOYEE WHERE DESIGNATION_ID = 3004
SELECT * FROM SALARY
INSERT INTO SALARY(EMPLOYEE_ID, PAYROLL_PERIOD_ID, BASIC_SALARY, ALLOWANCES, DEDUCTIONS)
VALUES
(1004, 5013, 71674, 7514, 3483),
(1008, 5013, 72014, 7514, 3483),
(1009, 5013, 75100, 7514, 3483),
(1010, 5013, 70145, 7514, 3483),
(1011, 5013, 74520, 7514, 3483),
(1012, 5013, 75601, 7514, 3483)

SELECT * FROM ATTENDANCE
INSERT INTO ATTENDANCE (EMPLOYEE_ID, ATTENDANCE_DATE, CLOCK_IN, CLOCK_OUT)
VALUES
(1002, CAST(GETDATE() AS DATE), '08:30:00', '06:45:00'),
(1003, CAST(GETDATE() AS DATE), '08:45:00', '06:45:00'),
(1004, CAST(GETDATE() AS DATE), '09:00:00', '06:30:00'),
(1005, CAST(GETDATE() AS DATE), '08:30:00', '06:45:00'),
(1006, CAST(GETDATE() AS DATE), '08:45:00', '06:30:00'),
(1008, CAST(GETDATE() AS DATE), '08:30:00', '06:50:00'),
(1009, CAST(GETDATE() AS DATE), '08:45:00', '06:50:00'),
(1010, CAST(GETDATE() AS DATE), '08:30:00', '06:30:00'),
(1011, CAST(GETDATE() AS DATE), '09:00:00', '06:30:00'),
(1012, CAST(GETDATE() AS DATE), '08:45:00', '06:30:00'),
(1014, CAST(GETDATE() AS DATE), '08:50:00', '06:30:00')

INSERT INTO LEAVE (EMPLOYEE_ID, LEAVE_TYPE, STARTDATE, ENDDATE)
VALUES
(1001, 'VACATION', '2023-07-20', '2023-07-29'),
(1007, 'SICK LEAVE', CAST(GETDATE() AS DATE), CAST(GETDATE() AS DATE)),
(1013, 'FAMILY EMERGENCY', '2023-07-24', '2023-07-26')
 
SELECT * FROM TRAINING
INSERT INTO TRAINING(TRAINING_NAME, TRAINING_DESCRIPTION, TRAINER, STARTDATE, ENDDATE, EMPLOYEE_ID)
VALUES
('SQL SERVER TRAINING', 'This is the SQL training for CFP program', 'MABEL CHRISTINA', '2023-06-23', '2023-08-27', 1003),
('SQL SERVER TRAINING', 'This is the SQL training for CFP program', 'MABEL CHRISTINA', '2023-06-23', '2023-08-27', 1005),
('SQL SERVER TRAINING', 'This is the SQL training for CFP program', 'MABEL CHRISTINA', '2023-06-23', '2023-08-27', 1006),
('SQL SERVER TRAINING', 'This is the SQL training for CFP program', 'MABEL CHRISTINA', '2023-06-23', '2023-08-27', 1013)

SELECT * FROM EMPLOYEE
SELECT * FROM DEPARTMENT
SELECT * FROM DESIGNATION
SELECT * FROM SALARY
SELECT * FROM PAYROLL_PERIOD
SELECT * FROM ATTENDANCE
SELECT * FROM LEAVE
SELECT * FROM TRAINING

/***********************************************************************************************************************/
--BASIC QUERIES
--1.Query to display last 5 Records from table
SELECT * FROM (SELECT TOP 5 * FROM EMPLOYEE ORDER BY EMP_ID DESC)AS LAST5ROWS ORDER BY EMP_ID ASC

--2.Query to fetch last record from the table
SELECT TOP 1 * FROM EMPLOYEE ORDER BY EMP_ID DESC

--3.Query to fetch monthly Salary of Employee if annual salary is given
SELECT *, (NETSALARY * 12) AS annualSalary FROM SALARY 

--4.Display Even rows in Employee table
SELECT * FROM EMPLOYEE WHERE (EMP_ID % 2 = 0)

--5.Display last 50% records from Employee table
SELECT * FROM (SELECT TOP 50 PERCENT * FROM EMPLOYEE ORDER BY EMP_ID DESC)AS LAST50PERCENTROWS ORDER BY EMP_ID ASC

--6.get distinct records from the table without using distinct keyword
SELECT EMP_ADDRESS FROM EMPLOYEE GROUP BY EMP_ADDRESS

--7.add the email validation using only one query
SELECT * FROM EMPLOYEE WHERE EMAIL LIKE '%@%.%'

/***********************************************************************************************************************/
-- JOINS

--1.Retrieve employee information along with their department names and designations
SELECT  E.DEPARTMENT_ID,E.FIRST_NAME, E.LAST_NAME, DEP.DEPARTMENT_NAME, E.DESIGNATION_ID, DE.DESIGNATION_NAME
FROM EMPLOYEE E
INNER JOIN DEPARTMENT DEP
ON E.DEPARTMENT_ID = DEP.DEPARTMENT_ID
INNER JOIN DESIGNATION DE
ON E.DESIGNATION_ID = DE.DESIGNATION_ID

--2.Retrieve all employees and their corresponding salaries, if available
SELECT E.EMP_ID, E.FIRST_NAME, E.LAST_NAME,S.NETSALARY FROM EMPLOYEE E
LEFT JOIN SALARY S
ON E.EMP_ID = S.EMPLOYEE_ID

--3.Retrieve all salaries and the corresponding employee names, if available
SELECT S.NETSALARY,E.EMP_ID, E.FIRST_NAME, E.LAST_NAME FROM SALARY S
RIGHT JOIN EMPLOYEE E
ON S.EMPLOYEE_ID = E.EMP_ID

--4.Retrieve all employees and their salaries, including unmatched records from both table
SELECT E.EMP_ID, E.FIRST_NAME, E.LAST_NAME,S.NETSALARY FROM EMPLOYEE E
FULL OUTER JOIN SALARY S
ON E.EMP_ID = S.EMPLOYEE_ID

--5.Retrieve the names of employees and their respective managers
SELECT E.EMP_ID, E.FIRST_NAME,E.LAST_NAME,E.MANAGER_ID,EM.FIRST_NAME,EM.LAST_NAME FROM EMPLOYEE E
JOIN EMPLOYEE EM
ON E.MANAGER_ID = EM.EMP_ID 

ALTER TABLE EMPLOYEE
ADD MANAGER_ID INT
SELECT * FROM EMPLOYEE
SELECT * FROM DEPARTMENT
UPDATE EMPLOYEE SET MANAGER_ID = 1004 WHERE DEPARTMENT_ID = 2001;
UPDATE EMPLOYEE SET MANAGER_ID = 1010 WHERE DEPARTMENT_ID = 2002;
UPDATE EMPLOYEE SET MANAGER_ID = 1011 WHERE DEPARTMENT_ID = 2003;
UPDATE EMPLOYEE SET MANAGER_ID = 1001 WHERE DEPARTMENT_ID = 2004;
UPDATE EMPLOYEE SET MANAGER_ID = 1008 WHERE DEPARTMENT_ID = 2005;
UPDATE EMPLOYEE SET MANAGER_ID = 1008 WHERE DEPARTMENT_ID = 2006;

/***********************************************************************************************************************/
-- STORED PROCEDURES

--1.Assuming we want to create a stored procedure to calculate the total salary
 -- for a specific employee based on their EmployeeID and a provided PayrollPeriodID.(handle exceptions in SP)
 
CREATE OR ALTER PROCEDURE SP_CALC_TOTAL_SAL (@P_EID INT)
AS
	DECLARE @V_EID INT,
			@V_PAYID INT,
			@V_PAYPERIOD INT,
			@V_NETSAL INT,
			@V_SD DATE,
			@V_ED DATE
BEGIN
BEGIN TRY
	SELECT @V_PAYID = PAYROLL_PERIOD_ID,@V_NETSAL = NETSALARY FROM SALARY WHERE EMPLOYEE_ID = @P_EID;
	IF(@V_PAYID IS NULL)
		RAISERROR ('THIS EMPLOYEE DOESNOT EXIST', 16, 1)
	SELECT @V_SD = STARTDATE, @V_ED = ENDDATE FROM PAYROLL_PERIOD WHERE PAYROLL_PERIOD_ID = @V_PAYID;
	PRINT (DATEDIFF(DAY, @V_SD, @V_ED)/30) * @V_NETSAL;
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH
END

EXEC SP_CALC_TOTAL_SAL 10000

--2.Write a Stored Procedure to validate username and password raise error if the data already present.
CREATE OR ALTER PROCEDURE SP_CHECKING_CREDENTIALS(@P_USN VARCHAR(100), @P_PWD VARCHAR(100))
AS
	DECLARE @V_EMAIL VARCHAR(500), @PH VARCHAR(500)
BEGIN
	BEGIN TRY
		SELECT @PH = CONTACT_NUMBER FROM EMPLOYEE WHERE EMAIL = @P_USN;
		IF(@PH = @P_PWD)
			RAISERROR ('EXCEPTION : THIS IS ALREADY PRESENT',16,1);
		ELSE
			PRINT 'NEW';
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE();
	END CATCH
END

EXEC SP_CHECKING_CREDENTIALS 'saipavanganesh@email.com', '9876543210'
select * from employee


--3.create a stored procedure that will take the Employee ID of a person and checks if it is in the table. 
CREATE TABLE TEST(
EID INT PRIMARY KEY,
FNAME VARCHAR(100),
LNAME VARCHAR(100)
)
INSERT INTO TEST (EID, FNAME, LNAME)
		VALUES(1, 'SAI PAVAN', 'GANESH')
SELECT EID FROM TEST WHERE EID = 14
-------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE SP_CHECK_ID (@P_EID INT)
AS
	DECLARE @V_EMP INT
BEGIN
BEGIN TRY
	SELECT @V_EMP = EID FROM TEST WHERE EID = @P_EID;
	IF(@V_EMP IS NULL)
	BEGIN
		INSERT INTO TEST (EID, FNAME, LNAME)
		VALUES(@P_EID, 'NEW FIRST NAME', 'NEW LAST NAME');
		PRINT 'SUCCESFULLY INSERTED';
	END
	ELSE
	BEGIN
		UPDATE TEST SET FNAME = 'NEW FIRST NAME', LNAME = 'NEW LAST NAME' 
		WHERE EID = @P_EID;
		PRINT 'SUCCESFULLY UPDATED';
	END
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH
END
-------------------------------------------------------------------------------------------------
EXEC SP_CHECK_ID 3
SELECT * FROM TEST

/***********************************************************************************************************************/
 --VIEWS
 SELECT * FROM EMPLOYEE
 SELECT * FROM DEPARTMENT

 --1.Query using the EmployeeDetails view to get employee details along with department and manager information

 CREATE VIEW EMP_MANAGER_INFO AS
 SELECT E.EMP_ID, E.FIRST_NAME,E.LAST_NAME,E.MANAGER_ID,EM.FIRST_NAME AS MANAGERFIRSTNAME,EM.LAST_NAME AS MANAGERLASTNAME,D.DEPARTMENT_ID,D.DEPARTMENT_NAME 
 FROM EMPLOYEE E
 JOIN EMPLOYEE EM ON E.MANAGER_ID= EM.EMP_ID
 LEFT JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 SELECT * FROM EMP_MANAGER_INFO
 ------------------------------------------------------------------------------------

 SELECT * FROM LEAVE
 INSERT INTO LEAVE (EMPLOYEE_ID, LEAVE_TYPE, STARTDATE, ENDDATE)
VALUES
(1001, 'VACATION', '2023-03-20', '2023-03-29'),
(1004, 'PERSONAL', '2022-11-20', '2022-11-20'),
(1009, 'MARRIAGE', '2023-06-24', '2023-06-26'),
(1012, 'FAMILY EMERGENCY', '2021-07-20', '2021-07-29'),
(1006, 'MEDICAL APPOINTMENT', '2023-07-20', '2023-07-20'),
(1007, 'HOME EMERGENCY', '2022-01-12', '2022-01-14')

--2.Query using a view to get employees who have taken leaves within a specific date range
CREATE VIEW LEAVERANGE AS
SELECT L.EMPLOYEE_ID,L.LEAVE_TYPE,L.STARTDATE,E.FIRST_NAME, E.LAST_NAME 
FROM LEAVE L
JOIN EMPLOYEE E ON L.EMPLOYEE_ID = E.EMP_ID
WHERE L.STARTDATE >= '2022-12-01' AND L.ENDDATE <= '2023-06-30'
SELECT * FROM LEAVERANGE

--3.Query using a view to get employees with their respective department and designation names
CREATE VIEW SHOW_DEPDES AS
SELECT E.EMP_ID, E.FIRST_NAME, E.LAST_NAME, DE.DEPARTMENT_NAME, D.DESIGNATION_NAME FROM EMPLOYEE E
JOIN DEPARTMENT DE ON E.DEPARTMENT_ID = DE.DEPARTMENT_ID
JOIN DESIGNATION D ON E.DESIGNATION_ID = D.DESIGNATION_ID

SELECT * FROM SHOW_DEPDES

--4.Query using a view to get employees who are managers along with their department names
CREATE VIEW MANAGER_DETAILS AS
SELECT E.EMP_ID, E.FIRST_NAME, E.LAST_NAME, DE.DEPARTMENT_NAME, D.DESIGNATION_NAME FROM EMPLOYEE E
JOIN DEPARTMENT DE ON E.DEPARTMENT_ID = DE.DEPARTMENT_ID
JOIN DESIGNATION D ON E.DESIGNATION_ID = D.DESIGNATION_ID
WHERE DESIGNATION_NAME = 'MANAGER'

/***********************************************************************************************************************/
-- FUNCTIONS

--1.Query using the CalculateAge function to retrieve the age of employees

CREATE OR ALTER FUNCTION CALC_AGE(@P_EID INT)
RETURNS INT
AS
BEGIN
	DECLARE @V_DOB DATE,
			@V_AGE INT;
	
	SELECT @V_DOB = DOB FROM EMPLOYEE WHERE EMP_ID = @P_EID;
	RETURN DATEDIFF(YEAR, @V_DOB,  CAST(GETDATE() AS DATE));

END
SELECT DBO.CALC_AGE(1001)
SELECT * FROM EMPLOYEE

--------------------------------------------------------------------------------
--2.Query using a custom function to calculate the total salary for an employee
CREATE OR ALTER FUNCTION CALC_SAL(@P_EID INT)
RETURNS INT
AS
BEGIN
DECLARE @V_BS INT,
		@V_AL INT,
		@V_DED INT;
	
	SELECT @V_BS = BASIC_SALARY, @V_AL = ALLOWANCES, @V_DED = DEDUCTIONS
	FROM SALARY WHERE EMPLOYEE_ID = @P_EID;
	RETURN @V_BS + @V_AL - @V_DED
END
SELECT DBO.CALC_SAL(1001)

--------------------------------------------------------------------------------
--3.Query using a function to get the number of employees in a specific department
CREATE OR ALTER FUNCTION GET_EMP(@P_DEP_NAME VARCHAR(50))
RETURNS TABLE
AS
RETURN (
	SELECT E.EMP_ID, E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME FROM EMPLOYEE E 
	INNER JOIN DEPARTMENT D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
	WHERE D.DEPARTMENT_NAME = @P_DEP_NAME
	)

SELECT * FROM GET_EMP('MARKETING')
----------------------------------------------------------------------------------------

--4.Query using a function to get the number of leaves taken by an employee
CREATE OR ALTER FUNCTION CALC_LEAVES(@P_EID INT)
RETURNS INT
AS
BEGIN
	DECLARE @V_SDATE DATE,
			@V_EDATE DATE,
			@V_TOTLEAVES INT
	SELECT @V_SDATE = STARTDATE, @V_EDATE = ENDDATE FROM LEAVE
	WHERE EMPLOYEE_ID = @P_EID;
	RETURN  DATEDIFF(DAY, @V_SDATE, @V_EDATE)	 
END
SELECT * FROM LEAVE
SELECT DBO.CALC_LEAVES(1001)

/***********************************************************************************************************************/

--INDEXES
--1.Query using the IX_Employee_EmployeeID index to retrieve an employee by their ID

CREATE INDEX IX_Employee_EmployeeID ON EMPLOYEE (EMP_ID)
SELECT * FROM EMPLOYEE WHERE EMP_ID = 1011
 
--------------------------------------------------------------------------------------------------

--2)Query using an index on the StartDate column to improve performance in searching for leaves within a specific date range

CREATE INDEX IX_specificDaterange ON LEAVE (STARTDATE)
SELECT * FROM LEAVE WHERE STARTDATE BETWEEN '2023-06-01' AND '2023-06-30'

--------------------------------------------------------------------------------------------------
--3)Query using an index on the DepartmentID column to optimize filtering employees by their department

CREATE INDEX IX_DEPID ON EMPLOYEE (DEPARTMENT_ID)
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 2003;

--------------------------------------------------------------------------------------------------
--4)Query using an index on the NetSalary column to speed up searching for employees with specific salary ranges

CREATE INDEX IX_SALRANGE ON SALARY(NETSALARY)
SELECT * FROM SALARY WHERE NETSALARY BETWEEN 70000 AND 100000

--------------------------------------------------------------------------------------------------
--5)Query using an index on the DesignationName column to quickly search for employees with a specific job designation

CREATE INDEX IX_DESNAME ON DESIGNATION (DESIGNATION_NAME)
SELECT E.FIRST_NAME, E.LAST_NAME, D.DESIGNATION_NAME  FROM EMPLOYEE E 
JOIN DESIGNATION D ON E.DESIGNATION_ID = D.DESIGNATION_ID
WHERE DESIGNATION_NAME = 'FRONTLINE EMPLOYEES'