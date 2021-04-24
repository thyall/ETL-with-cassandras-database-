CREATE KEYSPACE musicsdb WITH REPLICATION = { 'class':'SimpleStrategy', 'replication_factor': 1};

create table musicsdb.musics (
	id uuid PRIMARY KEY,
	name text,
	album text,
	artist TEXT,
	views int,
	bad int,
	ok int,
	good int,
);

INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'FEAR', 'DAMN', 'Kendrick Lamar', 120930450, 47, 233, 720);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'DNA', 'DAMN', 'Kendrick Lamar', 728647242, 20, 420, 1540 );
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'YAH.', 'DAMN', 'Kendrick Lamar', 139702338, 1, 754, 203547);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'HUMBLE.', 'DAMN', 'Kendrick Lamar', 1419774493, 0, 10414, 5203547);

INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'No Role modelz', '2014 Forest Hill Drive', 'J.Cole', 940451242, 24, 624, 458721);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Fire Squad', '2014 Forest Hill Drive', 'J.Cole', 400872421, 115, 431, 276821 );
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Apparently', '2014 Forest Hill Drive', 'J.Cole', 804971345, 3, 924, 5036976);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Wet Dreamz', '2014 Forest Hill Drive', 'J.Cole', 540987242, 80, 705, 548725);


INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Time Move Slow', 'IV', 'BADBADNOTGOOD',3024497, 137, 824, 9247);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'In your eyes', 'IV', 'BADBADNOTGOOD', 34747725, 2, 624, 19874);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Confessions, Part 2', 'IV', 'BADBADNOTGOOD', 3795722, 40, 204, 725);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Speaking Gently', 'IV', 'BADBADNOTGOOD', 7962624, 31, 114,648);

INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Mandinga', 'Fome', 'Murica', 354334, 1, 471, 987);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Fome', 'Fome', 'Murica', 489937, 4, 147, 852);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Jaqueta Jeans', 'Fome', 'Murica', 593943, 8, 582, 789);
INSERT INTO musicsdb.musics (id, name, album, artist, views, bad, ok, good) VALUES (now(), 'Esquinaparanoidelirante', 'Fome', 'Murica', 455266, 17, 201, 647 );

SELECT * FROM musicsdb.musics	


CREATE MATERIALIZED VIEW musicsdb.musics_by_name AS
	SELECT * FROM musicsdb.musics WHERE name IS NOT NULL PRIMARY KEY(name, id);
	
CREATE MATERIALIZED VIEW musicsdb.musics_by_artist AS
	SELECT * FROM musicsdb.musics WHERE artist IS NOT NULL PRIMARY KEY(artist, id);
	
CREATE MATERIALIZED VIEW musicsdb.musics_by_album AS
	SELECT * FROM musicsdb.musics WHERE album IS NOT NULL PRIMARY KEY(album, id);
	
SELECT * FROM musicsdb.musics_by_name WHERE name = 'Jaqueta Jeans';

SELECT * FROM musicsdb.musics_by_artist WHERE artist = 'Kendrick Lamar';

SELECT * FROM musicsdb.musics_by_album WHERE album = 'IV';


















	
