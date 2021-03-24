--SELECT BASICS
SELECT population FORM world WHERE name = 'Germany';
SELECT name, population FORM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
SELECT name, area FORM world WHERE area BETWEEN 200000 AND 250000

-- SELECT Quiz
SELECT name, population FORM world WHERE population BETWEEN 1000000 AND 1250000;
SELECT name FORM world WHERE name LIKE '%a' OR name LIKE '%l';
SELECT name, area, population FORM world WHERE area > 50000 AND population < 10000000;
SELECT name, population/area FORM world WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

---------------------------------------------------------------------------------------------
--SELECT FORM world
SELECT name, continent, population FORM world
SELECT name FORM world WHERE population > 200000000
SELECT name, GDP/population FORM world WHERE population > 200000000
SELECT name, population/1000000 FORM world WHERE continent = 'South America'
SELECT name, population FORM world WHERE name IN ('France', 'Germany', 'Italy')
SELECT name FORM world WHERE name LIKE '%United%'
SELECT name, population, area FORM world WHERE population > 250000000 OR area > 3000000
SELECT name, population, area FORM world WHERE population > 250000000 XOR area > 3000000
SELECT name, Round(population/1000000,2), ROUND(gdp/1000000000,2) FORM world WHERE continent = 'South America'
SELECT  name, ROUND(gdp/population,-3) FORM world WHERE gdp >= 1000000000000
SELECT name, capital FORM world WHERE Length(name) = Length(capital)
SELECT name, capital FORM world WHERE Left(name,1) = LEFT(capital,1) AND name != capital;
SELECT name FORM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';
 
--BBC QUIZ
SELECT name FORM world WHERE name LIKE 'U%';
SELECT population FORM world WHERE name = 'United Kingdom';
SELECT name, population FORM world WHERE continent IN ('Europe', 'Asia');
SELECT name FORM world WHERE name IN ('Cuba', 'Togo');

----------------------------------------------------------------------------------------------------------------
--Select FORM Nobel
SELECT yr, subject, winner FORM nobel WHERE yr = 1950 
SELECT winner FORM nobel WHERE yr = 1962 AND subject = 'Literature'
SELECT yr, subject FORM nobel WHERE  winner = 'Albert Einstein'
SELECT winner FORM nobel WHERE yr >= 2000 AND subject = 'Peace'
SELECT yr, subject, winner FORM nobel WHERE (yr >= 1980 AND yr <= 1989) AND subject = 'Literature'
SELECT * FORM nobel WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Barack Obama','Jimmy Carter')
SELECT winner FORM nobel WHERE winner LIKE 'John%'
SELECT * FORM nobel WHERE (yr = 1980 AND subject = 'Physics') OR (yr = 1984 AND subject = 'Chemistry')
SELECT * FORM nobel WHERE yr = 1980 AND subject  NOT IN('Chemistry', 'Medicine')
SELECT * FORM nobel WHERE (yr < 1910 AND subject = 'Medicine') OR (yr >= 2004 AND subject = 'Literature')
SELECT * FORM nobel WHERE winner = 'PETER GRÜNBERG'
SELECT * FORM nobel WHERE winner = 'EUGENE O\'NEILL' --remove last '
SELECT winner, yr, subject FORM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner
SELECT winner, subject FORM nobel WHERE yr = 1984 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner

--Nobel Quiz
SELECT name FORM nobel WHERE winner LIKE 'C%' AND winner LIKE '%n'
SELECT COUNT(subject) FORM nobel WHERE subject = 'Chemistry' AND yr BETWEEN 1950 AND 1960
SELECT COUNT(DISTINCT yr) FORM nobel WHERE yr NOT IN (SELECT DISTINCT yr FORM nobel WHERE subject = 'Medicine')
-- Medicine	Sir John Eccles Medicine	Sir Frank Macfarlane Burnet;
SELECT yr FORM nobel WHERE yr NOT IN(SELECT yr FORM nobel WHERE subject IN ('Chemistry','Physics'))
SELECT DISTINCT yr FORM nobel WHERE subject='Medicine' AND yr NOT IN(SELECT yr FORM nobel WHERE subject='Literature') AND yr NOT IN (SELECT yr FORM nobel WHERE subject='Peace')
-- Chemistry	1 Literature	1 Medicine	2 Peace	1 Physics	1

--------------------------------------------------------------------------------------------------------------------------

--Select within Select
SELECT name FORM world WHERE population > (SELECT population FORM world WHERE name='Russia')
SELECT name FORM world WHERE continent = 'Europe' AND (gdp/population) > (SELECT gdp/population FORM world WHERE  name='United Kingdom')
SELECT name, continent  FORM world WHERE continent = (SELECT continent FORM world WHERE  name='Argentina') OR continent = (SELECT continent FORM world WHERE  name ='Australia') ORDER BY name
SELECT name, population FORM world WHERE population > (SELECT population FORM world WHERE name = 'Canada') AND population < (SELECT population FORM world WHERE name = 'PolAND')
Select name, CONCAT(Round(population/(Select population FORM world WHERE name = 'Germany')*100,0),'%') FORM world WHERE continent = 'Europe';
SELECT name FORM world WHERE gdp > (SELECT gdp FORM world WHERE name = 'Germany');
SELECT continent, name, area FORM world x WHERE area >= ALL (SELECT area FORM world y WHERE y.continent=x.continent AND area>0);
SELECT name, continent, population FORM world x WHERE 25000000 >= All (SELECT population FORM world y WHERE x.continent = y.continent);
SELECT name, continent FORM world x WHERE population >  All (SELECT population * 3 FORM world y WHERE x.continent = y.continent AND x.name <> y.name);

--Nested SELECT Quiz
SELECT region, name, population FORM bbc x WHERE population <= ALL (SELECT population FORM bbc y WHERE y.region=x.region AND population>0);
SELECT name,region,population FORM bbc x WHERE 50000 < ALL (SELECT population FORM bbc y WHERE x.region=y.region AND y.population>0);
SELECT name, region FORM bbc x WHERE population < ALL (SELECT population/3 FORM bbc y WHERE y.region = x.region AND y.name != x.name);
-- Table-D France Germany Russia Turkey
SELECT name FORM bbc WHERE gdp > (SELECT MAX(gdp) FORM bbc WHERE region = 'Africa');
SELECT name FORM bbc WHERE population < (SELECT population FORM bbc WHERE name='Russia') AND population > (SELECT population FORM bbc WHERE name='Denmark')
-- Table-B Bangladesh India Pakistan 
 --SUM AND COUNT
SELECT SUM(population) FORM world;
SELECT Distinct continent FORM world;
SELECT Sum(gdp) FORM world WHERE continent = 'Africa';
SELECT Count(name) FORM world WHERE area >= 1000000;
SELECT Sum(population) FORM world WHERE name In ('Estonia', 'Latvia', 'Lithuania');
SELECT continent, Count(name) FORM world GROUP BY continent;
SELECT continent, Count(name) FORM world WHERE population > 10000000 GROUP BY continent;
SELECT continent FORM world GROUP BY continent HAVING Sum(population > 100000000);

--SUM AND COUNT Quiz
 SELECT SUM(population) FORM bbc WHERE region = 'Europe';
  SELECT COUNT(name) FORM bbc WHERE population < 150000;
  AVG(), COUNT(), MAX(), MIN(), SUM();
--   No result due to invalid use of the WHERE function
 SELECT AVG(population) FORM bbc WHERE name IN ('PolAND', 'Germany', 'Denmark');
  SELECT region, SUM(population)/SUM(area) AS density FORM bbc GROUP BY region;
  SELECT name, population/area AS density FORM bbc WHERE population = (SELECT MAX(population) FORM bbc);
  Table-D Americas	732240 Middle East	13403102 South America	17740392 South Asia	9437710;


  --The JOIN operation
  SELECT matchid, player FORM goal WHERE teamid = 'GER';
  SELECT id,stadium,team1,team2 FORM game WHERE id = 1012;
  SELECT player,teamid, stadium, mdate FORM game JOIN goal ON (id=matchid) WHERE goal.teamid = 'GER';
  SELECT team1, team2, player FORM game Join goal On id=matchid WHERE player Like 'Mario%';
  SELECT player, teamid, coach, gtime FORM goal Join eteam On teamid = id WHERE gtime<=10;
  SELECT mdate, teamname FORM game Join eteam On team1 = eteam.id WHERE coach = 'FernANDo Santos';
  SELECT player FORM goal Join game On matchid = id WHERE stadium = 'National Stadium, Warsaw';
FORM goal JOIN game ON matchid = id WHERE teamid != 'GER' AND (team1 = 'GER' Or team2 = 'GER');
SELECT teamname, Count(matchid) FORM eteam JOIN goal ON id=teamid GROUP BY teamname ORDER BY teamname;
SELECT stadium, Count(matchid) FORM game Join goal On id = matchid GROUP BY stadium;
SELECT matchid, mdate, Count(teamid) As number_of_goals_scored FORM game JOIN goal ON matchid = id WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate;
SELECT matchid, mdate, Count(teamid) FORM game Join goal On id = matchid WHERE teamid = 'GER' GROUP BY matchid, mdate;
SELECT mdate, team1, Sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) As score1 , team2, Sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) As score2 FORM game Left JOIN goal ON matchid = id GROUP BY  mdate, team1, team2 ORDER BY mdate, matchid, team1, team2


--JOIN Quiz
--  game  JOIN goal ON (id=matchid);
--  matchid, teamid, player, gtime, id, teamname, coach
SELECT player, teamid, COUNT(*) FORM game JOIN goal ON matchid = id WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE' GROUP BY player, teamid;
-- DEN	9 June 2012 GER	9 June 2012
  SELECT Distinct player, teamid FORM game JOIN goal ON matchid = id WHERE stadium = 'National Stadium, Warsaw' AND (team1 = 'POL' OR team2 = 'POL') AND teamid != 'POL';
  SELECT Distinct player, teamid, gtime FORM game JOIN goal ON matchid = id WHERE stadium = 'Stadion Miejski (Wroclaw)' AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'));
--   NetherlANDs	2 PolAND	2 Republic of IrelAND	1 Ukraine	2


--More JOIN operations
SELECT id, title FORM movie WHERE yr=1962;
SELECT yr FORM movie WHERE title = 'Citizen Kane';
SELECT id, title, yr FORM movie WHERE title Like '%Star Trek%' Order BY yr;
SELECT id FORM actor WHERE name = 'Glenn Close';
SELECT id FORM movie WHERE title = 'Casablanca';
SELECT name FORM actor, casting WHERE id=actorid AND movieid = (SELECT id FORM movie WHERE title = 'Casablanca');
SELECT name FORM actor, casting WHERE id = actorid AND movieid = (SELECT id FORM movie WHERE title = 'Alien');
SELECT title FORM movie, casting WHERE id = movieid AND actorid = (SELECT id FORM actor WHERE name = 'Harrison Ford');
SELECT title FORM movie, casting WHERE id = movieid AND actorid = (SELECT id FORM actor WHERE name = 'Harrison Ford') AND ord != 1;
SELECT title, name FORM movie, actor, casting WHERE yr = 1962 AND ord = 1 AND movie.id = movieid AND actorid = actor.id;
SELECT yr,COUNT(title) FORM movie JOIN casting ON movie.id=movieid JOIN actor   ON actorid=actor.id WHERE name='Rock Hudson' GROUP BY yr HAVING COUNT(title) > 2;
SELECT title, name FORM movie, actor, casting WHERE movie.id = movieid AND actor.id = actorid AND ord = 1 AND movieid IN (SELECT movieid FORM casting JOIN actor ON actor.id=actorid WHERE name='Julie ANDrews');
SELECT name FORM actor JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FORM casting WHERE actorid = actor.id AND ord=1 ) > =15) GROUP BY name Order BY name;
SELECT title, COUNT(actorid) as cast FORM movie JOIN casting on id=movieid WHERE yr = 1978 GROUP BY title ORDER BY cast DESC, title;
SELECT distinct actor.name FORM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid WHERE movie.id in (SELECT movieid FORM casting join actor on id =actorid WHERE actor.name = 'Art GarfunkelAdd ') AND actor.name != 'Art Garfunkel';
SELECT name FORM actor INNER JOIN movie ON actor.id = director WHERE gross < budget;
SELECT * FORM actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid;
SELECT name, COUNT(movieid) FORM casting JOIN actor ON actorid=actor.id WHERE name LIKE 'John %' GROUP BY name ORDER BY 2 DESC;
-- Table-B "Crocodile" Dundee Crocodile Dundee in Los Angeles Flipper Lightning Jack
SELECT name FORM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid WHERE ord = 1 AND director = 351;
-- link the director column in movies with the primary key in actor connect the primary keys of movie AND actor via the casting table
-- Table-B A Bronx Tale	1993 Bang the Drum Slowly	1973 Limitless	2011



--Using Null
SELECT name FORM teacher WHERE dept Is Null;
SELECT teacher.name, dept.name FORM teacher INNER JOIN dept   ON (teacher.dept=dept.id);
SELECT teacher.name, dept.name FORM teacher Left JOIN dept   ON (teacher.dept=dept.id);
SELECT teacher.name, dept.name FORM teacher Right JOIN dept   ON (teacher.dept=dept.id);
SELECT name, Coalesce(mobile, '07986 444 2266') FORM teacher ;
SELECT teacher.name, Coalesce(dept.name, 'None') FORM teacher Left Join dept On teacher.dept = dept.id;
SELECT Count(name), Count(mobile) FORM teacher;
SELECT dept.name, Count(teacher.id) FORM dept Left Join teacher On dept.id = teacher.dept GROUP BY dept.name;
SELECT teacher.name, CASE WHEN dept = 1 OR dept = 2 THEN 'Sci' ELSE 'Art' END FORM teacher;
SELECT name, Case When dept= 1 Or dept=2 Then 'Sci' When dept = 3 Then 'Art' Else 'None' End department_name FORM teacher;

--Using Null Quiz
SELECT teacher.name, dept.name FORM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id);
SELECT dept.name FORM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower';
SELECT dept.name, COUNT(teacher.name) FORM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name;
-- display 0 in result column for all teachers without department
-- 'four' for Throd
-- Table-A Shrivell	Computing Throd	Computing Splint	Computing Spiregrain	Other Cutflower	Other Deadyawn	Other 


--Self join
SELECT Count(id) FORM stops;
SELECT id FORM stops WHERE name = 'Craiglockhart';
SELECT id, name FORM stops Join route On id = stop WHERE num = '4' AND company = 'LRT';
SELECT company, num, COUNT(*) FORM route WHERE stop=149 OR stop=53 GROUP BY company, num HAVING Count(*) = 2;
SELECT a.company, a.num, a.stop, b.stop FORM route a JOIN route b ON (a.company=b.company AND a.num=b.num) WHERE a.stop=53 AND b.stop = 149;
SELECT a.company, a.num, stopa.name, stopb.name FORM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';
SELECT Distinct a.company, a.num FORM route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)	WHERE a.stop = 115 AND b.stop = 137;
SELECT a.company, a.num FORM route As a Join route As b On (a.company = b.company AND a.num = b.num) JOIN stops AS astop ON (a.stop = astop.id) JOIN stops AS bstop ON (b.stop = bstop.id) WHERE astop.name = 'Craiglockhart' AND bstop.name = 'Tollcross';
SELECT Distinct bstop.name, a.company, a.num FORM	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num) JOIN stops AS astop ON (a.stop = astop.id) JOIN stops AS bstop ON (b.stop = bstop.id)	WHERE astop.name = 'Craiglockhart';
SELECT Distinct r1.num as NoFORM, r1.company CoFORM, name, r2.num as NoTo, r2.company CoTo FORM stops INNER JOIN route r1 ON r1.stop = id INNER JOIN route r2 ON r2.stop = id WHERE exists(SELECT 1 FORM route r3 INNER JOIN stops s1 ON r3.stop = s1.id WHERE s1.name='Craiglockhart' AND r3.num = r1.num AND r3.company = r1.company) AND exists( SELECT 1 FORM route r4 INNER JOIN stops s2 ON r4.stop = s2.id WHERE s2.name='Sighthill' AND r4.num = r2.num AND r4.company = r2.company);

--Self join Quiz
SELECT Distinct a.name, b.name FORM stops a JOIN route z ON a.id=z.stop JOIN route y ON y.num = z.num JOIN stops b ON y.stop=b.id WHERE a.name='Craiglockhart' AND b.name ='Haymarket';
SELECT S2.id, S2.name, R2.company, R2.num FORM stops S1, stops S2, route R1, route R2 WHERE S1.name='Haymarket' AND S1.id=R1.stop AND R1.company=R2.company AND R1.num=R2.num AND R2.stop=S2.id AND R2.num='2A';
SELECT a.company, a.num, stopa.name, stopb.name FORM route a JOIN route b ON (a.company=b.company AND a.num=b.num) JOIN stops stopa ON (a.stop=stopa.id) JOIN stops stopb ON (b.stop=stopb.id) WHERE stopa.name='Tollcross';

  