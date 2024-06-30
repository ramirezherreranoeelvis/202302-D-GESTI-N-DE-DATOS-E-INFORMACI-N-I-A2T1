CREATE PROCEDURE USP_Desafio1
    @ProductID INT
AS
BEGIN
    SELECT 
        p.ProductID AS 'CODIGO PRODUCTO',
        p.ProductName AS 'NOMBRE PRODUCTO',
        o.OrderID AS 'NUMERO PEDIDO',
        o.OrderDate AS 'FECHA PEDIDO',
        o.ShipCountry AS 'PAIS DESTINO',
        od.UnitPrice AS 'PRECIO UNITARIO',
        od.Quantity AS 'CANTIDAD',
        (od.UnitPrice * od.Quantity) AS 'IMPORTE'
    FROM 
        Products p
    INNER JOIN 
        [Order Details] od ON p.ProductID = od.ProductID
    INNER JOIN 
        Orders o ON od.OrderID = o.OrderID
    WHERE 
        p.ProductID = @ProductID
        ORDER BY 
        o.OrderDate DESC;
END
GO

EXEC USP_Desafio1 1;
GO

DROP PROCEDURE USP_Desafio1;
GO