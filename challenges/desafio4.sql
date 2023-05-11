SELECT 
    name pessoa_usuaria,
    IF(MAX(YEAR(uh.date)) >= 2021,
        'Ativa',
        'Inativa') status_pessoa_usuaria
FROM
    SpotifyClone.user u
        JOIN
    SpotifyClone.user_history uh ON u.id = uh.user_id
GROUP BY u.name
ORDER BY u.name