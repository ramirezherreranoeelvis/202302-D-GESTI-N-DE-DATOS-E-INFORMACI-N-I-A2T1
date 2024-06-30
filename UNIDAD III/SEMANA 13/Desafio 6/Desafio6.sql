CREATE PROCEDURE USP_NOTAS_MAXIMAS_CADA_CURSO_POR_CICLO
    @ciclo VARCHAR(7)
AS
BEGIN
    WITH
        MAXIMOS_PROMEDIOS
        AS
        (
            SELECT
                C.IdCurso,
                C.NomCurso,
                MAX(M.Promedio) AS 'PROMEDIO'
            FROM Matricula M
                JOIN CursoProgramado CP ON M.IdCursoProg = CP.IdCursoProg
                JOIN Curso C ON CP.IdCurso = C.IdCurso
            WHERE CP.IdCiclo = @ciclo
            GROUP BY C.IdCurso, C.NomCurso
        )
    SELECT
        C.IdCurso  AS 'CODIGO CURSO',
        C.NomCurso  AS 'NOMBRE CURSO',
        A.IdAlumno AS 'CODIGO ALUMNO',
        A.NomAlumno AS 'NOMBRE ALUMNO',
        M.ExaParcial AS 'EXAMEN PARCIAL',
        M.ExaFinal AS 'EXAMEN FINAL',
        M.ExaSub AS 'EXAMEN SUBNACION',
        M.Promedio AS 'PROMEDIO'
    FROM MATRICULA M
        JOIN Alumno A ON M.IdAlumno = A.IdAlumno
        JOIN CursoProgramado CP ON M.IdCursoProg = CP.IdCursoProg
        JOIN Curso C ON CP.IdCurso = C.IdCurso
        JOIN MAXIMOS_PROMEDIOS MP ON C.IdCurso = MP.IdCurso
    WHERE CP.IdCiclo =@ciclo AND MP.IdCurso = C.IdCurso AND M.Promedio = MP.PROMEDIO
    ORDER BY C.IdCurso
END
GO
EXEC USP_NOTAS_MAXIMAS_CADA_CURSO_POR_CICLO '2001-07'
DROP PROCEDURE USP_NOTAS_MAXIMAS_CADA_CURSO_POR_CICLO