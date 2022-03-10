--1. Write a procedure insertToMovie that inserts a tuple to table Movie.
--Note that the insertion should not be done if the following condition is
--violated: No more than four movies in any year.
CREATE OR REPLACE PROCEDURE insertToMovie (
        ID INTEGER,
        Title VARCHAR2,
        Year NUMBER,
        Score FLOAT,
        Votes INTEGER
    ) IS countMovies INTEGER;
BEGIN
SELECT COUNT(*) INTO countMovies
FROM MOVIE
WHERE Year = Year;
IF countMovies >= 4 THEN dbms_output.put_line('Violated: No more than 4 movies in any year.');
ELSE
INSERT INTO MOVIE
values(ID, Title, Year, Score, Votes);
COMMIT;
END IF;
END;
/ --2.Write a procedure insertToCasting that inserts a tuple to table Casting.
--Note that the insertion should not be done, if either of the following conditions is violated,
--(a) No actor is cast in the same billing order with some other actor in a movie.
--(For example, ‘ Leonardo DiCaprio ’ has Ordinal 1 in movie ‘ Titanic ’and other
--actor cannot have the same Ordinal value.)
--The constraint will not affect tuples already in the table.
--(b) No actor can cast in more than three movies in any year
CREATE OR REPLACE PROCEDURE insertToCasting (
        MovieID INTEGER,
        ActorID INTEGER,
        Ordinal INTEGER
    ) IS tempOrdinal INTEGER;
tempMovieCount INTEGER;
firstValidation INTEGER;
secondValidation INTEGER;
currentYear VARCHAR2(4);
BEGIN
SELECT TO_CHAR(SYSDATE, 'YYYY') INTO currentYear
FROM DUAL;
SELECT COUNT(ActorID) INTO tempOrdinal
FROM CASTING
WHERE MovieID = MovieID
    AND Ordinal = Ordinal
    AND ActorID <> ActorID;
SELECT COUNT(MOVIE.MovieID) INTO tempMovieCount
FROM CASTING,
    MOVIE
WHERE CASTING.MovieID = MOVIE.MovieID
    AND CASTING.ActorID = ActorID
    AND MOVIE.Year = currentYear;
IF (
    tempOrdinal = 0
    AND tempMovieCount < 3
) THEN
INSERT INTO CASTING
VALUES (MovieID, ActorID, Ordinal);
COMMIT;
ELSE dbms_output.put_line('Error');
END IF;
END;
/ --3. Add a column RecentDate to table Actor.
--Then, write a trigger so that every time when an insertion or update occurs to table
--Casting, the current date, using SYSDATE, should be updated in table Actor for the actor cast in the movie.
--Below is an example of using SYSDATE to change the RecentDate value for an actor:
--
ALTER TABLE ACTOR
ADD recentDate Date;
CREATE OR REPLACE TRIGGER tableChange
AFTER
INSERT
    OR
UPDATE ON CASTING FOR EACH ROW BEGIN
UPDATE ACTOR
SET recentDate = SYSDATE
WHERE Actor.ActorID = :NEW.ActorID;
END tableChange;