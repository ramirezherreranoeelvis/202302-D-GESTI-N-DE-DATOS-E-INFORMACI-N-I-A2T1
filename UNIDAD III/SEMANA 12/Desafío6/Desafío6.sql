SELECT
 CP.IdCursoProg AS 'ID',
 C.NomCurso AS 'NOMBRE CURSO',
 M.IdAlumno AS 'CODIGO ALUMNO',
 A.NomAlumno AS 'NOMBRE ALUMNO',
 M.ExaParcial AS 'EXAMEN PARCIAL',
 M.ExaFinal AS 'EXAMEN FINAL',
 M.Subsanacion AS 'EXAMEN SUBNACION',
 M.Promedio AS 'PROMEDIO'
FROM CursoProgramado CP
JOIN CURSO C ON CP.IdCurso = C.IdCurso
JOIN Matricula M ON CP.IdCursoProg = M.IdCursoProg
JOIN Alumno A ON M.IdAlumno = A.IdAlumno
WHERE CP.IdCursoProg = 22
GO

CREATE PROCEDURE USP_CONSULTA_ESTUDIANTES_DE_CURSO
(@ID_CursoProgramado int)
AS
BEGIN
    SELECT
        CP.IdCursoProg AS 'ID',
        C.NomCurso AS 'NOMBRE CURSO',
        M.IdAlumno AS 'CODIGO ALUMNO',
        A.NomAlumno AS 'NOMBRE ALUMNO',
        M.ExaParcial AS 'EXAMEN PARCIAL',
        M.ExaFinal AS 'EXAMEN FINAL',
        M.Subsanacion AS 'EXAMEN SUBNACION',
        M.Promedio AS 'PROMEDIO'
    FROM CursoProgramado CP
    JOIN CURSO C ON CP.IdCurso = C.IdCurso
    JOIN Matricula M ON CP.IdCursoProg = M.IdCursoProg
    JOIN Alumno A ON M.IdAlumno = A.IdAlumno
    WHERE @ID_CursoProgramado = CP.IdCursoProg;
END;
GO

EXEC USP_CONSULTA_ESTUDIANTES_DE_CURSO 2