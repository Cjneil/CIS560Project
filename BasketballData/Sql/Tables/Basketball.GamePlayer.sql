IF OBJECT_ID(N'Basketball.GamePlayer') IS NULL
CREATE TABLE Basketball.GamePlayer
(
	PlayerId INT NOT NULL,
	GameTeamId INT NOT NULL,
	TeamId INT NOT NULL,
	Minutes INT NOT NULL,
	Points INT NOT NULL,
	Assists INT NOT NULL,
	Rebounds INT NOT NULL,
	Steals INT NOT NULL,
	Blocks INT NOT NULL,
	Turnovers INT NOT NULL,
	CreatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),
    UpdatedOn DATETIMEOFFSET NOT NULL DEFAULT(SYSDATETIMEOFFSET()),

	PRIMARY KEY(GameTeamId, PlayerId),
	FOREIGN KEY(PlayerId, TeamId) REFERENCES Basketball.Player(PlayerId, TeamId),
	FOREIGN KEY(GameTeamId, TeamId) REFERENCES Basketball.GameTeam(GameTeamId, TeamId),
);
