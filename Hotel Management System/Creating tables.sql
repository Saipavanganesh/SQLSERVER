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
Payment_Id INT PRIMARY KEY,
Reservation_Id INT,
Payment_Amount DECIMAL(10,2),
Payment_Date DATE,
Payment_Method VARCHAR(50),
FOREIGN KEY (Reservation_Id) REFERENCES Reservations (Reservation_Id)
);
ALTER TABLE Rooms
ADD IsAvailable BIT DEFAULT 1;