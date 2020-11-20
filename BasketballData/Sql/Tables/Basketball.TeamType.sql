CREATE TABLE Basketball.TeamType
(
	TeamTypeId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(4) NOT NULL UNIQUE -- 2 for Home, 1 for Away
);
