SELECT
    EXPEDIENTE.IDEXPEDIENTE
      , EXPEDIENTE.IDCLIENTE
      , EXPEDIENTE.FECHAINICIO
      , EXPEDIENTE.FECHAFINALIZACION
      , EXPEDIENTE.IDESTADO,
      ESTADO.NOMBRE
FROM BDJURIDICO..EXPEDIENTE
    JOIN BDJURIDICO..ESTADO ON EXPEDIENTE.IDESTADO = ESTADO.IDESTADO
    WHERE ESTADO.NOMBRE = 'archivado';
GO