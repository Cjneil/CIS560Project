CREATE OR ALTER PROCEDURE Basketball.RetrieveAllGameTeamsForATeam
	@TeamName NVARCHAR(50)
AS
SELECT G.Date, T.Name, GT.TeamScore, O.Name AS OpponentName, GT2.TeamScore AS OpponentScore, GT.TeamTypeId
FROM Basketball.Team T
	INNER JOIN Basketball.GameTeam GT ON GT.TeamId = T.TeamId
	INNER JOIN Basketball.Game G ON GT.GameId = G.GameId
	INNER JOIN Basketball.GameTeam GT2 ON GT.GameId = GT2.GameId
		AND GT.TeamId <> GT2.TeamId
	INNER JOIN Basketball.Team O ON GT2.TeamId = O.TeamId
WHERE T.Name = @TeamName
ORDER BY G.Date 
GO
--EXEC Basketball.RetrieveAllGameTeamsForATeam @TeamName = N'Baylor University'