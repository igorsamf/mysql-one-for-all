SELECT u.user_name AS usuario,
IF(MAX(YEAR(h.history_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.history AS h
ON h.history_user_id = u.user_id
GROUP BY u.user_name
ORDER BY u.user_name;