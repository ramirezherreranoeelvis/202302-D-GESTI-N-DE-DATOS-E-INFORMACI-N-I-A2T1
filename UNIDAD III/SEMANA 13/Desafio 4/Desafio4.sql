CREATE PROCEDURE USP_CALCULAR_POTENCIA
    @base float,
    @exponente float,
    @potencia float OUT
AS
BEGIN
    SET @potencia = POWER(@base, @exponente);
END
GO

DECLARE @potencia FLOAT
EXEC USP_CALCULAR_POTENCIA 3, 3, @potencia out
SELECT @potencia as Potencia
DROP USP_CALCULAR_POTENCIA