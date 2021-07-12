DROP TABLE IF EXISTS 'chessgames';
CREATE TABLE IF NOT EXISTS 'chessgames' (
'gameTime' TEXT,
'whiteID' TEXT,
'whiteRating' INTEGER,
'blackID' TEXT,
'blackRating' INTEGER,
'totalMoves' INTEGER,
'victoryType' TEXT,
'Winner' TEXT,
'underdog' TEXT,
'ratingDifference' INTEGER,
'ECO' TEXT,
'untilPosition' INTEGER,
'systemName' TEXT
);

.mode csv
.import outfile3.csv chessgames