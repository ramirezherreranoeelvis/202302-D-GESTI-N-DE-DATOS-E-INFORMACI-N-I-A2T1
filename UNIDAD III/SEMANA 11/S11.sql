SELECT *
FROM Northwind..Products
WHERE UnitPrice = (
SELECT
    MAX(UnitPrice)
FROM Northwind..Products);
GO

/* Producto mas barato */
SELECT *
FROM Northwind..Products
WHERE UnitPrice = (
SELECT
    MIN(UnitPrice)
FROM Northwind..Products);
GO

/* Producto mas barato */
SELECT *
FROM Northwind..Products
WHERE UnitPrice > (
SELECT
    avg(UnitPrice)
FROM Northwind..Products);
GO

/* Stock Totoal de la categoria 3 */
SELECT
    SUM(UnitsInStock) "Stock Total"
FROM Northwind..Products
WHERE CategoryID = 3;
GO

/* Importe total que se tiene en mercaderia.
 */
SELECT
    SUM(UnitPrice * UnitsInStock) AS 'Importe Total'
FROM Northwind..Products
GO