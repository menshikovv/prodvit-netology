CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(255),
    duration TIME
);

CREATE TABLE Collections (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255),
    release_year DATE
);

CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255)
);

SELECT track_name, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;
SELECT track_name
FROM Tracks
WHERE duration >= '03:30';
SELECT collection_name
FROM Collections
WHERE EXTRACT(YEAR FROM release_year) BETWEEN 2018 AND 2020;
SELECT artist_name
FROM Artists
WHERE POSITION(' ' IN artist_name) = 0;
SELECT track_name
FROM Tracks
WHERE LOWER(track_name) LIKE '%мой%' OR LOWER(track_name) LIKE '%my%';
