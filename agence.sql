-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2022 at 01:21 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agence`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `numtick` int(11) NOT NULL,
  `nomcli` text NOT NULL,
  `numtelcli` varchar(20) NOT NULL,
  `numcnicli` varchar(20) NOT NULL,
  `prixtick` double NOT NULL,
  `dateEnreg` date NOT NULL,
  `HeureDep` varchar(10) NOT NULL,
  `Categorie` text NOT NULL,
  `destination` text NOT NULL,
  `numbagages` int(11) DEFAULT NULL,
  `numbus` int(11) DEFAULT NULL,
  `numcni` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`numtick`, `nomcli`, `numtelcli`, `numcnicli`, `prixtick`, `dateEnreg`, `HeureDep`, `Categorie`, `destination`, `numbagages`, `numbus`, `numcni`) VALUES
(1, 'Loic', '641527845', '74859123', 10000, '2022-08-18', '12h', 'VIP', 'Yaounde', 5, 1, NULL),
(2, 'Bryan', '654123789', '874512', 10000, '2022-07-16', '12h', 'VIP', 'Yaounde', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itineraire`
--

CREATE TABLE `itineraire` (
  `iditi` int(11) NOT NULL,
  `nom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itineraire`
--

INSERT INTO `itineraire` (`iditi`, `nom`) VALUES
(1, 'Yaounde'),
(2, 'Kribi');

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `nom` text NOT NULL,
  `numtel` varchar(20) NOT NULL,
  `numcni` varchar(20) NOT NULL,
  `addresse` text NOT NULL,
  `mail` text NOT NULL,
  `salaire` double NOT NULL,
  `poste` text NOT NULL,
  `sexe` text NOT NULL,
  `password` text DEFAULT NULL,
  `imgsrc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personnel`
--

INSERT INTO `personnel` (`nom`, `numtel`, `numcni`, `addresse`, `mail`, `salaire`, `poste`, `sexe`, `password`, `imgsrc`) VALUES
('Tarek', '674466980', '85', 'douala-lendi', 'akazongloic@gmail.com', 750000, 'gerant', 'M', '1234', '\\Image\\669047.png'),
('loic', '674466980', '85421', 'douala-lendi', 'akazongloic@gmail.com', 750000, 'gerant', 'M', '1234', '\\Image\\273995.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

CREATE TABLE `vehicule` (
  `immat` varchar(20) NOT NULL,
  `numbus` int(11) NOT NULL,
  `typebus` text NOT NULL,
  `nbrplaces` int(11) NOT NULL,
  `etat` text NOT NULL,
  `itineraire` text NOT NULL,
  `iditi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicule`
--

INSERT INTO `vehicule` (`immat`, `numbus`, `typebus`, `nbrplaces`, `etat`, `itineraire`, `iditi`) VALUES
('LT 595 IE', 1, 'VIP', 70, 'E', 'Yaounde', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`numtick`),
  ADD KEY `fk_numbus` (`numbus`),
  ADD KEY `fk_numcni` (`numcni`);

--
-- Indexes for table `itineraire`
--
ALTER TABLE `itineraire`
  ADD PRIMARY KEY (`iditi`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`numcni`);

--
-- Indexes for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`numbus`),
  ADD KEY `fk_iditi` (`iditi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `numtick` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `itineraire`
--
ALTER TABLE `itineraire`
  MODIFY `iditi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicule`
--
ALTER TABLE `vehicule`
  MODIFY `numbus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_numbus` FOREIGN KEY (`numbus`) REFERENCES `vehicule` (`numbus`),
  ADD CONSTRAINT `fk_numcni` FOREIGN KEY (`numcni`) REFERENCES `personnel` (`numcni`);

--
-- Constraints for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `fk_iditi` FOREIGN KEY (`iditi`) REFERENCES `itineraire` (`iditi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
