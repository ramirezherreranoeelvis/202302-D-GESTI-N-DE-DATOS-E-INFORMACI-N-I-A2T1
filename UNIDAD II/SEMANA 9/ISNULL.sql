    SELECT TOP (10)
        [idPedido]
        , ISNULL(CONVERT(varchar(12),[IdCliente]), 'Sin cliente')AS IdCliente
    FROM [FASTFOOD].[dbo].[Pedido];
    GO