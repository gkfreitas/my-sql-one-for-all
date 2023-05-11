SELECT 
    COUNT(*) musicas_no_historico
FROM
    SpotifyClone.user_history uh
        JOIN
    SpotifyClone.user u ON uh.user_id = u.id
        AND u.name = 'Barbara Liskov'

