CREATE OR ALTER PROCEDURE Basketball.RetrieveSeasons
AS

SELECT S.SeasonId, S.YearRange
FROM Basketball.Season S
GO
