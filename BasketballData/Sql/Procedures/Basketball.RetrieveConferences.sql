CREATE OR ALTER PROCEDURE Basketball.RetrievePlayers
AS

SELECT C.ConferenceId, C.Name, C.Nickname
FROM Basketball.Conference C;
GO
