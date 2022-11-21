
  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan_type VARCHAR(45) NOT NULL,
      plan_price DECIMAL(5, 2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
      user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(90) NOT NULL,
      user_age INT NOT NULL,
      user_plan_signature_date DATE NOT NULL,
      user_plan_id INT NOT NULL,
      FOREIGN KEY (user_plan_id) REFERENCES SpotifyClone.plans (plan_id)
  ) engine = InnoDB;

 CREATE TABLE SpotifyClone.artists(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(45) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(45) NOT NULL,
      album_artist_id INT NOT NULL,
      album_release_year YEAR NOT NULL,
      FOREIGN KEY (album_artist_id) REFERENCES SpotifyClone.artists (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.songs(
      song_id INT PRIMARY KEY AUTO_INCREMENT,
      song_name VARCHAR(45) NOT NULL,
      song_duration_sec INT NOT NULL,
      song_album_id INT NOT NULL,
      song_artist_id INT NOT NULL,
      FOREIGN KEY (song_album_id) REFERENCES SpotifyClone.albuns (album_id),
      FOREIGN KEY (song_artist_id) REFERENCES SpotifyClone.artists (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
      history_user_id INT NOT NULL,
      history_song_id INT NOT NULL,
      history_date DATETIME NOT NULL,
      FOREIGN KEY (history_user_id) REFERENCES SpotifyClone.users (user_id),
      FOREIGN KEY (history_song_id) REFERENCES SpotifyClone.songs (song_id),
      PRIMARY KEY (history_song_id, history_user_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.followers(
      followers_user_id INT NOT NULL,
      followers_artist_id INT,
      FOREIGN KEY (followers_user_id) REFERENCES SpotifyClone.users (user_id),
      FOREIGN KEY (followers_artist_id) REFERENCES SpotifyClone.artists (artist_id),
      PRIMARY KEY (followers_user_id, followers_artist_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plans (plan_type, plan_price)
  VALUES
      ('gratuito', 0.00),
      ('familiar', 7.99),
      ('universitário', 5.99),
      ('pessoal',	6.99);

  INSERT INTO SpotifyClone.users (user_name, user_age, user_plan_id, user_plan_signature_date)
  VALUES
    ('Barbara Liskov', 82, 01, '2019-10-20'),
    ('Robert Cecil Martin', 58, 01, '2017-01-06'),
    ('Ada Lovelace', 37, 02, '2017-12-30'),
    ('Martin Fowler', 46, 02, '2017-01-17'),
    ('Sandi Metz', 58, 02, '2018-04-29'),
    ('Paulo Freire', 19, 03, '2018-02-14'),
    ('Bell Hooks', 26, 03, '2018-01-05'),
    ('Christopher Alexander',	85, 04, '2019-06-05'),
    ('Judith Butler',	45, 04, '2020-05-13'),
    ('Jorge Amado',	58, 04, '2017-02-17');

  INSERT INTO SpotifyClone.artists (artist_name)
  VALUES
      ('Beyoncé'),
      ('Queen'),
      ('Elis Regina'),
      ('Baco Exu do Blues'),
      ('Blind Guardian'),
      ('Nina Simone');

  INSERT INTO SpotifyClone.albuns (album_name, album_artist_id, album_release_year)
  VALUES
      ('Renaissance', 01, 2022),
      ('Jazz', 02, 1978),
      ('Hot Space',	02,	1982),
      ('Falso Brilhante', 03, 1998),
      ('Vento de Maio',	03,	2001),
      ('QVVJFA?', 04, 2003),
      ('Somewhere Far Beyond', 05, 2007),
      ('I Put A Spell On You', 06, 2012);

  INSERT INTO SpotifyClone.songs (song_name, song_album_id, song_artist_id, song_duration_sec)
  VALUES
      ('BREAK MY SOUL',	01, 01, 279),
      ('VIRGO’S GROOVE', 01, 01, 369),
      ('ALIEN SUPERSTAR',	01, 01, 116),
      ('Don’t Stop Me Now',	02, 02, 203),
      ('Under Pressure', 03, 02, 152),
      ('Como Nossos Pais', 04, 03, 105),
      ('O Medo de Amar é o Medo de Ser Livre', 05, 03, 207),
      ('Samba em Paris', 06, 04, 267),
      ('The Bard’s Song',	07, 05, 244),
      ('Feeling Good', 08, 06, 100);

      INSERT INTO SpotifyClone.history (history_user_id, history_song_id, history_date)
  VALUES
      (01, 08, '2022-02-28 10:45:55'),
      (01, 02, '2020-05-02 05:30:35'),
      (01, 10, '2020-03-06 11:22:33'),
      (02, 10, '2022-08-05 08:05:17'),
      (02, 07, '2020-01-02 07:40:33'),
      (03, 10, '2020-11-13 16:55:13'),
      (03, 02, '2020-12-05 18:38:30'),
      (04, 08, '2021-08-15 17:10:10'),
      (05, 08, '2022-01-09 01:44:33'),
      (05, 05, '2020-08-06 15:23:43'),
      (06, 07, '2017-01-24 00:31:17'),
      (06, 01, '2017-10-12 12:35:20'),
      (07, 04, '2011-12-15 22:30:49'),
      (08, 04, '2012-03-17 14:56:41'),
      (09, 09, '2022-02-24 21:14:22'),
      (10, 03, '2015-12-13 08:30:22');

        INSERT INTO SpotifyClone.followers (followers_user_id, followers_artist_id)
  VALUES
      (01, 01),
      (01, 02),
      (01, 03),
      (02, 01),
      (02, 03),
      (03, 02),
      (04, 04),
      (05, 05),
      (05, 06),
      (06, 06),
      (06, 01),
      (07, 06),
      (09, 03),
      (10, 02);