CREATE OR ALTER PROCEDURE Basketball.RetrievePlayers
AS

SELECT P.PlayerId, P.TeamId, P.FirstName, P.LastName, P.Position
FROM Basketball.Player P;
GO
