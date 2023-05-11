SELECT 
    art.artist_name artista, alb.name album
FROM
    SpotifyClone.artists art
        JOIN
    SpotifyClone.album alb ON art.id = alb.artists_id
        AND art.artist_name = 'Elis Regina'
