SELECT 
    songs.cancoes, art.artistas, alb.albuns
FROM
    (SELECT COUNT(*) cancoes
    FROM SpotifyClone.songs) songs
        JOIN
    (SELECT COUNT(*) artistas
    FROM SpotifyClone.artists) art
        JOIN 
    (SELECT COUNT(*) albuns
    FROM SpotifyClone.album) alb;