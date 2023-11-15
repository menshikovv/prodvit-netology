CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255)
);

CREATE TABLE Artist_Genre (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    album_id INT,
    duration INTERVAL
);

CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255),
    release_year DATE
);

CREATE TABLE Artist_Album (
    artist_id INT,
    album_id INT,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE Collections (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255)
);

CREATE TABLE Collection_Track (
    collection_id INT,
    track_id INT,
    PRIMARY KEY (collection_id, track_id),
    FOREIGN KEY (collection_id) REFERENCES Collections(collection_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id)
);

SELECT g.genre_name, COUNT(ag.artist_id) AS artist_count
FROM Genres g
LEFT JOIN Artist_Genre ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name;
SELECT COUNT(*) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE EXTRACT(YEAR FROM a.release_year) BETWEEN 2019 AND 2020;
SELECT a.album_name, AVG(EXTRACT(EPOCH FROM t.duration)) AS avg_duration_seconds
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_name;
SELECT artist_name
FROM Artists a
WHERE NOT EXISTS (
  SELECT 1
  FROM Artist_Album aa
  JOIN Albums al ON aa.album_id = al.album_id
  WHERE aa.artist_id = a.artist_id AND EXTRACT(YEAR FROM al.release_year) = 2020
);
SELECT c.collection_name
FROM Collections c
JOIN Collection_Track ct ON c.collection_id = ct.collection_id
JOIN Tracks t ON ct.track_id = t.track_id
JOIN Albums a ON t.album_id = a.album_id
JOIN Artist_Album aa ON a.album_id = aa.album_id
WHERE aa.artist_id = 1;
