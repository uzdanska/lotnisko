CREATE DATABASE projekt_lotnisko;

CREATE TABLE klient (
  id_klient int(11) NOT NULL CHECK (id_klient > 0),
  imie_klienta varchar(15) NOT NULL,
  nazwisko_klienta varchar(20) NOT NULL,
  numer_telefonu int(9) NOT NULL
);

INSERT INTO klient (id_klient, imie_klienta, nazwisko_klienta, numer_telefonu) VALUES
(321, 'Marian', 'Adamski', 781726345),
(839, 'Ada', 'Czerwiec', 123456789),
(1271, 'Martyna', 'Świerzbińska', 136247589),
(1289, 'Piotr', 'Zalewski', 456123789),
(8172, 'Jan', 'Wasilewski', 516254367),
(9823, 'Katarzyna', 'Kuc', 789123456);

CREATE TABLE lot (
  id_lotu int(11) NOT NULL CHECK (id_lotu > 0),
  nazwa_firmy varchar(45) NOT NULL,
  dzien date DEFAULT NULL
);

INSERT INTO lot (id_lotu, nazwa_firmy, dzien) VALUES
(1, 'Delta Airlines', '2021-07-04'),
(3, 'Enter Air', '2021-12-06'),
(24, 'LOT', '2021-10-9'),
(27, 'SprintAir', '2021-11-02'),
(238, 'SkyTaxi', '2021-09-01'),
(321, 'Lufthansa', '2021-10-06');

CREATE TABLE lotnisko (
  id_lotniska int(11) NOT NULL CHECK (id_lotniska > 0),
  nazwa_lotniska varchar(70) NOT NULL,
  miasto varchar(45) NOT NULL,
  kraj varchar(45) NOT NULL
);


INSERT INTO lotnisko (id_lotniska, nazwa_lotniska, miasto, kraj) VALUES
(1, 'Delta Air Lines', 'Atlanta', 'Stany Zjednoczone'),
(2, 'United Airlines', 'Chicago', 'Stany Zjednoczone'),
(3, 'LOT', 'Warszawa', 'Polska'),
(4, 'Ryanair', 'Dublin', 'Irlandia'),
(5, 'China Eastern Airlines', 'Szanghaj', 'Chiny'),
(6, 'EasyJet', 'Luton ', 'Wielka Brytania');

CREATE TABLE rezerwacja (
  numer_rezerwacji int(11) NOT NULL,
  id_klient int(11) NOT NULL CHECK (id_klient > 0),
  id_lotu int(11) NOT NULL CHECK (id_lotu > 0),
  liczba_siedzen int(11) NOT NULL CHECK (liczba_siedzen > 0),
  id_samolotu int(11) NOT NULL CHECK (id_samolotu > 0)
);


INSERT INTO rezerwacja (numer_rezerwacji, id_klient, id_lotu, liczba_siedzen, id_samolotu) VALUES
(19283, 321, 1, 5673, 5673123),
(12, 1289, 3, 3421, 99928),
(12873, 938, 24, 1456, 12990),
(234, 9823, 27, 12453, 28912),
(5412, 1271, 238, 2672, 1233),
(12983, 8172, 321, 2344, 23421);

CREATE TABLE samolot (
  id_samolotu int(11) NOT NULL CHECK (id_samolotu > 0),
  dostepne_siedzenia int(11) NOT NULL,
  typ_samolotu varchar(20) NOT NULL
);


INSERT INTO samolot (id_samolotu, dostepne_siedzenia, typ_samolotu) VALUES
(1233, 1234, 'towarowy'),
(12990, 938, 'pasażerski'),
(23421, 8, 'osobiste'),
(28912, 2341, 'pasażerski'),
(99928, 3, 'osobisty'),
(5673123, 1289, 'pasażerski');

CREATE TABLE segment_lotu (
  id_segmentu int(11) NOT NULL CHECK (id_segmentu > 0),
  id_lotu int(11) NOT NULL CHECK (id_lotu > 0),
  czas_odlotu datetime NOT NULL,
  czas_przybycia datetime NOT NULL,
  id_lotniska_odlotu int(11) NOT NULL CHECK (id_lotniska_odlotu > 0),
  id_lotniska_przylotu int(11) NOT NULL CHECK (id_lotniska_przylotu > 0)
);



INSERT INTO segment_lotu (id_segmentu, id_lotu, czas_odlotu, czas_przybycia, id_lotniska_odlotu, id_lotniska_przylotu) VALUES
(9, 1, '2021-06-16 12:20:03', '2021-06-16 16:20:03', 6, 2),
(11, 3, '2021-07-30 17:28:03', '2021-07-30 21:20:03', 4, 6),
(7, 24, '2021-06-06 20:17:44', '2021-06-02 02:07:44', 1, 5),
(10, 27, '2021-06-23 18:20:03', '2021-06-24 02:20:03', 5, 1),
(12, 238, '2021-08-12 20:20:03', '2021-08-13 10:20:03', 3, 4),
(8, 321, '2021-07-13 06:20:03', '2021-07-14 12:20:03', 2, 3);

CREATE TABLE typ_samolotu (
  typ_samolotu varchar(30) NOT NULL,
  max_siedzenia int(11) NOT NULL,
  firma varchar(20) NOT NULL
);

INSERT INTO typ_samolotu (typ_samolotu, max_siedzenia, firma) VALUES
('towarowy', 13000, 'Ryanair'),
('paseżerski', 12321, 'LOT'),
('osobiste', 19832, 'Wizz Air'),
('towarowe', 1234, 'Easy Jet'),
('pasażerskie', 909821, 'Lufthansa'),
('pasażerskie', 123321, 'LOT');
