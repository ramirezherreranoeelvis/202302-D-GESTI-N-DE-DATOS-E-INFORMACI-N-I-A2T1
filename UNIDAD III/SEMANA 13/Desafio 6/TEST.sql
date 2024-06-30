CREATE PROCEDURE USP_NOTAS_MAXIMAS_CADA_CURSO_POR_CICLO
    @ciclo VARCHAR(7)
AS
BEGIN
    WITH
        CURSOS_ALUMNOS_NOTAS_MAXIMAS
        AS
        (
            SELECT
                C.IdCurso AS 'CODIGO CURSO',
                C.NomCurso AS 'NOMBRE CURSO',
                MAX(M.Promedio) AS 'PROMEDIO'
            FROM Matricula M
                JOIN CursoProgramado CP ON M.IdCursoProg = CP.IdCursoProg
                JOIN Curso C ON CP.IdCurso = C.IdCurso
            WHERE CP.IdCiclo = @ciclo
            GROUP BY C.IdCurso, C.NomCurso
        ),
        ALUMNOS_MEJOR_PROMEDIO
        AS
        (
            SELECT
                A.IdAlumno,
                A.NomAlumno,
                M.Promedio,
                CP.IdCurso,
                ROW_NUMBER() OVER(PARTITION BY CP.IdCurso ORDER BY M.Promedio DESC) AS Row_Num
            FROM Matricula M
                JOIN Alumno A ON M.IdAlumno = A.IdAlumno
                JOIN CursoProgramado CP ON M.IdCursoProg = CP.IdCursoProg
            WHERE CP.IdCiclo = @ciclo
        )
    SELECT
        CNM.[CODIGO CURSO],
        CNM.[NOMBRE CURSO],
        AMP.IdAlumno AS 'CODIGO ALUMNO',
        AMP.NomAlumno AS 'NOMBRE ALUMNO',
        AMP.Promedio AS 'PROMEDIO ALUMNO',
        CNM.PROMEDIO AS 'MAXIMO CURSO'
    FROM CURSOS_ALUMNOS_NOTAS_MAXIMAS CNM
        INNER JOIN ALUMNOS_MEJOR_PROMEDIO AMP ON CNM.[CODIGO CURSO] = AMP.IdCurso AND AMP.Row_Num = 1
END
GO
EXEC USP_NOTAS_MAXIMAS_CADA_CURSO_POR_CICLO '1984-12'
DROP PROCEDURE USP_NOTAS_MAXIMAS_CADA_CURSO_POR_CICLO