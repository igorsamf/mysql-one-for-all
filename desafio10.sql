SELECT so.song_name AS nome, COUNT(hi.history_song_id) AS reproducoes
FROM SpotifyClone.history AS hi
JOIN SpotifyClone.songs AS so
ON so.song_id = hi.history_song_id
JOIN SpotifyClone.users AS us
ON us.user_id = hi.history_user_id
JOIN SpotifyClone.plans as pl
ON us.user_plan_id = pl.plan_id
WHERE pl.plan_type IN ('gratuito', 'pessoal')
GROUP BY so.song_name
ORDER BY so.song_name;