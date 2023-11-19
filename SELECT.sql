SELECT track_name
FROM Tracks
WHERE LOWER(track_name) LIKE '% мой %' OR LOWER(track_name) LIKE '% my %';
SELECT album_name
FROM Albums
WHERE album_id IN (
  SELECT album_id
  FROM Tracks
  GROUP BY album_id
  ORDER BY COUNT(*) ASC
  LIMIT 1
);
SELECT DISTINCT a.album_name
FROM Albums a
JOIN Artist_Album aa ON a.album_id = aa.album_id
JOIN Artist_Genre ag ON aa.artist_id = ag.artist_id
GROUP BY a.album_name, aa.artist_id
HAVING COUNT(DISTINCT ag.genre_id) > 1;
