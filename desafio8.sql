SELECT a.artist_name AS artista, al.album_name AS album
FROM SpotifyClone.artists AS a
JOIN SpotifyClone.albuns AS al
ON a.artist_id = al.album_artist_id
WHERE a.artist_name = 'Elis Regina'
ORDER BY al.album_name;