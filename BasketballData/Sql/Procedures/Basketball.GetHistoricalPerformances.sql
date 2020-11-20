CREATE OR ALTER PROCEDURE Basketball.GetHistoricalPerformances
	@TeamName1 NVARCHAR(50),
	@TeamName2 NVARCHAR(50)
AS
WITH TeamCTE(TeamId, Name, OppName, Wins, GameCount, TotalPoints, TotalPointsOpp) 
AS 
(
	SELECT T.TeamId, T.Name, O.Name as OppName,
	SUM(CASE
		WHEN GT.TeamScore > GT2.TeamScore THEN 1
		ELSE 0
	END) AS Wins,
	COUNT(*) AS GameCount,
	SUM(GT.TeamScore) AS TotalPoints,
	SUM(GT2.TeamScore) AS TotalPointsOpp
	FROM Basketball.Team T
		INNER JOIN Basketball.GameTeam GT ON T.TeamId = GT.TeamId
		INNER JOIN Basketball.GameTeam GT2 ON GT2.GameId = GT.GameId
			AND GT2.TeamId <> GT.TeamId
		INNER JOIN Basketball.Team O ON GT2.TeamId = O.TeamId
	WHERE (T.Name = @TeamName1 AND O.Name = @TeamName2)
	GROUP BY T.TeamId, T.Name, O.Name
) 
SELECT T.TeamId as TeamId, T.Name as Name, T.OppName as OppName, T.Wins as Wins, T.GameCount - T.Wins AS Losses, 
	1.0 * T.Wins / T.GameCount AS WinPercentage, 
	1.0 * T.TotalPoints / T.GameCount AS AveragePoints,
	1.0 * T.TotalPointsOpp / T.GameCount AS AveragePointsOpp
FROM TeamCTE T
ORDER BY WinPercentage DESC
GO

--EXEC Basketball.GetHistoricalPerformances @TeamName1 = N'University of Kansas', @TeamName2 = N'Baylor University'

	
