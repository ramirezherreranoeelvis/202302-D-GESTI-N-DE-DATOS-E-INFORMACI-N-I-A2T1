SELECT TOP (10)
    chr_cuencodigo
      , chr_cuenclave, CONVERT(numeric(6), chr_cuenclave) AS int_cuenclave
FROM [EUREKABANK].[dbo].[Cuenta];
GO