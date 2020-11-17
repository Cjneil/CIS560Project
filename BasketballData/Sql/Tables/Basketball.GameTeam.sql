IF OBJECT_ID(N'Basketball.GameTeam') IS NULL
CREATE TABLE Basketball.GameTeam
(
	GameTeamId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	GameId INT NOT NULL FOREIGN KEY
		REFERENCES Basketball.Game(GameId),
	TeamId INT NOT NULL FOREIGN KEY
		REFERENCES Basketball.Team(TeamId),
	TeamTypeId INT NOT NULL FOREIGN KEY
		REFERENCES Basketball.TeamType(TeamTypeId),
	TeamScore INT NOT NULL,

	UNIQUE(GameId, TeamTypeId),
	UNIQUE(GameTeamId, TeamId)
);
