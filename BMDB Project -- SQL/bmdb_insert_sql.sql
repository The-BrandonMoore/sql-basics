--bmbd CRUD stuff
-- Insert a Movie
INSERT INTO Movie (Title, Year, Rating, Director)
VALUES
	('The Princess Bride',	1987,	'PG',		'Rob Reiner'),
	('The Mummy',			1999,	'PG-13',	'Stephen Sommers'),
	('The Great Outdoors',	1988,	'PG',		'Howard Deutch'),
	('The Lord of the Rings: The Fellowship of the Ring', 2001, 'PG-13', 'Peter Jackson'),
	('National Lampoon''s Christmas Vacation', 1989, 'PG-13', 'Jeremiah S. Chechik');

-- insert Actor into Actor table
INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
VALUES
	--('Cary',		'Elwes',		'M', '1962-10-26'),
	('Brendan',		'Fraser',		'M', '1968-12-03'),
	('John',		'Candy',		'M', '1950-10-31'),
	('Viggo',		'Mortensen',	'M', '1958-10-20'),
	('Chevy',		'Chase',		'M', '1943-10-8');


INSERT INTO Credit (MovieId, ActorId, Role)
VALUES
	--(1, 1, 'Westley')
	(3, 3, 'Chet Ripley'),
	(2, 2, 'Rick O''Connell'),
	(4, 4, 'Aragorn'),
	(5, 5, 'Clark Griswold');


SELECT * 
FROM Movie;

--update statement

UPDATE Movie
	SET Title = 'Super Dumb Movie'
	WHERE Id = 2;

DELETE 
  FROM Movie
  WHERE Id = 1;

-- Join 3 tables to show the movie-actor-role information

SELECT Title, Year, FirstName, LastName, Role
  FROM Credit C
  JOIN Movie M ON C.MovieId = M.Id
  JOIN Actor A ON C.ActorId = A.ID;