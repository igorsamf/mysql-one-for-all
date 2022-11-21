SELECT ar.artist_name AS artista, al.album_name AS album, COUNT(fo.followers_user_id) AS seguidores
FROM SpotifyClone.artists AS ar
JOIN SpotifyClone.albuns AS al
ON al.album_artist_id = ar.artist_id
JOIN SpotifyClone.followers as fo
ON fo.followers_artist_id = ar.artist_id
GROUP BY ar.artist_id, al.album_name
ORDER BY seguidores DESC, ar.artist_name, al.album_name;