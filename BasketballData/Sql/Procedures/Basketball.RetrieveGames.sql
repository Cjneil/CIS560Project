CREATE OR ALTER PROCEDURE Basketball.RetrieveGames
AS

SELECT G.GameId as GameId, G.SeasonId as SeasonId, G.Neutral as Neutral, G.Date as Date
FROM Basketball.Game G;
GO
