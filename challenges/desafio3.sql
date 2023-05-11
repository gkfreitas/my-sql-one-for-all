SELECT 
    name pessoa_usuaria,
    COUNT(songs_id) musicas_ouvidas,
    ROUND(SUM(s.duration / 60), 2) total_minutos
FROM
    SpotifyClone.user u
        JOIN
    SpotifyClone.user_history uh ON u.id = uh.user_id
        JOIN
    SpotifyClone.songs s ON s.id = uh.songs_id
GROUP BY u.name
ORDER BY u.name ASC;