
    SELECT TOP(3)
        [idempleado]AS id, 'BOOKSTORE' AS origen
    FROM [BOOKSTORE].[dbo].[Empleado]
EXCEPT
    SELECT TOP(4)
        [emp_id]AS id , 'EDUCA2' AS origen
    FROM [EDUCA2].[dbo].[EMPLEADO]
    GO


    SELECT TOP(3)
        [idempleado]AS id, 'BOOKSTORE' AS origen
    FROM [BOOKSTORE].[dbo].[Empleado]
INTERSECT
    SELECT TOP(4)
        [emp_id]AS id , 'EDUCA2' AS origen
    FROM [EDUCA2].[dbo].[EMPLEADO]
    GO