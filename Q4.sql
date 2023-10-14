-- Q4: Find out what artists produce most albums --
-- albums: AlbumId, ArtistId
-- artists: ArtistId Name
SELECT albums.ArtistId, artists.Name, COUNT(albums.AlbumId) AS 'Number of albums produced' FROM albums
JOIN artists
ON albums.ArtistId == artists.ArtistId
GROUP BY albums.ArtistId
ORDER BY COUNT(albums.AlbumId) DESC
LIMIT 10;

-- Q4-2: What artists produce most songs? --
-- albums: AlbumId, ArtistId
-- artists: ArtistId Name
-- tracks: TrackId, AlbumId (Each track belongs to one album)
SELECT albums.ArtistId, artists.Name, COUNT(tracks.TrackId) AS 'Number of tracks produced' FROM albums
JOIN artists
ON albums.ArtistId == artists.ArtistId
JOIN tracks
ON albums.AlbumId == tracks.AlbumId
-- Here, I can join two tables to albums. Just to ensure the ON clause is correct
GROUP BY albums.ArtistId
ORDER BY COUNT(tracks.TrackId) DESC
LIMIT 10;


-- The below is just to try to summarize what track is from what artist
/*WITH temp AS (
SELECT albums.ArtistId, artists.Name, tracks.TrackId FROM albums
JOIN artists
ON albums.ArtistId == artists.ArtistId
JOIN tracks
ON albums.AlbumId == tracks.AlbumId
-- Here, I can join two tables to albums. Just to ensure the ON clause is correct
)
SELECT * FROM temp*/
