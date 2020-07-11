-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 10. Jul 2020 um 16:48
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_andreas_pirkner_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_andreas_pirkner_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_andreas_pirkner_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Employee`
--

CREATE TABLE `Employee` (
  `Employee_ID` int(10) NOT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Second_Name` varchar(30) DEFAULT NULL,
  `Mail_ID` int(10) DEFAULT NULL,
  `Recipient_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Employee`
--

INSERT INTO `Employee` (`Employee_ID`, `First_Name`, `Second_Name`, `Mail_ID`, `Recipient_ID`) VALUES
(5, 'Klaus', 'Reimon', 1, 1),
(6, 'Lisa', 'Fitz', 2, 2),
(7, 'Max', 'Schulz', 3, 3),
(8, 'Norbert', 'Steger', 4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Location`
--

CREATE TABLE `Location` (
  `Location_ID` int(10) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Mail_ID` int(10) DEFAULT NULL,
  `Employee_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Location`
--

INSERT INTO `Location` (`Location_ID`, `Address`, `Mail_ID`, `Employee_ID`) VALUES
(1, 'Strasse 9,1090 Wien', 1, 5),
(2, 'Strasse 10, 1010 Wien', 2, 6),
(3, 'Strasse 11, 1110 Wien', 3, 7),
(4, 'Strasse 12, 1120 Wien', 4, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Mail`
--

CREATE TABLE `Mail` (
  `Mail_ID` int(10) NOT NULL,
  `Date_Deposition` datetime DEFAULT NULL,
  `Recipient_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Mail`
--

INSERT INTO `Mail` (`Mail_ID`, `Date_Deposition`, `Recipient_ID`) VALUES
(1, '2020-01-01 10:12:01', 1),
(2, '2020-02-02 11:13:02', 2),
(3, '2020-03-03 12:14:03', 3),
(4, '2020-04-04 13:15:04', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Recipient`
--

CREATE TABLE `Recipient` (
  `Recipient_ID` int(10) NOT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Second_Name` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Date_Received` datetime DEFAULT NULL,
  `Mail_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Recipient`
--

INSERT INTO `Recipient` (`Recipient_ID`, `First_Name`, `Second_Name`, `Address`, `Date_Received`, `Mail_ID`) VALUES
(1, 'Emil', 'Richter', 'Strasse 1, 1010 Wien', '2020-01-03 09:15:27', 1),
(2, 'Fritz', 'Kogler', 'Strasse 2, 1020 Wien', '2020-02-04 10:28:30', 2),
(3, 'Gabi', 'Winter', 'Strasse 3, 1030 Wien', '2020-03-05 11:47:02', 3),
(4, 'Jonas', 'Schalk', 'Strasse 4, 1040 Wien', '2020-04-06 12:13:17', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Sender`
--

CREATE TABLE `Sender` (
  `Sender_ID` int(10) NOT NULL,
  `First_Name` varchar(30) DEFAULT NULL,
  `Second_Name` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Mail_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Sender`
--

INSERT INTO `Sender` (`Sender_ID`, `First_Name`, `Second_Name`, `Address`, `Mail_ID`) VALUES
(1, 'Alexander', 'Berger', 'Strasse 5, 1050 Wien', 1),
(2, 'Bettina', 'Bauer', 'Strasse 6, 1060 Wien', 2),
(3, 'Christian', 'Pichler', 'Strasse 7, 1070 Wien', 3),
(4, 'Doris', 'Probst', 'Strasse 8, 1080 Wien', 4);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`Employee_ID`),
  ADD KEY `Mail_ID` (`Mail_ID`),
  ADD KEY `Recipient_ID` (`Recipient_ID`);

--
-- Indizes für die Tabelle `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`Location_ID`),
  ADD KEY `Mail_ID` (`Mail_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indizes für die Tabelle `Mail`
--
ALTER TABLE `Mail`
  ADD PRIMARY KEY (`Mail_ID`),
  ADD KEY `Recipient_ID` (`Recipient_ID`);

--
-- Indizes für die Tabelle `Recipient`
--
ALTER TABLE `Recipient`
  ADD PRIMARY KEY (`Recipient_ID`),
  ADD KEY `Mail_ID` (`Mail_ID`);

--
-- Indizes für die Tabelle `Sender`
--
ALTER TABLE `Sender`
  ADD PRIMARY KEY (`Sender_ID`),
  ADD KEY `Mail_ID` (`Mail_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Employee`
--
ALTER TABLE `Employee`
  MODIFY `Employee_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `Mail`
--
ALTER TABLE `Mail`
  MODIFY `Mail_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `Recipient`
--
ALTER TABLE `Recipient`
  MODIFY `Recipient_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Sender`
--
ALTER TABLE `Sender`
  MODIFY `Sender_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Mail_ID`) REFERENCES `Mail` (`Mail_ID`),
  ADD CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`Recipient_ID`) REFERENCES `Recipient` (`Recipient_ID`);

--
-- Constraints der Tabelle `Location`
--
ALTER TABLE `Location`
  ADD CONSTRAINT `Location_ibfk_1` FOREIGN KEY (`Mail_ID`) REFERENCES `Mail` (`Mail_ID`),
  ADD CONSTRAINT `Location_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `Employee` (`Employee_ID`);

--
-- Constraints der Tabelle `Mail`
--
ALTER TABLE `Mail`
  ADD CONSTRAINT `Mail_ibfk_1` FOREIGN KEY (`Recipient_ID`) REFERENCES `Recipient` (`Recipient_ID`),
  ADD CONSTRAINT `Mail_ibfk_2` FOREIGN KEY (`Recipient_ID`) REFERENCES `Recipient` (`Recipient_ID`);

--
-- Constraints der Tabelle `Recipient`
--
ALTER TABLE `Recipient`
  ADD CONSTRAINT `Recipient_ibfk_1` FOREIGN KEY (`Mail_ID`) REFERENCES `Mail` (`Mail_ID`);

--
-- Constraints der Tabelle `Sender`
--
ALTER TABLE `Sender`
  ADD CONSTRAINT `Sender_ibfk_1` FOREIGN KEY (`Mail_ID`) REFERENCES `Mail` (`Mail_ID`),
  ADD CONSTRAINT `Sender_ibfk_2` FOREIGN KEY (`Mail_ID`) REFERENCES `Mail` (`Mail_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
