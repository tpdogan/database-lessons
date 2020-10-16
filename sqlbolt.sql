/*
Find titles
Find directors
Find title and director
Find title and year
Find all
*/
SELECT Title FROM movies;
SELECT Director FROM movies;
SELECT Title, Director FROM movies;
SELECT Title, Year FROM movies;
SELECT * FROM movies;
/*
Find movie with id=6
Find movies released [2000-2010]
Find movies not released [2000-2010]
Find title of first 5 movies and years
*/
SELECT * FROM movies WHERE id = 6;
SELECT * FROM movies WHERE year BETWEEN 2000 AND 2010;
SELECT * FROM movies WHERE year NOT BETWEEN 2000 AND 2010;
SELECT Title, Year FROM movies WHERE id < 6;
/*
Find all toy story movies
Find all movies with director John Lasseter
Find all movies and director not directed by John Lasseter
Find all WALL-* movies
*/
SELECT * FROM movies WHERE Title LIKE '%TOY STORY%';
SELECT * FROM movies WHERE Director = 'John Lasseter';
SELECT * FROM movies WHERE NOT Director = 'John Lasseter';
SELECT * FROM movies WHERE Title LIKE '%WALL-_%';
/*
List all directors alphabetically without duplicates
List last four recent movies
List first five movies alphabetically
List second five movies alphabetically (from 6 to 10)
*/
SELECT DISTINCT Director FROM movies ORDER BY Director;
SELECT * FROM movies ORDER BY Year DESC LIMIT 4;
SELECT * FROM movies ORDER BY Title ASC LIMIT 5;
SELECT * FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;
/*
List all canadian cities and population
List all cities in US order by latitude from north to south
List all cities west of Chicago order from west to east
List two largest cities in mexico by population
List the third and fourth largest cities in US
*/
SELECT City, Population
FROM North_american_cities WHERE Country = 'Canada';

SELECT * FROM north_american_cities
WHERE Country = 'United States' ORDER BY Latitude DESC;

SELECT * FROM North_american_cities
WHERE Longitude < (SELECT Longitude FROM North_american_cities
WHERE City = 'Chicago') ORDER BY Longitude ASC;

SELECT * FROM North_american_cities
WHERE Country = 'Mexico' ORDER BY Population DESC LIMIT 2;

SELECT * FROM North_american_cities
WHERE Country = 'United States'
ORDER BY Population DESC LIMIT 2 OFFSET 2;
/*
Find domestic and international sales
Show movies with better international sales
List all by descending ratings
*/
SELECT movies.Title, Boxoffice.Domestic_sales,
Boxoffice.International_sales
FROM movies INNER JOIN Boxoffice
ON movies.id = Boxoffice.Movie_id;

SELECT movies.Title,
Boxoffice.Domestic_sales, Boxoffice.International_sales
FROM movies INNER JOIN Boxoffice
ON movies.id = Boxoffice.Movie_id
WHERE Boxoffice.International_sales > Boxoffice.Domestic_sales;

SELECT movies.Title, Boxoffice.Rating
FROM movies INNER JOIN Boxoffice
ON movies.id = Boxoffice.Movie_id
ORDER BY Boxoffice.Rating DESC;
/*
Find buildings that have employees
List buildings and their capacity
List building and distinct employee roles
*/
SELECT DISTINCT Building_name
FROM Buildings LEFT JOIN Employees
ON Buildings.Building_name = Employees.Building
WHERE Employees.Name IS NOT NULL;

SELECT * FROM Buildings;

SELECT DISTINCT Buildings.Building_name, Employees.Role
FROM Buildings LEFT JOIN Employees
ON Buildings.Building_name = Employees.Building;
/*
Find name and role of employees without building
Find buildings without employees
*/
SELECT * FROM Employees WHERE Building IS NULL;

SELECT * FROM Buildings LEFT JOIN Employees
ON Buildings.Building_name = Employees.Building
WHERE Employees.Building IS NULL;
/*
List movies and combined sales in millons dollars
List movies and rating in percent
List movies released on even number years
*/
SELECT Movies.Title,
(Boxoffice.Domestic_sales + Boxoffice.International_sales)/1000000
AS Combined
FROM Movies INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id;

SELECT Movies.Title,
Boxoffice.Rating * 10 AS Percent
FROM Movies INNER JOIN Boxoffice
ON Movies.Id = Boxoffice.Movie_id;

SELECT * FROM Movies WHERE Year%2 = 0;
/*
Find longest employed
Find average years for each role
Find total work years in each building
*/
SELECT MAX(Years_employed) FROM Employees;
SELECT Role, AVG(Years_employed) FROM Employees GROUP BY Role;
SELECT Building, SUM(Years_employed) FROM Employees GROUP BY Building;
/*
Find number of Artists without HAVING
Find number of Employees of each role
Find total employed years by engineers
*/
SELECT Role, COUNT(*) FROM Employees WHERE Role = 'Artist';
SELECT Role, COUNT(*) FROM Employees GROUP BY Role;
SELECT Role, SUM(Years_employed) FROM Employees WHERE Role = 'Engineer';
/*Order of execution
FROM - JOIN
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
LIMIT - OFFSET
*/
/*
Find number of movies for each director
Find total sales to each director
*/
SELECT Director, COUNT(*) FROM Movies GROUP BY Director;

SELECT Movies.Director,
SUM(Boxoffice.Domestic_sales + Boxoffice.International_sales)
AS Total_sales
FROM Movies JOIN Boxoffice
ON Movies.id = Movie_id
GROUP BY Movies.Director;
/*
Add Toy Story 4 to movie list
Add Toy Story 4 record to box office
*/
INSERT INTO Movies (Title) VALUES ('Toy Story 4');

INSERT INTO Boxoffice VALUES
((SELECT Id FROM Movies WHERE Title = 'Toy Story 4'),
8.7, 340000000, 270000000);
/*
Update director for A Bug's Life to John Lasseter
Update Toy Story 2 year to 1999
Update Toy Story 8 and director to 3 and Lee Unkrich
*/
UPDATE Movies SET Director = 'John Lasseter'
WHERE Title = "A Bug's Life";

UPDATE Movies SET Year = 1999
WHERE Title = 'Toy Story 2';

UPDATE Movies SET Title = 'Toy Story 3', Director = 'Lee Unkrich'
WHERE Title = 'Toy Story 8';
/*
Remove movies released before 2005
Remove movies directed by Andrew Stanton
*/
DELETE FROM Movies WHERE Year < 2005;
DELETE FROM Movies WHERE Director = 'Andrew Stanton';
/* Data Types
Integer
Boolean
Float
Double
Real
Character(length)
Varchar(length)
Text
Date
Datetime
Blob

Constraints
Primary Key
Autoincrement
Unique
Not null
Check (expression)
Foreign Key
*/
/*
Create table named Database with Name, Version, Download_Count
*/
CREATE TABLE IF NOT EXISTS Database
(Name TEXT, Version FLOAT, Download_Count INTEGER);
/*
Add column named Aspect_ratio
Add column named Language with default English
*/
ALTER TABLE Movies ADD Aspect_ratio FLOAT;
ALTER TABLE Movies ADD Language DEFAULT English;
/*
Remove Movies
Drop Boxoffice
*/
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Boxoffice;