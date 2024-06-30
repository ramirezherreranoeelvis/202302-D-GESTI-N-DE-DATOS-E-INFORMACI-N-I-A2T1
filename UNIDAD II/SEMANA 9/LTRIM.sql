SELECT TOP(3)
    [IdArticulo], NomArticulo, LTRIM(NomArticulo, 'Gaseosa') AS Tamaño
FROM [FASTFOOD].[dbo].[Articulo];
GO