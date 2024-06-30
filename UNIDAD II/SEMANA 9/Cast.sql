-- CAST ( expression AS data_type [ ( length ) ] )
SELECT
    precio, CAST(precio AS INT) AS SalarioEntero
FROM [BOOKSTORE].[dbo].[VENTA];
GO
SELECT
    cur_id, alu_id, pag_cuota, CAST(pag_fecha AS DATE) AS pago_fecha
 FROM [EDUCA2].[dbo].[PAGO];
GO
SELECT CAST('123' AS INT) AS Entero;