/* Forma con columnas deseadas */
SELECT TOP 1 
    D.iddepartamento 'CODIGO DEPARTAMENTO',
    D.nombre 'NOMBRE DEPARTAMENTO',
    E.idempleado 'CODIGO EMPLEADO',
    E.nombre 'NOMBRE EMPLEADO',
    MIN(E.sueldo) AS 'SUELDO'
FROM empleado E
    JOIN departamento D ON E.iddepartamento = D.iddepartamento
WHERE D.nombre = 'Sistemas'
GROUP BY D.iddepartamento, D.nombre, E.idempleado, E.nombre
ORDER BY E.sueldo ASC
GO

CREATE PROCEDURE USP_EMPLEADO_MENOR_SUELDO_DEPARTAMENTO
    @departamento VARCHAR(100)
AS
BEGIN
    SELECT TOP 1
        d.iddepartamento AS 'CODIGO DEPARTAMENTO',
        d.nombre AS 'NOMBRE DEPARTAMENTO',
        e.iddepartamento AS 'CODIGO EMPLEADO',
        e.nombre AS 'NOMBRE EMPLEADO',
        e.sueldo AS 'SUELDO'
    FROM empleado e
        JOIN departamento d ON e.iddepartamento = d.iddepartamento
    WHERE d.nombre = 'Sistemas'
    ORDER BY e.sueldo ASC
END
GO
EXEC USP_EMPLEADO_MENOR_SUELDO_DEPARTAMENTO 'SISTEMAS'
/* con with */
WITH
    EMPLEADO_SUELDO_MINIMO
    AS
(
        SELECT
    D.iddepartamento 'CODIGO DEPARTAMENTO',
    D.nombre 'NOMBRE DEPARTAMENTO',
    MIN(E.sueldo) AS 'SUELDO'
FROM departamento D
    JOIN empleado E ON D.iddepartamento =E.iddepartamento
WHERE D.nombre = 'Sistemas'
GROUP BY D.iddepartamento, D.nombre
    )
SELECT
    D.[CODIGO DEPARTAMENTO] AS 'CODIGO DEPARTAMENTO',
    D.[NOMBRE DEPARTAMENTO] AS 'NOMBRE DEPARTAMENTO',
    E.idempleado 'CODIGO EMPLEADO',
    E.nombre 'NOMBRE EMPLEADO',
    MIN(E.sueldo) AS 'SUELDO'
FROM empleado E
    JOIN EMPLEADO_SUELDO_MINIMO D ON E.iddepartamento = D.[CODIGO DEPARTAMENTO]
WHERE D.[NOMBRE DEPARTAMENTO] = 'Sistemas'
GROUP BY D.[CODIGO DEPARTAMENTO], D.[NOMBRE DEPARTAMENTO], E.idempleado, E.nombre
GO





CREATE PROCEDURE USP_EMPLEADO_MENOR_SUELDO_POR_DEPARTAMENTO
    @departamento VARCHAR(100)
AS
BEGIN
    WITH
        EMPLEADO_SUELDO_MINIMO
        AS
        (
            SELECT
                D.iddepartamento 'CODIGO DEPARTAMENTO',
                D.nombre 'NOMBRE DEPARTAMENTO',
                MIN(E.sueldo) AS 'SUELDO'
            FROM departamento D
                JOIN empleado E ON D.iddepartamento =E.iddepartamento
            WHERE D.nombre = @departamento
            GROUP BY D.iddepartamento, D.nombre
        )
    SELECT
        D.[CODIGO DEPARTAMENTO] AS 'CODIGO DEPARTAMENTO',
        D.[NOMBRE DEPARTAMENTO] AS 'NOMBRE DEPARTAMENTO',
        E.idempleado 'CODIGO EMPLEADO',
        E.nombre 'NOMBRE EMPLEADO',
        MIN(E.sueldo) AS 'SUELDO'
    FROM empleado E
        JOIN EMPLEADO_SUELDO_MINIMO D ON E.iddepartamento = D.[CODIGO DEPARTAMENTO]
    WHERE D.[NOMBRE DEPARTAMENTO] = @departamento AND E.sueldo = D.SUELDO
    GROUP BY D.[CODIGO DEPARTAMENTO], D.[NOMBRE DEPARTAMENTO], E.idempleado, E.nombre
END
GO
EXEC USP_EMPLEADO_MENOR_SUELDO_POR_DEPARTAMENTO 'Sistemas'
DROP PROCEDURE USP_EMPLEADO_MENOR_SUELDO_POR_DEPARTAMENTO
