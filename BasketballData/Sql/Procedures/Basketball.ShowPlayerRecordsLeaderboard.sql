CREATE OR ALTER PROCEDURE Basketball.ShowPlayerRecordsLeaderboard
	@ConferenceNickname NVARCHAR(50),
	@StatisticChosen NVARCHAR(15),
	@TopN INT
AS
SELECT DISTINCT TOP(@TopN) T.Name, P.FirstName, P.LastName,
	CASE
		WHEN @StatisticChosen = N'Minutes' THEN SUM(GP.Minutes) OVER(PARTITION BY GP.PlayerId)
		WHEN @StatisticChosen = N'Points' THEN SUM(GP.Points) OVER(PARTITION BY GP.PlayerId)
		WHEN @StatisticChosen = N'Assists' THEN SUM(GP.Assists) OVER(PARTITION BY GP.PlayerId)
		WHEN @StatisticChosen = N'Rebounds' THEN SUM(GP.Rebounds) OVER(PARTITION BY GP.PlayerId)
		WHEN @StatisticChosen = N'Steals' THEN SUM(GP.Steals) OVER(PARTITION BY GP.PlayerId)
		WHEN @StatisticChosen = N'Blocks' THEN SUM(GP.Blocks) OVER(PARTITION BY GP.PlayerId)
		WHEN @StatisticChosen = N'Turnovers' THEN SUM(GP.Turnovers) OVER(PARTITION BY GP.PlayerId)
	END AS StatisticChosen
FROM Basketball.Conference C
	INNER JOIN Basketball.Team T ON C.ConferenceId = T.ConferenceId
	INNER JOIN Basketball.Player P ON T.TeamId = P.TeamId
	INNER JOIN Basketball.GamePlayer GP ON P.PlayerId = GP.PlayerId
WHERE C.Nickname = @ConferenceNickname
ORDER BY StatisticChosen DESC
GO

--EXEC Basketball.ShowConferenceStatisticLeaderboard @ConferenceNickname = N'Big 12', @StatisticChosen = N'Points', @TopN = 5