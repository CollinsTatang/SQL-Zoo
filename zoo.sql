--SELECT BASICS
SELECT population FROM world WHERE name = 'Germany';
SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000

-- Select Quiz
SELECT name, population FROM world WHERE population BETWEEN 1000000 AND 1250000;
SELECT name FROM world WHERE name LIKE '%a' OR name LIKE '%l';
SELECT name, area, population FROM world WHERE area > 50000 AND population < 10000000;
SELECT name, population/area FROM world WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

---------------------------------------------------------------------------------------------
--SELECT from world
SELECT name, continent, population FROM world
SELECT name FROM world WHERE population > 200000000
SELECT name, GDP/population FROM world WHERE population > 200000000
SELECT name, population/1000000 FROM world WHERE continent = 'South America'
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy')
SELECT name FROM world WHERE name LIKE '%United%'
SELECT name, population, area FROM world WHERE population > 250000000 OR area > 3000000
SELECT name, population, area FROM world WHERE population > 250000000 XOR area > 3000000
SELECT name, Round(population/1000000,2), ROUND(gdp/1000000000,2) FROM world WHERE continent = 'South America'
SELECT  name, ROUND(gdp/population,-3) FROM world WHERE gdp >= 1000000000000
SELECT name, capital FROM world WHERE Length(name) = Length(capital)
SELECT name, capital FROM world WHERE Left(name,1) = LEFT(capital,1) AND name != capital;
SELECT name FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' And name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';
 
--BBC QUIZ
SELECT name FROM world WHERE name LIKE 'U%';
SELECT population FROM world WHERE name = 'United Kingdom';
SELECT name, population FROM world WHERE continent IN ('Europe', 'Asia');
SELECT name FROM world WHERE name IN ('Cuba', 'Togo');

