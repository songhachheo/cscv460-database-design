--View KevinBacon
CREATE OR REPLACE VIEW KevinBacon AS
SELECT A.Name,
    COUNT(A.ActorID) AS ActWithBacon
FROM ACTOR A
    INNER JOIN CASTING C ON A.ActorID = C.ActorID
WHERE A.Name != 'Kevin Bacon'
    AND C.MovieID IN (
        SELECT MovieID
        FROM Casting
        WHERE ActorID IN (
                SELECT ActorID
                FROM Actor
                WHERE Name = 'Kevin Bacon'
            )
    )
GROUP BY A.ActorID,
    A.Name;
--
--Test Statement
--SELECT *
--FROM KevinBacon;
--
--VIEW POPULARITY
CREATE OR REPLACE VIEW POPULARITY AS
SELECT DISTINCT A.ActorID,
    A.Name,
    SUM(M.Score * M.Votes) AS COMPOSITESCORE
FROM ACTOR A
    INNER JOIN CASTING C ON A.ActorID = C.ActorID
    INNER JOIN MOVIE M ON C.MovieID = M.MovieID
GROUP BY A.ActorID,
    A.Name
ORDER BY COMPOSITESCORE DESC;
--
--Test Statement
--SELECT *
--FROM POPULARITY;