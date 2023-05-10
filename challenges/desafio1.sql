DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone DEFAULT CHARACTER SET utf8 ;
USE SpotifyClone ;

CREATE TABLE IF NOT EXISTS SpotifyClone.`plans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `plans_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_plans_idx` (`plans_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_plans`
    FOREIGN KEY (`plans_id`)
    REFERENCES SpotifyClone.`plans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.`artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.`user_follow` (
  `user_id` INT NOT NULL,
  `artists_id` INT NOT NULL,
  INDEX `fk_user_follow_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_follow_artists1_idx` (`artists_id` ASC) VISIBLE,
  PRIMARY KEY (`artists_id`, `user_id`),
  CONSTRAINT `fk_user_follow_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES SpotifyClone.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_follow_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES SpotifyClone.`artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artists_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `release_year` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_album_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES SpotifyClone.`artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.`songs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `song_name` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_songs_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES SpotifyClone.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.`user_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL UNIQUE,
  `user_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_history_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_history_songs1_idx` (`songs_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_history_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES SpotifyClone.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_history_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES SpotifyClone.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.`sign` (
  `user_id` INT NOT NULL,
  `plans_id` INT NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  INDEX `fk_sign_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_sign_plans1_idx` (`plans_id` ASC) VISIBLE,
  CONSTRAINT `fk_sign_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES SpotifyClone.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sign_plans1`
    FOREIGN KEY (`plans_id`)
    REFERENCES SpotifyClone.`plans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO SpotifyClone.plans (type, value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.user (name, age, plans_id)
VALUES
  ('Barbara Liskov', 82,1),
  ('Robert Cecil Martin', 58,1),
  ('Ada Lovelace',37,2),
  ('Martin Fowler',46,2),
  ('Sandi Metz',58,2),
  ('Paulo Freire',19,3),
  ('Bell Hooks',26,3),
  ('Christopher Alexander',85,4),
  ('Judith Butler',45,4),
  ('Jorge Amado',58,4);

INSERT INTO SpotifyClone.artists (artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.album (name,artists_id,release_year)
VALUES
  ('Renaissance',1,'2022'),
  ('Jazz',2,'1978'),
  ('Hot Space',2,'1982'),
  ('Falso Brilhante',3,'1998'),
  ('Vento de Maio',3,'2001'),
  ('QVVJFA?',4,'2003'),
  ('Somewhere Far Beyond',5,'2007'),
  ('I Put A Spell On You',6,'2012');

INSERT INTO SpotifyClone.songs (song_name,duration,album_id)
VALUES
  ('BREAK MY SOUL',279,1),
  ("VIRGO'S GROOVE",369,1),
  ("ALIEN SUPERSTAR",116,1),
  ("Don't Stop Me Now",203,2),
  ('Under Pressure',152,3),
  ('Como Nossos Pais',105,4),
  ('O Medo de Amar é o Medo de Ser Livre',207,5),
  ('Samba em Paris',267,6),
  ("The Bard's Song",244,7),
  ("Feeling Good",100,8);

INSERT INTO SpotifyClone.user_history (user_id,songs_id,date)
VALUES
  (1,8,'2022-02-28 10:45:55'),
  (1,2,'2022-02-28 05:30:35'),
  (1,10,'2020-03-06 11:22:33'),
  (2,10,'2022-08-05 08:05:17'),
  (2,7,'2020-01-02 07:40:33'),
  (3,10,'2020-11-13 16:55:13'),
  (3,2,'2020-12-05 18:38:30'),
  (4,8,'2021-08-15 17:10:10'),
  (5,8,'2022-01-09 01:44:33'),
  (5,5,'2020-08-06 15:23:43'),
  (6,7,'2017-01-24 00:31:17'),
  (6,1,'2017-10-12 12:35:20'),
  (7,4,'2011-12-15 22:30:49'),
  (8,4,'2012-03-17 14:56:41'),
  (9,9,'2022-02-24 21:14:22'),
  (10,3,'2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.user_follow (user_id,artists_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,6),
  (6,1),
  (7,6),
  (9,3),
  (10,2);


