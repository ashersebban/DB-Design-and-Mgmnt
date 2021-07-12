--Total Records
SELECT COUNT(*) FROM chessgames;

--Top overall rated games
SELECT * FROM chessgames ORDER BY blackRating+whiteRating DESC LIMIT 10;

--First 10 openings in the system in which black was the underdog
SELECT systemName, Winner, whiteRating, blackRating FROM chessgames WHERE whiteRating > blackRating ORDER BY systemName LIMIT 10;

--Average rating for both white and black (as well as the average difference between them) for each opening
SELECT systemName, AVG(whiteRating), AVG(blackRating), AVG(ratingDifference) FROM chessgames GROUP BY systemName ORDER BY AVG(ratingDifference);

--The total amount of games played with each opening from most common to least common
SELECT COUNT(systemName), systemName FROM chessgames GROUP BY systemName HAVING COUNT(systemName) > 10 ORDER BY COUNT(systemName) DESC;

--The 15 most common openings used when two chess masters are playing
SELECT "CODE: "||ECO||" was used a total of " ||COUNT(ECO)||" times in games where two chessmasters were present." FROM chessgames WHERE(whiteRating >= 2000 AND blackRating >= 2000) GROUP BY ECO ORDER BY COUNT(ECO) DESC LIMIT 15;

--The best and worst players in the data set, as well as the most lopsided games
SELECT "The two worst players... WHITE: "||MIN(whiteRating)||" BLACK: "||MIN(blackRating) FROM chessgames;
SELECT "The two best players... WHITE: "||MAX(whiteRating)||" BLACK: "||MAX(blackRating) FROM chessgames;

--The most lopsided games in the data set
SELECT "Black's most lopsided games... BLACK: "||blackRating||" WHITE: "||whiteRating||" WINNER: "||Winner FROM chessgames WHERE blackRating < whiteRating ORDER BY ratingDifference DESC LIMIT 1;
SELECT "Whites's most lopsided games... WHITE: "||whiteRating||" BLACK: "||blackRating||" WINNER: "||Winner FROM chessgames WHERE blackRating > whiteRating ORDER BY ratingDifference DESC LIMIT 1;

--The most herioc victories
SELECT "Black's most herioc victory... BLACK: "||blackRating||" WHITE: "||whiteRating||" WINNER: "||Winner FROM chessgames WHERE blackRating < whiteRating AND Winner == "black" ORDER BY ratingDifference DESC LIMIT 1;
SELECT "Whites's most herioc victory... WHITE: "||whiteRating||" BLACK: "||blackRating||" WINNER: "||Winner FROM chessgames WHERE blackRating > whiteRating AND Winner == "white" ORDER BY ratingDifference DESC LIMIT 1;

--Who wins more often?
SELECT Winner||": "||COUNT(winner) FROM chessgames GROUP BY Winner;

--APPARENTLY SOME GAMES RESULT IN DRAWS! (oops) so lets print the draws in order of total moves and victory type (draw or time-out)!
SELECT UPPER(Winner)||": "||whiteRATING,blackRating,victoryType||" in "||totalMoves||"moves" FROM chessgames WHERE Winner == "draw" ORDER BY victoryType,totalMoves;

--Lastly, lets print out a cheat sheet for our ECO / Opening System... (simple but very useful)
SELECT ECO||"        "||systemName FROM chessgames GROUP BY systemName ORDER BY ECO;
SELECT ECO||"        "||systemName FROM chessgames GROUP BY ECO ORDER BY systemName;
