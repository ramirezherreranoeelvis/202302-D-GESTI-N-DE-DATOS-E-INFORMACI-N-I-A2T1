SELECT
    OrderID, OrderDate, CustomerID
FROM Northwind..Orders
WHERE DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(MONTH, OrderDate) = 4 AND (CustomerID = 'EASTC' OR CustomerID = 'PERIC');
GO

CREATE TABLE a(
    id Integer primary key,
    a Money
)
GO