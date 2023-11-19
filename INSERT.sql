INSERT INTO Genres (genre_name) VALUES ('Rock'), ('Pop'), ('Hip Hop'), ('Electronic');

INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 4);

INSERT INTO Albums (album_name, release_year) VALUES ('Album1', '01.01.2019'), ('Album2', '01.01.2020'), ('Album3', '01.01.2020');

INSERT INTO Artist_Album (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Tracks (album_id, track_name, duration) VALUES
(1, 'Track1', '00:03:45'),
(1, 'Track2', '00:04:30'),
(2, 'Track3', '00:02:55'),
(2, 'Track4', '00:03:15'),
(3, 'Track5', '00:04:00');

INSERT INTO Collections (collection_name) VALUES ('Collection1'), ('Collection2');

INSERT INTO Collection_Track (collection_id, track_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);
