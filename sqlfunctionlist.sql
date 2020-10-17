/*
Statements:

    SELECT
    CREATE TABLE
    DROP TABLE
    CREATE INDEX
    DROP INDEX
    UPDATE
    DELETE
    INSERT INTO
    CREATE DATABASE
    DROP DATABASE
    COMMIT (concept)
    ROLLBACK (concept)

Clauses:

    DISTINCT
    WHERE
    IN
    AND
    OR
    BETWEEN
    LIKE
    ORDER BY
    COUNT

Functions:

    GROUP BY
    HAVING
    AVG
    COUNT
    MIN
    MAX
    SUM
*/
/*
XOR -> either one but not both
LENGTH -> length of the string
LEFT -> LEFT(str,2) left two letters
CONCAT -> concatenate num and str

Defining a variable
Find max area for each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
