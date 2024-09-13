-- Database Creation --
CREATE DATABASE ShoppingCartDb;

USE ShoppingCartDb;

-- Tables Creation --
CREATE TABLE ShoppingCartDb.dbo.Users (

	UserId INT,
	UserName varchar(15),
	UserPassword varchar(15),
	ContactNumber varchar(14),
	City varchar(25)
	);

CREATE TABLE ShoppingCartDb.dbo.Products (

	ProductId INT,
	ProductName varchar(25) NOT NULL,
	QuantityInStock INT NOT NULL,
	UnitPrice INT NOT NULL,
	Category varchar(15) NOT NULL,

	CONSTRAINT PK_Products_ProductId PRIMARY KEY(ProductId),
	CONSTRAINT CHK_Products_QuantityInStock CHECK(QuantityInStock > 0),
	CONSTRAINT CHK_Products_UnitPrice CHECK(UnitPrice > 0)
	);

CREATE TABLE ShoppingCartDb.dbo.Cart (

	Id INT IDENTITY(1,1),
	CartId varchar(32) NOT NULL,
	ProductId INT,
	Quantity INT NOT NULL,

	CONSTRAINT PK_Cart_Id PRIMARY KEY(Id),
	CONSTRAINT CHK_Cart_Quantity CHECK(Quantity > 0),

	CONSTRAINT FK_Cart_ProductId FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	);

-- Data Insertion in tables --
-- Users Table --
INSERT INTO ShoppingCartDb.dbo.Users (UserId, UserName, UserPassword, ContactNumber, City)
VALUES (1, 'JohnDoe', 'password123', '123-456-7890', 'New York');

INSERT INTO ShoppingCartDb.dbo.Users (UserId, UserName, UserPassword, ContactNumber, City)
VALUES (2, 'JaneSmith', 'qwerty456', '234-567-8901', 'Los Angeles');

INSERT INTO ShoppingCartDb.dbo.Users (UserId, UserName, UserPassword, ContactNumber, City)
VALUES (3, 'MikeBrown', 'abc123xyz', '345-678-9012', 'Chicago');

INSERT INTO ShoppingCartDb.dbo.Users (UserId, UserName, UserPassword, ContactNumber, City)
VALUES (4, 'EmilyDavis', 'pass789word', '456-789-0123', 'Houston');

INSERT INTO ShoppingCartDb.dbo.Users (UserId, UserName, UserPassword, ContactNumber, City)
VALUES (5, 'ChrisWilson', 'securePass1', '567-890-1234', 'Phoenix');

-- Products Table --
INSERT INTO ShoppingCartDb.dbo.Products (ProductId, ProductName, QuantityInStock, UnitPrice, Category)
VALUES (101, 'Laptop', 50, 8000, 'Electronics');

INSERT INTO ShoppingCartDb.dbo.Products (ProductId, ProductName, QuantityInStock, UnitPrice, Category)
VALUES (102, 'Smartphone', 100, 6000, 'Electronics');

INSERT INTO ShoppingCartDb.dbo.Products (ProductId, ProductName, QuantityInStock, UnitPrice, Category)
VALUES (103, 'Headphones', 200, 500, 'Accessories');

INSERT INTO ShoppingCartDb.dbo.Products (ProductId, ProductName, QuantityInStock, UnitPrice, Category)
VALUES (104, 'Coffee Maker', 30, 100, 'Home Appliances');

INSERT INTO ShoppingCartDb.dbo.Products (ProductId, ProductName, QuantityInStock, UnitPrice, Category)
VALUES (105, 'Desk Chair', 40, 15000, 'Furniture');

-- Cart Table --
INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART001', 101, 2);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART002', 102, 1);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART003', 103, 3);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART004', 104, 1);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART005', 105, 2);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART001', 101, 2);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART001', 102, 1);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART001', 103, 3);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART001', 104, 1);

INSERT INTO ShoppingCartDb.dbo.Cart (CartId, ProductId, Quantity)
VALUES ('CART001', 105, 2);



-- Queries --
-- Product Table --

-- a.   Display all Products
SELECT ProductName FROM Products;

-- b.   Display Products belongs to particular category
SELECT ProductName FROM Products WHERE Category='Electronics';

-- c.   Display out of stock products (means quantity is zero)
SELECT ProductName FROM Products WHERE QuantityInStock=0;

-- d.  Display the products which price between 1000 to 10000 
SELECT ProductName,UnitPrice FROM Products WHERE UnitPrice BETWEEN 1000 AND 10000;

-- e.  Display the product details based on the ProductId
SELECT * FROM Products Where ProductId=102;

-- Cart Table --

-- a.  Display data based on the given CartId
SELECT * FROM Cart WHERE CartId='CART002';

-- b.  Check is there any products added in Cart based on the ProductId
SELECT COUNT(*) AS 'Number of Carts' FROM Cart WHERE ProductId=102;

-- Users Table

-- a. Display All users 
SELECT * FROM Users;

-- b. Display user details based on ContactNumber
SELECT * FROM Users WHERE ContactNumber='+911234567890';

-- c. Display user details based on UserId
SELECT * FROM Users Where UserId=1;
