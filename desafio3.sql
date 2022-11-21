SELECT 
    u.user_name AS usuario,
    COUNT(s.song_name) AS qt_de_musicas_ouvidas,
    ROUND(SUM(s.song_duration_sec) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.history AS h
ON h.history_user_id = u.user_id
INNER JOIN SpotifyClone.songs AS s
ON s.song_id = h.history_song_id
GROUP BY u.user_name ORDER BY u.user_name;