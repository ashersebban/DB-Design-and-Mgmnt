DROP TABLE IF EXISTS 'chessgames';
CREATE TABLE IF NOT EXISTS 'chessgames' (
'whiteRating' INTEGER,
'blackRating' INTEGER,
'totalMoves' INTEGER,
'victoryType' TEXT,
'Winner' TEXT,
'ratingDifference' INTEGER,
'ECO' TEXT,
'systemName' TEXT
);

.mode csv
.import asg4_as10518.csv chessgames