--Query 1
--List the titles of all mmovies.
select TITLE
from MOVIE;
/
--Query 2
--List the actor table.
select *
from ACTOR;
/
--Query 3
--List Movies that have scores greater than 7.0
select TITLE
from MOVIE
where SCORE > 7.0;
/
--Query 4
--List movies that have scores greater than 7.0 or years greater than 1990
select TITLE
from MOVIE
where SCORE > 7.0
or YEAR > 1990;
/
--Query 5
--List movies that have scores greater than 7.0 and years greater than 1990
select TITLE
from MOVIE
where SCORE > 7.0
and YEAR > 7.0;
/
--Query 6
--List movies that have votes between 3000 and 4000
select TITLE
from MOVIE
where VOTES between 3000 and 4000;

