CREATE OR ALTER PROCEDURE Basketball.RetrieveAllGamePlayersForAPlayer
	@FirstName NVARCHAR(20),
	@LastName NVARCHAR(20)
AS
SELECT G.Date, T.Name AS TeamName, GP.Minutes, GP.Points, GP.Assists, GP.Rebounds, GP.Steals, GP.Blocks, GP.Turnovers
FROM Basketball.GamePlayer GP
	INNER JOIN Basketball.Player P ON GP.PlayerId = P.PlayerId
	INNER JOIN Basketball.GameTeam GT ON GT.GameTeamId = GP.GameTeamId
	INNER JOIN Basketball.Game G ON GT.GameId = G.GameId
	INNER JOIN Basketball.Team T ON GT.TeamId = T.TeamId
WHERE P.FirstName = @FirstName AND P.LastName = @LastName
ORDER BY G.Date 
GO

--EXEC Basketball.RetrieveAllGamePlayersForAPlayer @FirstName = N'Xavier', @LastName = N'Sneed'