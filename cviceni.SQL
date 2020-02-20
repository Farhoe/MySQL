-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `skola` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci */;
USE `skola`;

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `description` text COLLATE utf8_czech_ci,
  `adress` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `students` (`id_student`, `firstname`, `lastname`, `description`, `adress`, `city`, `birthdate`) VALUES
(1,	'Matěj',	'Kneifl',	'Hraje tyfko',	'V baráku 123',	'Křečhoř',	'2002-10-18');

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id_subject` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `description` text COLLATE utf8_czech_ci,
  `shortcut` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `subjects` (`id_subject`, `name`, `description`, `shortcut`) VALUES
(NULL,	'Anglický jazyk',	'Výuka cizího jazyka',	'Aj'),
(NULL,	'Matematika',	'Nauka matematiky',	'M'),
(NULL,	'Český jazyk',	'Výuka českého jazyka',	'Čj'),
(NULL,	'Počítačová grafika',	'Nauka grafických programů na počítačích',	'PG'),
(NULL,	'Databáze',	'Nauka o práci a správě databází',	'Da');

INSERT INTO `teachers` (`firstname`, `lastname`, `birthdate`, `address`, `description`, `city`, `id_teacher`) VALUES
('Jan',	'Klíma',	'1985-05-05',	'Na Vavřínech',	'Učitel grafiky',	'Žehuň',	NULL),
('Martin',	'Kokeš',	'1988-01-01',	'Železnická 162',	'Učitel IT',	'Kolín',	NULL),
('Naděžda',	'Rytířová',	'1965-03-27',	'U Masny 32',	'Uspávačka hadů',	'Kolín',	NULL);

-- 2019-10-08 08:55:17

DROP TABLE IF EXISTS `classrooms`;
CREATE TABLE `classrooms` (
  `id_classroom` int(11) NOT NULL AUTO_INCREMENT,
  `class_number` varchar(255) COLLATE utf8_bin NOT NULL,
  `seats` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_classroom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `classrooms` (`id_classroom`, `class_number`, `seats`, `location`) VALUES
(1,	'19',	13,	'první budova'),
(2,	'8',	20,	'druhá budova'),
(3,	'6a',	30,	'první budova'),
(4,	'6b',	25,	'první budova'),
(5,	'13',	50,	'druhá budova');

-- 2019-10-08 10:09:13
CREATE TABLE schedule(
 id_schedule int(11) NOT NULL AUTO_INCREMENT,
 id_teacher int(11) NOT NULL,
 id_class int(11) NOT NULL,
 id_subject int(11) NOT NULL,
 id_classroom int(11) NOT NULL,
 id_lesson int(11) NOT NULL,
 description TEXT,
 PRIMARY KEY (id_schedule)
)

-- 2019-11-5 11:38:30

SELECT boo.id_book AS 'Číslo Knihy', boo.title AS 'Název',CONCAT(aut.firstname, ' ', aut.lastname) As 'Jméno Autora', pub.name AS 'Nakladatelství', gen.name AS 'Žánr'
FROM books boo
JOIN author aut ON boo.id_author = aut.id_author
JOIN genre gen ON boo.id_genre = gen.id_genre
JOIN publisher pub ON boo.id_publisher = pub.id_publisher;

-- 2019-12-10 15:19:45

SELECT *
FROM books b
JOIN book_genre b_g ON b.id_book = b_g.id_book
JOIN genre g ON g.id_genre = b_g.id_genre

-- 2019-12-17 11:43:20
ossp_wars
---------------

DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `id_character` int(11) NOT NULL AUTO_INCREMENT,
  `id_player` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `id_class` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `mana` int(11) DEFAULT NULL,
  `strength` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `intelligence` int(11) DEFAULT NULL,
  `agility` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_character`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `characters` (`id_character`, `id_player`, `name`, `level`, `id_class`, `hp`, `mana`, `strength`, `defense`, `money`, `intelligence`, `agility`, `created_at`) VALUES
(1,	1,	'Nidallas',	120,	1,	60000,	0,	100,	100,	15,	30,	58,	'2006-12-15 21:30:00'),
(2,	1,	'Bradeon',	60,	2,	30000,	40500,	35,	100,	1000,	100,	35,	'2008-06-05 16:58:32'),
(3,	2,	'Yarpen',	85,	3,	36000,	0,	56,	75,	1500,	65,	100,	'2012-08-10 12:08:27'),
(4,	2,	'Reaper_xxx',	30,	4,	15000,	10000,	30,	20,	200,	100,	45,	'2018-06-30 03:10:20'),
(5,	3,	'Vapesmoker420',	120,	5,	10000,	0,	55,	20,	100000,	95,	100,	'2005-07-01 23:18:00'),
(6,	3,	'Julias',	96,	6,	70500,	50000,	100,	100,	40000,	95,	20,	'2010-10-10 16:20:35');

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `id_class` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id_class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `classes` (`id_class`, `name`) VALUES
(1,	'warrior'),
(2,	'mage'),
(3,	'hunter'),
(4,	'necromancer'),
(5,	'thief'),
(6,	'paladin');

DROP TABLE IF EXISTS `guilds`;
CREATE TABLE `guilds` (
  `id_guild` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_guild`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `guilds` (`id_guild`, `name`, `created_at`) VALUES
(2,	'The Badgers',	'2006-05-01 18:36:20'),
(1,	'Keepers of Light',	'2011-11-06 09:00:05');

DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `id_player` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `newsletter` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  `gdpr` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id_player`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `players` (`id_player`, `nickname`, `email`, `password`, `birthday`, `created_at`, `newsletter`, `gdpr`) VALUES
(1,	'radar',	'radar@cus.co.uk.org',	'password',	'2002-03-18',	'2005-12-20 18:30:42',	'yes',	'yes'),
(2,	'KnefiCZ',	'rafan@hotmail.uk',	'root',	'2000-10-03',	'2012-10-10 21:34:15',	'yes',	'no'),
(3,	'Pilarik3213CZ',	'pilarik@gmail.com',	'9FdsaBeaA',	'2000-11-05',	'2002-12-24 22:53:20',	'no',	'yes');

DROP TABLE IF EXISTS `unit_types`;
CREATE TABLE `unit_types` (
  `id_unit_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`id_unit_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `unit_types` (`id_unit_type`, `name`) VALUES
(1,	'Christian'),
(2,	'Pikeman'),
(3,	'Halberdier'),
(4,	'archer'),
(5,	'Royal Griffin'),
(6,	'Swordsman'),
(7,	'Crusader'),
(8,	'Peasant');

DROP TABLE IF EXISTS `units`;
CREATE TABLE `units` (
  `id_unit` int(11) NOT NULL AUTO_INCREMENT,
  `id_unit_type` int(11) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `damage` int(11) DEFAULT NULL,
  `id_character` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_unit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

INSERT INTO `units` (`id_unit`, `id_unit_type`, `hp`, `damage`, `id_character`) VALUES
(1,	1,	30,	5,	1),
(2,	2,	40,	20,	1),
(3,	3,	50,	25,	2),
(4,	4,	15,	40,	2),
(5,	5,	50,	60,	3),
(6,	6,	20,	35,	3),
(7,	7,	70,	70,	3),
(8,	8,	5,	5,	6);

-------------------------------------------

SELECT play.id_guild AS 'číslo guildy', play.nickname AS 'Jméno', play.created_at AS 'Vytvořeno' 
FROM players play
JOIN guilds g ON g.id_guild
ORDER BY nazev_guildy;

//*Výpis s hráčem bez guildy  *//
SELECT COALESCE(g.id_guild, "Nevyplněno") AS "ID guildy", p.id_player AS "ID hráče", g.name AS "Jméno", g.created_at AS "Vytvořeno:", p.nickname AS "Nickname"
FROM guilds g
RIGHT JOIN players p ON g.id_guild = p.id_guild;

9:25:00
-----------------------------------------------------------------
