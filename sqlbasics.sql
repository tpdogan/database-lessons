/* A table of books */
CREATE TABLE book (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);
INSERT INTO book VALUES (1, "Alchemist", 5);
INSERT INTO book VALUES (2, "The Miserables", 4);
INSERT INTO book VALUES (3, "Dante's Inferno", 2);
INSERT INTO book VALUES (4, "Dante's Purgatorio", 2);
INSERT INTO book VALUES (5, "Dante's Paradiso", 2);

/* A database of movie */
CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);
INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);
 
SELECT * FROM movies;
SELECT * FROM movies WHERE release_year > 2000 ORDER BY release_year;

/* A TODO list */
CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);
INSERT INTO todo_list VALUES (4, "Finish databases", 60);

SELECT SUM(minutes) FROM todo_list;

/* A store project */
CREATE TABLE store (id INTEGER PRIMARY KEY, name TEXT, color TEXT, size TEXT, price INTEGER);

INSERT INTO store VALUES(1, "Shorts", "Black", "M", 20);
INSERT INTO store VALUES(2, "Shorts", "Yellow", "L", 20);
INSERT INTO store VALUES(3, "Trousers", "Gray", "S", 50);
INSERT INTO store VALUES(4, "T-shirts", "Blue", "L", 10);
INSERT INTO store VALUES(5, "Blouse", "Red", "XL", 25);
INSERT INTO store VALUES(6, "Skirt", "White", "S", 15);
INSERT INTO store VALUES(7, "Boxers", "Black", "L", 5);
INSERT INTO store VALUES(8, "Boxers", "Gray", "M", 5);
INSERT INTO store VALUES(9, "Shoes", "White", "42", 40);
INSERT INTO store VALUES(10, "Shoes", "Black", "41", 35);
INSERT INTO store VALUES(11, "Socks", "Purple", "40", 10);
INSERT INTO store VALUES(12, "Socks", "Black", "43", 10);
INSERT INTO store VALUES(13, "Gloves", "Black", "L", 20);
INSERT INTO store VALUES(14, "Gloves", "Gray", "M", 20);
INSERT INTO store VALUES(15, "Jacket", "Brown", "L", 50);

SELECT * FROM store;
SELECT * FROM store WHERE price > 24 ORDER BY price;
SELECT SUM(price) FROM store WHERE name < 'C';
SELECT SUM(price)/MAX(id) FROM store;