##MOVIE
#Question 1 - List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr = 1962

#Question 2 - When was Citizen Kane released?
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

#Question 3 - List all of the Star Trek movies, include the id, title and yr 
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr ASC

#Question 4 - What id number does the actor 'Glenn Close' have?
SELECT DISTINCT actorid
FROM actor
JOIN casting
ON actor.id = casting.actorid
WHERE name = 'Glenn Close'

#Question 5 - What is the id of the film 'Casablanca' ?
SELECT id
FROM movie
WHERE title = 'Casablanca'

#Question 6 - Obtain the cast list for 'Casablanca'.

SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON casting.movieid = movie.id
WHERE title = 'Casablanca'

#Question 7
SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid
JOIN movie
ON casting.movieid = movie.id
WHERE title = 'Alien'

#Question 8
SELECT title
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'

#Question 9 - Harrison Ford as a supporting actor
SELECT title
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
AND ord!=1

#Question 10 - Lead actors in 1962 movies
SELECT title, name
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE yr = 1962
AND ord = 1

#Question 11 - Busy years for Rock Hudson
SELECT yr, COUNT(*) AS busy
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING busy > 2

#Question 12 - Lead actor in Julie Andrews movies
SELECT title, name
FROM movie
JOIN casting
ON
movie.id = casting.movieid AND ord=1
JOIN actor
ON casting.actorid = actor.id
WHERE movie.id IN (
	SELECT id
	FROM movie
	JOIN casting
	ON
	movie.id = casting.movieid
	WHERE actorid IN (
	  SELECT id FROM actor
	  WHERE name='Julie Andrews')
	)

#Question 13 - Actors with 15 leading roles
SELECT name
FROM actor
JOIN casting
ON actor.id = casting.actorid AND ord=1
GROUP BY name
HAVING COUNT(*) >= 15
ORDER BY name ASC

#Question 14 - List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actorid) AS cast_am
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY title
ORDER by cast_am DESC, title 

#Question 15 - List all the people who have worked with 'Art Garfunkel'.
SELECT actor.name
FROM casting 
JOIN actor ON actorid=actor.id
JOIN
  (SELECT movieid, name FROM casting JOIN actor
   ON actor.id=actorid WHERE
   name='Art Garfunkel') AS garf
ON garf.movieid=casting.movieid
WHERE actor.name<>garf.name