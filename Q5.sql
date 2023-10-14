-- Q5: Find out what songs exist in most playlists --
-- playlist_track: PlaylistId, TrackId(The relationship between the playlists table and tracks table is many-to-many)
-- tracks: TrackId, Name
SELECT playlist_track.TrackId, tracks.Name, COUNT(playlist_track.PlaylistId) AS 'Exist in how many playlists' 
FROM playlist_track
JOIN tracks
ON playlist_track.TrackId == tracks.TrackId
GROUP BY playlist_track.TrackId
ORDER BY count(playlist_track.PlaylistId) DESC
LIMIT 10;
-- For the same reason, this database is quite dull as the top 41 tracks exist all in 5 playlists. 

