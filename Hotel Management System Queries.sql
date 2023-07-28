use [Hotel Management System]

use [Hotel Management System]
CREATE TABLE Hotels (
Hotel_Id INT PRIMARY KEY,
Hotel_Name VARCHAR(100),
Hotel_Location VARCHAR(100),
Contact_Info VARCHAR(100)
);
CREATE TABLE Rooms (
Room_Id INT PRIMARY KEY,
Hotel_Id INT,
Room_Number VARCHAR(20),
Room_Type VARCHAR(50),
Capacity INT,
Price_Per_Day DECIMAL(10,2),
FOREIGN KEY (Hotel_Id) REFERENCES Hotels (Hotel_Id)
);

CREATE TABLE Guests(
Guest_Id INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Phone VARCHAR(20),
Email VARCHAR(50),
Guest_Address VARCHAR(100),
);
CREATE TABLE Reservations (
Reservation_Id INT PRIMARY KEY,
Guest_Id INT,
Room_Id INT,
Check_In_Date DATE,
Check_Out_Date DATE,
Total_Cost DECIMAL(10,2),
FOREIGN KEY (Guest_Id) REFERENCES Guests (Guest_Id),
FOREIGN KEY (Room_Id) REFERENCES Rooms (Room_Id)
);
CREATE TABLE Payments(
Payment_Id INT IDENTITY(30001,1) PRIMARY KEY,
Reservation_Id INT,
Payment_Amount DECIMAL(10,2),
Payment_Date DATE,
Payment_Method VARCHAR(50),
FOREIGN KEY (Reservation_Id) REFERENCES Reservations (Reservation_Id)
);
ALTER TABLE Rooms
ADD IsAvailable BIT DEFAULT 1;


select * from Hotels;
BEGIN TRANSACTION;
INSERT INTO dbo.Hotels (Hotel_Id, Hotel_Name, Hotel_Location, Contact_Info)
VALUES 
(3, 'Sapphire Bay Hotel', 'Bangalore', '9638527410'),
(4, 'Wolf''s Gate Hotel', 'Chennai', '7418529630');

SELECT * FROM Rooms;
--Inserting data into Rooms Table
INSERT INTO dbo.Rooms (Room_Id, Hotel_Id, Room_Number, Room_Type, Capacity, Price_Per_Day, IsAvailable)
--Grand Oasis Hotel
VALUES 
(1001, 1, '101', 'Standard', 2, 100.00, 1),
(1002, 1, '102', 'Deluxe', 3, 200.00, 1),
(1003, 1, '103', 'Suite', 4, 300.00, 0),

--The Grand Retreat
(2001, 2, '201', 'Standard', 2, 120.00, 1),
(2002, 2, '202', 'Family', 3, 220.00, 0),
(2003, 2, '203', 'Suite', 4, 500.00, 0),

--Sapphire Bay Hotel
(3001, 3, '301', 'Standard', 4, 220.00, 0),
(3002, 3, '302', 'Family', 4, 450.00, 0),
(3003, 3, '303', 'Deluxe', 4, 800.00, 1),
(3004, 3, '304', 'Suite', 4, 1000.00, 1),

--Wolf's Gate Hotel
(4001, 4, '402', 'Deluxe', 4, 800.00, 0),
(4002, 4, '403', 'Deluxe', 4, 800.00, 0),
(4003, 4, '404', 'Suite', 4, 1000.00, 1),
(4004, 4, '405', 'Suite', 4, 1000.00, 0);

UPDATE Rooms
SET Room_Number = '401' WHERE Room_Id = 4001;
UPDATE Rooms
SET Room_Number = '402' WHERE Room_Id = 4002;
UPDATE Rooms
SET Room_Number = '403' WHERE Room_Id = 4003;
UPDATE Rooms
SET Room_Number = '404' WHERE Room_Id = 4004;

--INSERTING DATA INTO GUESTS TABLE
SELECT * FROM Guests;
INSERT INTO Guests (Guest_Id, First_Name, Last_Name, Phone, Email, Guest_Address)
VALUES
(10001, 'Sai Pavan', 'Ganesh', '7654321097', 'saipavanganesh@email.com', 'Hyderabad'),
(10002, 'Raj', 'Kumar', '6543210986', 'rajkumar@email.com', 'Nalgonda'),
(10003, 'Sai Kiran', 'Bolla', '8765432108', 'saikiranbolla@email.com', 'Suryapet'),
(10004, 'Aarav', 'Sharma', '5432109875', 'aaravsharma_2@email.com', 'Hyderabad'),
(10005, 'Kunal', 'Singh', '0987654321', 'kunalsingh001@email.com', 'Chennai'),
(10006, 'Chris', 'Hemsworth', '9018765432', 'hemsworth.chris@email.com', 'California'),
(10007, 'Peter', 'Parker', '2109876543', 'pparker@email.com', 'New York'),
(10008, 'Nisha', 'Singh', '3210987654', 'nishasingh55@email.com', 'Bhuvaneswar'),
(10009, 'Oliver', 'Queen', '4321098765', 'iamoliverqueen@email.com', 'Starling City'),
(10010, 'Sneha', 'Gupta', '5432109876', 'snehagupta@email.com', 'Hyderabad'),
(10011, 'Barry', 'Allen', '6543210987', 'baryyallen@email.com', 'Central City'),
(10012, 'Arjun', 'Reddy', '7654321098', 'arjunreddy123@email.com', 'Madhapur'),
(10013, 'Tony', 'Stark', '9875543211', 'tonystark3000@email.com', 'New York'),
(10014, 'Vikram', 'Rathod', '9018765000', 'saipavanganesh@email.com', 'Hyderabad'),
(10015, 'Eren', 'Jaeger', '8765442108', 'saipavanganesh@email.com', 'Hyderabad');

SELECT * FROM Reservations;
INSERT INTO Reservations (Reservation_Id, Guest_Id, Room_Id, Check_In_Date, Check_Out_Date)
VALUES
(61056,10001, 4003, '2023-05-17', '2023-05-19'),
(61057,10001, 1001, '2023-11-12', '2023-11-19'),
(61058,10009, 3003, '2021-08-20', '2021-08-29'),
(61059,10011, 3004, '2022-11-04', '2022-11-10');


SELECT * FROM Guests WHERE Email = 'saipavanganesh@email.com' --Updating emails from Guests table
UPDATE Guests
SET Email = 'vikramrathod@email.com' WHERE Guest_Id = 10014;
UPDATE Guests 
SET Email = 'erenjaeger@gmail.com' WHERE Guest_Id = 10015;
SELECT * FROM Guests;

SELECT * FROM Rooms
WHERE IsAvailable = 1;

UPDATE Rooms --Updated availability based on the reservations
SET IsAvailable = 0 WHERE Room_Id IN (1001,3003,3004,4003);

ALTER TABLE Payments
ADD Payment_Status VARCHAR(10) DEFAULT 'No';

SELECT * FROM Payments;

ALTER TABLE Payments
DROP COLUMN Payment_Status;

INSERT INTO Payments (Payment_Id, Payment_Status)
VALUES (1,'Yes');

UPDATE Payments
SET Payment_Status = 'NotpAID' WHERE Payment_Id = 1;

ALTER TABLE Payments
ADD Test_Col VARCHAR(10)

UPDATE Payments
SET Test_Col = 'NotpAID' WHERE Payment_Id = 1;

ALTER TABLE Payments
DROP COLUMN Test_Col;

SELECT * FROM Rooms;
SELECT * FROM Reservations;

UPDATE Reservations --Updated the totalcost of Reservations table using calculations
SET Total_Cost = DATEDIFF(DAY, '2023-05-17', '2023-05-19') * (SELECT Price_Per_Day FROM Rooms WHERE Room_Id = 4003) WHERE Room_Id = 4003;
UPDATE Reservations
SET Total_Cost = DATEDIFF(DAY, '2023-11-12', '2023-11-19') * (SELECT Price_Per_Day FROM Rooms WHERE Room_Id = 1001) WHERE Room_Id = 1001;
UPDATE Reservations
SET Total_Cost = DATEDIFF(DAY, '2021-08-20', '2021-08-29') * (SELECT Price_Per_Day FROM Rooms WHERE Room_Id = 3003) WHERE Room_Id = 3003;
UPDATE Reservations
SET Total_Cost = DATEDIFF(DAY, '2022-11-04', '2022-11-10') * (SELECT Price_Per_Day FROM Rooms WHERE Room_Id = 3004) WHERE Room_Id = 3004;

SELECT * FROM Payments;
TRUNCATE TABLE Payments;
INSERT INTO Payments (Payment_Id, Reservation_Id, Payment_Amount, Payment_Date, Payment_Method)
VALUES
    (34031, 61056, 2000.00, '2023-05-19', 'Credit Card'),
    (34032, 61057, 700.00, '2023-11-19', 'Debit Card'),
    (34033, 61058, 7200.00, '2021-08-29', 'UPI'),
    (34034, 61059, 6000.00, '2022-11-10', 'Cash');
COMMIT;

--LEFT JOIN
select G.Guest_Id, G.First_Name, G.Last_Name, R.Reservation_Id, R.Room_Id 
from Guests as G
left join Reservations as R
on G.Guest_Id = R.Guest_Id;

--RIGHT JOIN
select G.Guest_Id, G.First_Name, G.Last_Name, R.Reservation_Id, R.Room_Id 
from Guests as G
right join Reservations as R
on G.Guest_Id = R.Guest_Id;

--INNER JOIN
select G.Guest_Id, G.First_Name, G.Last_Name, R.Reservation_Id, R.Room_Id 
from Reservations as R
inner join Guests as G
on G.Guest_Id = R.Guest_Id;

--FULL OUTER JOIN
create view fOutJoinGuests
as
select G.Guest_Id, G.First_Name, G.Last_Name, R.Reservation_Id, R.Room_Id 
from Guests as G
full outer join Reservations as R
on G.Guest_Id = R.Guest_Id;
select * from fOutJoinGuests;


--FINDING THE ROOM WITH PRICE HIGHER THAN THE AVG. PRICE OF ALL ROOMS [SCALAR SUBQUERY]
SELECT AVG(Price_Per_Day) FROM Rooms;
SELECT * FROM Rooms 
WHERE Price_Per_Day > (SELECT AVG(Price_Per_Day) FROM Rooms);

SELECT Hotel_Id, max(Price_Per_Day)
FROM Rooms 
GROUP BY Hotel_Id;
/***********************************************************************************************/

--STORED PROCEDURE WITHOUT PARAMETER

SELECT * FROM Rooms WHERE IsAvailable = 1
SELECT * FROM Reservations;
CREATE OR ALTER PROCEDURE BOOK_ROOM
AS
	DECLARE @roomId INT,
			@roomPrice INT;
BEGIN
	SELECT @roomId = Room_Id, @roomPrice = Price_Per_Day
	FROM Rooms WHERE Room_Number = 105;

	INSERT INTO Reservations (Reservation_Id, Guest_Id, Room_Id, Check_In_Date, Check_Out_Date, Total_Cost)
	VALUES(61064, 10014, @roomId, '2023-06-17' ,'2023-06-19', (@roomPrice * 2));

	INSERT INTO Payments (Payment_Id, Reservation_Id, Payment_Amount, Payment_Date, Payment_Method)
	VALUES(34036, 61064, (@roomPrice * 2), NULL, NULL);
	
	UPDATE Rooms SET IsAvailable = 0 WHERE Room_Id = @roomId;

	PRINT('CONGRATULATIONS... ROOM BOOKED');
END

EXEC BOOK_ROOM;

/***********************************************************************************************/

INSERT INTO dbo.Rooms (Room_Id, Hotel_Id, Room_Number, Room_Type, Capacity, Price_Per_Day, IsAvailable)
--Grand Oasis Hotel
VALUES 
(1004, 1, '104', 'Standard', 2, 100.00, 1),
(1005, 1, '105', 'Deluxe', 3, 200.00, 1),
(1006, 1, '106', 'Suite', 4, 300.00, 1),

--The Grand Retreat
(2004, 2, '204', 'Standard', 2, 120.00, 1),
(2005, 2, '205', 'Family', 3, 220.00, 1),
(2006, 2, '206', 'Suite', 4, 500.00, 1),

--Sapphire Bay Hotel
(3005, 3, '305', 'Standard', 4, 220.00, 1),
(3006, 3, '306', 'Family', 4, 450.00, 1),
(3007, 3, '307', 'Deluxe', 4, 800.00, 1),
(3008, 3, '308', 'Suite', 4, 1000.00, 1),

--Wolf's Gate Hotel
(4005, 4, '405', 'Deluxe', 4, 800.00, 1),
(4006, 4, '406', 'Deluxe', 4, 800.00, 1),
(4007, 4, '407', 'Suite', 4, 1000.00, 1),
(4008, 4, '408', 'Suite', 4, 1000.00, 1);

/***************************************************************************************************/


--STORED PROCEDURE WITH PARAMETERS

SELECT * FROM Rooms WHERE IsAvailable = 1
SELECT * FROM Reservations;

CREATE OR ALTER PROCEDURE PAY_BILL(@p_Reservation_Id INT, @p_Payment_Method VARCHAR(50))
AS
BEGIN
	UPDATE Payments SET Payment_Method = @p_Payment_Method, Payment_Date = CAST(GETDATE() AS DATE)
	WHERE Reservation_Id = @p_Reservation_Id;
	PRINT('PAYMENT DONE');
END
select * from payments
INSERT INTO Reservations (Reservation_Id, Guest_Id, Room_Id, Check_In_Date, Check_Out_Date, Total_Cost)
	VALUES(61064, 10014, 1003, '2023-07-17' ,'2023-07-19', 1200);
INSERT INTO Payments (Payment_Id, Reservation_Id, Payment_Amount, Payment_Date, Payment_Method)
	VALUES(34037, 61064, 1200, NULL, NULL);

BEGIN TRY --EXCEPTION HANDLING
	EXEC PAY_BILL 'a', 'Credit Card';
END TRY
BEGIN CATCH
	PRINT 'PASS THE CORRECT PARAMETERS';
END CATCH

BEGIN TRY --EXCEPTION HANDLING
	INSERT INTO Payments(Payment_Id, Reservation_Id, Payment_Amount, Payment_Date, Payment_Method)
	VALUES (34036, 61062, 1000, NULL, NULL);
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH

select * from hotels
select * from rooms
select * from guests
select * from Reservations
SELECT *  FROM PAYMENTS
 

EXEC PAY_BILL 61061, 'UPI';

CREATE INDEX idx_room_id ON Rooms (room_id);
select * from rooms where Room_Id = 4005
delete from Payments where Payment_Method = '4'

/***************************************************************************************************/
--TRIGGERS
CREATE TABLE Reservations_Audit 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Audit_Data VARCHAR(500)
);


SELECT * FROM Reservations_Audit

CREATE TRIGGER tr_reservations_insert   --FOR INSERT
ON Reservations FOR INSERT
AS
BEGIN
	DECLARE @guest_id INT,
			@res_id INT

	SELECT @res_id = Reservation_Id, @guest_id = Guest_Id FROM inserted
	INSERT INTO Reservations_Audit 
	VALUES ('New Room with Reservation Id ' + CAST(@res_id as VARCHAR(6)) + ' and Guest Id ' + 
	CAST(@guest_id as VARCHAR(6)) + ' added on ' + CAST(GETDATE() AS VARCHAR(20)))
END

INSERT INTO Reservations
VALUES(61062, 10013, 1002, '2022-06-17', '2022-06-19', 400);


ALTER TRIGGER tr_reservations_delete --FOR DELETE
ON Reservations FOR DELETE
AS
BEGIN
	DECLARE @guest_id INT,
			@res_id INT

	SELECT @res_id = Reservation_Id, @guest_id = Guest_Id FROM	deleted
	INSERT INTO Reservations_Audit 
	VALUES ('New Room with Reservation Id ' + CAST(@res_id as VARCHAR(6)) + ' and Guest Id ' + 
	CAST(@guest_id as VARCHAR(6)) + ' deleted on ' + CAST(GETDATE() AS VARCHAR(20)))
END

INSERT INTO Reservations
VALUES(61062, 10013, 1002, '2022-06-17', '2022-06-19', 400);

DELETE FROM Reservations WHERE Reservation_Id = 61062;

select * from Reservations;
SELECT * FROM Reservations_Audit;


CREATE TRIGGER tr_reservations_update   --FOR UPDATE
ON Reservations FOR UPDATE
AS
BEGIN
	INSERT INTO Reservations_Audit 
	VALUES ('Reservation table got updated');
END

UPDATE Reservations SET Total_Cost = 450
WHERE Reservation_Id  = 10015;

/***************************************************************************************************/

--VIEWS

CREATE VIEW vw_HotelsToRooms
AS
SELECT H.Hotel_Id, H.Hotel_Name,R.Room_Number, R.Room_Type, R.Price_Per_Day, R.IsAvailable FROM Hotels H
LEFT JOIN Rooms R 
ON H.Hotel_Id = R.Hotel_Id

 sp_helptext vw_HotelsToRooms -- Gives the code of the view

 SELECT * FROM vw_HotelsToRooms WHERE IsAvailable = 1;

 UPDATE vw_HotelsToRooms --Updating the base table from views (Also can be deleted and inserted)
 SET Price_Per_Day = 200 WHERE Room_Number = 305

 SELECT * FROM ROOMS

 /***********************************************************************************************/
 --CURSORS

 DECLARE @v_roomType VARCHAR(50), 
		 @v_hotelName VARCHAR(50), 
		 @v_price INT

 DECLARE budgetRoomCursor CURSOR FOR

 SELECT Hotel_Name, Room_type, Price_Per_Day FROM vw_HotelsToRooms WHERE Price_Per_Day < 600

 OPEN budgetRoomCursor
 FETCH NEXT FROM budgetRoomCursor INTO @v_hotelName, @v_roomType, @v_price
 WHILE(@@FETCH_STATUS = 0)
	BEGIN
		PRINT 'HOTEL_NAME : ' + @v_hotelName + ', ROOM_TYPE : ' + @v_roomType + ', PRICE : ' + CAST(@v_price AS VARCHAR(50))
		FETCH NEXT FROM budgetRoomCursor INTO @v_hotelName, @v_roomType, @v_price
	END
 CLOSE budgetRoomCursor
 DEALLOCATE budgetRoomCursor

 /***********************************************************************************************/
ALTER TRIGGER trg_Hotels
ON Hotels
INSTEAD OF INSERT 
AS
BEGIN
	DECLARE @hotelId INT,
			@hotelName VARCHAR(50),
			@loc VARCHAR(50),
			@contact VARCHAR(50)
			select * from INSERTED

           IF(@hotelName = 'The Grand Retreat') 
		   BEGIN
              INSERT INTO Hotels (Hotel_Id, Hotel_Name, Hotel_Location, Contact_Info)
			  SELECT Hotel_Id, 'Changed_The Grand Retreat' , Hotel_Location,Contact_Info FROM INSERTED        
           END
END
insert into Hotels
values (7, 'The Grand Retreat', 'CHE', '7894461231')
select * from hotels


CREATE TABLE Rating(
 Rating_Id INT IDENTITY(1,1) PRIMARY KEY,
 Rating_Value INT,
 Comment VARCHAR(500)
);
CREATE OR ALTER PROCEDURE SP_InsertRating(@p_rating_Value INT, @p_comment VARCHAR(500))
AS
BEGIN
	INSERT INTO Rating(Rating_Value, Comment)
	VALUES(@p_rating_Value, @p_comment);
END;

INSERT INTO Rating(Rating_Value, Comment)
	VALUES(1, 'TestComment');

CREATE OR ALTER PROCEDURE SP_UpdateRating(@p_rating_Id INT, @p_rating_Value INT, @p_comment VARCHAR(500))
AS
BEGIN
	UPDATE Rating SET Rating_Value = @p_rating_Value,
	Comment = @p_comment WHERE Rating_Id = @p_rating_Id;
END
select * from rating

delete from hotels where Hotel_Id = 5
select * from hotels
select * from rooms
select * from guests
select * from reservations
select * from Payments
select * from rating

CREATE OR ALTER TRIGGER tr_roomBooking_insert  ON RESERVATIONS FOR INSERT
AS
BEGIN
	DECLARE @v_resId INT, @v_cost INT
	SELECT @v_resId = Reservation_Id, @v_cost = Total_Cost from INSERTED
	INSERT INTO Payments(Reservation_Id, Payment_Amount)
	VALUES(@v_resId, @v_cost)
END
INSERT INTO Reservations VALUES(61066, 10014, 1002, '2023-07-24',  '2023-07-26', 400);

CREATE OR ALTER VIEW budgetRooms AS
SELECT Reservation_Id, Guest_Id, Room_Id, Total_Cost FROM Reservations WHERE Total_Cost < 1000;

select * from budgetRooms

DECLARE @v_rId INT, @v_gId INT, @v_roomId INT, @v_cost INT
DECLARE lessThan1k CURSOR FOR SELECT Reservation_Id, Guest_Id, Room_Id, Total_Cost FROM Reservations WHERE Total_Cost < 1000;
OPEN lessThan1k
FETCH NEXT FROM lessThan1k INTO @v_rId, @v_gId, @v_roomId, @v_cost
WHILE(@@FETCH_STATUS = 0)
BEGIN
	PRINT CAST(@v_roomId  AS VARCHAR(50))+ ' has been reserved for Guest number ' + CAST(@v_gId  AS VARCHAR(50))+ '. With Resrvation Id ' + CAST(@v_rId  AS VARCHAR(50))+ '.
	Cost of the room is ' + CAST(@v_cost AS VARCHAR(50))
	FETCH NEXT FROM lessThan1k INTO @v_rId, @v_gId, @v_roomId, @v_cost
END
CLOSE lessThan1k
DEALLOCATE lessThan1k
