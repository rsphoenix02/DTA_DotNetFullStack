-- Products :  ProductId, Name, QuantityInStock, UnitPrice, Category
-- Cart   :  Id,  CartId, ProductId, Quantity

/*
2.1. Write the sql queries for the following requirements  by using joins concept:

	a. Consider the Products table and Cart table 
	b. Write a Query to display the results from the above two tables:
			CartId,  ProductName, Quantity, UnitPrice
			
		Hint :  Quantity should takes from Cart table
			
	c.  Try to appy inner join,  right outer join , left outer join and full outer join on the above tables.
*/

-- INNER JOIN --
SELECT c.CartId,  p.ProductName, c.Quantity, p.UnitPrice 
FROM Products as p
INNER JOIN Cart as c
ON c.ProductId = p.ProductId;


-- LEFT OUTER JOIN --
SELECT c.CartId,  p.ProductName, c.Quantity, p.UnitPrice 
FROM Products as p
LEFT OUTER JOIN Cart as c
ON c.ProductId = p.ProductId;

-- RIGHT OUTER JOIN --
SELECT c.CartId,  p.ProductName, c.Quantity, p.UnitPrice 
FROM Products as p
RIGHT OUTER JOIN Cart as c
ON c.ProductId = p.ProductId;

-- FUKK OUTER JOIN --
SELECT c.CartId,  p.ProductName, c.Quantity, p.UnitPrice 
FROM Products as p
FULL OUTER JOIN Cart as c
ON c.ProductId = p.ProductId;


