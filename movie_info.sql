-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 27 2014 г., 14:51
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

CREATE TABLE IF NOT EXISTS `director` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `film_studio`
--

CREATE TABLE IF NOT EXISTS `film_studio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`address`,`contact_person`),
  KEY `name_2` (`name`,`address`,`contact_person`),
  KEY `name_3` (`name`),
  KEY `address` (`address`),
  KEY `contact_person` (`contact_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director` varchar(100) NOT NULL,
  `movie_name` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `duration` time NOT NULL,
  `premiere` date NOT NULL,
  `budget` int(11) NOT NULL,
  `film_studio` varchar(100) NOT NULL,
  `in_the_collection_from` date NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `director_ibfk_2` FOREIGN KEY (`surname`) REFERENCES `movie` (`director`),
  ADD CONSTRAINT `director_ibfk_1` FOREIGN KEY (`name`) REFERENCES `movie` (`director`);

--
-- Ограничения внешнего ключа таблицы `film_studio`
--
ALTER TABLE `film_studio`
  ADD CONSTRAINT `film_studio_ibfk_1` FOREIGN KEY (`name`) REFERENCES `movie` (`film_studio`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
