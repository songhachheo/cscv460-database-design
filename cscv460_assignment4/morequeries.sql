--Query 1
--List the movieid value of movie Titanic.
SELECT MOVIEID
FROM MOVIE
WHERE TITLE = 'Titanic';
--Query 2
--List the actorid value of actor Kevin Bacon.
SELECT ACTORID
FROM ACTOR
WHERE NAME = 'Kevin Bacon';
--Query 3
--List the average movie score in the movie database.
SELECT AVG(SCORE)
FROM MOVIE;
--Query 4
--List the title of movies that have scores greater than the average score in the movie database.
SELECT TITLE
FROM MOVIE
WHERE SCORE > (
        SELECT AVG(SCORE)
        FROM MOVIE
    );
--Query 5
--List the name of actors who were cast in movie with movieid = 4.
SELECT ACTOR.NAME
FROM ACTOR
    JOIN CASTING ON ACTOR.ACTORID = CASTING.ACTORID
    JOIN MOVIE ON CASTING.MOVIEID = MOVIE.MOVIEID
WHERE MOVIE.MOVIEID = 4;
--Query 6
--List the titles of movies that cast the actor Kevin Bacon.
SELECT MOVIE.TITLE
FROM MOVIE
    JOIN CASTING ON MOVIE.MOVIEID = CASTING.MOVIEID
    JOIN ACTOR ON CASTING.ACTORID = ACTOR.ACTORID
WHERE ACTOR.NAME = 'Kevin Bacon';
--Query 7
--List the actorid values of actors that were cast in any movie that have votes between 3000 and 4000.
SELECT ACTOR.ACTORID
FROM ACTOR
    JOIN CASTING ON ACTOR.ACTORID = CASTING.ACTORID
    JOIN MOVIE ON CASTING.MOVIEID = MOVIE.MOVIEID
WHERE MOVIE.VOTES BETWEEN '3000' AND '4000';
--Query 8
--List the names of actor, if any, that were cast in any movie that has votes between 3000 and 4000.
SELECT ACTOR.NAME
FROM ACTOR
    JOIN CASTING ON ACTOR.ACTORID = CASTING.ACTORID
    JOIN MOVIE ON CASTING.MOVIEID = MOVIE.MOVIEID
WHERE MOVIE.VOTES BETWEEN '3000' AND '4000';
--Query 9
--List the titles of movies that have a higher score than some movie in the database.
--(Don't hardcode "some" movie as any specific movie such as "Titanic".)
SELECT TITLE
FROM MOVIE
WHERE SCORE > (
        SELECT MIN(SCORE)
        FROM MOVIE
    );
--Query 10
--List the highest score of movies in the database.
SELECT MAX(SCORE)
FROM MOVIE;
--Query 11
--List the titles of movies that have the highest score in the database.
SELECT TITLE
FROM MOVIE
WHERE SCORE = (
        SELECT MAX(SCORE)
        FROM MOVIE
    );
--Query 12
--Find the IDs of actors who were cast in more than one movie.
SELECT ACTOR.ACTORID
FROM ACTOR
    JOIN CASTING ON ACTOR.ACTORID = CASTING.ACTORID
    JOIN MOVIE ON CASTING.MOVIEID = MOVIE.MOVIEID
GROUP BY ACTOR.ACTORID
HAVING COUNT(MOVIE.MOVIEID) > 1;
--Query 13
--List the titles of movies that have a cast of more than 5 actors.
SELECT MOVIE.TITLE
FROM MOVIE
    JOIN CASTING ON MOVIE.MOVIEID = CASTING.MOVIEID
GROUP BY MOVIE.TITLE
having count(CASTING.ACTORID) > 5;
--Query 14
--For each year, list the best scores held by the movies made in that year.
SELECT DISTINCT YEAR,
    SCORE
FROM MOVIE
GROUP BY YEAR,
    SCORE
HAVING SCORE = MAX(SCORE)
ORDER BY YEAR;
--Query 15
--For each year, list the title of the movie with the most votes.
SELECT DISTINCT YEAR,
    TITLE
FROM MOVIE
GROUP BY TITLE,
    YEAR,
    VOTES
HAVING VOTES = MAX(VOTES);
--Query 16
--List the titles of both the movie with the highest score and the movie with the second highest score.
SELECT *
FROM (
        SELECT TITLE,
            SCORE
        FROM MOVIE
        ORDER BY SCORE DESC
    )
WHERE ROWNUM <= 2;
--Query 17
--Arnold Schwarzenegger was cast in many movies. In some years he was cast in two or more movies. For each year in which he was cast in at least two different movies, list the year and the number of movies in which he was a cast member.
SELECT MOVIE.YEAR,
    COUNT(MOVIE.TITLE)
FROM MOVIE
    JOIN CASTING ON CASTING.MOVIEID = MOVIE.MOVIEID
    JOIN ACTOR ON CASTING.ACTORID = ACTOR.ACTORID
WHERE ACTOR.ACTORID = '515'
GROUP BY YEAR
HAVING COUNT(MOVIE.TITLE) >= 2
ORDER BY YEAR ASC;
--Query 18
--List the names of actors, if any, that were cast in all the movies that have votes between 3000 and 4000.
SELECT ACTOR.NAME
FROM ACTOR
    JOIN CASTING ON ACTOR.ACTORID = CASTING.ACTORID
    JOIN MOVIE ON CASTING.MOVIEID = MOVIE.MOVIEID
WHERE MOVIE.VOTES BETWEEN '3000' and '4000';
--Query 19
--List the name of actors that have appeared in more than 10 movies.
SELECT ACTOR.NAME
FROM ACTOR
    JOIN CASTING ON ACTOR.ACTORID = CASTING.ACTORID
    JOIN MOVIE ON CASTING.MOVIEID = MOVIE.MOVIEID
GROUP BY ACTOR.NAME
having count(MOVIE.MOVIEID) > 10;
--Query 20
--From among the actors that have appeared in more than 10 movies, list their name and the average score of all the movies they were cast in.
SELECT ACTOR.NAME,
    AVG(MOVIE.SCORE)
FROM ACTOR
    JOIN CASTING ON ACTOR.ACTORID = CASTING.ACTORID
    JOIN MOVIE ON CASTING.MOVIEID = MOVIE.MOVIEID
GROUP BY ACTOR.NAME
HAVING COUNT(MOVIE.MOVIEID) > 10;