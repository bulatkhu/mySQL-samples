USE `record_company`;

CREATE TABLE songs (
	id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    length FLOAT NOT NULL,
    albumId INT,
    PRIMARY KEY (id),
    FOREIGN KEY (albumId) REFERENCES albums(id)
);