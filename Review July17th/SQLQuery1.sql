use ReviewDatabase
CREATE TABLE Customers(
Customer_Id INT PRIMARY KEY,
Customer_Name VARCHAR(50),
Customer_Email VARCHAR(50),
Customer_Address VARCHAR(150)
);

CREATE TABLE Orders(
Order_Id INT PRIMARY KEY,
Customer_Id INT,
Order_Date DATE,
Total_Amount INT,
FOREIGN KEY (Customer_Id) REFERENCES Customers(Customer_Id)
);

CREATE TABLE Category(
Category_Id INT PRIMARY KEY,
Category_Name VARCHAR(50),
Category_Description VARCHAR(150)
);

CREATE TABLE Products(
Product_Id INT PRIMARY KEY,
Product_Name VARCHAR(50),
Product_Price INT,
Category_Id INT,
FOREIGN KEY (Category_Id) REFERENCES Category(Category_Id)
);


SELECT * FROM Orders;
INSERT INTO Customers (Customer_Id, Customer_Name, Customer_Email, Customer_Address)
VALUES 
(0001, 'Ganesh', 'ganesh@gmail.com', 'Hyderabad'),
(0002, 'Raj kumar', 'rajkumar@gmail.com', 'Pune'),
(0003, 'Sai Kiran', 'saikiran@gmail.com', 'Bangalore'),
(0004, 'Pradeep', 'pradeep@gmail.com', 'Chennai'),
(0005, 'Srinivas', 'srinivas@gmail.com', 'Hyderabad'),
(0006, 'Tarun', 'tarun@gmail.com', 'Bangalore')

INSERT INTO Orders (Order_Id, Customer_Id, Order_Date, Total_Amount)
VALUES 
(1001, '0001', '2023-01-11', '40000'),
(1002, '0003', '2023-01-11', '37000'),
(1003, '0004', '2023-01-11', '80000'),
(1004, '0005', '2023-01-11', '67500');

SELECT * FROM Category;
INSERT INTO Category (Category_Id,Category_Name,Category_Description)
VALUES 
(2001, 'Laptop', 'This is a good laptop to work on'),
(2002, 'Televison', 'This television is the best one in the market'),
(2003, 'Headset', 'This headset has good sound system');

SELECT * FROM Products
INSERT INTO Products (Product_Id,Product_Name,Product_Price,Category_Id)
VALUES
(3001, 'Hp Laptop', 35000, 2001),
(3002, 'Dell Laptop', 33000, 2001),
(3003, 'Asus Laptop', 40000, 2001),
(3004, 'LG Tv', 55000, 2002),
(3005, 'Samsung Tv', 65000, 2002),
(3006, 'bOAt Headset', 2000, 2003),
(3007, 'Jbl Headset', 5000, 2003)

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Category;
SELECT * FROM Products;


/*
Retrieve products in a specific price range with their corresponding category name
Retrieve customers who have not placed any orders

*/

--Retrieve customers who have not placed any orders
SELECT * FROM Customers c 
LEFT JOIN Orders o
ON c.Customer_Id = o.Customer_Id
WHERE Order_Id is Null;

--Retrieve products in a specific price range with their corresponding category name
SELECT * FROM Products p 
LEFT JOIN Category c
ON p.Category_Id = c.Category_Id
where P.Category_Id=2001 AND Product_Price BETWEEN 35000 AND 56000 

