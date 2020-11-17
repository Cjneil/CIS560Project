CREATE OR ALTER PROCEDURE Basketball.GetHistoricalPerformances
	@TeamName1 NVARCHAR(50),
	@TeamName2 NVARCHAR(50)
AS
SELECT DISTINCT T.Name,
	SUM(CASE WHEN GT.TeamScore >
				(SELECT GTM.TeamScore
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName2
				) THEN 1
			WHEN GT.TeamScore >
				(SELECT GTM.TeamScore
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName1
				) THEN 1
			ELSE 0
			END) OVER(PARTITION BY GT.TeamId) AS Wins,

	SUM(CASE WHEN GT.TeamScore <
				(SELECT GTM.TeamScore
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName2
				) THEN 1
			WHEN GT.TeamScore <
				(SELECT GTM.TeamScore
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName1
				) THEN 1
			ELSE 0
			END) OVER(PARTITION BY GT.TeamId) AS Losses,

		CAST(SUM(CASE WHEN GT.TeamScore >
				(SELECT GTM.TeamScore
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName2
				) THEN 1
			WHEN GT.TeamScore >
				(SELECT GTM.TeamScore
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName1
				) THEN 1
			ELSE 0
			END) OVER(PARTITION BY GT.TeamId) AS FLOAT(3)) / 
		SUM(CASE WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName2
				) THEN 1
			WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName1
				) THEN 1
			ELSE 0
			END) OVER(PARTITION BY GT.TeamId) AS WinPercentage,

		CAST(SUM(CASE WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName2
				) THEN GT.TeamScore
			WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName1
				) THEN GT.TeamScore
			ELSE 0
			END) OVER(PARTITION BY GT.TeamId) AS FLOAT(3)) /
			SUM(CASE WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName2
				) THEN 1
			WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName1
				) THEN 1
			ELSE 0
			END) OVER(PARTITION BY GT.TeamId) 
			AS AveragePoints--,
	--G.Date
FROM Basketball.Team T 
	INNER JOIN Basketball.GameTeam GT ON T.TeamId = GT.TeamId
	INNER JOIN Basketball.Game G ON GT.GameId = G.GameId
WHERE (T.Name = @TeamName1 OR T.Name = @TeamName2) AND 
			-- There is a game between TeamName1 and TeamName2
			(CASE WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName2
				) THEN GT.TeamScore
			WHEN GT.TeamId <>
				(SELECT GTM.TeamId
				FROM Basketball.GameTeam GTM
					INNER JOIN Basketball.Team TM ON GTM.TeamId = TM.TeamId
				WHERE GTM.GameId = GT.GameId AND TM.Name = @TeamName1
				) THEN GT.TeamScore
			ELSE 0
		END > 0)
ORDER BY Wins DESC
GO
	
