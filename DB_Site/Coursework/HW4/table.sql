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
.import outfile2.csv chessgames