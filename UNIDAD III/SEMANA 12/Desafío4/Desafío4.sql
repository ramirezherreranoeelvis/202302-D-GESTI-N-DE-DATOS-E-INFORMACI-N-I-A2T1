SELECT
    D.iddepartamento AS 'CODIGO DEPARTAMENTO',
    D.nombre AS 'NOMBRE DEPARTAMENTO',
    SUM(E.sueldo) AS 'IMPORTE SUELDO',
    SUM( COALESCE(E.COMISION, 0)) AS 'IMPORTE COMISION',
    SUM(E.sueldo + COALESCE(E.comision, 0)) AS 'IMPORTE TOTAL'
FROM DEPARTAMENTO D
    JOIN empleado E ON D.iddepartamento = E.iddepartamento
WHERE D.iddepartamento = 100
GROUP BY D.iddepartamento, D.nombre;
GO

CREATE PROCEDURE USP_PLANILLA_DEPARTAMENTO
    @CODIGO_DEPARTAMENTO int
AS
BEGIN
    SELECT
        D.iddepartamento AS 'CODIGO DEPARTAMENTO',
        D.nombre AS 'NOMBRE DEPARTAMENTO',
        SUM(E.sueldo) AS 'IMPORTE SUELDO',
        COALESCE(SUM(E.COMISION), 0) AS 'IMPORTE COMISION',
        SUM(E.sueldo + COALESCE(E.comision, 0)) AS 'IMPORTE TOTAL'
    FROM DEPARTAMENTO D
        JOIN empleado E ON D.iddepartamento = E.iddepartamento
    WHERE D.iddepartamento = @CODIGO_DEPARTAMENTO
    GROUP BY D.iddepartamento, D.nombre
    ORDER BY D.iddepartamento ASC;
END
GO

EXEC USP_PLANILLA_DEPARTAMENTO 100;
GO

DROP PROCEDURE USP_PLANILLA_DEPARTAMENTO;
GO