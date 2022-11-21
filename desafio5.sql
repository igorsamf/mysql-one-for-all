SELECT s.song_name as cancao, COUNT(h.history_song_id) AS reproducoes FROM SpotifyClone.songs AS s
JOIN SpotifyClone.history AS h ON h.history_song_id = s.song_id
GROUP BY h.history_song_id
ORDER BY reproducoes DESC, cancao LIMIT 2;