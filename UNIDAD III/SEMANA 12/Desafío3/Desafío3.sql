
/* SIN RESUMEN */
SELECT
    C.CategoryID AS 'CODIGO CATEGORIA',
    C.CategoryName AS 'NOMBRE CATEGORIA',
    OD.Quantity AS 'CANTIDAD',
    OD.UnitPrice * OD.Quantity 'IMPORTE'
FROM
    Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE
    CustomerID = 'WELLI'
ORDER BY 'CODIGO CATEGORIA'
GO

/* RESUMEN */
SELECT
    DISTINCT C.CategoryID AS 'CODIGO CATEGORIA',
    C.CategoryName AS 'NOMBRE CATEGORIA',
    SUM(OD.Quantity) AS 'CANTIDAD',
    SUM(OD.UnitPrice * OD.Quantity) 'IMPORTE'
FROM
    Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE
    CustomerID = 'WELLI'
GROUP BY C.CategoryID, C.CategoryName
ORDER BY 'CODIGO CATEGORIA'
GO

/* CREATE PROCEDURE */
CREATE PROCEDURE USP_RESUMEN_VENTAS_POR_CATEGORIA_DE_CLIENTE
    @CODIGO_CLIENTE char(5)
AS
BEGIN
    SELECT
        C.CategoryID AS 'CODIGO CATEGORIA',
        C.CategoryName AS 'NOMBRE CATEGORIA',
        SUM(OD.Quantity) AS 'CANTIDAD',
        SUM(OD.UnitPrice * OD.Quantity) 'IMPORTE'
    FROM
        Orders O
        JOIN [Order Details] OD ON O.OrderID = OD.OrderID
        JOIN Products P ON OD.ProductID = P.ProductID
        JOIN Categories C ON P.CategoryID = C.CategoryID
    WHERE
        CustomerID = @CODIGO_CLIENTE
    GROUP BY C.CategoryID, C.CategoryName
    ORDER BY 'CODIGO CATEGORIA'
END
GO

EXEC USP_RESUMEN_VENTAS_POR_CATEGORIA_DE_CLIENTE 'BERGS'
GO

DROP PROCEDURE USP_RESUMEN_VENTAS_POR_CATEGORIA_DE_CLIENTE


EXEC USP_RESUMEN_VENTAS_POR_CAT_CLIENTE ALFKI
