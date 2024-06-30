SELECT TOP(10)
    empleado.[idempleado],
    empleado.[idcargo],
    empleado.[sueldo],
    IIF(empleado.[sueldo] = cargo.[sueldo_min], 'Sueldo Mínimo', IIF(empleado.[sueldo] = cargo.[sueldo_max], 'Sueldo Máximo', 'Sueldo Intermedio')) AS tipoSueldo
FROM [RH].[dbo].[empleado]
JOIN [RH].[dbo].[cargo] ON empleado.[idcargo] = cargo.[idcargo];
