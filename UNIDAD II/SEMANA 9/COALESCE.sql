SELECT TOP(20)
   [idPedido],
   COALESCE([IdCliente],'Sin Cliente') AS IdCliente,
   COALESCE([NomCliente],'Sin Cliente') AS NomCliente
FROM[FASTFOOD].[dbo].[Pedido];
GO

SELECT TOP(20)
   [idPedido],
   COALESCE([IdCliente],[NomCliente],'Sin Cliente') AS IdCliente, NomCliente
FROM[FASTFOOD].[dbo].[Pedido];
GO

    SELECT TOP(30)
        [idPedido],
        COALESCE([NomCliente],[IdCliente],'Sin Cliente') AS Cliente
    FROM[FASTFOOD].[dbo].[Pedido];
    GO

SELECT TOP(40)
   [idPedido],
   [NomCliente],
   [IdCliente]
FROM[FASTFOOD].[dbo].[Pedido]
Where [NomCliente] IS NULL OR [IdCliente] IS NULL;
GO