USE PulsoLAB;
GO

CREATE VIEW dbo.VerPreguntasYRespuestas
AS
SELECT enc.Titulo, CONCAT(e.Nombre, N' ', e.ApellidoPaterno) AS Persona,
       q.Numero, q.Texto, o.Etiqueta AS Respuesta
FROM dbo.Encuesta AS enc
INNER JOIN dbo.Participacion AS p ON p.EncuestaID = enc.EncuestaID
INNER JOIN dbo.Encuestados AS e ON e.EncuestadoID = p.EncuestadoID
INNER JOIN dbo.Respuesta AS r ON r.ParticipacionID = p.ParticipacionID
INNER JOIN dbo.Pregunta AS q ON q.PreguntaID = r.PreguntaID
INNER JOIN dbo.OpcionRespuesta AS o ON o.OpcionID = r.OpcionID
GO

