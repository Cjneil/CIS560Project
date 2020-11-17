CREATE OR ALTER PROCEDURE Basketball.CreateSeason
   @YearRange NVARCHAR(10)
AS

INSERT Basketball.Season(YearRange)
VALUES(@YearRange);
GO
