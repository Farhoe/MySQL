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
