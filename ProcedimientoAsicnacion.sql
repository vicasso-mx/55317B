USE PulsoLAB;
GO

CREATE PROCEDURE dbo.AsignarEncuesta 
@IdEncuesta AS INT,
@IdEncuestado AS INT
AS
BEGIN TRY
	BEGIN TRAN

		IF NOT EXISTS (SELECT 1 FROM DBO.Encuesta WHERE EncuestaID = @IdEncuesta)
			THROW 51010, 'La encuesta no existe', 1
		ELSE
			PRINT 'La encuesta fue encontrada'

		IF NOT EXISTS (SELECT 1 FROM DBO.Encuestados WHERE EncuestadoID = @IdEncuesta)
			THROW 51011, 'El encuestado no existe', 1
		ELSE
			PRINT 'El encuestado fue encontrado'

		IF NOT EXISTS (SELECT 1 FROM DBO.Participacion where EncuestaID = @IdEncuesta and EncuestadoID = @IdEncuestado)
			PRINT 'La asignación entre encuesta y encuestado no existe'
		ELSE
			THROW 51012, 'La asignación entre encuesta y encuestado fue encontrada', 1

		INSERT INTO dbo.Participacion (EncuestaID, EncuestadoID)
		VALUES (@IdEncuesta, @IdEncuestado)

	COMMIT TRAN
	PRINT 'se registró la encuesta correctamente'	
END TRY
BEGIN CATCH
	
	IF @@TRANCOUNT > 0
		ROLLBACK TRAN

	PRINT ERROR_MESSAGE()
	
END CATCH
GO

