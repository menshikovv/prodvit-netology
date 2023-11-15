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
    track_name VARCHAR(255),
    duration INTERVAL
);

CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255)
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
SELECT DISTINCT a.album_name
FROM Albums a
JOIN Artist_Album aa ON a.album_id = aa.album_id
JOIN Artist_Genre ag ON aa.artist_id = ag.artist_id
GROUP BY a.album_name
HAVING COUNT(DISTINCT ag.genre_id) > 1;
SELECT t.track_name
FROM Tracks t
LEFT JOIN Collection_Track ct ON t.track_id = ct.track_id
WHERE ct.collection_id IS NULL;
SELECT a.artist_name, t.track_name, t.duration
FROM Artists a
JOIN Artist_Album aa ON a.artist_id = aa.artist_id
JOIN Albums al ON aa.album_id = al.album_id
JOIN Tracks t ON al.album_id = t.album_id
WHERE t.duration = (
  SELECT MIN(duration)
  FROM Tracks
);
SELECT album_name
FROM Albums
WHERE album_id IN (
  SELECT album_id
  FROM Tracks
  GROUP BY album_id
  ORDER BY COUNT(*) ASC
  LIMIT 1
);