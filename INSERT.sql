INSERT INTO Artists (artist_name, country) VALUES
  ('Artist1', 'Country1'),
  ('Artist2', 'Country2'),
  ('Artist3', 'Country3'),
  ('Artist4', 'Country4');

INSERT INTO Genres (genre_name) VALUES
  ('Genre1'),
  ('Genre2'),
  ('Genre3');

INSERT INTO Albums (album_name, release_year) VALUES
  ('Album1', 2020),
  ('Album2', 2021),
  ('Album3', 2022);

INSERT INTO Tracks (track_name, duration) VALUES
  ('Track1', '03:30'),
  ('Track2', '04:15'),
  ('Track3', '02:50'),
  ('Track4', '05:00'),
  ('Track5', '03:45'),
  ('Track6', '04:30');

INSERT INTO Collections (collection_name) VALUES
  ('Collection1'),
  ('Collection2'),
  ('Collection3'),
  ('Collection4');

INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 1);

INSERT INTO Artist_Album (artist_id, album_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 1);

INSERT INTO Collection_Track (collection_id, track_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 5),
  (3, 6),
  (4, 1),
  (4, 3);
