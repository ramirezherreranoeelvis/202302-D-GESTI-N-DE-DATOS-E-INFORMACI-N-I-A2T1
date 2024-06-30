SELECT
    OD.ProductID AS 'CODIGO PRODUCTO',
    P.ProductName AS 'NOMBRE PRODUCTO',
    OD.OrderID AS 'NUMERO. PEDIDO',
    O.OrderDate AS 'FECHA PEDIDO',
    O.ShipCountry AS 'PAIS DESTINO',
    OD.UnitPrice AS 'PRECIO UNITARIO',
    OD.Quantity AS 'CANTIDAD',
    (OD.Quantity * OD.UnitPrice) AS 'IMPORTE'
FROM Orders O
    INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    INNER JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductID = 2
ORDER BY O.OrderDate DESC
GO

CREATE PROCEDURE USP_VENTAS_PRODUCTO_DETERMINADO
    @CODIGO_Producto int
AS
BEGIN
    SELECT
        OD.ProductID AS 'CODIGO PRODUCTO',
        P.ProductName AS 'NOMBRE PRODUCTO',
        OD.OrderID AS 'NUMERO. PEDIDO',
        O.OrderDate AS 'FECHA PEDIDO',
        O.ShipCountry AS 'PAIS DESTINO',
        OD.UnitPrice AS 'PRECIO UNITARIO',
        OD.Quantity AS 'CANTIDAD',
        (OD.Quantity * OD.UnitPrice) AS 'IMPORTE'
    FROM Orders O
        INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
        INNER JOIN Products P ON OD.ProductID = P.ProductID
    WHERE P.ProductID = @CODIGO_Producto
    ORDER BY 
        o.OrderDate DESC;
END
GO

EXEC USP_VENTAS_PRODUCTO_DETERMINADO 1

DROP PROCEDURE USP_VENTAS_PRODUCTO_DETERMINADO;
