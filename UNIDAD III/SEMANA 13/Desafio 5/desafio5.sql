CREATE PROCEDURE USP_MATRICULAS
    @idCursoPro int,
    @idAlumno char(5),
    @ExaParcial NUMERIC(4,2) NULL,
    @ExaFinal NUMERIC(4,2) NULL,
    @Promedio NUMERIC(4,2)NULL,
    @Subsanacion NUMERIC(1),
    @ExaSub NUMERIC(4,2)NULL
AS
BEGIN
    DECLARE @FecMatricula DATETIME = GETDATE();
    INSERT INTO Matricula
        (IdCursoProg, IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio,Subsanacion,ExaSub)
    VALUES
        (@idCursoPro, @idAlumno, @FecMatricula, @ExaParcial, @ExaFinal, @Promedio, @Subsanacion, @ExaSub);
END
GO

EXEC USP_MATRICULAS 5,'A0002', null,null,null,0,null
GO

SELECT
    m.IdCursoProg, m.IdAlumno, m.Subsanacion
FROM Matricula m
where m.IdAlumno = 'A0002';
GO

DELETE FROM Matricula where IdAlumno = 'A0002' and IdCursoProg = 5;
GO