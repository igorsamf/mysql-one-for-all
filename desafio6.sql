SELECT
ROUND(MIN(pl.plan_price), 2) AS faturamento_minimo,
ROUND(MAX(pl.plan_price), 2) AS faturamento_maximo,
ROUND(AVG(pl.plan_price), 2) AS faturamento_medio,
ROUND(SUM(pl.plan_price), 2) AS faturamento_total
FROM SpotifyClone.users as us
JOIN SpotifyClone.plans AS pl
ON us.user_plan_id = pl.plan_id;