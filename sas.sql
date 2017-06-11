-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 11. Jun 2017 um 02:07
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
  `id` int(11) NOT NULL,
  `Name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `fach`
--

INSERT INTO `fach` (`id`, `Name`) VALUES
(1, 'Mathe'),
(2, 'Informatik'),
(3, 'Deutsch'),
(4, 'Englisch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `klasse`
--

CREATE TABLE `klasse` (
  `id` int(11) NOT NULL,
  `Klasse` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `klasse`
--

INSERT INTO `klasse` (`id`, `Klasse`) VALUES
(1, '5a'),
(2, '5b'),
(3, '5c'),
(4, '6a'),
(5, '6b'),
(6, '6c');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lehrer`
--

CREATE TABLE `lehrer` (
  `id` int(11) NOT NULL,
  `Name` text,
  `Vorname` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `lehrer`
--

INSERT INTO `lehrer` (`id`, `Name`, `Vorname`) VALUES
(1, 'Meyer', 'Ernst'),
(2, 'Müller', 'Udo'),
(3, 'Schubert', 'Gisela'),
(4, 'Krone', 'Ulf');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vertretung`
--

CREATE TABLE `vertretung` (
  `id` int(11) NOT NULL,
  `Lehrer_k` int(11) DEFAULT NULL,
  `Lehrer_v` int(11) DEFAULT NULL,
  `Fach_id` int(11) DEFAULT NULL,
  `Klasse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `vertretung`
--

INSERT INTO `vertretung` (`id`, `Lehrer_k`, `Lehrer_v`, `Fach_id`, `Klasse_id`) VALUES
(1, 1, 2, 1, 1),
(2, 1, 3, 2, 2),
(3, 1, 2, 3, 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `fach`
--
ALTER TABLE `fach`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `klasse`
--
ALTER TABLE `klasse`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `lehrer`
--
ALTER TABLE `lehrer`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `vertretung`
--
ALTER TABLE `vertretung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vertretung_lehrer` (`Lehrer_k`),
  ADD KEY `FK_vertretung_lehrer_2` (`Lehrer_v`),
  ADD KEY `FK_vertretung_fach` (`Fach_id`),
  ADD KEY `FK_vertretung_klasse` (`Klasse_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `fach`
--
ALTER TABLE `fach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `klasse`
--
ALTER TABLE `klasse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `lehrer`
--
ALTER TABLE `lehrer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `vertretung`
--
ALTER TABLE `vertretung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `vertretung`
--
ALTER TABLE `vertretung`
  ADD CONSTRAINT `FK_vertretung_fach` FOREIGN KEY (`Fach_id`) REFERENCES `fach` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vertretung_klasse` FOREIGN KEY (`Klasse_id`) REFERENCES `klasse` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vertretung_lehrer` FOREIGN KEY (`Lehrer_k`) REFERENCES `lehrer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_vertretung_lehrer_2` FOREIGN KEY (`Lehrer_v`) REFERENCES `lehrer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
