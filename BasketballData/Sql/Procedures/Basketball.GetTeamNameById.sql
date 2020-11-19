CREATE OR ALTER PROCEDURE Basketball.CreateGame
   @TeamId INT
AS

SELECT T.Name
FROM Basketball.Team T
WHERE T.TeamId = @TeamId
GO