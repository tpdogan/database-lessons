/*select all table*/
SELECT * FROM family_members
/*the name and species columns*/
SELECT name, species FROM family_members;
/*all of the rows that refer to dogs*/
SELECT * FROM family_members WHERE species = 'dog';
/*family members whose num_books_read is greater than 190*/
SELECT * FROM family_members WHERE num_books_read > 190;
/*family_members where num_books_read is a value greater or equal to 180*/
SELECT * FROM family_members WHERE num_books_read >= 180;
/*all of Pickles' friends that are dogs and under the height of 45cm*/
SELECT * FROM friends_of_pickles WHERE species = 'dog' AND height_cm < 45;
/*all of Pickles' friends that are dogs or under the height of 45cm*/
SELECT * FROM friends_of_pickles WHERE species = 'dog' OR species = 'cat';
/*the rows that are not cats or dogs*/
SELECT * FROM friends_of_pickles WHERE species NOT IN ('dog','cat');
/*a list of the distinct species of animals greater than 50cm in height*/
SELECT DISTINCT species FROM friends_of_pickles WHERE height_cm > 50;
/*sort the friends_of_pickles by height_cm in descending order*/
SELECT * FROM friends_of_pickles ORDER BY height_cm DESC;
/*the single row (and all columns) of the tallest friends_of_pickles?*/
SELECT * FROM friends_of_pickles ORDER BY height_cm DESC LIMIT 1;
/*the total number of rows in the table friends_of_pickles*/
SELECT COUNT(*) FROM friends_of_pickles;
/*the number of rows in friends_of_pickles where the species is a dog*/
SELECT COUNT(*) FROM friends_of_pickles WHERE species = 'dog';
/*the total num_books_read made by this family*/
SELECT SUM(num_books_read) FROM family_members;
/*the average num_books_read*/
SELECT AVG(num_books_read) FROM family_members;
/*the highest num_books_read that a family member makes*/
SELECT MAX(num_books_read) FROM family_members;
/*the tallest height for each species*/
SELECT MAX(height_cm), species FROM friends_of_pickles GROUP BY species;
/*the family members that have the highest num_books_read*/
SELECT *, MAX(num_books_read) FROM family_members;
SELECT * FROM family_members ORDER BY num_books_read DESC LIMIT 1;
SELECT * FROM family_members WHERE num_books_read = (SELECT MAX(num_books_read) FROM family_members); /*nested way*/
/*all of the rows of family_members where favorite_book is not null*/
SELECT * FROM family_members WHERE favorite_book NOT IN ('null');
SELECT * FROM family_members WHERE favorite_book IS NOT NULL;
/*a list of celebrities that were born after September 1st, 1980*/
SELECT * FROM celebs_born WHERE birthdate > '1980-09-01';
/*inner join to pair each character name with the actor who plays them?*/
/*Select the columns: character.name, character_actor.actor_name*/
SELECT character.name, character_actor.actor_name
FROM character INNER JOIN character_actor
ON character.id = character_actor.character_id;
/*use two joins to pair each character name with the actor who plays them?*/
/*Select the columns: character.name, actor.name*/
SELECT character.name, actor.name
FROM character INNER JOIN character_actor
ON character.id = character_actor.character_id
INNER JOIN actor
ON actor.id = character_actor.actor_id;
/*a list of characters and TV shows that are not named "Willow Rosenberg" and not in the show "How I Met Your Mother"*/
SELECT character.name, tv_show.name
FROM character INNER JOIN character_tv_show
ON character.id = character_tv_show.character_id
INNER JOIN tv_show
ON character_tv_show.tv_show_id = tv_show.id
WHERE character.name NOT IN ('Willow Rosenberg')
AND tv_show.name NOT IN ('How I Met Your Mother');
/*use left joins to match character names with the actors that play them?*/
/*Select the columns: character.name, actor.name*/
SELECT character.name, actor.name
FROM character LEFT JOIN character_actor
ON character.id = character_actor.character_id
LEFT JOIN actor
ON character_actor.actor_id = actor.id;
/*Can you use left joins to match character names with the actors that play them, and use aliases to make the query shorter? The aliases for character, character_actor, and actor should be c, ca, and a.*/
/*Select the columns: c.name, a.name*/
SELECT c.name, a.name
FROM character AS c
LEFT JOIN character_actor AS ca
ON c.id = ca.character_id
LEFT JOIN actor AS a
ON ca.actor_id = a.id;
/*use left joins to match character names with the actors that play them, and use aliases to call the two columns returned character and actor?*/
SELECT c.name AS character, a.name AS actor
FROM character AS c
LEFT JOIN character_actor AS ca
ON c.id = ca.character_id
LEFT JOIN actor AS a
ON ca.actor_id = a.id;
/*run a query that returns the name of an employee and the name of their boss? Use column aliases to make the columns employee_name and boss_name.*/
SELECT employees.name AS employee_name, boss.name AS boss_name
FROM employees
LEFT JOIN employees AS boss
ON boss.id = employees.boss_id
WHERE boss.id IS NOT NULL;
/*run a query that returns "Robot" followed by a year between 2000 and 2099?*/
SELECT * FROM robots WHERE name LIKE "%Robot%20__";
/*the results with a column named sound that returns "talk" for humans, "bark" for dogs, and "meow" for cats?*/
SELECT *, CASE
WHEN species = 'human' THEN 'talk'
WHEN species = 'dog' THEN 'bark'
WHEN species = 'cat' THEN 'meow'
END AS sound
FROM friends_of_pickles;
/*return all of the robots that are located in NY*/
SELECT * FROM robots WHERE SUBSTR(location, -2) LIKE '%NY%';
/*Suppose that a fighter's tank could count as a weapon, and it would take precedence over the gun and the sword. Could you find each fighter's weapon in that scenario?*/
/*COALESCE checks columns in given order until NOT NULL*/
SELECT name, COALESCE(tank, sword, gun) AS weapon FROM fighters;