SELECT TOP(3)
        [idempleado]AS id
    FROM [BOOKSTORE].[dbo].[Empleado]
INTERSECT
    SELECT TOP(4)
        [emp_id]AS id
    FROM [EDUCA2].[dbo].[EMPLEADO]
    GO