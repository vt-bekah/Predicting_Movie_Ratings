CREATE TABLE Ratings(
   tconst          VARCHAR    NOT NULL,
   averageRating    VARCHAR    NOT NULL,
   numVotes         VARCHAR
);
Copy Ratings
FROM '\Users\bryan\Documents\Final_Project\Resources\ratings.tsv'
DELIMITER E'\t'
CSV HEADER;

CREATE TABLE Titlebasics(
	tconst	VARCHAR  ,
	titleType	VARCHAR,
	primaryTitle	VARCHAR ,
	originalTitle	VARCHAR,
	isAdult VARCHAR ,
	startYear VARCHAR,
	endYear VARCHAR,
	runtimeMinutes VARCHAR ,
	genres text, 	
PRIMARY KEY(tconst));
Copy Titlebasics
FROM '\Users\bryan\Documents\Final_Project\Resources\titlebasics.tsv'
WITH(HEADER,DELIMITER E'\t',NULL'NULL');



Select * From Titlebasics Where tconst not in (
	
	;
	CREATE TABLE Table_1980_Cleaned
  AS (
	Select *
	From Titlebasics 
	where startYear <> 'N'
	and startYear > '1980')

	
	
Select startYear, count(*) as cnt
	From Titlebasics 
	where startYear <> 'N'
	and startYear >1980
	group by 1;

CREATE TABLE namess(
	nconst	VARCHAR  ,
	primaryName	VARCHAR,
	birthYear	VARCHAR ,
	deathYear	VARCHAR,
	primaryProfession VARCHAR ,
	knownForTitles1 VARCHAR,
	knownForTitles2 VARCHAR,
	knownForTitles3 VARCHAR,
	knownForTitles4 VARCHAR,
	Primary Key (nconst)
);
Copy namess
FROM '\Users\bryan\Documents\Final_Project\Resoruces\namecleaned.tsv'
WITH(HEADER,DELIMITER E'\t',NULL'NULL');

	
CREATE INDEX idx_ratings_tconst ON Ratings(tconst);
CREATE INDEX idx_titlebasics_tconst ON Titlebasics(tconst);	
	
--remove 'N' and values before 1980
DELETE FROM titlebasics
WHERE startYear = 'N' OR (startYear <> 'N' AND startYear < '1980');	
--remove non movies from Titlebasics

DELETE FROM titlebasics
WHERE LOWER(titleType) NOT IN ('movie');
	
SELECT r.*
FROM Ratings r
LEFT JOIN Titlebasics t ON r.tconst = t.tconst
WHERE t.tconst IS NULL;

DELETE FROM Ratings
WHERE NOT EXISTS (SELECT 1 FROM Titlebasics WHERE Titlebasics.tconst = Ratings.tconst);
	
EXPLAIN DELETE FROM Ratings WHERE tconst NOT IN (SELECT tconst FROM Titlebasics);	
	
SELECT COUNT(tconst)
FROM Titlebasics		


	
SELECT * FROM Titlebasics ORDER BY startyear LIMIT 10 
SELECT * FROM Ratings ORDER BY tconst LIMIT 10 
SELECT * FROM Namess ORDER BY nconst LIMIT 10 
	
ALTER TABLE Ratings
ADD FOREIGN KEY (tconst) REFERENCES Titlebasics(tconst); 
	
ALTER TABLE Namess
ADD FOREIGN KEY (knownfortitles1) REFERENCES Titlebasics(tconst); 
	
UPDATE Namess
SET knownfortitles1 = NULL
Drop Table Ratings	
	
FROM Namess n
LEFT JOIN Titlebasics t ON n.knownfortitles1 = t.tconst
WHERE t.tconst IS NULL;

COPY titlebasics TO '\Users\bryan\Documents\Final_porj\Predicting_Movie_Ratings\Resources\IMDB_SQL_Titles.csv' WITH CSV HEADER;
COPY ratings TO '\Users\bryan\Documents\Final_porj\Predicting_Movie_Ratings\Resources\IMDB_SQL_Ratings.csv' WITH CSV HEADER;
	