/* Ejercicio terminado */
CREATE PROCEDURE USP_IMPORTE_VENTAS_POR_CIUDAD_DE_1997
AS
BEGIN
    WITH
        [IMPORTE VENTAS]
        AS
        (
            SELECT
                SUM(OD.UnitPrice * OD.Quantity) AS 'TOTAL',
                O.ShipCountry
            FROM Orders O
                JOIN [Order Details] OD ON O.OrderID = OD.OrderID
            WHERE DATEPART(YEAR, O.OrderDate) = '1997'
            GROUP BY O.ShipCountry
        )
    SELECT
        O.ShipCountry AS 'NOMBRE PAIS',
        OD.UnitPrice* OD.Quantity AS 'IMPORTE VENTAS',
        ((OD.UnitPrice* OD.Quantity)/[IMPORTE VENTAS].TOTAL)*100 AS ' % DEL TOTAL'
    FROM Orders O
        JOIN [Order Details] OD ON O.OrderID = OD.OrderID
        JOIN [IMPORTE VENTAS] ON [IMPORTE VENTAS].ShipCountry = O.ShipCountry
    WHERE DATEPART(YEAR, O.OrderDate) = '1997'
END;
GO
EXEC USP_IMPORTE_VENTAS_POR_CIUDAD_DE_1997
GO
DROP PROCEDURE USP_IMPORTE_VENTAS_POR_CIUDAD_DE_1997
GO




CREATE PROCEDURE USP_IMPORTE_VENTAS_POR_PAIS_DE_1997
AS
BEGIN
    DECLARE @TotalVentas MONEY;

    -- Total de ventas para 1997
    SELECT @TotalVentas = SUM(OD.UnitPrice * OD.Quantity)
    FROM Orders O
        JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    WHERE DATEPART(YEAR, O.OrderDate) = 1997;


    SELECT
        C.Country AS 'NOMBRE PAIS',
        SUM(OD.UnitPrice * OD.Quantity) AS 'IMPORTE VENTAS',
        (SUM(OD.UnitPrice * OD.Quantity) / @TotalVentas) * 100 AS '% DEL TOTAL'
    FROM Orders O
        JOIN [Order Details] OD ON O.OrderID = OD.OrderID
        JOIN Customers C ON O.CustomerID = C.CustomerID
    WHERE DATEPART(YEAR, O.OrderDate) = 1997
    GROUP BY C.Country;
END;
GO

EXEC USP_IMPORTE_VENTAS_POR_PAIS_DE_1997

DROP PROCEDURE USP_IMPORTE_VENTAS_POR_PAIS_DE_1997







/* TestS */
with
    V1
    AS
    (
        SELECT
            SUM(OD.UnitPrice* OD.Quantity) AS 'TOTAL_CANTIDAD',
            O.ShipCountry
        FROM Orders O
            JOIN [Order Details] OD ON O.OrderID = OD.OrderID
        WHERE DATEPART(YEAR, O.OrderDate) = '1997' AND O.ShipCountry = 'Germany'
        GROUP BY O.ShipCountry
    ),
    V2
    AS
    (
        SELECT
            SUM(((OD.UnitPrice* OD.Quantity)/V1.TOTAL_CANTIDAD)*100) AS 'TOTAL_PORCENTUAL',
            O.ShipCountry
        FROM Orders O
            JOIN [Order Details] OD ON O.OrderID = OD.OrderID
            JOIN V1 ON O.ShipCountry = V1.ShipCountry
        WHERE DATEPART(YEAR, O.OrderDate) = '1997' AND O.ShipCountry = 'Germany'
        GROUP BY O.ShipCountry
    )
SELECT
    O.ShipCountry AS 'NOMBRE PAIS',
    OD.UnitPrice* OD.Quantity AS 'IMPORTE VENTAS',
    ((OD.UnitPrice* OD.Quantity)/V1.TOTAL_CANTIDAD)*100 AS ' % DEL TOTAL',
    V2.TOTAL_PORCENTUAL AS '%',
    V1.TOTAL_CANTIDAD
AS 'Importe ventas'
FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN V1 ON V1.ShipCountry = O.ShipCountry
    JOIN V2 ON V2.ShipCountry = O.ShipCountry
WHERE DATEPART
(YEAR, O.OrderDate) = '1997' AND O.ShipCountry = 'Germany'
GO