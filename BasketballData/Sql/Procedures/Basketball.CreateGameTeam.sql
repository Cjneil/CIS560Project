CREATE OR ALTER PROCEDURE Basketball.CreateGameTeam
   @GameTeamId INT,
   @GameId INT,
   @TeamId INT,
   @TeamTypeId INT,
   @TeamScore INT,
   @CreatedOn DATETIMEOFFSET,
   @UpdatedOn DATETIMEOFFSET
AS

INSERT Basketball.Team(ConferenceId, Name, Mascot, City, State)
VALUES(@GameTeamId, @GameId, @TeamId, @TeamTypeId, @TeamScore, @CreatedOn, @UpdatedOn);
GO