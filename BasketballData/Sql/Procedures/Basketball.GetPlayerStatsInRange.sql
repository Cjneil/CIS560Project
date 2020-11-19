CREATE OR ALTER PROCEDURE Basketball.GetPlayerStats
	@FirstName NVARCHAR(20),
	@LastName NVARCHAR(20),
	@DateStart DATE,
	@DateEnd DATE
AS
SELECT DISTINCT T.Name AS TeamName, P.FirstName, P.LastName, 
	CAST(SUM(GP.Minutes) OVER(PARTITION BY P.PlayerId) AS FLOAT(3)) / COUNT(GP.PlayerId) OVER(PARTITION BY GP.PlayerId) AS MinutesPerGame, 
	CAST(SUM(GP.Points) OVER(PARTITION BY P.PlayerId) AS FLOAT(3)) / COUNT(GP.PlayerId) OVER(PARTITION BY GP.PlayerId) AS PointsPerGame, 
	CAST(SUM(GP.Assists) OVER(PARTITION BY P.PlayerId) AS FLOAT(3)) / COUNT(GP.PlayerId) OVER(PARTITION BY GP.PlayerId) AS AssistsPerGame, 
	CAST(SUM(GP.Rebounds) OVER(PARTITION BY P.PlayerId) AS FLOAT(3)) / COUNT(GP.PlayerId) OVER(PARTITION BY GP.PlayerId) AS ReboundsPerGame,
	CAST(SUM(GP.Steals) OVER(PARTITION BY P.PlayerId) AS FLOAT(3)) / COUNT(GP.PlayerId) OVER(PARTITION BY GP.PlayerId) AS StealsPerGame,
	CAST(SUM(GP.Blocks) OVER(PARTITION BY P.PlayerId) AS FLOAT(3)) / COUNT(GP.PlayerId) OVER(PARTITION BY GP.PlayerId) AS BlocksPerGame,
	CAST(SUM(GP.Turnovers) OVER(PARTITION BY P.PlayerId) AS FLOAT(3)) / COUNT(GP.PlayerId) OVER(PARTITION BY GP.PlayerId) AS TurnoversPerGame
FROM Basketball.Player P
	INNER JOIN Basketball.GamePlayer GP ON P.PlayerId = GP.PlayerId AND P.TeamId = GP.TeamId
	INNER JOIN Basketball.GameTeam GT ON GP.TeamId = GT.TeamId AND GT.GameTeamId = GP.GameTeamId
	INNER JOIN Basketball.Game G ON GT.GameId = G.GameId
	INNER JOIN Basketball.Team T ON T.TeamId = P.TeamId
WHERE G.Date BETWEEN @DateStart AND @DateEnd AND P.FirstName = @FirstName AND P.LastName = @LastName
GO

--EXEC Basketball.GetPlayerStats @FirstName = N'Devon', @LastName = N'Dotson', @DateStart = N'2020-01-01', @DateEnd = N'2020-03-31'
