USE `record_company`;

/* 1 */
CREATE TABLE songs (
	id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    length FLOAT NOT NULL,
    albumId INT,
    PRIMARY KEY (id),
    FOREIGN KEY (albumId) REFERENCES albums(id)
);

/* 2 */
SELECT name AS 'Band Name'
FROM bands;


/* 3 */
SELECT * FROM albums
WHERE albums.releaseYear = (SELECT MIN(albums.releaseYear) FROM albums); 

/* or */
SELECT * FROM albums
WHERE albums.releaseYear IS NOT NULL
ORDER BY albums.releaseYear
LIMIT 1;

/* 4 */
SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.bandId
GROUP BY albums.bandId
HAVING COUNT(albums.id) = 0 ;


/* 6 */
SELECT SUM(songs.length) as Duration 
FROM albums
JOIN songs on albums.id = songs.albumId
GROUP BY songs.albumId
ORDER BY duration DESC
LIMIT 1;


/* 7 */
UPDATE albums
SET releaseYear = null
WHERE id = 1

/* 8 */
INSERT INTO albums (name, releaseYear, bandId, duration)
VALUES ('Favorite Album Name', 2000, 3, 25);

/* 9 
SET FOREIGN_KEY_CHECKS=0;
*/	
DELETE FROM albums WHERE id = 8;


/* 10 */
INSERT INTO songs (name, length, albumId)
VALUES  ('song 1', 123, 1),
		('song 2', 90, 2),
		('song 3', 11, 3),
		('song 4', 123, 4);

SELECT AVG(songs.length) AS 'Average Song Duration'
FROM songs;

/* 10 */
SELECT
  albums.name AS 'Album',
  albums.releaseYear AS 'Release Year',
  MAX(songs.length) AS 'Duration'
FROM albums
JOIN songs ON albums.id = songs.albumId
GROUP BY songs.albumId;