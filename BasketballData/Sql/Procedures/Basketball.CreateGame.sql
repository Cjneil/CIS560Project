CREATE OR ALTER PROCEDURE Basketball.CreateGame
   @GameId INT,
   @SeasonId INT,
   @Neutral BIT,
   @Date DATE,
   @CreatedOn DATETIMEOFFSET,
   @UpdatedOn DATETIMEOFFSET
AS

INSERT Basketball.Team(ConferenceId, Name, Mascot, City, State)
VALUES(@GameId, @SeasonId, @Neutral, @Date, @CreatedOn, @UpdatedOn);
GO