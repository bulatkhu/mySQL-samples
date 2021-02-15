CREATE DATABASE `record_company`;
USE `record_company`;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    releaseYear INT,
    bandId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (bandId) REFERENCES bands(id)
);


INSERT INTO bands (name) 
VALUES ('Iron Maiden');


INSERT INTO bands (name)
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id FROM bands;

SELECT id AS 'ID', name AS 'Band Name' 
FROM bands;


SELECT * FROM bands ORDER BY name;

SELECT * FROM bands ORDER BY name ASC;

SELECT * FROM bands ORDER BY name DESC;

INSERT INTO albums (name, releaseYear, bandId)
VALUES ('The Number of the Beasts', 1985, 1),
	   ('Power Slave', 1984, 1),
       ('Nightmare', 2018, 2),
       ('Nightmare', 2010, 3),
       ('Test Alnum', NULL, 3);

SELECT * FROM albums;

SELECT name FROM albums;

SELECT DISTINCT name FROM albums;
/* no duplicate name*/

UPDATE albums 
SET releaseYear = 1982
WHERE id = 1;

SELECT * FROM albums 
WHERE releaseYear < 2000;

SELECT * FROM albums
WHERE name LIKE '%er%';
/* find each row that contains er*/


SELECT * FROM albums
WHERE name LIKE '%er%' OR bandId = 2;

SELECT * FROM albums 
WHERE releaseYear = 1984 AND bandId = 1;

SELECT * FROM albums
WHERE releaseYear BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE releaseYear IS NULL;

DELETE FROM albums WHERE id = 5;

SELECT * FROM bands
JOIN albums ON bands.id = albums.bandId;

SELECT * FROM bands
INNER JOIN albums ON bands.id = albums.bandId;

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.bandId;

SELECT * FROM bands
RIGHT JOIN albums ON bands.id = albums.bandId;

SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.bandId;

SELECT AVG(releaseYear) FROM albums;

SELECT SUM(releaseYear) FROM albums;

SELECT bandId, COUNT(bandId) FROM albums
GROUP BY bandId;

SELECT b.name AS bandName, COUNT(a.id) AS numAlbums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.bandId
GROUP BY b.id;


/*filtered by album id where id equals 1*/
SELECT b.name AS bandName, COUNT(a.id) AS numAlbums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.bandId
GROUP BY b.id
HAVING numAlbums = 1;


/*filtered by album id where id equals 1 nad band name equals Deuce*/
SELECT b.name AS bandName, COUNT(a.id) AS numAlbums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.bandId
WHERE b.name = 'Deuce'
GROUP BY b.id
HAVING numAlbums = 1;






