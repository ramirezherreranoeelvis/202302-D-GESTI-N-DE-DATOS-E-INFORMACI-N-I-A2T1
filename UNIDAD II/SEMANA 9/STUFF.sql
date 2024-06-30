SELECT STUFF('Hola Mundo, hermoso mundo', 6, 5, 'Amigo') AS Mensaje_de_prueba;
SELECT
    [nombre], STUFF(nombre,2,2,'123') AS NombreSTUFF
FROM [RH].[dbo].[cargo];
    GO