-- RESTRICCION PRIMARY KEY --
USE BDJURIDICO;
GO

-- EXPEDIENTE --
ALTER TABLE EXPEDIENTE
ADD CONSTRAINT PK_EXPEDIENTE PRIMARY KEY (IDEXPEDIENTE);
GO


-- CLIENTE --
ALTER TABLE CLIENTE
    ADD CONSTRAINT PK_CLIENTE PRIMARY KEY(IDCLIENTE);
GO


-- ESTADO --
ALTER TABLE ESTADO
    ADD CONSTRAINT PK_ESTADO PRIMARY KEY(IDESTADO);
GO


-- ACTIVIDAD --
ALTER TABLE ACTIVIDAD
    ADD CONSTRAINT PK_ACTIVIDAD PRIMARY KEY(IDACTIVIDAD);
GO