-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 28 2014 г., 18:40
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `movie_info`
--

-- --------------------------------------------------------

--
-- Структура таблицы `director`
--

CREATE TABLE IF NOT EXISTS `director` ( -- directors (множина)
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_death` date NOT NULL,
  `nationality` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`surname`,`date_of_birth`,`date_of_death`,`nationality`),
  KEY `name_2` (`name`,`surname`,`date_of_birth`,`date_of_death`,`nationality`),
  KEY `surname` (`surname`),
  KEY `date_of_birth` (`date_of_birth`),
  KEY `date_of_death` (`date_of_death`),
  KEY `nationality` (`nationality`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `director`
--

INSERT INTO `director` (`id`, `name`, `surname`, `date_of_birth`, `date_of_death`, `nationality`) VALUES
(1, 'Peter', 'Jackson', '1961-10-31', '0000-00-00', 'New Zealand');

-- --------------------------------------------------------

--
-- Структура таблицы `film_studio`
--

CREATE TABLE IF NOT EXISTS `film_studio` ( --studios 
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL, -- contact_person_id і звязок із іншою таблицею
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`address`,`contact_person`),
  KEY `name_2` (`name`,`address`,`contact_person`),
  KEY `name_3` (`name`),
  KEY `address` (`address`),
  KEY `contact_person` (`contact_person`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `film_studio`
--

INSERT INTO `film_studio` (`id`, `name`, `address`, `contact_person`) VALUES
(1, 'New Line Cinema', '116 N Robertson Blvd Los Angeles, CA 90048', 'Time Warner');

-- --------------------------------------------------------

--
-- Структура таблицы `help_table1`
--

CREATE TABLE IF NOT EXISTS `help_table1` ( --красномовна назва, по якій напевне можна здогадатися, що в цій таблиці за дані :)
  `director` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  KEY `director` (`director`),
  KEY `name` (`name`),
  KEY `surname` (`surname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `help_table2`
--

CREATE TABLE IF NOT EXISTS `help_table2` (
  `film_studio` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  KEY `film_studio` (`film_studio`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director` varchar(100) NOT NULL, -- director_id
  `movie_name` varchar(100) NOT NULL, -- просто name
  `genre` varchar(100) NOT NULL, -- genre_id --крім того, що треба винести в окрему таблицю, бо фільм може мати багато жанрів
  `duration` time NOT NULL,
  `premiere` date NOT NULL,
  `budget` int(11) NOT NULL,
  `film_studio` varchar(100) NOT NULL, --studia_id
  `in_the_collection_from` date NOT NULL, --занадто довга назва поля
  PRIMARY KEY (`id`),
  UNIQUE KEY `director` (`director`,`movie_name`,`genre`,`duration`,`premiere`,`budget`,`film_studio`,`in_the_collection_from`),
  KEY `film_studio` (`film_studio`),
  KEY `director_2` (`director`,`movie_name`,`genre`,`duration`,`premiere`,`budget`,`film_studio`,`in_the_collection_from`),
  KEY `movie_name` (`movie_name`),
  KEY `genre` (`genre`),
  KEY `duration` (`duration`),
  KEY `premiere` (`premiere`),
  KEY `budget` (`budget`),
  KEY `in_the_collection_from` (`in_the_collection_from`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `movie`
--

INSERT INTO `movie` (`id`, `director`, `movie_name`, `genre`, `duration`, `premiere`, `budget`, `film_studio`, `in_the_collection_from`) VALUES
(1, 'Peter Jackson', 'The Hobbit: An Unexpected Journey', 'Adventure, Fantasy', '02:49:37', '2012-11-28', 180000000, 'New Line Cinema, Metro-Goldwyn-Mayer (MGM), WingNut Films', '2014-10-28');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `help_table1`
--
ALTER TABLE `help_table1`
  ADD CONSTRAINT `help_table1_ibfk_3` FOREIGN KEY (`surname`) REFERENCES `director` (`surname`),
  ADD CONSTRAINT `help_table1_ibfk_1` FOREIGN KEY (`director`) REFERENCES `movie` (`director`),
  ADD CONSTRAINT `help_table1_ibfk_2` FOREIGN KEY (`name`) REFERENCES `director` (`name`);

--
-- Ограничения внешнего ключа таблицы `help_table2`
--
ALTER TABLE `help_table2`
  ADD CONSTRAINT `help_table2_ibfk_2` FOREIGN KEY (`name`) REFERENCES `film_studio` (`name`),
  ADD CONSTRAINT `help_table2_ibfk_1` FOREIGN KEY (`film_studio`) REFERENCES `movie` (`film_studio`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
