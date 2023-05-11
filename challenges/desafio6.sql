SELECT 
    MIN(p.value) faturamento_minimo,
    MAX(p.value) faturamento_maximo,
    ROUND(AVG(p.value), 2) faturamento_medio,
    SUM(p.value) faturamento_total
FROM
    SpotifyClone.plans p
        JOIN
    SpotifyClone.user u ON p.id = u.plans_id