CREATE PROCEDURE USP_IMPORTE_VENTAS_POR_PAIS_DE_1997
AS
BEGIN
    WITH
        IMPORTE_TOTAL
        AS
        (
            SELECT
                SUM(OD.UnitPrice * OD.Quantity) AS 'TOTAL_VENTAS',
                DATEPART(YEAR, O.OrderDate) AS 'Año'
            FROM Orders O
                JOIN [Order Details] OD ON O.OrderID = OD.OrderID
            WHERE DATEPART(YEAR, O.OrderDate) = 1997
            GROUP BY DATEPART(YEAR, O.OrderDate)
        )

    SELECT
        C.Country AS 'NOMBRE PAIS',
        SUM(OD.UnitPrice * OD.Quantity) AS 'IMPORTE VENTAS',
        (SUM(OD.UnitPrice * OD.Quantity) / IT.TOTAL_VENTAS) * 100 AS '% DEL TOTAL'
    FROM Orders O
        JOIN [Order Details] OD ON O.OrderID = OD.OrderID
        JOIN Customers C ON O.CustomerID = C.CustomerID
        JOIN IMPORTE_TOTAL IT ON DATEPART(YEAR, O.OrderDate) = IT.Año
    WHERE DATEPART(YEAR, O.OrderDate) = 1997
    GROUP BY C.Country, IT.TOTAL_VENTAS;
END;
GO

EXEC USP_IMPORTE_VENTAS_POR_PAIS_DE_1997;

DROP PROCEDURE USP_IMPORTE_VENTAS_POR_PAIS_DE_1997
