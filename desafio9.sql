SELECT COUNT(*) AS quantidade_musicas_no_historico 
FROM SpotifyClone.users AS user_history
JOIN SpotifyClone.history AS hi
ON user_history.user_id = hi.history_user_id
WHERE user_history.user_name = 'Barbara Liskov';