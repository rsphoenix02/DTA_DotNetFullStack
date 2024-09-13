-- Products :  ProductId, Name, QuantityInStock, UnitPrice, Category
-- Cart   :  Id,  CartId, ProductId, Quantity

/*
2.3.  Prepare the sql queries for the following requirements (use subqueries):
			
			a.   Display the products if any items exists in the cart table
			b.   Display the cart items whoe product price greater than 5000 
*/

-- a.   Display the products if any items exists in the cart table
SELECT *  
FROM Cart 
WHERE ProductId IN (SELECT ProductId FROM Products WHERE ProductName='Laptop');

-- b.   Display the cart items whoe product price greater than 5000 
SELECT * 
FROM Cart
WHERE ProductId IN (SELECT ProductId FROM Products WHERE UnitPrice > 5000);