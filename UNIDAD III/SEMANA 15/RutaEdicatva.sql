DROP DATABASE AcademiaRutaEducativa;
CREATE DATABASE AcademiaRutaEducativa;
GO
-- TABLES --
CREATE TABLE AcademiaRutaEducativa..Alumno
(
    idAlumno INTEGER IDENTITY,
    Nombres VARCHAR(150) NOT NULL,
    ApellidoPaterno VARCHAR (50) NOT NULL,
    ApellidoMaterno VARCHAR (50) NOT NULL,
    DNI NUMERIC (8) NOT NULL,
    Correo VARCHAR (150) NOT NULL,
    Telefono NUMERIC (9) NOT NULL
);
GO

CREATE TABLE AcademiaRutaEducativa..Profesor
(
    idProfesor INTEGER IDENTITY,
    Nombres VARCHAR (150) NOT NULL,
    ApellidoPaterno VARCHAR (50) NOT NULL,
    ApellidoMaterno VARCHAR (50) NOT NULL,
    DNI NUMERIC (8) NOT NULL,
    Telefono NUMERIC (9) NOT NULL,
    Correo VARCHAR (150) NOT NULL,
    GradoAcademico VARCHAR (20) NOT NULL,
    Profesion VARCHAR (20) NOT NULL
);
GO

CREATE TABLE AcademiaRutaEducativa..Curso
(
    idCurso INTEGER IDENTITY,
    Nombre VARCHAR(20) NOT NULL,
    Descripcion VARCHAR(200) NOT NULL
);
GO

CREATE TABLE AcademiaRutaEducativa..Curso_Programado
(
    idCurso_Programado INTEGER IDENTITY,
    idProfesor INTEGER NOT NULL,
    idCurso INTEGER NOT NULL,
    Vacantes INTEGER NOT NULL,
    CantidadMatriculados INTEGER NULL,
    PRECIO MONEY NOT NULL,
    Numero_Clases INTEGER NOT NULL
);
GO

CREATE TABLE AcademiaRutaEducativa..Matricula
(
    idMatricula INTEGER IDENTITY,
    Fecha_Matricula DATETIME NOT NULL,
    idAlumno INTEGER NOT NULL,
    idCurso_Programado INTEGER NOT NULL,
    Simulacro1 FLOAT NULL,
    Simulacro2 FLOAT NULL,
    SimulacroFinal FLOAT NULL,
    Promedio FLOAT NULL,
    Recuperación FLOAT NULL
);
GO

-- PRIMARY KEYS --
ALTER TABLE AcademiaRutaEducativa..ALUMNO
	ADD CONSTRAINT PK_ALUMNO PRIMARY KEY(idAlumno);
GO

ALTER TABLE AcademiaRutaEducativa..PROFESOR
	ADD CONSTRAINT PK_PROFESOR PRIMARY KEY(idProfesor);
GO

ALTER TABLE AcademiaRutaEducativa..CURSO
	ADD CONSTRAINT PK_CURSO PRIMARY KEY(idCurso);
GO

ALTER TABLE AcademiaRutaEducativa..CURSO_PROGRAMADO
	ADD CONSTRAINT PK_CURSO_PROGRAMADO PRIMARY KEY(idCurso_Programado);
GO

ALTER TABLE AcademiaRutaEducativa..MATRICULA
	ADD CONSTRAINT PK_MATRICULA PRIMARY KEY(idMatricula);
GO

-- FOREING KEYS --

ALTER TABLE AcademiaRutaEducativa..CURSO_PROGRAMADO
	ADD CONSTRAINT FK_CURSO_PROGRAMADO_PROFESOR FOREIGN KEY(idProfesor) REFERENCES Profesor(idProfesor),
    CONSTRAINT FK_CURSO_PROGRAMADO_CURSO FOREIGN KEY (idCurso) REFERENCES Curso(idCurso);
GO

ALTER TABLE AcademiaRutaEducativa..MATRICULA
    ADD CONSTRAINT FK_MATRICULA_ALUMNO FOREIGN KEY(idAlumno) REFERENCES Alumno(idAlumno),
    CONSTRAINT FK_MATRICULA_CURSO_PROGRAMADO FOREIGN KEY (idCurso_Programado) REFERENCES Curso_Programado(idCurso_Programado);
GO

-- CHECKS --

ALTER TABLE AcademiaRutaEducativa..Alumno
    ADD CONSTRAINT CHK_ALUMNO_NOMBRES CHECK(Nombres NOT LIKE '%[^A-Za-z]%'),
    CONSTRAINT CHK_ALUMNO_APELLIDOPATERNO CHECK(ApellidoPaterno NOT LIKE '%[^A-Za-z]%'),
    CONSTRAINT CHK_ALUMNO_APELLIDOMATERNO CHECK(ApellidoMaterno NOT LIKE '%[^A-Za-z]%'),
    CONSTRAINT CHK_ALUMNO_CORREO CHECK(Correo NOT LIKE '%@%.%');

ALTER TABLE AcademiaRutaEducativa..Profesor
    ADD CONSTRAINT CHK_PROFESOR_NOMBRES CHECK(Nombres NOT LIKE '%[^A-Za-z]%'),
    CONSTRAINT CHK_PROFESOR_APELLIDOPATERNO CHECK(ApellidoPaterno NOT LIKE '%[^A-Za-z]%'),
    CONSTRAINT CHK_PROFESOR_APELLIDOMATERNO CHECK(ApellidoMaterno NOT LIKE '%[^A-Za-z]%'),
    CONSTRAINT CHK_PROFESOR_CORREO CHECK(Correo NOT LIKE '%@%.%'),
    CONSTRAINT CHK_PROFESOR_PROFESION CHECK(Profesion NOT LIKE '%[^A-Za-z]%');
GO

ALTER TABLE AcademiaRutaEducativa..Curso
    ADD CONSTRAINT CHK_Curso_Nombre CHECK(Nombre NOT LIKE '%[^A-Za-z]%')

-- UNIQUE --
ALTER TABLE AcademiaRutaEducativa..Alumno
    ADD CONSTRAINT UQ_AUMNO_DNI UNIQUE(DNI)

ALTER TABLE AcademiaRutaEducativa..Profesor
    ADD CONSTRAINT UQ_PROFESOR_DNI UNIQUE(DNI)
GO