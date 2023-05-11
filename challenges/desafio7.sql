SELECT 
    art.artist_name artista,
    alb.name album,
    COUNT(uf.artists_id) pessoas_seguidoras
FROM
    SpotifyClone.user_follow uf
        JOIN
    SpotifyClone.artists art ON art.id = uf.artists_id
        JOIN
    SpotifyClone.album alb ON art.id = alb.artists_id
GROUP BY art.artist_name , alb.name
ORDER BY COUNT(uf.artists_id) DESC , art.artist_name , alb.name