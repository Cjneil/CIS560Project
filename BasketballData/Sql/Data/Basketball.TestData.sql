
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
		(N'2019-20', 0, '2020-02-01'),
		-- Fake Stats
		(N'2019-20', 0, '2020-02-01'),
		(N'2019-20', 0, '2020-01-25'),
		(N'2019-20', 0, '2020-02-14'),
		(N'2019-20', 0, '2020-02-25'),
		(N'2019-20', 0, '2020-01-30'),
		(N'2019-20', 0, '2020-01-05'),
		(N'2019-20', 0, '2020-02-01'),
		(N'2019-20', 0, '2020-02-04'),
		(N'2019-20', 0, '2020-02-17'),
		(N'2019-20', 0, '2020-03-01'),
		(N'2019-20', 0, '2020-03-01'),
		(N'2019-20', 0, '2020-03-01')
		
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
		(N'Northwestern University', N'Robbie', N'Beran', N'F'),
		 (N'Michigan State University', N'Julian', N'Washington', N'G'),
		 (N'University of Minnesota', N'Levi', N'Beach', N'G'),
		 (N'Texas Tech University', N'Griffith', N'Rivers', N'G'),
		 (N'Texas Christian University', N'Colorado', N'Padilla', N'G'),
		 (N'University of Minnesota', N'Dolan', N'Ratliff', N'F'),
		 (N'Michigan State University', N'Nash', N'Franklin', N'F'),
		 (N'Michigan State University', N'Micah', N'Cote', N'F'),
		 (N'Kansas State University', N'Bert', N'Black', N'C'),
		 (N'Kansas State University', N'Darius', N'Dale', N'C'),
		 (N'Oklahoma State University', N'Cyrus', N'Morales', N'C'),
		 (N'Kansas State University', N'Valentine', N'Callahan', N'G'),
		 (N'Baylor University', N'Edward', N'Chaney', N'G'),
		 (N'Texas Tech University', N'Kibo', N'Young', N'F'),
		 (N'Texas Christian University', N'Isaac', N'Moses', N'C'),
		 (N'Michigan State University', N'Vincent', N'Branch', N'C'),
		 (N'Texas Tech University', N'Jarrod', N'Dodson', N'F'),
		 (N'Kansas State University', N'Nolan', N'Santiago', N'F'),
		 (N'Kansas State University', N'Logan', N'Ryan', N'C'),
		 (N'Michigan State University', N'Lane', N'Christensen', N'G'),
		 (N'University of Wisconsin-Madison', N'Boris', N'Ball', N'G'),
		 (N'Michigan State University', N'Kelly', N'Robbins', N'G'),
		 (N'University of Minnesota', N'Hayden', N'Hill', N'G'),
		 (N'University of Minnesota', N'Salvador', N'Rojas', N'G'),
		 (N'Kansas State University', N'Kaseem', N'Herring', N'G'),
		 (N'University of Minnesota', N'Clarke', N'Hartman', N'G'),
		 (N'Michigan State University', N'Honorato', N'Cook', N'G'),
		 (N'Kansas State University', N'Lewis', N'Diaz', N'G'),
		 (N'West Virginia University', N'Sean', N'Casey', N'G'),
		 (N'Oklahoma State University', N'Baxter', N'Kennedy', N'G'),
		 (N'University of Oklahoma', N'Aaron', N'Douglas', N'G'),
		 (N'Oklahoma State University', N'Kibo', N'Irwin', N'F'),
		 (N'Michigan State University', N'Ryder', N'Gentry', N'F'),
		 (N'Oklahoma State University', N'Addison', N'Brady', N'F'),
		 (N'Baylor University', N'Ahmed', N'House', N'F'),
		 (N'University of Minnesota', N'Barrett', N'Humphrey', N'F'),
		 (N'Michigan State University', N'Clarke', N'Carver', N'F'),
		 (N'University of Kansas', N'Denton', N'Snyder', N'F'),
		 (N'University of Minnesota', N'Logan', N'Bauer', N'F'),
		 (N'Texas Christian University', N'Silas', N'Blevins', N'F'),
		 (N'University of Oklahoma', N'Jonas', N'Gilliam', N'F'),
		 (N'Texas Christian University', N'Ignatius', N'Hart', N'F'),
		 (N'Texas Christian University', N'Raja', N'Holcomb', N'F'),
		 (N'Oklahoma State University', N'Sebastian', N'Mccarty', N'F'),
		 (N'University of Minnesota', N'Jasper', N'Pope', N'F'),
		 (N'Michigan State University', N'Kelly', N'Juarez', N'F'),
		 (N'Texas Tech University', N'Acton', N'Burnett', N'F'),
		 (N'Kansas State University', N'Tad', N'Cole', N'F'),
		 (N'Texas Christian University', N'Jameson', N'Rowland', N'C'),
		 (N'Baylor University', N'Colin', N'Spencer', N'C'),
		 (N'Texas Tech University', N'Odysseus', N'Lewis', N'C'),
		 (N'University of Kansas', N'Nicholas', N'Blackwell', N'C'),
		 (N'University of Minnesota', N'Nathaniel', N'Ramsey', N'C'),
		 (N'West Virginia University', N'Craig', N'Reilly', N'C'),
		 (N'University of Minnesota', N'Hu', N'Carey', N'C'),
		 (N'University of Oklahoma', N'Alexander', N'Atkins', N'C'),
		 (N'Michigan State University', N'Wang', N'Mcneil', N'C'),
		 (N'Texas Tech University', N'Travis', N'Johnson', N'G'),
		 (N'University of Minnesota', N'Addison', N'Chavez', N'G'),
		 (N'University of Oklahoma', N'Ezra', N'Mcintosh', N'G'),
		 (N'Oklahoma State University', N'Lars', N'Brady', N'G'),
		 (N'University of Wisconsin-Madison', N'Jordan', N'Washington', N'G'),
		 (N'Texas Tech University', N'Lee', N'Thomas', N'G'),
		 (N'University of Wisconsin-Madison', N'Erich', N'Adkins', N'G'),
		 (N'University of Kansas', N'Hu', N'Rosales', N'G'),
		 (N'University of Minnesota', N'Preston', N'Welch', N'G'),
		 (N'University of Oklahoma', N'Ronan', N'Freeman', N'G'),
		 (N'West Virginia University', N'Bert', N'Donaldson', N'G'),
		 (N'Oklahoma State University', N'Christopher', N'Ellis', N'G'),
		 (N'Texas Christian University', N'Raja', N'Vance', N'G'),
		 (N'University of Minnesota', N'Lucius', N'Small', N'G'),
		 (N'University of Oklahoma', N'Cullen', N'Sherman', N'G'),
		 (N'Baylor University', N'Magee', N'Melton', N'G'),
		 (N'Texas Tech University', N'Ignatius', N'Wade', N'G'),
		 (N'University of Minnesota', N'Felix', N'Fulton', N'G'),
		 (N'West Virginia University', N'Kelly', N'Sanchez', N'G'),
		 (N'West Virginia University', N'Nolan', N'Pugh', N'G'),
		 (N'University of Kansas', N'Eric', N'Stanton', N'G'),
		 (N'University of Kansas', N'Perry', N'Sanford', N'G'),
		 (N'Oklahoma State University', N'Abbot', N'Blake', N'G'),
		 (N'Baylor University', N'Damian', N'Lewis', N'G'),
		 (N'Michigan State University', N'Brock', N'Bruce', N'G'),
		 (N'Kansas State University', N'Aaron', N'Haney', N'G'),
		 (N'Michigan State University', N'Charles', N'Rutledge', N'G'),
		 (N'University of Wisconsin-Madison', N'Todd', N'Berg', N'G'),
		 (N'Texas Christian University', N'Owen', N'Bridges', N'G'),
		 (N'Oklahoma State University', N'Bradley', N'Perez', N'G'),
		 (N'University of Minnesota', N'Erich', N'Hart', N'G'),
		 (N'Kansas State University', N'Nasim', N'Mays', N'G'),
		 (N'University of Oklahoma', N'Andrew', N'David', N'G'),
		 (N'University of Kansas', N'Garth', N'Townsend', N'F'),
		 (N'University of Minnesota', N'Ezekiel', N'Quinn', N'F'),
		 (N'University of Kansas', N'Griffin', N'Reynolds', N'F'),
		 (N'Texas Christian University', N'Hedley', N'Whitfield', N'F'),
		 (N'University of Kansas', N'Cole', N'Simon', N'F'),
		 (N'Texas Tech University', N'Howard', N'Flowers', N'F'),
		 (N'University of Minnesota', N'Craig', N'Baldwin', N'F'),
		 (N'University of Oklahoma', N'Aquila', N'Bradley', N'F'),
		 (N'University of Kansas', N'Yuli', N'Combs', N'F'),
		 (N'University of Oklahoma', N'Elijah', N'Moss', N'F'),
		 (N'University of Kansas', N'Rajah', N'Bolton', N'F')

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
		(10, N'Purdue University', 2, 61),
		-- Fake Stats
		(11, N'Baylor University', 2, 75),
		(11, N'University of Kansas', 1, 70),
		(12, N'University of Kansas', 1, 85),
		(12, N'University of Oklahoma', 2, 72),
		(13, N'Texas Tech University', 2, 77),
		(13, N'Oklahoma State University', 1, 70),
		(14, N'University of Oklahoma', 1, 65),
		(14, N'Baylor University', 2, 82),
		(15, N'Baylor University', 1, 78),
		(15, N'West Virginia University', 2, 71),
		(16, N'West Virginia University', 2, 69),
		(16, N'University of Texas at Austin', 1, 68),
		(17, N'University of Texas at Austin', 2, 75),
		(17, N'Oklahoma State University', 1, 79),
		(18, N'University of Kansas', 1, 77),
		(18, N'Baylor University', 2, 80),
		(19, N'Texas Tech University', 1, 73),
		(19, N'Texas Christian University', 2, 68),
		(20, N'University of Kansas', 2, 80),
		(20, N'Baylor University', 1, 78),
		(21, N'Michigan State University', 1, 75),
		(21, N'University of Wisconsin-Madison', 2, 80),
		(22, N'University of Minnesota', 2, 65),
		(22, N'University of Wisconsin-Madison', 1, 80)

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
		(N'Sasha', N'Stefanovic', 10, 2, 17, 6, 1, 0, 1, 0, 0),
		-- Fake stats
		
		('Julian', 'Washington', 21, 1, 3, 15, 8, 4, 1, 2, 0),
		('Levi', 'Beach', 22, 2, 31, 29, 0, 4, 4, 1, 4),
		('Griffith', 'Rivers', 13, 2, 33, 33, 6, 9, 0, 0, 4),
		('Colorado', 'Padilla', 1, 2, 30, 7, 1, 7, 3, 2, 5),
		('Dolan', 'Ratliff', 22, 2, 15, 32, 7, 13, 4, 1, 2),
		('Nash', 'Franklin', 21, 1, 37, 4, 9, 12, 4, 2, 6),
		('Micah', 'Cote', 21, 1, 24, 13, 1, 8, 1, 3, 4),
		('Bert', 'Black', 1, 1, 12, 16, 9, 5, 4, 1, 2),
		('Darius', 'Dale', 2, 2, 24, 40, 1, 13, 4, 1, 5),
		('Cyrus', 'Morales', 3, 2, 31, 6, 10, 5, 1, 2, 6),
		('Valentine', 'Callahan', 1, 1, 33, 17, 0, 5, 4, 2, 5),
		('Edward', 'Chaney', 11, 2, 13, 4, 6, 8, 3, 0, 5),
		('Kibo', 'Young', 13, 2, 2, 36, 4, 14, 1, 3, 0),
		('Isaac', 'Moses', 5, 1, 2, 23, 10, 8, 0, 2, 2),
		('Vincent', 'Branch', 21, 1, 14, 33, 2, 8, 3, 0, 2),
		('Jarrod', 'Dodson', 19, 1, 33, 4, 8, 14, 1, 0, 1),
		('Nolan', 'Santiago', 3, 1, 2, 34, 1, 8, 5, 2, 4),
		('Logan', 'Ryan', 2, 2, 29, 40, 4, 15, 3, 0, 1),
		('Lane', 'Christensen', 21, 1, 7, 7, 2, 5, 4, 0, 2),
		('Boris', 'Ball', 21, 2, 7, 26, 10, 1, 5, 0, 2),
		('Kelly', 'Robbins', 21, 1, 19, 24, 9, 4, 4, 2, 3),
		('Hayden', 'Hill', 22, 2, 3, 3, 5, 3, 4, 2, 6),
		('Salvador', 'Rojas', 22, 2, 30, 3, 6, 14, 4, 1, 4),
		('Kaseem', 'Herring', 2, 2, 35, 19, 0, 2, 3, 2, 0),
		('Clarke', 'Hartman', 22, 2, 28, 32, 9, 13, 1, 0, 6),
		('Honorato', 'Cook', 21, 1, 37, 2, 0, 13, 4, 2, 5),
		('Lewis', 'Diaz', 1, 1, 37, 8, 7, 11, 5, 0, 1),
		('Sean', 'Casey', 15, 2, 28, 39, 0, 0, 0, 0, 2),
		('Baxter', 'Kennedy', 13, 1, 40, 29, 3, 10, 4, 2, 4),
		('Aaron', 'Douglas', 12, 2, 14, 0, 2, 10, 3, 1, 2),
		('Kibo', 'Irwin', 13, 1, 31, 12, 0, 11, 3, 0, 5),
		('Ryder', 'Gentry', 21, 1, 35, 14, 3, 11, 4, 2, 4),
		('Addison', 'Brady', 17, 1, 35, 35, 4, 4, 3, 3, 6),
		('Ahmed', 'House', 14, 10, 8, 14, 5, 6, 1, 3, 2),
		('Barrett', 'Humphrey', 22, 2, 31, 10, 3, 13, 3, 2, 6),
		('Clarke', 'Carver', 21, 1, 40, 35, 9, 14, 3, 2, 0),
		('Denton', 'Snyder', 4, 2, 14, 19, 1, 9, 3, 1, 1),
		('Logan', 'Bauer', 22, 2, 36, 38, 1, 1, 3, 0, 2),
		('Silas', 'Blevins', 19, 7, 32, 4, 7, 12, 4, 2, 6),
		('Jonas', 'Gilliam', 12, 2, 31, 0, 2, 8, 2, 2, 6),
		('Ignatius', 'Hart', 19, 7, 13, 38, 0, 14, 3, 2, 4),
		('Raja', 'Holcomb', 1, 2, 39, 3, 8, 8, 1, 0, 4),
		('Sebastian', 'Mccarty', 17, 1, 40, 37, 3, 0, 4, 3, 0),
		('Jasper', 'Pope', 22, 2, 13, 33, 6, 5, 1, 2, 0),
		('Kelly', 'Juarez', 21, 1, 18, 23, 2, 11, 1, 2, 5),
		('Acton', 'Burnett', 13, 2, 27, 7, 9, 3, 1, 0, 4),
		('Tad', 'Cole', 1, 1, 20, 19, 5, 15, 2, 0, 0),
		('Jameson', 'Rowland', 5, 1, 25, 19, 4, 11, 3, 0, 4),
		('Colin', 'Spencer', 15, 1, 38, 38, 5, 1, 2, 0, 6),
		('Odysseus', 'Lewis', 19, 1, 24, 8, 9, 1, 1, 3, 5),
		('Nicholas', 'Blackwell', 5, 2, 37, 30, 1, 15, 4, 3, 5),
		('Nathaniel', 'Ramsey', 22, 2, 24, 33, 0, 14, 3, 1, 4),
		('Craig', 'Reilly', 16, 2, 19, 37, 2, 9, 1, 0, 1),
		('Hu', 'Carey', 22, 2, 36, 31, 0, 14, 2, 2, 6),
		('Alexander', 'Atkins', 14, 1, 15, 39, 7, 8, 0, 2, 1),
		('Wang', 'Mcneil', 21, 1, 35, 13, 6, 8, 1, 1, 6),
		('Travis', 'Johnson', 19, 1, 3, 36, 5, 7, 1, 3, 1),
		('Addison', 'Chavez', 22, 2, 18, 21, 3, 12, 1, 1, 0),
		('Ezra', 'Mcintosh', 14, 1, 2, 20, 8, 8, 0, 1, 2),
		('Lars', 'Brady', 3, 2, 22, 40, 4, 1, 5, 0, 4),
		('Jordan', 'Washington', 22, 1, 22, 6, 6, 7, 2, 3, 0),
		('Lee', 'Thomas', 13, 2, 35, 16, 10, 8, 4, 2, 3),
		('Erich', 'Adkins', 21, 2, 25, 17, 6, 10, 5, 2, 4),
		('Hu', 'Rosales', 11, 1, 14, 35, 10, 2, 5, 0, 5),
		('Preston', 'Welch', 22, 2, 39, 2, 9, 1, 1, 1, 2),
		('Ronan', 'Freeman', 12, 2, 6, 37, 5, 0, 3, 2, 0),
		('Bert', 'Donaldson', 15, 2, 26, 19, 3, 3, 4, 0, 5),
		('Christopher', 'Ellis', 3, 2, 30, 36, 6, 3, 0, 0, 0),
		('Raja', 'Vance', 1, 2, 12, 19, 9, 1, 5, 2, 2),
		('Lucius', 'Small', 22, 2, 35, 5, 2, 2, 3, 3, 4),
		('Cullen', 'Sherman', 12, 2, 30, 20, 2, 5, 4, 3, 0),
		('Magee', 'Melton', 18, 2, 26, 16, 6, 2, 5, 1, 1),
		('Ignatius', 'Wade', 19, 1, 25, 12, 3, 9, 5, 2, 1),
		('Felix', 'Fulton', 22, 2, 8, 4, 8, 12, 1, 3, 0),
		('Kelly', 'Sanchez', 15, 2, 28, 13, 2, 2, 2, 2, 5),
		('Nolan', 'Pugh', 16, 2, 28, 11, 3, 4, 0, 2, 0),
		('Eric', 'Stanton', 12, 1, 30, 1, 7, 13, 1, 3, 0),
		('Perry', 'Sanford', 4, 2, 8, 1, 4, 1, 0, 1, 3),
		('Abbot', 'Blake', 13, 1, 8, 18, 4, 15, 3, 0, 2),
		('Damian', 'Lewis', 20, 1, 11, 22, 6, 14, 5, 1, 0),
		('Brock', 'Bruce', 21, 1, 1, 34, 4, 10, 1, 0, 6),
		('Aaron', 'Haney', 2, 2, 26, 4, 0, 10, 2, 1, 5),
		('Charles', 'Rutledge', 21, 1, 35, 7, 5, 4, 0, 1, 2),
		('Todd', 'Berg', 21, 2, 3, 22, 5, 0, 0, 0, 3),
		('Owen', 'Bridges', 19, 2, 30, 11, 9, 15, 4, 2, 0),
		('Bradley', 'Perez', 17, 1, 32, 10, 8, 14, 0, 0, 3),
		('Erich', 'Hart', 22, 2, 11, 11, 5, 12, 3, 0, 3),
		('Nasim', 'Mays', 3, 1, 2, 21, 8, 12, 5, 2, 3),
		('Andrew', 'David', 14, 1, 33, 15, 3, 8, 5, 2, 3),
		('Garth', 'Townsend', 20, 2, 37, 21, 2, 15, 1, 3, 5),
		('Ezekiel', 'Quinn', 22, 2, 35, 27, 1, 8, 1, 2, 2),
		('Griffin', 'Reynolds', 18, 1, 36, 31, 9, 0, 4, 1, 5),
		('Hedley', 'Whitfield', 1, 2, 35, 10, 6, 9, 3, 3, 5),
		('Cole', 'Simon', 5, 2, 8, 38, 3, 2, 1, 2, 2),
		('Howard', 'Flowers', 13, 2, 3, 7, 2, 8, 3, 0, 3),
		('Craig', 'Baldwin', 22, 2, 18, 11, 10, 15, 4, 1, 6),
		('Aquila', 'Bradley', 14, 1, 12, 2, 1, 6, 4, 1, 2),
		('Yuli', 'Combs', 11, 1, 13, 12, 0, 0, 2, 3, 4),
		('Elijah', 'Moss', 12, 2, 4, 10, 5, 7, 4, 2, 3),
		('Rajah', 'Bolton', 12, 1, 17, 38, 4, 8, 4, 1, 4)
	) S(FirstName, LastName, GameId, TeamTypeId, Minutes, Points, Assists, Rebounds, Steals, Blocks, Turnovers)
	INNER JOIN Basketball.Player P ON S.FirstName = P.FirstName AND S.LastName = P.LastName
	INNER JOIN Basketball.GameTeam GT ON GT.TeamTypeId = S.TeamTypeId AND S.GameId = GT.GameId
GO
 
SELECT * FROM Basketball.GamePlayer
