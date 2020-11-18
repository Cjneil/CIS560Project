
-- Insert Conferences
INSERT Basketball.Conference(Name, Nickname)
VALUES
	(N'Big 12 Conference', N'Big 12'),
	(N'Big Ten Conference', N'Big Ten');
GO

INSERT Basketball.Team(ConferenceId, Name, Mascot, City, State)
SELECT C.ConferenceId, S.Name, S.Mascot, S.City, S.State
FROM
	(
		VALUES
		(N'Big 12', N'Kansas State University', N'Wildcats', N'Manhattan', N'Kansas'),
		(N'Big 12', N'University of Kansas', N'Jayhawks', N'Lawrence', N'Kansas'),
		(N'Big 12', N'Iowa State University', N'Cyclones', 'Ames', N'Iowa'),
		(N'Big 12', N'West Virginia University', N'Mountaineers', N'Morgantown', N'West Virginia'),
		(N'Big 12', N'University of Texas at Austin', N'Longhorns', N'Austin', N'Texas'),
		(N'Big 12', N'Texas Tech University', N'Red Raiders', N'Lubbock', N'Texas'),
		(N'Big 12', N'Texas Christian University', N'Horned Frogs', N'Fort Worth', N'Texas'),
		(N'Big 12', N'Oklahoma State University', N'Cowboys', N'Stillwater', N'Oklahoma'),
		(N'Big 12', N'University of Oklahoma', N'Sooners', N'Norman', N'Oklahoma'),
		(N'Big 12', N'Baylor University', N'Bears', N'Waco', N'Texas'),
		(N'Big Ten', N'University of Wisconsin-Madison', N'Badgers', N'Madison', N'Wisconsin'),
		(N'Big Ten', N'University of Illinois at Urbana-Champaign', N'Fighting Illini', N'Champaign-Urbana', N'Illinois'),
		(N'Big Ten', N'University of Iowa', N'Hawkeyes', 'Iowa City', N'Iowa'),
		(N'Big Ten', N'Indiana University Bloomington', N'Hoosiers', N'Bloomington', N'Indiana'),
		(N'Big Ten', N'University of Minnesota', N'Golden Gophers', N'Minneapolis', N'Minnesota'),
		(N'Big Ten', N'University of Michigan', N'Wolverines', N'Ann Arbor', N'Michigan'),
		(N'Big Ten', N'Michigan State University', N'Spartans', N'East Lansing', N'Michigan'),
		(N'Big Ten', N'University of Maryland', N'Terrapins', N'College Park', N'Maryland'),
		(N'Big Ten', N'Pennsylvania State University', N'Nittany Lions', N'State College', N'Pennsylvania'),
		(N'Big Ten', N'University of Nebraska', N'Cornhuskers', N'Lincoln', N'Nebraska'),
		(N'Big Ten', N'Northwestern University', N'Wildcats', N'Evanston', N'Illinois'),
		(N'Big Ten', N'The Ohio State University', N'Buckeyes', N'Columbus', N'Ohio'),
		(N'Big Ten', N'Purdue University', N'Boilermakers', N'West Lafayette', N'Indiana'),
		(N'Big Ten', N'Rutgers', N'Scarlet Knights', N'Piscataway', N'New Jersey')
	) S(ConferenceName, Name, Mascot, City, State)
		INNER JOIN Basketball.Conference C ON S.ConferenceName = C.NickName
GO

-- Insert Seasons
INSERT Basketball.Season(YearRange)
VALUES
	(N'2019-20'),
	(N'2018-19');
GO

-- Insert Games
INSERT Basketball.Game(SeasonId, Neutral, Date)
SELECT SE.SeasonId, S.Neutral, S.Date
FROM
	(
		VALUES
		(N'2019-20', 1, '2020-03-11'),
		(N'2019-20', 0, '2020-03-07'),
		(N'2019-20', 0, '2020-03-04'),
		(N'2019-20', 0, '2020-03-07'),
		(N'2019-20', 0, '2020-03-04'),
		(N'2019-20', 0, '2020-01-07'),
		(N'2019-20', 0, '2020-01-14'),
		(N'2019-20', 0, '2020-02-15'),
		(N'2018-19', 0, '2019-02-10'),
		(N'2019-20', 0, '2020-02-01')	
		
	) S(YearRange, Neutral, Date)
		INNER JOIN Basketball.Season SE ON S.YearRange = SE.YearRange
GO

SELECT * FROM Basketball.Game

-- Insert into Player
INSERT Basketball.Player(TeamId, FirstName, LastName, Position)
SELECT T.TeamId, S.FirstName, S.LastName, S.Position
FROM
	(
		VALUES
		(N'Kansas State University', N'Xavier', N'Sneed', N'F'),
		(N'Kansas State University', N'Cartier', N'Diarra', N'G'),
		(N'University of Kansas', N'Devon', N'Dotson', N'G'),
		(N'Purdue University', N'Jahaad', N'Proctor', N'G'),
		(N'Purdue University', N'Trevion', N'Williams', N'F'),
		(N'Purdue University', N'Nojel', N'Eastern', N'G'),
		(N'Purdue University', N'Evan', N'Boudreaux', N'F'),
		(N'Purdue University', N'Sasha', N'Stefanovic', N'G'),
		(N'Northwestern University', N'Miller', N'Kopp', N'F'),
		(N'Northwestern University', N'Pat', N'Spencer', N'G'),
		(N'Northwestern University', N'Ryan', N'Young', N'G'),
		(N'Northwestern University', N'Pete', N'Nance', N'F'),
		(N'Northwestern University', N'Robbie', N'Beran', N'F')
	) S(TeamName, FirstName, LastName, Position)
		INNER JOIN Basketball.Team T ON S.TeamName = T.Name
GO

SELECT * FROM Basketball.Player

-- Insert into TeamType
INSERT Basketball.TeamType(Name)
VALUES
(N'Home'), (N'Away');
GO

-- Insert into GameTeam
INSERT Basketball.GameTeam(GameId, TeamId, TeamTypeId, TeamScore)
SELECT G.GameId, T.TeamId, TT.TeamTypeId, S.TeamScore
FROM
	(
		VALUES
		(1, N'Kansas State University', 1, 53),
		(1, N'Texas Christian University', 2, 49), 
		(2, N'Kansas State University', 2, 79),
		(2, N'Iowa State University', 1, 63),
		(3, N'Kansas State University', 1, 63), 
		(3, N'Oklahoma State University', 2, 69), 
		(4, N'University of Kansas', 2, 66), 
		(4, N'Texas Tech University', 1, 62), 
		(5, N'University of Kansas', 2, 75), 
		(5, N'Texas Christian University', 1, 66),
		(6, N'The Ohio State University', 1, 55),
		(6, N'University of Maryland', 2, 67),
		(7, N'University of Nebraska', 1, 68),
		(7, N'The Ohio State University', 2, 80),
		(8, N'Purdue University', 1, 52),
		(8, N'The Ohio State University', 2, 68),
		(9, N'The Ohio State University', 1, 55),
		(9, N'Indiana University Bloomington', 2, 52),
		(10, N'Northwestern University', 1, 58),
		(10, N'Purdue University', 2, 61)

	) S(GameId, TeamName, TeamTypeId, TeamScore)
	INNER JOIN Basketball.Game G ON G.GameId = S.GameId
	INNER JOIN Basketball.TeamType TT ON TT.TeamTypeId = S.TeamTypeId
	INNER JOIN Basketball.Team T ON T.Name = S.TeamName

SELECT * FROM Basketball.GameTeam

-- Insert into GamePlayer
INSERT Basketball.GamePlayer(PlayerId, GameTeamId, TeamId, Minutes, Points, Assists, Rebounds, Steals, Blocks, Turnovers)
SELECT P.PlayerId, GT.GameTeamId, P.TeamId, S.Minutes, S.Points, S.Assists, S.Rebounds, S.Steals, S.Blocks, S.Turnovers
FROM 
	(
		VALUES
		(N'Xavier', N'Sneed', 1, 1, 36, 8, 0, 6, 1, 0, 1),
		(N'Xavier', N'Sneed', 2, 2, 36, 8, 0, 6, 1, 0, 1),
		(N'Cartier', N'Diarra', 1, 1, 37, 13, 3, 3, 3, 0, 4),
		(N'Devon', N'Dotson', 4, 2, 38, 17, 5, 7, 1, 0, 5),
		(N'Devon', N'Dotson', 5, 2, 38, 18, 2, 6, 4, 0, 2),
		(N'Jahaad', N'Proctor', 10, 2, 32, 9, 1, 2, 0, 0, 2),
		(N'Trevion', N'Williams', 10, 2, 23, 13, 1, 7, 2, 0, 4),
		(N'Nojel', N'Eastern', 10, 2, 22, 0, 4, 5, 0, 0, 1),
		(N'Evan', N'Boudreaux', 10, 2, 20, 5, 1, 3, 0, 0, 0),
		(N'Sasha', N'Stefanovic', 10, 2, 17, 6, 1, 0, 1, 0, 0)
	) S(FirstName, LastName, GameId, TeamTypeId, Minutes, Points, Assists, Rebounds, Steals, Blocks, Turnovers)
	INNER JOIN Basketball.Player P ON S.FirstName = P.FirstName AND S.LastName = P.LastName
	INNER JOIN Basketball.GameTeam GT ON GT.TeamTypeId = S.TeamTypeId AND S.GameId = GT.GameId
GO
 
 SELECT * FROM Basketball.GamePlayer
