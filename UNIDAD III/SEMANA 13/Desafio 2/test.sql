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
    ),
    EMPLEADO_DATOS
    AS
    (
        SELECT
            E.idempleado AS 'CODIGO EMPLEADO',
            E.nombre AS 'NOMBRE EMPLEADO'
        FROM empleado E
            JOIN EMPLEADO_SUELDO_MINIMO ESM ON E.iddepartamento =ESM.[CODIGO DEPARTAMENTO]
        WHERE E.iddepartamento = ESM.[CODIGO DEPARTAMENTO]
    )
SELECT
    D.iddepartamento AS 'CODIGO DEPARTAMENTO',
    D.nombre AS 'NOMBRE DEPARTAMENTO',
    ED.[CODIGO EMPLEADO] AS 'CODIGO EMPLEADO',
    MIN(E.sueldo) AS 'SUELDO'
FROM empleado E
    JOIN departamento D ON E.iddepartamento = D.iddepartamento
    JOIN EMPLEADO_DATOS ED ON E.idempleado = ED.[CODIGO EMPLEADO]
WHERE D.nombre = 'Sistemas'
GROUP BY D.iddepartamento, D.nombre, ED.[CODIGO EMPLEADO]