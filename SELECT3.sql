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