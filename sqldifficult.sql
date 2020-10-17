/*
All countries in a continent having population < 25M
SELECT name, continent, population FROM world
  WHERE continent = (SELECT continent FROM world x
    WHERE population = ALL
      (SELECT MAX(population) FROM world y
          WHERE x.continent = y.continent)
          AND population < 25000000)

Find max area for each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

Find countries that have at least 3 times more pop than any other in the same continent
SELECT name, continent FROM world z
  WHERE population > 3*
    (SELECT MAX(population) FROM world x
      WHERE population < (SELECT MAX(population) FROM world y 
                          WHERE x.continent = y.continent)
  AND z.continent = x.continent)

Find match dates and final score
SELECT mdate, team1, SUM(score1) AS score1, team2, SUM(score2) AS score2
FROM (SELECT mdate,
      team1, CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1,
      team2, CASE WHEN teamid=team2 THEN 1 ELSE 0 END score2,
      matchid
      FROM game JOIN goal ON matchid = id)
GROUP BY matchid
ORDER BY mdate, matchid, team1, team2

Films in 1978 ordered descending for number of actors but ascending for title
SELECT title, COUNT(actorid) FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title ASC

Self join to find connection from Hay to Leith
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'
GROUP BY a.num, a.company