/* 
Se necesita un procedimiento que reporte el resumen de venta por país de un
determinado producto. El procedimiento debe tener como parámetro de entrada el
código del producto.
Base de datos: NORTHWIND
El procedimiento debe tener como resultado la siguiente plantilla:
    NOMBRE PAIS    |   CANTIDAD    |   IMPORTE
 */
SELECT
    DISTINCT O.ShipCountry AS 'PAIS',
    SUM(OD.Quantity) AS 'CANTIDAD',
    SUM(OD.UnitPrice * OD.Quantity ) AS 'IMPORTE'
FROM
    Orders O
    JOIN
    [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN
    Products P ON OD.ProductID = P.ProductID
WHERE
    P.ProductID = 10
GROUP BY
    O.ShipCountry
GO

/* CREATE PROCEDURE */
CREATE PROCEDURE USP_RESUME_VENTA_POR_PAIS_DE_PRODUCTO
    @CODIGO_PRODUCTO INT
AS
BEGIN
    SELECT
        O.ShipCountry AS 'NOMBRE PAIS',
        SUM(OD.Quantity) AS 'CANTIDAD',
        SUM(OD.UnitPrice * OD.Quantity) AS 'IMPORTE'
    FROM
        Orders O
        JOIN [Order Details] OD ON O.OrderID = OD.OrderID
        JOIN Products P ON OD.ProductID = P.ProductID
    WHERE
        P.ProductID = @CODIGO_PRODUCTO
    GROUP BY
        O.ShipCountry
    ORDER BY
        'NOMBRE PAIS'
END
GO

EXEC USP_RESUME_VENTA_POR_PAIS_DE_PRODUCTO 1
GO

DROP PROCEDURE USP_RESUME_VENTA_POR_PAIS_DE_PRODUCTO;
GO


