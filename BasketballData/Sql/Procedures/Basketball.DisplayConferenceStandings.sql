CREATE OR ALTER PROCEDURE Basketball.RetrieveConferenceStandings
	@ConferenceNickname NVARCHAR(10),
	@YearRange NVARCHAR(10)
AS
SELECT DISTINCT T.Name, C.Nickname, S.YearRange,
	SUM(IIF(GT.TeamScore > 
			(SELECT GTM.TeamScore
			FROM Basketball.GameTeam GTM
			WHERE GTM.TeamId <> GT.TeamID AND GTM.GameId = GT.GameId
		), 1, 0
	)) OVER(Partition by GT.TeamId, S.SeasonId ORDER BY GT.TeamId) AS Wins,
	SUM(IIF(GT.TeamScore < 
			(SELECT GTM.TeamScore
			FROM Basketball.GameTeam GTM
			WHERE GTM.TeamId <> GT.TeamID AND GTM.GameId = GT.GameId
		), 1, 0
	)) OVER(Partition by GT.TeamId, S.SeasonId ORDER BY GT.TeamId) AS Losses,
	CAST(CAST(SUM(IIF(GT.TeamScore > 
			(SELECT GTM.TeamScore
			FROM Basketball.GameTeam GTM
			WHERE GTM.TeamId <> GT.TeamID AND GTM.GameId = GT.GameId
		), 1, 0
	)) OVER(Partition by GT.TeamId, S.SeasonId ORDER BY GT.TeamId) AS DECIMAL(4,3)) / COUNT(GT.GameId) OVER(PARTITION BY T.TeamId) AS DECIMAL(4, 3)) AS WinPercentage
FROM Basketball.GameTeam GT
	INNER JOIN Basketball.Team T ON GT.TeamId = T.TeamId
	INNER JOIN Basketball.Conference C ON T.ConferenceId = C.ConferenceId
	INNER JOIN Basketball.Game G ON G.GameId = GT.GameId
	INNER JOIN Basketball.Season S ON S.SeasonId = G.SeasonId
WHERE C.Nickname = @ConferenceNickname AND S.YearRange = @YearRange
ORDER BY Wins DESC
GO