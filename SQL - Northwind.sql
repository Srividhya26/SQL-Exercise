--1)Which category has maximum product?
SELECT MIN(ProdCount.Products) AS Min_Product FROM (SELECT P.CategoryID, COUNT(P.ProductID) AS Products FROM Products P
JOIN Categories C ON C.CategoryID = P.CategoryID
GROUP BY P.CategoryID) AS ProdCount
JOIN Categories C ON C.CategoryID = ProdCount.CategoryID

SELECT TOP 1 C.CategoryName,  P.CategoryID,COUNT(P.ProductID) AS MinProducts FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY P.CategoryID,C.CategoryName
ORDER BY COUNT(P.ProductID)

--2)Which category has minimum product?
SELECT MAX(ProdCount.Products) AS Max_Product FROM (SELECT P.CategoryID, COUNT(P.ProductID) AS Products FROM Products P
JOIN Categories C ON C.CategoryID = P.CategoryID
GROUP BY P.CategoryID) AS ProdCount
JOIN Categories C ON C.CategoryID = ProdCount.CategoryID

SELECT TOP 1 C.CategoryName,P.CategoryID,COUNT(P.ProductID) AS MinProducts FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY P.CategoryID,C.CategoryName
ORDER BY COUNT(P.ProductID) DESC

--Select * from [Order Details]

--3)Find the costliest order
SELECT SUM(((UnitPrice*Quantity)-((UnitPrice * Quantity)/100)*Discount)) As costliestOrder
FROM [Order Details];

--4)Which product is not all ordered?
SELECT P.ProductID FROM Products P
EXCEPT
SELECT O.ProductID FROM [Order Details] O

--5)Which category has the costliest product?
SELECT MAX(ProdCount.Products) AS CostliestPrice FROM (SELECT P.CategoryID, MAX(UnitPrice) AS Products FROM Products P
JOIN Categories C ON C.CategoryID = P.CategoryID
GROUP BY P.CategoryID) AS ProdCount
JOIN Categories C ON C.CategoryID = ProdCount.CategoryID

SELECT TOP 1 P.ProductName,P.CategoryID,MAX(P.UnitPrice) AS CostliestPrice FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY P.CategoryID,p.ProductName
ORDER BY MAX(P.UnitPrice) DESC

--6)Which category has no product?
SELECT COUNT(CategoryId) AS 'Products' FROM Products GROUP BY CategoryID

SELECT C.CategoryId FROM Categories C
EXCEPT
SELECT P.CategoryID FROM [Products] P

--7)Which products has ordered least?
SELECT TOP 1 P.ProductName,O.ProductID,COUNT(O.ProductID) AS LeastOrder FROM [Order Details] O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY O.ProductID,P.ProductName
ORDER BY COUNT(O.ProductID)

SELECT ProductID,COUNT(ProductId) AS 'Orders' FROM [Order Details] GROUP BY ProductId;

--8)Which order has maximum products?
select top 1 OrderID,count(ProductID) as MaxProduct from [Order Details]
group by OrderID
order by OrderID desc

--9)Which category has lot of products with respect to quantity on hand?
SELECT TOP 1  P.ProductName, P.CategoryID,MAX(P.UnitsInStock) AS Products FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY P.CategoryID,P.ProductName
ORDER BY MAX(P.UnitsInStock) DESC

--SELECT OrderId,MAX(((UnitPrice*Quantity)-((UnitPrice * Quantity)/100)*Discount)) 'Orders' FROM [Order Details] GROUP BY OrderId
--ORDER BY MAX(((UnitPrice*Quantity)-((UnitPrice * Quantity)/100)*Discount)) DESC;

--10)Which customer made the costliest order?
SELECT TOP 1 O.CustomerID,Od.OrderID,MAX(((UnitPrice*Quantity)-((UnitPrice * Quantity)/100)*Discount)) AS CosliestOrder FROM [Order Details] Od
JOIN Orders O ON Od.OrderID = O.OrderID
GROUP BY Od.OrderID,O.CustomerID
ORDER BY MAX(((UnitPrice*Quantity)-((UnitPrice * Quantity)/100)*Discount)) DESC

--11)Which customer made the costliest order today?
SELECT O.CustomerID,Od.OrderID,MAX(((UnitPrice*Quantity)-((UnitPrice * Quantity)/100)*Discount)) AS CosliestOrder FROM [Order Details] Od
JOIN Orders O ON Od.OrderID = O.OrderID
WHERE O.OrderDate = '1996-09-10'
GROUP BY Od.OrderID,O.CustomerID
ORDER BY MAX(((UnitPrice*Quantity)-((UnitPrice * Quantity)/100)*Discount)) DESC

--12)Category wise display the product with minimum quantity on hand?
SELECT P.ProductName, P.CategoryID,MIN(P.UnitsInStock) AS Products FROM Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY P.CategoryID,P.ProductName
ORDER BY MIN(P.UnitsInStock)

--13)Category wise display the costliest product?
SELECT categoryid,MAX(unitprice) AS price FROM products
GROUP BY categoryid

--14) Which products has ordered frequently?
SELECT TOP 1 P.ProductName,O.ProductID,COUNT(O.ProductID) AS LeastOrder FROM [Order Details] O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY O.ProductID,P.ProductName
ORDER BY COUNT(O.ProductID) DESC

--15) In which date the costliest order made?
SELECT TOP 1 O.OrderID,O.OrderDate, MAX(DATE.CostliestOrder) AS CostPrice FROM
(SELECT O.OrderID,MAX(((UnitPrice * Quantity)-((UnitPrice * Quantity)/100) * Discount)) AS CostliestOrder
FROM [Order Details] od
inner join Orders O ON O.OrderID = od.OrderID
GROUP BY O.OrderID) AS DATE
inner join Orders O ON O.OrderID = DATE.OrderID
GROUP BY O.OrderDate,DATE.CostliestOrder,O.OrderID
ORDER BY DATE.CostliestOrder DESC

