
CREATE OR ALTER FUNCTION dbo.ObtenerNombreEncuesta(@IdEncuesta int)
RETURNS varchar(50)
AS
BEGIN

	DECLARE @titulo  varchar(50)

	select @Titulo = Titulo 
	from dbo.Encuesta
	WHERE EncuestaID = @IdEncuesta

	RETURN @Titulo
END
GO

select * from dbo.Encuestados
GO

CREATE OR ALTER FUNCTION dbo.ObtenerNombreEncuestado(@IdEncuestado int)
RETURNS varchar(50)
AS
BEGIN

	DECLARE @Nombre  varchar(50)

	select @Nombre = CONCAT(Nombre, ApellidoPaterno, ApellidoMaterno) 
	from dbo.Encuestados
	WHERE EncuestadoID = @IdEncuestado

	RETURN @Nombre
END