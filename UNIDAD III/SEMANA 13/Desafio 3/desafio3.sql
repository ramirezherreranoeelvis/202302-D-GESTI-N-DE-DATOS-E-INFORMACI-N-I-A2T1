CREATE PROCEDURE USP_TABLA_MULTIPLICAR
    @NUMBER FLOAT,
    @QUANTITY INT
AS
BEGIN
    -- variables:
    DECLARE @i int = 0;
    -- procces:
    WHILE @i < @QUANTITY
    BEGIN
        SET @i = @i + 1
        DECLARE @PRODUCT FLOAT = @i * @NUMBER
        PRINT concat(@NUMBER, ' x ', @i, '=', @PRODUCT)
    END
END
GO
EXEC USP_TABLA_MULTIPLICAR 5,20