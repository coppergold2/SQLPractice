CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE albums(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
	release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
    );

INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands(name)
VALUES ('Deuce') , ('Avenged Sevenfold'), ('Ankor');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name' 
FROM bands;

SELECT * FROM bands ORDER BY name;

INSERT INTO albums (name, release_year, band_id)
VALUES ('The number of the Beasts', 1985, 1),
	   ('Power Slave', 1984, 1),
       ('Nightmare', 2018, 2),
       ('Nightmare', 2010, 3),
       ('Test Album', NULL, 3);
       
SELECT * FROM albums;
       
SELECT DISTINCT name FROM albums;

UPDATE albums
SET release_year = 1982 
WHERE id = 1;

SELECT * FROM albums
WHERE release_year < 2000;

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums
WHERE id = 5;

SELECT * FROM bands
INNER JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM albums
RIGHT JOIN bands ON bands.id = albums.band_id;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

SELECT * FROM albums;
SELECT * FROM bands;
SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;

CREATE TABLE songs(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
length FLOAT NOT NULL,
album_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(album_id) REFERENCES albums(id)
); -- q0

SELECT name AS 'Band Name'  FROM bands; -- q1

SELECT 	* FROM albums WHERE release_year IS NOT NULL  -- q2
ORDER BY release_year 
LIMIT 1 ;

SELECT DISTINCT bands.name AS 'Band Name' FROM bands
JOIN albums ON bands.id = albums.band_id; -- q3

/* If bands do not have a unique name then use this query */
/* 
  SELECT bands.name AS 'Band Name'
  FROM bands
  JOIN albums ON bands.id = albums.band_id
  GROUP BY albums.band_id
  HAVING COUNT(albums.id) > 0;
*/

SELECT DISTINCT bands.name AS 'Band Name' FROM bands -- q4 
LEFT JOIN albums ON bands.id = albums.band_id 
WHERE albums.band_id IS NULL;

SELECT albums.name AS Name, albums.release_year AS 'Release Year', SUM(songs.length) AS Duration 
FROM albums
JOIN songs ON albums.id = songs.album_id 
GROUP BY songs.album_id
ORDER BY Duration DESC
LIMIT 1;   -- q5

UPDATE albums  -- q6
SET release_year = 1962
WHERE albums.id = 4;

INSERT INTO bands(name) VALUES('newjeans'); -- q7
SELECT * FROM bands;
INSERT INTO albums(name,release_year,band_id) VALUES('Ditto',2023,8);
SELECT * FROM albums;    

DELETE FROM albums WHERE albums.id = 19;
DELETE FROM bands WHERE bands.id = 8; -- q8

SELECT AVG(songs.length) AS 'Average Song Duration' FROM songs -- q9

  






 


