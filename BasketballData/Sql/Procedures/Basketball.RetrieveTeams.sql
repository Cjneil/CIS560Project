CREATE OR ALTER PROCEDURE Basketball.RetrieveTeams
AS

SELECT T.TeamId, T.ConferenceId, T.Name, T.Mascot, T.City, T.State
FROM Basketball.Team T;
GO
