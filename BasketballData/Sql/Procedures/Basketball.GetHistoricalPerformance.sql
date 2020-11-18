CREATE OR ALTER PROCEDURE Basketball.GetHistoricalPerformances
	@TeamName1 NVARCHAR(50),
	@TeamName2 NVARCHAR(50)
AS
WITH TeamCTE(TeamId, Name, Wins, GameCount, TotalPoints) 
AS 
(
	SELECT T.TeamId, T.Name,
	SUM(CASE
		WHEN GT.TeamScore > GT2.TeamScore THEN 1
		ELSE 0
	END) AS Wins,
	COUNT(*) AS GameCount,
	SUM(GT.TeamScore) AS TotalPoints
	FROM Basketball.Team T
		INNER JOIN Basketball.GameTeam GT ON T.TeamId = GT.TeamId
		INNER JOIN Basketball.GameTeam GT2 ON GT2.GameId = GT.GameId
			AND GT2.TeamId <> GT.TeamId
		INNER JOIN Basketball.Team O ON GT2.TeamId = O.TeamId
	WHERE (T.Name = @TeamName1 AND O.Name = @TeamName2) OR (O.Name = @TeamName1 AND T.Name = @TeamName2)
	GROUP BY T.TeamId, T.Name
) 
SELECT T.TeamId, T.Name, T.Wins, T.GameCount - T.Wins AS Losses, 
	1.0 * T.Wins / T.GameCount AS WinPercentage, 
	1.0 * T.TotalPoints / T.GameCount AS AveragePoints
FROM TeamCTE T
ORDER BY WinPercentage DESC
GO

--EXEC Basketball.GetHistoricalPerformances @TeamName1 = N'University of Kansas', @TeamName2 = N'Baylor University'

	
