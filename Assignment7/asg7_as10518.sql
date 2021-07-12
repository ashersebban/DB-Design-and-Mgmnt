
DROP TABLE IF EXISTS countries;
CREATE TABLE countries(
country_ID INT(3) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(15) NOT NULL,
country_secondary VARCHAR(15) NULL);

DELETE FROM countries;
INSERT INTO countries VALUES
(NULL,'France',NULL),
(NULL,'England',NULL),
(NULL,'Prussia',NULL),
(NULL,'USA',NULL),
(NULL,'Austria-Hungry',NULL),
(NULL,'Germany',NULL),
(NULL,'Cuba',NULL),
(NULL,'Russia',NULL),
(NULL,'Netherlands',NULL),
(NULL,'Soviet Union','Russia'),
(NULL,'Soviet Union','Armenia'),
(NULL,'Soviet Union','Latvia'),
(NULL,'Soviet Union','Ukraine'),
(NULL,'Soviet Union','Georgia'),
(NULL,'India',NULL),
(NULL,'Ukraine',NULL),
(NULL,'Uzbekistan',NULL),
(NULL,'Bulgaria',NULL),
(NULL,'Norway',NULL),
(NULL,'Czechoslovakia',NULL),
(NULL,'China',NULL);

DROP TABLE IF EXISTS statuses;
CREATE TABLE statuses(
status_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
status_type VARCHAR(10) NOT NULL);

DELETE FROM statuses;
INSERT INTO statuses VALUES
(NULL,'deceased'),
(NULL,'retired'),
(NULL,'active');

DROP TABLE IF EXISTS chessEras;
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
title_ID INT(3) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
title_name VARCHAR(15) NOT NULL);

DELETE FROM titles;
INSERT INTO titles VALUES
(NULL,'Noteworthy'),
(NULL,'Unofficial'),
(NULL,'Pre-FIDE'),
(NULL,'FIDE'),
(NULL,'Classical'),
(NULL,'Undisputed'),
(NULL,"Women's");

DROP TABLE IF EXISTS players;
CREATE TABLE players(
player_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
player_firstName VARCHAR(15),
player_lastName VARCHAR(30) NOT NULL, 
player_countryID INT(2) NOT NULL, 
player_DOB DATE NOT NULL, 
player_FIDE_rating INT(4),
player_FIDE_peak INT(4),
player_peak_year YEAR,
player_statusID INT(1)
);      



DELETE FROM players;
INSERT INTO players VALUES
(NULL,'Paul','Morphy',4,'1837-06-22',NULL,NULL,NULL,'1'),
(NULL,'Wilhelm','Steinitz',5,'1836-05-17',NULL,NULL,NULL,'1'),
(NULL,'Emanuel','Lasker',6,'1868-12-24',NULL,NULL,NULL,'1'),
(NULL,'Jose','Capablanca',7,'1888-11-19',NULL,NULL,NULL,'1'),
(NULL,'Alexander','Alekhine',1,'1892-10-31',NULL,NULL,NULL,'1'),
(NULL,'Max','Euwe',9,'1901-05-20',NULL,NULL,NULL,'1'),
(NULL,'Mikhail','Botvinnik',10,'1911-08-17',NULL,NULL,NULL,'1'),
(NULL,'Vasily','Smyslov',10,'1921-03-24',NULL,NULL,NULL,'1'),
(NULL,'Mikhail','Tal',12,'1936-11-09',NULL,NULL,NULL,'1'),
(NULL,'Tigran','Petrosian',11,'1939-06-17',NULL,NULL,NULL,'1'),
(NULL,'Boris','Spassky',10,'1937-01-30',NULL,NULL,NULL,'2'),
(NULL,'Robert','Fischer',4,'1943-03-09',NULL,2785,'1972','1'),
(NULL,'Anatoly','Karpov',10,'1951-05-23',2619,2780,'1994','2'),
(NULL,'Gary','Kasparov',10,'1963-04-13',2812,2851,'1999','2'),
(NULL,'Alexander','Khalifman',10,'1966-01-18',2614,2702,'2003','3'),
(NULL,'Viswanathan','Anand',15,'1969-12-11',2784,2817,'2011','3'),
(NULL,'Vladimir','Kramnik',10,'1975-06-25',2801,2810,'2013','3'),
(NULL,'Ruslan','Ponomariov',16,'1983-10-11',2726,2758,'2011','3'),
(NULL,'Rustam','Kasimdzhanov',17,'1979-12-05',2657,2715,'2001','3'),
(NULL,'Veselin','Topalov',18,'1975-03-15',2780,2816,'2001','3'),
(NULL,'Magnus','Carlson',19,'1990-12-30',2844,2881,'2014','3'),
(NULL,'Asher','Sebban',27,'1997-11-14',1240,1560,'2019','3')
;

DROP TABLE IF EXISTS worldChampions;
CREATE TABLE worldChampions(
champ_ID INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
champ_playerID INT(5) NOT NULL, 
champ_startDate INT(4),
champ_endDate INT(4),
champ_countryID INT(3) NOT NULL, 
champ_dateEstimated ENUM('True','False') NOT NULL,
champ_titleID INT(1) NOT NULL
);  

DELETE FROM worldChampions;
INSERT INTO worldChampions VALUES
(NULL,1,1858,1862,4,'False',2),
(NULL,2,1886,1894,5,'True',3),
(NULL,2,1886,1894,2,'True',3),
(NULL,2,1886,1894,4,'True',3),
(NULL,3,1894,1921,6,'False',3),
(NULL,4,1921,1927,7,'False',3),
(NULL,5,1927,1935,8,'False',3),
(NULL,6,1935,1937,9,'False',3),
(NULL,5,1937,1946,1,'False',3),
(NULL,7,1948,1957,10,'False',4),
(NULL,8,1957,1958,10,'False',4),
(NULL,7,1958,1960,10,'False',4),
(NULL,9,1960,1961,12,'False',4),
(NULL,7,1961,1963,10,'False',4),
(NULL,10,1963,1969,11,'False',4),
(NULL,11,1969,1972,10,'False',4),
(NULL,12,1972,1975,4,'False',4),
(NULL,13,1975,1985,10,'False',4),
(NULL,14,1985,1993,10,'False',4),
(NULL,14,1993,2000,8,'False',5),
(NULL,17,2000,2006,8,'False',5),
(NULL,13,1993,1999,8,'False',4),
(NULL,15,1999,2000,8,'False',4),
(NULL,16,2000,2002,15,'False',4),
(NULL,18,2002,2004,16,'False',4),
(NULL,19,2004,2005,17,'False',4),
(NULL,20,2005,2006,18,'False',4),
(NULL,17,2006,2007,8,'False',6),
(NULL,16,2007,2013,15,'False',6),
(NULL,21,2013,2019,19,'False',6);


--QUERIES

SELECT * FROM countries;

SELECT * FROM statuses;

SELECT * FROM titles;

--INNER JOINS

SELECT player_firstName,player_lastName,statuses.status_type FROM players INNER JOIN statuses 
ON players.player_statusID = statuses.status_ID;

SELECT CONCAT(player_firstName,' ',player_lastName) as player_name,countries.country_name FROM players INNER JOIN countries 
ON players.player_countryID = countries.country_ID
ORDER BY countries.country_name;

--RIGHT JOIN
SELECT CONCAT(players.player_firstName,' ',players.player_lastName) as player_name,country_name 
FROM countries RIGHT JOIN players 
ON players.player_countryID = countries.country_ID
ORDER BY countries.country_name
LIMIT 1	;

--MORE THAN ONE INNER JOIN
SELECT CONCAT(worldChampions.champ_startDate,"-",worldChampions.champ_endDate) AS 'Total Reign',
CONCAT(players.player_firstName," ",players.player_lastName) AS 'Full Name',
players.player_FIDE_peak AS 'Highest Rating',
countries.country_name AS Representing,
titles.title_name AS Category
FROM players,worldChampions,countries,titles
WHERE players.player_ID = worldChampions.champ_playerID
AND countries.country_ID = worldChampions.champ_countryID
AND titles.title_ID = worldChampions.champ_titleID;

--LEFT JOINS
SELECT titles.title_name AS Eras, COUNT(*) AS Total 
FROM worldChampions LEFT JOIN titles
ON titles.title_ID = worldChampions.champ_titleID
GROUP BY titles.title_ID;

SELECT countries.country_name AS Country, COUNT(*) AS Total 
FROM worldChampions LEFT JOIN countries
ON countries.country_ID = worldChampions.champ_countryID
GROUP BY countries.country_name;

--NESTED
SELECT DISTINCT(country_name) as 'Winning Countries' FROM countries
WHERE country_ID 
IN(SELECT worldChampions.champ_countryID 
	FROM worldChampions);

SELECT Grandmaster, SUM(Years) AS 'Total Reign'
FROM(SELECT players.player_lastName AS Grandmaster,(champ_endDate - champ_startDate) AS Years 
	FROM worldChampions INNER JOIN players 
	ON worldChampions.champ_playerID = players.player_ID) AS reigns
GROUP BY Grandmaster
ORDER BY 'Total Reign';
