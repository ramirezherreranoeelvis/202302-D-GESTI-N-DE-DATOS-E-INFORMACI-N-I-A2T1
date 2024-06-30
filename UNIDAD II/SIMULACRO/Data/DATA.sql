USE BDJURIDICO;
GO
--INSERTAR ESTADOS
INSERT INTO ESTADO
    (NOMBRE)
VALUES
    ('Trámite'),
    ('Archivado'),
    ('CERRADO')
;
GO
INSERT INTO CLIENTE
    (DNI, NOMBRE, DIRECCION, CORREO)
VALUES
    (12344322, 'Lorena Torres 2', 'Calle 222', 'lorena2@example.com'),
    (67890124, 'Fernando Martinez 2', 'Avenida 333', 'fernando2@example.com'),
    (87654323, 'Rosa Rodriguez 2', 'Calle 444', 'rosa2@example.com'),
    (12344322, 'Lorena Torres 2', 'Calle 222', 'lorena2@example.com'),
    (67890124, 'Fernando Martinez 2', 'Avenida 333', 'fernando2@example.com'),
    (87654323, 'Rosa Rodriguez 2', 'Calle 444', 'rosa2@example.com'),
    (12344321, 'Lorena Torres 2', 'Calle 222', 'lorena2@example.com'),
    (67890123, 'Fernando Martinez 2', 'Avenida 333', 'fernando2@example.com'),
    (87654322, 'Rosa Rodriguez 2', 'Calle 444', 'rosa2@example.com'),
    (11111111, 'Lorena Torres', 'Calle 222', 'lorena2@example.com'),
    (22222222, 'Fernando Martinez', 'Avenida 333', 'fernando2@example.com'),
    (33333333, 'Rosa Rodriguez', 'Calle 444', 'rosa2@example.com'),
    (44444444, 'Patricia López', 'Avenida 555', 'patricia2@example.com'),
    (55555555, 'Santiago González', 'Calle 666', 'santiago2@example.com');

-- Insertar datos en la tabla EXPEDIENTE con valores válidos en la columna IDCLIENTE
INSERT INTO EXPEDIENTE
    (IDCLIENTE, FECHAINICIO, FECHAFINALIZACION, IDESTADO)
VALUES
    (11, '2023-01-15', '2023-02-28', 1),
    (12, '2023-02-01', '2023-03-15', 2),
    (13, '2023-03-10', '2023-04-20', 1),
    (14, '2023-04-05', '2023-05-10', 1),
    (15, '2023-05-01', '2023-06-30', 1),
    (16, '2023-06-15', '2023-07-30', 2),
    (17, '2023-07-20', '2023-08-10', 1),
    (18, '2023-08-01', '2023-09-25', 2),
    (19, '2023-09-10', '2023-10-15', 1),
    (20, '2023-10-05', '2023-11-20', 2),
    (21, '2023-10-05', '2023-10-15', 1),
    (22, '2023-10-05', '2023-10-15', 2),
    (23, '2023-10-05', '2023-10-15', 1),
    (11, '2023-01-15', '2023-02-28', 1),
    (12, '2023-02-01', '2023-03-15', 2),
    (13, '2023-03-10', '2023-04-20', 1),
    (14, '2023-04-05', '2023-05-10', 1),
    (15, '2023-05-01', '2023-06-30', 1),
    (16, '2023-06-15', '2023-07-30', 2),
    (17, '2023-07-20', '2023-08-10', 1),
    (18, '2023-08-01', '2023-09-25', 2),
    (19, '2023-09-10', '2023-10-15', 1),
    (20, '2023-10-05', '2023-11-20', 2),
    (21, '2023-10-05', '2023-10-15', 1),
    (22, '2023-10-05', '2023-10-15', 2),
    (23, '2023-10-05', '2023-10-15', 1),
    (16, '2023-10-05', '2023-10-15', 1),
    (17, '2023-10-06', '2023-10-16', 1),
    (18, '2023-10-07', '2023-10-17', 2),
    (19, '2023-10-08', '2023-10-18', 1),
    (20, '2023-10-09', '2023-10-19', 2),
    (20, '2023-10-09', '2023-10-19', 3),
    (4, '2023-10-05', '2023-10-15', 3),
    (4, '2023-10-07', '2023-10-17', 3),
    (17, '2023-10-06', '2023-10-16', 3),
    (2, '2023-10-08', '2023-10-18', 3),
    (3, '2023-10-09', '2023-10-19', 3);

-- Insertar datos en la tabla ACTIVIDAD
INSERT INTO ACTIVIDAD
    (IDEXPEDIENTE, NOMBREACTIVIDAD, FECHA)
VALUES
    (11, 'Revisión de documentos', '2023-10-06'),
    (12, 'Entrevistas con el cliente', '2023-10-07'),
    (13, 'Investigación de antecedentes', '2023-10-08'),
    (14, 'Preparación de informe', '2023-10-09'),
    (15, 'Reunión con abogados', '2023-10-10'),
    (16, 'Presentación de documentos legales', '2023-10-11'),
    (17, 'Entrevistas con testigos', '2023-09-01'),
    (18, 'Preparación para juicio', '2023-09-02'),
    (19, 'Revisión final del caso', '2023-09-03'),
    (20, 'Cierre del expediente', '2023-09-04'),
    (11, 'Revisión de documentos', '2023-10-06'),
    (12, 'Entrevistas con el cliente', '2023-10-07'),
    (13, 'Investigación de antecedentes', '2023-10-08'),
    (14, 'Preparación de informe', '2023-10-09'),
    (15, 'Reunión con abogados', '2023-10-10'),
    (16, 'Presentación de documentos legales', '2023-10-11'),
    (17, 'Entrevistas con testigos', '2023-09-01'),
    (18, 'Preparación para juicio', '2023-09-02'),
    (19, 'Revisión final del caso', '2023-09-03'),
    (20, 'Cierre del expediente', '2023-09-04'),
    (18, 'Entrevista con el cliente', '2023-10-06'),
    (19, 'Revisión de documentos', '2023-10-08'),
    (20, 'Reunión con abogados', '2023-10-10'),
    (16, 'Preparación de informe', '2023-10-12'),
    (17, 'Presentación de documentos legales', '2023-10-14'),
    (3, 'Entrevista con el cliente', '2023-10-06'),
    (3, 'Revisión de documentos', '2023-10-08'),
    (3, 'Reunión con abogados', '2023-10-10'),
    (3, 'Preparación de informe', '2023-10-12'),
    (3, 'Presentación de documentos legales', '2023-10-14');
GO