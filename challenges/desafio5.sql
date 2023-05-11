SELECT 
    s.song_name cancao, COUNT(uh.songs_id) reproducoes
FROM
    SpotifyClone.songs s
        JOIN
    SpotifyClone.user_history uh ON uh.songs_id = s.id
GROUP BY song_name
ORDER BY COUNT(uh.songs_id) , song_name ASC
LIMIT 7 , 9