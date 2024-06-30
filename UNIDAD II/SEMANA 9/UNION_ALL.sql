
        SELECT TOP(3)
            [idempleado]AS id, 'BOOKSTORE' AS origen
        FROM [BOOKSTORE].[dbo].[Empleado]
    UNION ALL
        SELECT TOP(4)
            [emp_id]AS id , 'EDUCA2' AS origen
        FROM [EDUCA2].[dbo].[EMPLEADO]
    GO