WITH
    EMPLEADO_SUELDO_MINIMO
    AS
    (
        SELECT
            D.iddepartamento AS 'CODIGO DEPARTAMENTO',
            D.nombre AS 'NOMBRE DEPARTAMENTO',
            MIN(E.sueldo) AS 'SUELDO'
        FROM departamento D
            JOIN empleado E ON D.iddepartamento =E.iddepartamento
        WHERE D.nombre = 'Sistemas'
        GROUP BY D.iddepartamento, D.nombre
    )
SELECT
    E.idempleado AS 'CODIGO EMPLEADO',
    E.nombre AS 'NOMBRE EMPLEADO'
FROM empleado E
    JOIN EMPLEADO_SUELDO_MINIMO ESM ON E.iddepartamento =ESM.[CODIGO DEPARTAMENTO]
WHERE E.iddepartamento = ESM.[CODIGO DEPARTAMENTO]
GO

SELECT
    D.iddepartamento 'CODIGO DEPARTAMENTO',
    D.nombre 'NOMBRE DEPARTAMENTO',
    MIN(E.sueldo) AS 'SUELDO'
FROM departamento D
    JOIN empleado E ON D.iddepartamento =E.iddepartamento
WHERE D.nombre = 'Sistemas'
GROUP BY D.iddepartamento, D.nombre