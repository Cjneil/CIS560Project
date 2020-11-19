CREATE OR ALTER PROCEDURE Basketball.RetrieveConferences
AS

SELECT C.ConferenceId, C.Name, C.Nickname
FROM Basketball.Conference C;
GO
