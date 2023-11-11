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
