-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 19 août 2020 à 14:33
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bilan_meteo`
--

-- --------------------------------------------------------

--
-- Structure de la table `astronomy`
--

DROP TABLE IF EXISTS `astronomy`;
CREATE TABLE IF NOT EXISTS `astronomy` (
  `json` json NOT NULL,
  `request_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_timestamp` timestamp NOT NULL,
  UNIQUE KEY `request_timestamp` (`request_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `astronomy`
--

INSERT INTO `astronomy` (`json`, `request_timestamp`, `data_timestamp`) VALUES
('{\"data\": [{\"time\": \"2020-08-19T12:00:00+00:00\", \"sunset\": \"2020-08-19T19:18:23+00:00\", \"moonset\": \"2020-08-19T20:01:34+00:00\", \"sunrise\": \"2020-08-19T05:14:30+00:00\", \"moonrise\": \"2020-08-19T04:58:43+00:00\", \"civilDawn\": \"2020-08-19T04:41:15+00:00\", \"civilDusk\": \"2020-08-19T19:51:39+00:00\", \"moonPhase\": {\"closest\": {\"text\": \"New moon\", \"time\": \"2020-08-18T23:08:00+00:00\", \"value\": 0}, \"current\": {\"text\": \"Waxing crescent\", \"time\": \"2020-08-19T12:00:00+00:00\", \"value\": 0.018144108545809168}}, \"moonFraction\": 0.003245641898804663, \"nauticalDawn\": \"2020-08-19T04:00:06+00:00\", \"nauticalDusk\": \"2020-08-19T20:32:47+00:00\", \"astronomicalDawn\": \"2020-08-19T03:14:15+00:00\", \"astronomicalDusk\": \"2020-08-19T21:18:38+00:00\"}], \"meta\": {\"lat\": 47.519124, \"lng\": -2.856659, \"cost\": 1, \"start\": \"2020-08-19 12:00\", \"dailyQuota\": 50, \"requestCount\": 4}}', '2020-08-19 14:27:52', '2020-08-18 20:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tide_extremes`
--

DROP TABLE IF EXISTS `tide_extremes`;
CREATE TABLE IF NOT EXISTS `tide_extremes` (
  `json` json NOT NULL,
  `request_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_timestamp` timestamp NOT NULL,
  UNIQUE KEY `request_timestamp` (`request_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tide_extremes`
--

INSERT INTO `tide_extremes` (`json`, `request_timestamp`, `data_timestamp`) VALUES
('{\"data\": [{\"time\": \"2020-08-19T03:44:00+00:00\", \"type\": \"high\", \"height\": 1.7541100327891206}, {\"time\": \"2020-08-19T09:53:00+00:00\", \"type\": \"low\", \"height\": -2.0728676376621147}, {\"time\": \"2020-08-19T15:57:00+00:00\", \"type\": \"high\", \"height\": 2.075105692599209}], \"meta\": {\"end\": \"2020-08-19 21:59\", \"lat\": 47.519124, \"lng\": -2.856659, \"cost\": 1, \"datum\": \"MSL\", \"start\": \"2020-08-18 22:00\", \"station\": {\"lat\": 47.543, \"lng\": -2.895, \"name\": \"le crouesty\", \"source\": \"sg\", \"distance\": 4}, \"dailyQuota\": 50, \"requestCount\": 5}}', '2020-08-19 14:29:01', '2020-08-18 20:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tide_sea`
--

DROP TABLE IF EXISTS `tide_sea`;
CREATE TABLE IF NOT EXISTS `tide_sea` (
  `json` json NOT NULL,
  `request_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_timestamp` timestamp NOT NULL,
  UNIQUE KEY `request_timestamp` (`request_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tide_sea`
--

INSERT INTO `tide_sea` (`json`, `request_timestamp`, `data_timestamp`) VALUES
('{\"data\": [{\"sg\": -2.03, \"time\": \"2020-08-18T22:00:00+00:00\"}, {\"sg\": -1.55, \"time\": \"2020-08-18T23:00:00+00:00\"}, {\"sg\": -0.67, \"time\": \"2020-08-19T00:00:00+00:00\"}, {\"sg\": 0.32, \"time\": \"2020-08-19T01:00:00+00:00\"}, {\"sg\": 1.15, \"time\": \"2020-08-19T02:00:00+00:00\"}, {\"sg\": 1.64, \"time\": \"2020-08-19T03:00:00+00:00\"}, {\"sg\": 1.74, \"time\": \"2020-08-19T04:00:00+00:00\"}, {\"sg\": 1.45, \"time\": \"2020-08-19T05:00:00+00:00\"}, {\"sg\": 0.8, \"time\": \"2020-08-19T06:00:00+00:00\"}, {\"sg\": -0.12, \"time\": \"2020-08-19T07:00:00+00:00\"}, {\"sg\": -1.09, \"time\": \"2020-08-19T08:00:00+00:00\"}, {\"sg\": -1.83, \"time\": \"2020-08-19T09:00:00+00:00\"}, {\"sg\": -2.07, \"time\": \"2020-08-19T10:00:00+00:00\"}, {\"sg\": -1.7, \"time\": \"2020-08-19T11:00:00+00:00\"}, {\"sg\": -0.82, \"time\": \"2020-08-19T12:00:00+00:00\"}, {\"sg\": 0.26, \"time\": \"2020-08-19T13:00:00+00:00\"}, {\"sg\": 1.24, \"time\": \"2020-08-19T14:00:00+00:00\"}, {\"sg\": 1.87, \"time\": \"2020-08-19T15:00:00+00:00\"}, {\"sg\": 2.07, \"time\": \"2020-08-19T16:00:00+00:00\"}, {\"sg\": 1.85, \"time\": \"2020-08-19T17:00:00+00:00\"}, {\"sg\": 1.22, \"time\": \"2020-08-19T18:00:00+00:00\"}, {\"sg\": 0.28, \"time\": \"2020-08-19T19:00:00+00:00\"}, {\"sg\": -0.81, \"time\": \"2020-08-19T20:00:00+00:00\"}, {\"sg\": -1.77, \"time\": \"2020-08-19T21:00:00+00:00\"}], \"meta\": {\"end\": \"2020-08-19 21:59\", \"lat\": 47.519124, \"lng\": -2.856659, \"cost\": 1, \"datum\": \"MSL\", \"start\": \"2020-08-18 22:00\", \"station\": {\"lat\": 47.543, \"lng\": -2.895, \"name\": \"le crouesty\", \"source\": \"sg\", \"distance\": 4}, \"dailyQuota\": 50, \"requestCount\": 3}}', '2020-08-19 14:27:52', '2020-08-18 20:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `weather`
--

DROP TABLE IF EXISTS `weather`;
CREATE TABLE IF NOT EXISTS `weather` (
  `json` json NOT NULL,
  `request_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_timestamp` timestamp NOT NULL,
  UNIQUE KEY `request_timestamp` (`request_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `weather`
--

INSERT INTO `weather` (`json`, `request_timestamp`, `data_timestamp`) VALUES
('{\"meta\": {\"end\": \"2020-08-19 21:59\", \"lat\": 47.519124, \"lng\": -2.856659, \"cost\": 1, \"start\": \"2020-08-18 22:00\", \"params\": [\"waveHeight\", \"swellDirection\", \"windSpeed\", \"windDirection\", \"airTemperature\", \"cloudCover\", \"humidity\", \"precipitation\"], \"dailyQuota\": 50, \"requestCount\": 2}, \"hours\": [{\"time\": \"2020-08-18T22:00:00+00:00\", \"humidity\": {\"sg\": 93.33, \"dwd\": 93.33, \"noaa\": 92.2}, \"windSpeed\": {\"sg\": 2.6, \"icon\": 2.6, \"noaa\": 5.56}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 100}, \"waveHeight\": {\"sg\": 0.74, \"dwd\": 0.65, \"icon\": 0.47, \"noaa\": 0.74, \"meteo\": 0.74}, \"precipitation\": {\"sg\": 0.02, \"dwd\": 0.02, \"noaa\": 0.71}, \"windDirection\": {\"sg\": 182.18, \"icon\": 182.18, \"noaa\": 187.6}, \"airTemperature\": {\"sg\": 19.6, \"dwd\": 19.6, \"noaa\": 20.11}, \"swellDirection\": {\"sg\": 239.4, \"dwd\": 229.56, \"icon\": 236.23, \"noaa\": 221.89, \"meteo\": 239.4}}, {\"time\": \"2020-08-18T23:00:00+00:00\", \"humidity\": {\"sg\": 92.64, \"dwd\": 92.64, \"noaa\": 92.8}, \"windSpeed\": {\"sg\": 2.77, \"icon\": 2.77, \"noaa\": 6.4}, \"cloudCover\": {\"sg\": 99.79, \"dwd\": 99.79, \"noaa\": 100}, \"waveHeight\": {\"sg\": 0.78, \"dwd\": 0.69, \"icon\": 0.47, \"noaa\": 0.76, \"meteo\": 0.78}, \"precipitation\": {\"sg\": 0.25, \"dwd\": 0.25, \"noaa\": 1.42}, \"windDirection\": {\"sg\": 164.2, \"icon\": 164.2, \"noaa\": 186.41}, \"airTemperature\": {\"sg\": 19.88, \"dwd\": 19.88, \"noaa\": 20.09}, \"swellDirection\": {\"sg\": 240.87, \"dwd\": 231.23, \"icon\": 237.11, \"noaa\": 220.15, \"meteo\": 240.87}}, {\"time\": \"2020-08-19T00:00:00+00:00\", \"humidity\": {\"sg\": 92.51, \"dwd\": 92.51, \"noaa\": 93.4}, \"windSpeed\": {\"sg\": 2.95, \"icon\": 2.95, \"noaa\": 7.24}, \"cloudCover\": {\"sg\": 99.99, \"dwd\": 99.99, \"noaa\": 100}, \"waveHeight\": {\"sg\": 0.81, \"dwd\": 0.74, \"icon\": 0.46, \"noaa\": 0.79, \"meteo\": 0.81}, \"precipitation\": {\"sg\": 0, \"dwd\": 0, \"noaa\": 2.12}, \"windDirection\": {\"sg\": 146.21, \"icon\": 146.21, \"noaa\": 185.22}, \"airTemperature\": {\"sg\": 20.01, \"dwd\": 20.01, \"noaa\": 20.08}, \"swellDirection\": {\"sg\": 242.34, \"dwd\": 233.43, \"icon\": 238, \"noaa\": 218.4, \"meteo\": 242.34}}, {\"time\": \"2020-08-19T01:00:00+00:00\", \"humidity\": {\"sg\": 93.96, \"dwd\": 93.96, \"noaa\": 93.23}, \"windSpeed\": {\"sg\": 3.86, \"icon\": 3.86, \"noaa\": 7.97}, \"cloudCover\": {\"sg\": 99.98, \"dwd\": 99.98, \"noaa\": 96.83}, \"waveHeight\": {\"sg\": 0.87, \"dwd\": 0.73, \"icon\": 0.48, \"noaa\": 0.87, \"meteo\": 0.87}, \"precipitation\": {\"sg\": 0, \"dwd\": 0, \"noaa\": 1.9}, \"windDirection\": {\"sg\": 145.75, \"icon\": 145.75, \"noaa\": 186.82}, \"airTemperature\": {\"sg\": 19.94, \"dwd\": 19.94, \"noaa\": 20.05}, \"swellDirection\": {\"sg\": 241.27, \"dwd\": 227.97, \"icon\": 238.84, \"noaa\": 219.95, \"meteo\": 241.27}}, {\"time\": \"2020-08-19T02:00:00+00:00\", \"humidity\": {\"sg\": 93.64, \"dwd\": 93.64, \"noaa\": 93.07}, \"windSpeed\": {\"sg\": 4.78, \"icon\": 4.78, \"noaa\": 8.7}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 93.67}, \"waveHeight\": {\"sg\": 0.93, \"dwd\": 0.72, \"icon\": 0.49, \"noaa\": 0.96, \"meteo\": 0.93}, \"precipitation\": {\"sg\": 0.76, \"dwd\": 0.76, \"noaa\": 1.67}, \"windDirection\": {\"sg\": 145.3, \"icon\": 145.3, \"noaa\": 188.42}, \"airTemperature\": {\"sg\": 19.94, \"dwd\": 19.94, \"noaa\": 20.02}, \"swellDirection\": {\"sg\": 240.19, \"dwd\": 231.29, \"icon\": 239.69, \"noaa\": 221.51, \"meteo\": 240.19}}, {\"time\": \"2020-08-19T03:00:00+00:00\", \"humidity\": {\"sg\": 94.11, \"dwd\": 94.11, \"noaa\": 92.9}, \"windSpeed\": {\"sg\": 5.69, \"icon\": 5.69, \"noaa\": 9.43}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 90.5}, \"waveHeight\": {\"sg\": 0.99, \"dwd\": 0.74, \"icon\": 0.51, \"noaa\": 1.04, \"meteo\": 0.99}, \"precipitation\": {\"sg\": 2.69, \"dwd\": 2.69, \"noaa\": 1.44}, \"windDirection\": {\"sg\": 144.84, \"icon\": 144.84, \"noaa\": 190.02}, \"airTemperature\": {\"sg\": 19.89, \"dwd\": 19.89, \"noaa\": 20}, \"swellDirection\": {\"sg\": 239.12, \"dwd\": 233.41, \"icon\": 240.53, \"noaa\": 223.06, \"meteo\": 239.12}}, {\"time\": \"2020-08-19T04:00:00+00:00\", \"humidity\": {\"sg\": 92.58, \"dwd\": 92.58, \"noaa\": 92.4}, \"windSpeed\": {\"sg\": 6.47, \"icon\": 6.47, \"noaa\": 10.14}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 87.33}, \"waveHeight\": {\"sg\": 1.11, \"dwd\": 0.84, \"icon\": 0.63, \"noaa\": 1.17, \"meteo\": 1.11}, \"precipitation\": {\"sg\": 5.45, \"dwd\": 5.45, \"noaa\": 1.8}, \"windDirection\": {\"sg\": 149.34, \"icon\": 149.34, \"noaa\": 193.74}, \"airTemperature\": {\"sg\": 19.69, \"dwd\": 19.69, \"noaa\": 19.65}, \"swellDirection\": {\"sg\": 242.09, \"dwd\": 239.1, \"icon\": 238.42, \"noaa\": 225.07, \"meteo\": 242.09}}, {\"time\": \"2020-08-19T05:00:00+00:00\", \"humidity\": {\"sg\": 93.81, \"dwd\": 93.81, \"noaa\": 91.9}, \"windSpeed\": {\"sg\": 7.25, \"icon\": 7.25, \"noaa\": 10.84}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 84.17}, \"waveHeight\": {\"sg\": 1.22, \"dwd\": 1.05, \"icon\": 0.74, \"noaa\": 1.3, \"meteo\": 1.22}, \"precipitation\": {\"sg\": 6.5, \"dwd\": 6.5, \"noaa\": 2.16}, \"windDirection\": {\"sg\": 153.83, \"icon\": 153.83, \"noaa\": 197.46}, \"airTemperature\": {\"sg\": 19.35, \"dwd\": 19.35, \"noaa\": 19.31}, \"swellDirection\": {\"sg\": 245.05, \"dwd\": 245.76, \"icon\": 236.31, \"noaa\": 227.09, \"meteo\": 245.05}}, {\"time\": \"2020-08-19T06:00:00+00:00\", \"humidity\": {\"sg\": 93.65, \"dwd\": 93.65, \"noaa\": 91.4}, \"windSpeed\": {\"sg\": 8.03, \"icon\": 8.03, \"noaa\": 11.55}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 81}, \"waveHeight\": {\"sg\": 1.34, \"dwd\": 1.23, \"icon\": 0.86, \"noaa\": 1.43, \"meteo\": 1.34}, \"precipitation\": {\"sg\": 7.57, \"dwd\": 7.57, \"noaa\": 2.52}, \"windDirection\": {\"sg\": 158.33, \"icon\": 158.33, \"noaa\": 201.18}, \"airTemperature\": {\"sg\": 19.24, \"dwd\": 19.24, \"noaa\": 18.96}, \"swellDirection\": {\"sg\": 248.02, \"dwd\": 247.67, \"icon\": 234.2, \"noaa\": 229.1, \"meteo\": 248.02}}, {\"time\": \"2020-08-19T07:00:00+00:00\", \"humidity\": {\"sg\": 93.79, \"dwd\": 93.79, \"noaa\": 91.63}, \"windSpeed\": {\"sg\": 8.77, \"icon\": 8.77, \"noaa\": 11.7}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 77.17}, \"waveHeight\": {\"sg\": 1.44, \"dwd\": 1.33, \"icon\": 1.03, \"noaa\": 1.54, \"meteo\": 1.44}, \"precipitation\": {\"sg\": 5.35, \"dwd\": 5.35, \"noaa\": 2.04}, \"windDirection\": {\"sg\": 167.24, \"icon\": 167.24, \"noaa\": 203.79}, \"airTemperature\": {\"sg\": 19.15, \"dwd\": 19.15, \"noaa\": 19.29}, \"swellDirection\": {\"sg\": 249.81, \"dwd\": 247.35, \"icon\": 236.84, \"noaa\": 233.84, \"meteo\": 249.81}}, {\"time\": \"2020-08-19T08:00:00+00:00\", \"humidity\": {\"sg\": 91.91, \"dwd\": 91.91, \"noaa\": 91.87}, \"windSpeed\": {\"sg\": 9.52, \"icon\": 9.52, \"noaa\": 11.84}, \"cloudCover\": {\"sg\": 99.79, \"dwd\": 99.79, \"noaa\": 73.33}, \"waveHeight\": {\"sg\": 1.53, \"dwd\": 1.43, \"icon\": 1.2, \"noaa\": 1.66, \"meteo\": 1.53}, \"precipitation\": {\"sg\": 1.36, \"dwd\": 1.36, \"noaa\": 1.56}, \"windDirection\": {\"sg\": 176.16, \"icon\": 176.16, \"noaa\": 206.39}, \"airTemperature\": {\"sg\": 19.25, \"dwd\": 19.25, \"noaa\": 19.62}, \"swellDirection\": {\"sg\": 251.6, \"dwd\": 244.4, \"icon\": 239.47, \"noaa\": 238.57, \"meteo\": 251.6}}, {\"time\": \"2020-08-19T09:00:00+00:00\", \"humidity\": {\"sg\": 91.01, \"dwd\": 91.01, \"noaa\": 92.1}, \"windSpeed\": {\"sg\": 10.26, \"icon\": 10.26, \"noaa\": 11.99}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 69.5}, \"waveHeight\": {\"sg\": 1.63, \"dwd\": 1.46, \"icon\": 1.37, \"noaa\": 1.77, \"meteo\": 1.63}, \"precipitation\": {\"sg\": 0.44, \"dwd\": 0.44, \"noaa\": 1.08}, \"windDirection\": {\"sg\": 185.07, \"icon\": 185.07, \"noaa\": 209}, \"airTemperature\": {\"sg\": 19.29, \"dwd\": 19.29, \"noaa\": 19.95}, \"swellDirection\": {\"sg\": 253.39, \"dwd\": 241.85, \"icon\": 242.11, \"noaa\": 243.31, \"meteo\": 253.39}}, {\"time\": \"2020-08-19T10:00:00+00:00\", \"humidity\": {\"sg\": 92.68, \"dwd\": 92.68, \"noaa\": 91.9}, \"windSpeed\": {\"sg\": 9.83, \"icon\": 9.83, \"noaa\": 11.17}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 65.67}, \"waveHeight\": {\"sg\": 1.7, \"dwd\": 1.47, \"icon\": 1.39, \"noaa\": 1.77, \"meteo\": 1.7}, \"precipitation\": {\"sg\": 0.24, \"dwd\": 0.24, \"noaa\": 0.72}, \"windDirection\": {\"sg\": 188.42, \"icon\": 188.42, \"noaa\": 208.08}, \"airTemperature\": {\"sg\": 19.76, \"dwd\": 19.76, \"noaa\": 19.95}, \"swellDirection\": {\"sg\": 253.17, \"dwd\": 242.18, \"icon\": 240.63, \"noaa\": 252.71, \"meteo\": 253.17}}, {\"time\": \"2020-08-19T11:00:00+00:00\", \"humidity\": {\"sg\": 90.46, \"dwd\": 90.46, \"noaa\": 91.7}, \"windSpeed\": {\"sg\": 9.41, \"icon\": 9.41, \"noaa\": 10.34}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 61.83}, \"waveHeight\": {\"sg\": 1.76, \"dwd\": 1.5, \"icon\": 1.42, \"noaa\": 1.76, \"meteo\": 1.76}, \"precipitation\": {\"sg\": 0.09, \"dwd\": 0.09, \"noaa\": 0.36}, \"windDirection\": {\"sg\": 191.76, \"icon\": 191.76, \"noaa\": 207.15}, \"airTemperature\": {\"sg\": 19.87, \"dwd\": 19.87, \"noaa\": 19.95}, \"swellDirection\": {\"sg\": 252.94, \"dwd\": 240.75, \"icon\": 239.14, \"noaa\": 262.12, \"meteo\": 252.94}}, {\"time\": \"2020-08-19T12:00:00+00:00\", \"humidity\": {\"sg\": 91.27, \"dwd\": 91.27, \"noaa\": 91.5}, \"windSpeed\": {\"sg\": 8.98, \"icon\": 8.98, \"noaa\": 9.52}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 58}, \"waveHeight\": {\"sg\": 1.83, \"dwd\": 1.53, \"icon\": 1.44, \"noaa\": 1.76, \"meteo\": 1.83}, \"precipitation\": {\"sg\": 0.06, \"dwd\": 0.06, \"noaa\": 0}, \"windDirection\": {\"sg\": 195.11, \"icon\": 195.11, \"noaa\": 206.23}, \"airTemperature\": {\"sg\": 19.87, \"dwd\": 19.87, \"noaa\": 19.95}, \"swellDirection\": {\"sg\": 252.72, \"dwd\": 240.64, \"icon\": 237.66, \"noaa\": 271.52, \"meteo\": 252.72}}, {\"time\": \"2020-08-19T13:00:00+00:00\", \"humidity\": {\"sg\": 91.01, \"dwd\": 91.01, \"noaa\": 92.53}, \"windSpeed\": {\"sg\": 8.68, \"icon\": 8.68, \"noaa\": 8.46}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 64.67}, \"waveHeight\": {\"sg\": 1.83, \"dwd\": 1.5, \"icon\": 1.4, \"noaa\": 1.69, \"meteo\": 1.83}, \"precipitation\": {\"sg\": 0.02, \"dwd\": 0.02, \"noaa\": 0}, \"windDirection\": {\"sg\": 198.94, \"icon\": 198.94, \"noaa\": 208.94}, \"airTemperature\": {\"sg\": 20.23, \"dwd\": 20.23, \"noaa\": 19.95}, \"swellDirection\": {\"sg\": 252.26, \"dwd\": 232.71, \"icon\": 237.32, \"noaa\": 261.53, \"meteo\": 252.26}}, {\"time\": \"2020-08-19T14:00:00+00:00\", \"humidity\": {\"sg\": 85.7, \"dwd\": 85.7, \"noaa\": 93.57}, \"windSpeed\": {\"sg\": 8.39, \"icon\": 8.39, \"noaa\": 7.41}, \"cloudCover\": {\"sg\": 98.21, \"dwd\": 98.21, \"noaa\": 71.33}, \"waveHeight\": {\"sg\": 1.82, \"dwd\": 1.46, \"icon\": 1.36, \"noaa\": 1.61, \"meteo\": 1.82}, \"precipitation\": {\"sg\": 0.01, \"dwd\": 0.01, \"noaa\": 0}, \"windDirection\": {\"sg\": 202.76, \"icon\": 202.76, \"noaa\": 211.65}, \"airTemperature\": {\"sg\": 21.11, \"dwd\": 21.11, \"noaa\": 19.95}, \"swellDirection\": {\"sg\": 251.79, \"dwd\": 233.75, \"icon\": 236.97, \"noaa\": 251.54, \"meteo\": 251.79}}, {\"time\": \"2020-08-19T15:00:00+00:00\", \"humidity\": {\"sg\": 88.12, \"dwd\": 88.12, \"noaa\": 94.6}, \"windSpeed\": {\"sg\": 8.09, \"icon\": 8.09, \"noaa\": 6.35}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 78}, \"waveHeight\": {\"sg\": 1.82, \"dwd\": 1.44, \"icon\": 1.32, \"noaa\": 1.54, \"meteo\": 1.82}, \"precipitation\": {\"sg\": 0.31, \"dwd\": 0.31, \"noaa\": 0}, \"windDirection\": {\"sg\": 206.59, \"icon\": 206.59, \"noaa\": 214.36}, \"airTemperature\": {\"sg\": 21.06, \"dwd\": 21.06, \"noaa\": 19.95}, \"swellDirection\": {\"sg\": 251.33, \"dwd\": 233.11, \"icon\": 236.63, \"noaa\": 241.55, \"meteo\": 251.33}}, {\"time\": \"2020-08-19T16:00:00+00:00\", \"humidity\": {\"sg\": 90.4, \"dwd\": 90.4, \"noaa\": 94.43}, \"windSpeed\": {\"sg\": 7.59, \"icon\": 7.59, \"noaa\": 6.78}, \"cloudCover\": {\"sg\": 99.71, \"dwd\": 99.71, \"noaa\": 84.67}, \"waveHeight\": {\"sg\": 1.79, \"dwd\": 1.41, \"icon\": 1.27, \"noaa\": 1.51, \"meteo\": 1.79}, \"precipitation\": {\"sg\": 0.36, \"dwd\": 0.36, \"noaa\": 0}, \"windDirection\": {\"sg\": 200.73, \"icon\": 200.73, \"noaa\": 207.55}, \"airTemperature\": {\"sg\": 20.74, \"dwd\": 20.74, \"noaa\": 20.02}, \"swellDirection\": {\"sg\": 250.78, \"dwd\": 232.09, \"icon\": 236.73, \"noaa\": 241.39, \"meteo\": 250.78}}, {\"time\": \"2020-08-19T17:00:00+00:00\", \"humidity\": {\"sg\": 90.6, \"dwd\": 90.6, \"noaa\": 94.27}, \"windSpeed\": {\"sg\": 7.09, \"icon\": 7.09, \"noaa\": 7.2}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 91.33}, \"waveHeight\": {\"sg\": 1.76, \"dwd\": 1.38, \"icon\": 1.23, \"noaa\": 1.47, \"meteo\": 1.76}, \"precipitation\": {\"sg\": 1.01, \"dwd\": 1.01, \"noaa\": 0}, \"windDirection\": {\"sg\": 194.86, \"icon\": 194.86, \"noaa\": 200.73}, \"airTemperature\": {\"sg\": 20.61, \"dwd\": 20.61, \"noaa\": 20.08}, \"swellDirection\": {\"sg\": 250.22, \"dwd\": 232.87, \"icon\": 236.82, \"noaa\": 241.24, \"meteo\": 250.22}}, {\"time\": \"2020-08-19T18:00:00+00:00\", \"humidity\": {\"sg\": 91.52, \"dwd\": 91.52, \"noaa\": 94.1}, \"windSpeed\": {\"sg\": 6.59, \"icon\": 6.59, \"noaa\": 7.63}, \"cloudCover\": {\"sg\": 99.82, \"dwd\": 99.82, \"noaa\": 98}, \"waveHeight\": {\"sg\": 1.73, \"dwd\": 1.35, \"icon\": 1.18, \"noaa\": 1.44, \"meteo\": 1.73}, \"precipitation\": {\"sg\": 0.47, \"dwd\": 0.47, \"noaa\": 0}, \"windDirection\": {\"sg\": 189, \"icon\": 189, \"noaa\": 193.92}, \"airTemperature\": {\"sg\": 20.38, \"dwd\": 20.38, \"noaa\": 20.15}, \"swellDirection\": {\"sg\": 249.67, \"dwd\": 231.25, \"icon\": 236.92, \"noaa\": 241.08, \"meteo\": 249.67}}, {\"time\": \"2020-08-19T19:00:00+00:00\", \"humidity\": {\"sg\": 92.42, \"dwd\": 92.42, \"noaa\": 93.83}, \"windSpeed\": {\"sg\": 6.33, \"icon\": 6.33, \"noaa\": 8.19}, \"cloudCover\": {\"sg\": 99.74, \"dwd\": 99.74, \"noaa\": 98.33}, \"waveHeight\": {\"sg\": 1.78, \"dwd\": 1.31, \"icon\": 1.13, \"noaa\": 1.45, \"meteo\": 1.78}, \"precipitation\": {\"sg\": 0.01, \"dwd\": 0.01, \"noaa\": 0.72}, \"windDirection\": {\"sg\": 183.04, \"icon\": 183.04, \"noaa\": 195.91}, \"airTemperature\": {\"sg\": 20.16, \"dwd\": 20.16, \"noaa\": 20.19}, \"swellDirection\": {\"sg\": 249.96, \"dwd\": 228.57, \"icon\": 236.75, \"noaa\": 238.89, \"meteo\": 249.96}}, {\"time\": \"2020-08-19T20:00:00+00:00\", \"humidity\": {\"sg\": 92.82, \"dwd\": 92.82, \"noaa\": 93.57}, \"windSpeed\": {\"sg\": 6.08, \"icon\": 6.08, \"noaa\": 8.75}, \"cloudCover\": {\"sg\": 99.87, \"dwd\": 99.87, \"noaa\": 98.67}, \"waveHeight\": {\"sg\": 1.83, \"dwd\": 1.28, \"icon\": 1.09, \"noaa\": 1.46, \"meteo\": 1.83}, \"precipitation\": {\"sg\": 0.3, \"dwd\": 0.3, \"noaa\": 1.44}, \"windDirection\": {\"sg\": 177.09, \"icon\": 177.09, \"noaa\": 197.9}, \"airTemperature\": {\"sg\": 20.19, \"dwd\": 20.19, \"noaa\": 20.24}, \"swellDirection\": {\"sg\": 250.25, \"dwd\": 229.99, \"icon\": 236.57, \"noaa\": 236.71, \"meteo\": 250.25}}, {\"time\": \"2020-08-19T21:00:00+00:00\", \"humidity\": {\"sg\": 92.73, \"dwd\": 92.73, \"noaa\": 93.3}, \"windSpeed\": {\"sg\": 5.82, \"icon\": 5.82, \"noaa\": 9.31}, \"cloudCover\": {\"sg\": 100, \"dwd\": 100, \"noaa\": 99}, \"waveHeight\": {\"sg\": 1.88, \"dwd\": 1.29, \"icon\": 1.04, \"noaa\": 1.47, \"meteo\": 1.88}, \"precipitation\": {\"sg\": 0.79, \"dwd\": 0.79, \"noaa\": 2.16}, \"windDirection\": {\"sg\": 171.13, \"icon\": 171.13, \"noaa\": 199.89}, \"airTemperature\": {\"sg\": 20.21, \"dwd\": 20.21, \"noaa\": 20.28}, \"swellDirection\": {\"sg\": 250.54, \"dwd\": 229.42, \"icon\": 236.4, \"noaa\": 234.52, \"meteo\": 250.54}}]}', '2020-08-19 14:22:41', '2020-08-18 20:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
