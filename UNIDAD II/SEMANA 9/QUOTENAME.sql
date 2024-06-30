SELECT TOP(5)
    QUOTENAME(city, '()') AS cityInBrackes
FROM [pubs].[dbo].[authors]
    GO
