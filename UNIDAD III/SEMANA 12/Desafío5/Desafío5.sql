SELECT
    C.IdCurso AS 'CODIGO CURSO',
    C.NomCurso AS 'NOMBRE CURSO',
    COUNT(CP.IdCursoProg) AS 'SECCIONES',
    SUM(ISNULL(CP.Matriculados, 0)) AS 'MATRICULADOS',
    SUM(CP.PreCursoProg * ISNULL(CP.Matriculados, 0)) AS 'IMPORTE RECAUDADO'
FROM Curso C
    JOIN CursoProgramado CP ON C.IdCurso = CP.IdCurso
WHERE CP.IdCiclo = '1986-01'
GROUP BY C.IdCurso, C.NomCurso
GO

CREATE PROCEDURE USP_RESUMEN_MATRICULADO_DE_UN_CICLO
    @fecha varchar(7)
AS
BEGIN
    SELECT
        C.IdCurso AS 'CODIGO CURSO',
        C.NomCurso AS 'NOMBRE CURSO',
        COUNT(DISTINCT CP.IdCursoProg) AS 'SECCIONES',
        SUM(ISNULL(CP.Matriculados, 0)) AS 'MATRICULADOS',
        SUM(CP.PreCursoProg * ISNULL(CP.Matriculados, 0)) AS 'IMPORTE RECAUDADO'
    FROM Curso C
        JOIN CursoProgramado CP ON C.IdCurso = CP.IdCurso
    WHERE CP.IdCiclo = @fecha
    GROUP BY C.IdCurso, C.NomCurso
END
GO

EXEC USP_RESUMEN_MATRICULADO_DE_UN_CICLO '1984-10';
GO

DROP PROCEDURE USP_RESUMEN_MATRICULADO_DE_UN_CICLO
GO
