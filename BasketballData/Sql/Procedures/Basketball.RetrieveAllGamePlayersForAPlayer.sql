CREATE OR ALTER PROCEDURE Basketball.RetrieveAllGamePlayersForAPlayer
	@FirstName NVARCHAR(20),
	@LastName NVARCHAR(20)
AS
SELECT G.Date, T.Name AS TeamName, O.Name AS OpponentTeamName, GP.Minutes, GP.Points, GP.Assists, GP.Rebounds, GP.Steals, GP.Blocks, GP.Turnovers
FROM Basketball.GamePlayer GP
	INNER JOIN Basketball.Player P ON GP.PlayerId = P.PlayerId
	INNER JOIN Basketball.GameTeam GT ON GT.GameTeamId = GP.GameTeamId
	INNER JOIN Basketball.Game G ON GT.GameId = G.GameId
	INNER JOIN Basketball.Team T ON GT.TeamId = T.TeamId
	INNER JOIN Basketball.GameTeam GT2 ON GT2.GameId = GT.GameId
		AND GT2.TeamId <> GT.TeamId
	INNER JOIN Basketball.Team O ON GT2.TeamId = O.TeamId
WHERE P.FirstName = @FirstName AND P.LastName = @LastName
ORDER BY G.Date 
GO
--EXEC Basketball.RetrieveAllGamePlayersForAPlayer @FirstName = N'Xavier', @LastName = N'Sneed'