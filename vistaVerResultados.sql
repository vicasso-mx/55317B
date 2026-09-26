USE PulsoLAB;
GO

CREATE VIEW dbo.VerResultados
AS
SELECT enc.Titulo
, CONCAT(e.Nombre, N' ', e.ApellidoPaterno, N' ', e.ApellidoMaterno ) AS Persona
, q.Numero
, q.Texto
, o.Etiqueta AS Respuesta
, p.FechaRespuesta
FROM dbo.Encuesta AS enc
INNER JOIN dbo.Participacion AS p ON p.EncuestaID = enc.EncuestaID
INNER JOIN dbo.Encuestados AS e ON e.EncuestadoID = p.EncuestadoID
INNER JOIN dbo.Respuesta AS r ON r.ParticipacionID = p.ParticipacionID
INNER JOIN dbo.Pregunta AS q ON q.PreguntaID = r.PreguntaID
INNER JOIN dbo.OpcionRespuesta AS o ON o.OpcionID = r.OpcionID
GO



USE PulsoLAB;
GO


SELECT * FROM dbo.VerResultados
WHERE 
	Titulo = 'Conectividad digital' 
	AND Persona = DBO.ObtenerNombreEncuestado(15)
ORDER BY Numero


SELECT DBO.ObtenerNombreEncuestado(26)

SELECT DISTINCT Titulo, DBO.ObtenerNombreEncuestado(15) 
FROM dbo.VerResultados


SELECT DISTINCT Titulo, DBO.ObtenerNombreEncuestado(203) 
FROM dbo.VerResultados

