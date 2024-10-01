-- ========================================================================
--  Copyright Universidade Federal do Espirito Santo (Ufes)
-- 
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
-- 
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
-- 
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <https://www.gnu.org/licenses/>.
--  
--  This program is released under license GNU GPL v3+ license.
-- 
-- ========================================================================

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `db_transactions`;
CREATE DATABASE `db_transactions` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_transactions`;

-- Schedule (MySQL 5.7/8+)
CREATE TABLE `Schedule` (
  `time` int NOT NULL,
  `#t` int NOT NULL,
  `op` varchar(20) NOT NULL,
  `attr` varchar(20) NOT NULL,
  UNIQUE (`time`)
);
