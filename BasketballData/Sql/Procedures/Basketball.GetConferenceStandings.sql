CREATE OR ALTER PROCEDURE Basketball.GetConferenceStandings
	@ConferenceNickname NVARCHAR(10),
	@YearRange NVARCHAR(10)
AS
WITH ConferenceCTE(TeamName, Wins, GameCount) 
AS 
(
	SELECT T.Name,
	SUM(CASE
		WHEN GT.TeamScore > GT2.TeamScore THEN 1
		ELSE 0
	END) AS Wins,
	COUNT(*) AS GameCount
	FROM Basketball.Conference C
		INNER JOIN Basketball.Team T ON C.ConferenceId = T.ConferenceId
		INNER JOIN Basketball.GameTeam GT ON T.TeamId = GT.TeamId
		INNER JOIN Basketball.GameTeam GT2 ON GT2.GameId = GT.GameId
			AND GT2.TeamId <> GT.TeamId
		INNER JOIN Basketball.Team O ON GT2.TeamId = O.TeamId
		INNER JOIN Basketball.Conference OC ON O.ConferenceId = OC.ConferenceId
		INNER JOIN Basketball.Game G ON GT.GameId = G.GameId
		INNER JOIN Basketball.Season S ON G.SeasonId = S.SeasonId
	WHERE C.Nickname = @ConferenceNickname AND OC.Nickname = @ConferenceNickname AND S.YearRange = @YearRange
	GROUP BY T.TeamId, T.Name
) 
SELECT C.TeamName as TeamName, C.Wins As Wins, C.GameCount - C.Wins AS Losses, 
	1.0 * C.Wins / C.GameCount AS WinPercentage
FROM ConferenceCTE C
ORDER BY WinPercentage DESC, Wins DESC
GO

--EXEC Basketball.GetConferenceStandings @ConferenceNickName = N'Big 12', @YearRange = N'2019-20'