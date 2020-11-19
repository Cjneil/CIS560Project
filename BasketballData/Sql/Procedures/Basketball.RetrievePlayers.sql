CREATE OR ALTER PROCEDURE Basketball.RetrievePlayers
AS

SELECT P.PlayerId, T.Name AS Name, P.FirstName, P.LastName, P.Position
FROM Basketball.Player P
	INNER JOIN Basketball.Team T ON T.TeamId = P.TeamId
ORDER BY P.LastName ASC
GO
