CREATE OR ALTER PROCEDURE Basketball.CreateTeam
   @ConferenceId INT,
   @Name NVARCHAR(50),
   @Mascot NVARCHAR(50),
   @City NVARCHAR(30),
   @State NVARCHAR(15)
AS

INSERT Basketball.Team(ConferenceId, Name, Mascot, City, State)
VALUES(@ConferenceId, @Name, @Mascot, @City, @State);
GO
