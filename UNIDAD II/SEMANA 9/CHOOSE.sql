SELECT
    *
FROM [Northwind].[dbo].[Categories];
GO
    SELECT TOP(15)
        [ProductID], [CategoryID], CHOOSE(
            [CategoryID],
            'Beverages',
            'Condiments',
            'Confections',
            'Dairy Products',
            'Grains/Cereals',
            'Meat/Poultry',
            'Produce',
            'Seafood'
            )AS CategoryName
    FROM [Northwind].[dbo].[Products];
    GO
SELECT TOP(15)
    [Products].[ProductID], [Products].[CategoryID],
    [Categories].[CategoryName]
FROM [Northwind].[dbo].[Products]
    JOIN[Northwind].[dbo].[Categories] ON Products.[CategoryID] = [Categories].[CategoryID];
GO