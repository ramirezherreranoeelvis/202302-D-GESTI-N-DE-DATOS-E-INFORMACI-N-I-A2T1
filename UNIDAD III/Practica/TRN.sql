ALTER PROCEDURE usp_crea_cuenta
    (
    @cliente CHAR(5),
    @moneda CHAR(2),
    @importe MONEY,
    @clave CHAR(6),
    @empleado CHAR(4),
    @estado INT OUT,
    @mensaje VARCHAR(1000) OUT
)
AS
BEGIN
    DECLARE @sucursal CHAR(3);
    DECLARE @cont INT;
    DECLARE @cuenta CHAR(8);
    BEGIN TRY
	-- Inicio de TX
	BEGIN TRANSACTION;
        
        -- Obtener sucursal
        SELECT @sucursal = chr_sucucodigo FROM asignado 
        WHERE chr_emplcodigo = @empleado AND dtt_asigfechabaja IS NULL;
        
        -- Contador de cientas
        UPDATE sucursal 
        SET int_sucucontcuenta = int_sucucontcuenta + 1
        WHERE chr_sucucodigo = @sucursal;

        SELECT @cont = int_sucucontcuenta FROM sucursal
        WHERE chr_sucucodigo = @sucursal;

        SET @cuenta = RIGHT('000000' + CAST(@cont AS VARCHAR(6)), 5);
        SET @cuenta = @sucursal + @cuenta;
        
        -- Insertar la cuenta
        insert into cuenta
            (
                chr_cuencodigo,
                chr_monecodigo,
                chr_sucucodigo,
                chr_emplcreacuenta,
                chr_cliecodigo,
                dec_cuensaldo,
                dtt_cuenfechacreacion,
                vch_cuenestado,
                int_cuencontmov,
                chr_cuenclave
            )
        values
        (
            @cuenta, 
            @moneda, 
            @sucursal, 
            @empleado, 
            @cliente, 
            @importe, 
            getdate(), 
            'ACTIVO', 
            1, 
            @clave
        );
        
        -- Registrar movimiento
        insert into movimiento
        ( chr_cuencodigo,
int_movinumero,
            dtt_movifecha,
            chr_emplcodigo,
            chr_tipocodigo,
            dec_moviimporte
        )
        values
        (
            @cuenta,
            1,
            getdate(),
            @empleado,
            '001',
            @importe
        );
        -- Confirmar TX
	COMMIT;
	set @estado = 1;
	set @mensaje = 'Proceso completado.';
END TRY
BEGIN CATCH
	ROLLBACK;
	set @estado = -1;
	set @mensaje = 'Error en el proceso.';
END CATCH;
end;
GO

SELECT * FROM cuenta;
GO

SELECT * FROM movimiento;
GO

declare @estado int, @mensaje varchar(1000);
exec usp_crea_cuenta '00006', '01', 5000.0, '123456','0006', @estado out, @mensaje out;
select @estado, @mensaje;
GO