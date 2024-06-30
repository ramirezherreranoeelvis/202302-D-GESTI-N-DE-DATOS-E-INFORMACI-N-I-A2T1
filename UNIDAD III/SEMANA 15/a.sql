CREATE PROCEDURE USP_REPORTE
    @ID_ESTUDIANTE INT
AS
BEGIN
    SELECT
    A.idAlumno,
    A.Nombres+' '+A.ApellidoPaterno+' '+A.ApellidoMaterno AS 'NOMBRES ALUMNO',
    A.DNI AS 'DNI ALUMNO',
    C.Nombre AS 'NOMBRE CURSO',
    P.idProfesor,
    P.Nombres+' '+P.ApellidoPaterno+' '+P.ApellidoMaterno AS 'NOMBRES PROFESOR',
    P.DNI AS 'DNI PROFESOR',
    M.Simulacro1,
    M.Simulacro2,
    M.SimulacroFinal,
    M.Promedio,
    M.Recuperación
    FROM ALUMNO A
    JOIN MATRICULA M ON A.idAlumno = M.idAlumno
    JOIN Curso_Programado CP ON M.idCurso_Programado = CP.idCurso_Programado
    JOIN Curso C ON CP.idCurso = C.idCurso
    JOIN Profesor P ON CP.idProfesor = P.idProfesor
    WHERE A.idAlumno = @ID_ESTUDIANTE
END
GO
