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