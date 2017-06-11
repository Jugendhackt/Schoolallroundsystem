-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 10. Jun 2017 um 12:01
-- Server-Version: 5.6.36
-- PHP-Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `sas`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fach`
--

CREATE TABLE `fach` (
  `Name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fach`
--

INSERT INTO `fach` (`Name`) VALUES
('Mathe'),
('Informatik'),
('Deutsch'),
('Englisch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klasse`
--

CREATE TABLE `klasse` (
  `Klasse` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `klasse`
--

INSERT INTO `klasse` (`Klasse`) VALUES
('5a'),
('5b'),
('5c'),
('6a'),
('6b'),
('6c');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lehrer`
--

CREATE TABLE `lehrer` (
  `Name` text,
  `Vorname` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `lehrer`
--

INSERT INTO `lehrer` (`Name`, `Vorname`) VALUES
('Meyer', 'Ernst'),
('Müller', 'Udo'),
('Schubert', 'Gisela'),
('Krone', 'Ulf');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vertretung`
--

CREATE TABLE `vertretung` (
  `Lehrer_k` int(11) DEFAULT NULL,
  `Lehrer_v` int(11) DEFAULT NULL,
  `Fach_id` int(11) DEFAULT NULL,
  `Klasse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `vertretung`
--

INSERT INTO `vertretung` (`Lehrer_k`, `Lehrer_v`, `Fach_id`, `Klasse_id`) VALUES
(0, 2, 1, 1),
(0, 3, 2, 2),
(1, 2, 3, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
