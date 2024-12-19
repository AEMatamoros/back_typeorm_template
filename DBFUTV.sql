-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_futv_local
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `first_login` tinyint NOT NULL,
  `restore_code` varchar(5) NOT NULL,
  `active` tinyint NOT NULL,
  `roleId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_64b763e6fa4098cb63ab6361b14` (`roleId`),
  CONSTRAINT `FK_64b763e6fa4098cb63ab6361b14` FOREIGN KEY (`roleId`) REFERENCES `admin_user_rols` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'admin','7af2d10b73ab7cd8f603937f7697cb5fe432c7ff','alejandro.carcamo@unitec.edu',0,'',1,1);
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_rols`
--

DROP TABLE IF EXISTS `admin_user_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_rols` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_rols`
--

LOCK TABLES `admin_user_rols` WRITE;
/*!40000 ALTER TABLE `admin_user_rols` DISABLE KEYS */;
INSERT INTO `admin_user_rols` VALUES (1,'ADMIN'),(2,'GESTOR'),(3,'SOPORTE');
/*!40000 ALTER TABLE `admin_user_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar_match`
--

DROP TABLE IF EXISTS `calendar_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar_match` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goalsTeamA` tinyint NOT NULL,
  `goalsTeamB` tinyint NOT NULL,
  `matchDate` date NOT NULL,
  `teamAId` int DEFAULT NULL,
  `teamBId` int DEFAULT NULL,
  `roundId` int DEFAULT NULL,
  `seasonId` int DEFAULT NULL,
  `competenceId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4a7d188e32e1846e28adcc7d713` (`teamAId`),
  KEY `FK_197c6e2e57f713ea9592bdf36a4` (`teamBId`),
  KEY `FK_716afa2ed14177d8b7ca763e221` (`roundId`),
  KEY `FK_380f7475c9ff40aa4ca2ffe2496` (`seasonId`),
  KEY `FK_9365c3635e7bcfc8855bd3c8980` (`competenceId`),
  CONSTRAINT `FK_197c6e2e57f713ea9592bdf36a4` FOREIGN KEY (`teamBId`) REFERENCES `team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_380f7475c9ff40aa4ca2ffe2496` FOREIGN KEY (`seasonId`) REFERENCES `season` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_4a7d188e32e1846e28adcc7d713` FOREIGN KEY (`teamAId`) REFERENCES `team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_716afa2ed14177d8b7ca763e221` FOREIGN KEY (`roundId`) REFERENCES `rounds` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_9365c3635e7bcfc8855bd3c8980` FOREIGN KEY (`competenceId`) REFERENCES `competence` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar_match`
--

LOCK TABLES `calendar_match` WRITE;
/*!40000 ALTER TABLE `calendar_match` DISABLE KEYS */;
INSERT INTO `calendar_match` VALUES (1,1,1,'2021-12-28',NULL,NULL,NULL,NULL,NULL),(2,1,1,'2021-12-28',NULL,NULL,NULL,NULL,NULL),(3,1,2,'2021-12-28',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `calendar_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `competence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `img` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence`
--

LOCK TABLES `competence` WRITE;
/*!40000 ALTER TABLE `competence` DISABLE KEYS */;
INSERT INTO `competence` VALUES (2,'Liga Promerica','1643337887023_WhatsAppImage2022-01-20at11.16.57AM.jpeg'),(3,'Liga de Ascenso Motorola','1644340692142_WhatsAppImage2022-01-20at10.13.13AM.jpeg');
/*!40000 ALTER TABLE `competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_zona_fan`
--

DROP TABLE IF EXISTS `home_zona_fan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_zona_fan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(250) NOT NULL,
  `image` text,
  `state` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_zona_fan`
--

LOCK TABLES `home_zona_fan` WRITE;
/*!40000 ALTER TABLE `home_zona_fan` DISABLE KEYS */;
INSERT INTO `home_zona_fan` VALUES (1,'Promocion','1644339499302_WhatsAppImage2022-02-08at10.55.00AM.jpeg',1);
/*!40000 ALTER TABLE `home_zona_fan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_home`
--

DROP TABLE IF EXISTS `news_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_home` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(75) NOT NULL,
  `subtitle` varchar(50) NOT NULL,
  `image` text,
  `content` longtext NOT NULL,
  `description` varchar(75) NOT NULL,
  `date` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_home`
--

LOCK TABLES `news_home` WRITE;
/*!40000 ALTER TABLE `news_home` DISABLE KEYS */;
INSERT INTO `news_home` VALUES (3,'Costa Rica sigue reinando como la mejor liga de Centro América, según IFFHS','Costa Rica en el top de Centro America','1644340613639_dt.common.streams.StreamServer-4.jpeg','<p><span style=\"color: rgb(49, 49, 49);\">Según la Federación Internacional de Historia y Estadística de Fútbol,&nbsp;</span><strong style=\"color: rgb(0, 0, 0);\">Costa Rica sigue siendo la mejor liga de toda Centro América.</strong>La liga tica se ubica primero, dejando en el segundo lugar a Guatemala y&nbsp;<strong style=\"color: rgb(0, 0, 0);\">Honduras estando siempre como la mejor tercera.</strong></p><p>Luego, en cuarto lugar aparece la de Nicaragua, Panamá en quinto y El Salvador en sexto lugar.</p><p><strong style=\"color: rgb(0, 0, 0);\">La IFFHS coloca a la liga catracha en el puesto 72, eso sí,</strong>&nbsp;e<strong style=\"color: rgb(0, 0, 0);\">l campeonato hondureño experimentó un ascenso de 10 casillas</strong>&nbsp;con respecto al ranking del año pasado, donde figuraba en el 82.</p><p class=\"ql-align-center\"><img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4gIoSUNDX1BST0ZJTEUAAQEAAAIYAAAAAAQwAABtbnRyUkdCIFhZWiAAAAAAAAAAAAAAAABhY3NwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAA9tYAAQAAAADTLQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlkZXNjAAAA8AAAAHRyWFlaAAABZAAAABRnWFlaAAABeAAAABRiWFlaAAABjAAAABRyVFJDAAABoAAAAChnVFJDAAABoAAAAChiVFJDAAABoAAAACh3dHB0AAAByAAAABRjcHJ0AAAB3AAAADxtbHVjAAAAAAAAAAEAAAAMZW5VUwAAAFgAAAAcAHMAUgBHAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFhZWiAAAAAAAABvogAAOPUAAAOQWFlaIAAAAAAAAGKZAAC3hQAAGNpYWVogAAAAAAAAJKAAAA+EAAC2z3BhcmEAAAAAAAQAAAACZmYAAPKnAAANWQAAE9AAAApbAAAAAAAAAABYWVogAAAAAAAA9tYAAQAAAADTLW1sdWMAAAAAAAAAAQAAAAxlblVTAAAAIAAAABwARwBvAG8AZwBsAGUAIABJAG4AYwAuACAAMgAwADEANv/bAEMAEAsMDgwKEA4NDhIREBMYKBoYFhYYMSMlHSg6Mz08OTM4N0BIXE5ARFdFNzhQbVFXX2JnaGc+TXF5cGR4XGVnY//bAEMBERISGBUYLxoaL2NCOEJjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY//AABEIAZABkAMBIgACEQEDEQH/xAAbAAEBAAIDAQAAAAAAAAAAAAAABgQFAgMHAf/EAEAQAAIBAgIGBwYEBQMEAwAAAAABAgMEBRESFiExUtEGQVFTYZKTEyIycYGRFCOhwUJicrHhByTwFTNDokVV8f/EABoBAQADAQEBAAAAAAAAAAAAAAABAgMEBQb/xAAtEQEAAgEEAQQCAAYCAwAAAAAAAQIDERITUQQVITFhBUEiMkJxgZGhsRQjM//aAAwDAQACEQMRAD8AkwAeu4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHpepeDd1V9VjUvBu6q+qyhB5fJft17a9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9J7UvBu6q+qxqXg3dVfVZQgcl+zbXpPal4N3VX1WNS8G7qr6rKEDkv2ba9AAKLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfAPoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHGUowi5SaUUs23uSORj386dOwuJ1k3SVOTml1rLaB59jv+oN1Urzo4TGNKinkqso5yl4rqSJyv0jxqvLOeKXS/oqOC/TI1kstJ6KyWexHwDtndXFR5zr1ZP8Amm2delLS0s3n25nwAbnC+lGLYXOPsrupUpR/8VVuUcuzbu+h6j0ex62x6x9vQ9yrDJVaTebg+XYzxU3fRHFXhWPW9Ryao1ZKnV27Mn1/TeB7KAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAATHT/E62HYDoUNk7mfsnLhWTb++WX1KOvWp29CpXqyUadOLlKT6ktrPHulHSGvj185NuNrTbVGn2LtfiwNIAAAAAAH2MZTmoxTcpPJJdbA92w6rKthtrVm85TpQk32tpGSdFjSlQsLejJZSp0oxa8UsjvAAAAAAAAAAAAAAAAAAACf1ww7gr+Vcxrhh3BX8q5kKDDkl73p+H7XWuGHcFfyrmNcMO4K/lXMhQOST0/D9rrXDDuCv5VzGuGHcFfyrmQoHJJ6fh+11rhh3BX8q5jXDDuCv5VzIy2srq7llb29Sp4xjmvubKn0XxWazdGMP6pomLWlnbxPGp/NOn+VDrhh3BX8q5jXDDuCv5VzJ+fRXFIrNUoS+U0YF1hl9Z7bi1qQXFlmvuhutCK+L4tvas/wDKv1ww7gr+Vcxrhh3BX8q5kKCOSWvp+H7XWuGHcFfyrmNcMO4K/lXMhQOST0/D9rrXDDuCv5VzGuGHcFfyrmQoHJJ6fh+11rhh3BX8q5jXDDuCv5VzIU6rlVXbz9hLKaWa2b/AmLzKl/Bw1rNtJ9l/rhh3BX8q5jXDDuCv5VzPMrTE3noXL2dU8v7myTUlnFpp9aeaJm1oZ4fH8bNGtdV3rhh3BX8q5jXDDuCv5VzIUFeSW/p+H7XWuGHcFfyrmNcMO4K/lXMhQOST0/D9rrXDDuCv5VzGuGHcFfyrmQoHJJ6fh+1tcdKcKubepQrUq8qVWLhOOitqayfWefY9YWEK1N4PC5lCWelGptyfVlkZZj31xK2t9OCTk5KO3q2PkTF5mWWbwsNKTb3aKUXGTjJNNPJp9R8OVSpKrNzm9KT3s4mzxp+gAACk6HxsbW8WIYjGc/ZvOjCMc/eX8T+XV/gmygtIKFrSS4U/vtK3tpDr8TBGa8xb4ega4YdwV/KuY1ww7gr+VcyFBlyS9P0/D9rrXDDuCv5VzGuGHcFfyrmQoHJJ6fh+11rhh3BX8q5jXDDuCv5VzIUDkk9Pw/a61ww7gr+Vcxrhh3BX8q5kKBySen4ftda4YdwV/KuY1ww7gr+VcyFA5JPT8P2utcMO4K/lXMa4YdwV/KuZCgcknp+H7XWuGHcFfyrmNcMO4K/lXMhQOST0/D9rrXDDuCv5VzGuGHcFfyrmQoHJJ6fh+wAFHcAGXhmHVsSu40KK8ZS6ortCtrRWNZ+HCysri/uFRtqbnJ7+xeLLLC+itrapVLvK4q9j+FfTrNrhuHUMNtlRoR/qk98n2syzatIj5eJ5Hm2yTpT2hxhCNOKjCKjFbklkjkT+KY5c0q/4ext9KbeScuvtMD2+M3MpKVxo9i04wa+zRttedN1efGs1kyTnUxajUc6Vy9B7lKsp9va2ZNpjd9Srxo3lKM082pLKOa8Bt6Rvj9szEujljfxbjBUKvVOCy+6IzFMIusLq6NeOcH8NSO5npMJKcIyW5rNHC4t6V1QlRrwU6clk0zK1Il6GDzL4p0n3h5UDa49gtTCrjOOc7efwT7PB+JqjGY0e5S9b1i1fgABC4aO7vateTjthBbNFfubwxrmyo3DcnnGeXxL+77S9JiJ93H5mLJlrpSWiOVOpOk86c5RfgzYvCOyv/wCn+TjUwmol+XUjJ9jWRruq8n/xM9ffa6qeJXMN8o1F2SXLaZEMWjl+ZSef8rNdUpVKTyqQlF+KOAmsSrXyc2P2izbxxWi370JpeCzO+F9bVMkqqTfVJZfruNCCOOG1fyGaPn3UwJyFWpT+CpOP9LyO9YjdKOXtVlu+BcivG6q/kq/1VbwwsUo1KtGMobVBttfuYccUuVFp6Em+tx3fYxqterWlnUm5f2+wrSYnVTyPNx5Mc0iJ93WADV5QAABv7WtTnb0kpxzUEms/A0AK2rudHj+ROCZmI1U2ee55gm4VJ05Z05yi+1PI2FvijTUbhZriitv2M5xz+npYvyFLTpeNG0BxpzhUgpQkpRfWjkZvRiYmNYAAEgAAAAAAAAAAAAAAAOUISqTjCCblJ5JLrZ6NgWFxwuxjTyTrT96pLtfZ9CZ6HYeri+ldVFnCh8P9TLg1x1/bx/yGfWeOP8se6vbezSdeoouW5dbNTf4zPSjGmnTg+tNab+nUjb3NrG6UI1JTUIvNxi8tL5muxC/p4Wnb0LaLlKGk3J5Ry7X2mu6tY1l5U1tadIYVGwr1aftqNOejV9/38nnn25vM1tSlONV27rVIwecZNRTS+jZwuOkF3Wm6dCrUqSy2eyhoxX99h1xV/ToVLq4jTjGElt0k9KW/J5dqexmd895j+CEVx49dJlk1043TVKtWcZ+9tik038nt3GfDDLiVuloOVNxXwpLNdu803tLi9jKpbwi83o+zlkmlt2v/AJkvqcqON31m4xuJVqWe6TjnDL/niRTPkiNbwXx4tfaW6ssWqU6ip5SnBR+Go8mvkzcW+I21zV9lCeVXglsZq8NxhXbjbV6NOpGo8lOmslLc9sfr2m2oWVO3rOpSlOKaycM80/E1i9bxrBttWdJfb6zpX9pO3rrOE1vW9PtR5pfWlSxu6lvVXvQeWfau09TJfpph6nb076EffpvQm11p7v1/uZ3jWNXpeBn2X2T8T/2jQAYvcAAAAAHycY1I6M4qUX1NZmHWwyjNP2bdOW/tRmgmLTHwxyYMeX+aGjqYdc090NNdsXmYzTi8pJprqZSnGdOnUX5kIy6tqNIyduDJ+Nj+if8AabBuKuF0ZtOnKVPt2aSMC8t6dtNQhWdSX8S0csv1LxaJ+HBl8bJi97R7MYAFnOAAAAAAAABLN5IGbhdH2lzptbILP69REzpGq+Ok5LxWP2ysPsp0fzJzlGT/AIE+rxM5tRTcmklvbZ9NHfXMq9ZpS/Li/dXb4mMRN5e3e9PDxxFY+W3VzQc9FVYZ/M7SZOyFetCKjCrNRW5J7C3G5afkp/qqogaBXlwv/LI7IYlcwazkprskt5HHLaPyWP8AcS3YNdSxWDyVWm4vrcXmvsZUL22m8lWin/Ns/uVmsw6qeVhv8Wd4OMZwnnoTjLLhaZyKt4tE/AAAkAAAA5Uo6dWEOKSQQ9C6M2n4TBaKa9+p+ZL67v0yNscKUFTpQgt0YpGPilw7exqTgnpv3Y5b82dPtWHy97Te827ajE76vO5nTp13GnFPJUnln4N5b/kaG8s7ivdypXM6iikn7PS96S37W9zNjUvq9LC506NCFNVIvKbi/e+WeW1Hdh1SN5Zwq3NSUpaGUc0up5fX65mWOIyW9/lXL/DX6dFvbypSqQpZU7eWS0Fk08stue97VnnnyMp0KsYaMZyTm9Lak9J+PaZFOcZ01RnKFOOeemz5Wm/aJKr7SMPhkdsUiPZyTefljqzqLK3lpPLNKCXU9+/PM6qlunGaajJzfvOUdLw3dfX9zLjVqKopqb092kzunnbaScqdR1Fta25EzSPgi8/OqbWHShdynZSdKLqbKU5vJ7ckk/8AnzNvb3d1a1op1qi2tOFVtpfPZmvoc60KUKHtotxrR25qKyWXzMPC8RuKlpUpSpK4VScpZZNyy63mcWWkUmJ1dWGd0TpCvjJTipRacWs011nVe28buzrW81sqQcTX9Hbp17N05L3qeTT6mnu/VM25es7q6re9bPJ5wdOpKEt8W0zibDH6PsMbu4Ldp6S+u39zXnPL6ilt1Yt2AALAAAAAAAY95dxtYLYpTluX7kxGqmTJXHXdb4cb67VtTyjtqyWxdniaSTcpOTebbzbPtSpOrUc6knKT3tnE3rXSHz3kZ7Zraz8AALOcAAAAAAAAM/CJNXEo9Tjn+pgHOlVnRmp05ZSRFo1jRrhvx5ItP6Ua3ompxcJyjJZOLyaMuOJXK3yjL5xO+VhUuoe2m1Tqy2uLWwzrG35dvkXjy9OOJ1hrAZcsNuYtpQUl2qS2nH/p913X/sjTWHFOHJH9M/6YwMh2Nzn/ANmT+W04St60d9Ka+g1hWcdo+YdQOz2FXup/Y+q1ry3Up/YnVG23TqOyNerBrRqTWXidn4G57mX1OqrRqUXlUg4vqz6yPZO29ffTR2fjbnLL28/uco39zB5qq380n/cxgNIIyXj4mWfDFaqSU4Ql47mzKt8QVapCDpSi5PLNbUjlhr07KOkl7rcf+fcykktySMrTGumj2MGPNasW5Pafp9MrC46WKWkX11oL9UYpk4ZLQxO0k9yrQf6opDuv/LL1Ewa99ZScqNVqpHPKS0dJHdfVHSsqs4vJqOx+JF1Z1ZyypxeSSyejnte5eGwtmyzTSIfNUpub3Hr6zWFunTcXlk0kslHIw8FotYZSUtm9/ds0V3LRjp1JOa2ySlHLNJ7H9XsNdRnc1Ho06tX6SeSJx4cnkUtattv2pmtXHpWY1VWLzUIKkntlta8Dqwa6d1ZuLX5lJuEk32bv0NPUrwtaaVScpvdm3m8zXUa9SNWcqVRxqJ6WcHvX+DXFaazETOv24pmJnX9LK6qujRlm0p5bMnnvMTB6+kq1Bt6VOWaz7H/nM1VFz0PbXFZzeW9yzSRgXN9CVdOnpRW5zi8s0aTk0yRrPsidP0qqt9OtUnZaf5bhLRX83X+529E7uhb0asKzUJ55Zvw6iavKn+zjOjU25rJp7WcrKUppRhL8xbM0tLSaWz9OvwOfLf2i3Tp8b3mayvoX2H0ZSVLKKk85SjBpNmfGSlFSi009qa6yDp1KntIvSlKMpJaWhotJ7pb+3qKvAqrq4flLfCTj+/7lMWabzpLpvTbGqS6XxUcdqNfxQi/0NIbrpdJSx2ol/DCK/Q0pFvmX0Hj/APyr/YABDcAAAAAcZzjTg5TaSXaT1arKtVlUm822ZGIXX4irow/7cN3j4mIb0ro8DzPI5bbY+IAAXcQAAAAAAAAAdlChUuJ6NOOfa+pBMRMzpDrMi3s61xthHKPFLYjYW2G06aUq2VSXZ1LmZxnOTp6WH8fa3vk9mLa2FK3ak/fmv4n1fJGUAZTMz8vVx464421gABDQAAAAAD5KKkspJSXY1mj6AiYifaWuvbBzcfw9OCWW1bnmdFHC60pL2uUI9e3Nm4BeLzo4reDitbd/w406caVONOCyjHcjkAUdsRFY0gOVOWhVjPhaZxAHp13/ALnC5yjt0qamsvuRcvdraOim1obdBy3Zx5FT0Xu1d4NSTec6X5cvpu/TI0vSDDvwldVVFujJvLJZ5J719OoZ67oi0PnYjjvNJaO5ilCKnHZopZZaO5nUqjisoNRj2I7rmDqRa91N9cUks/8A9S+5rHmnk9jOjxMM5qTEW00/Tz/NrbfExPsyI04Rk5JLN72d1phjvK2VKk5drTSy+5hRWlOMc8s3lm9yLmzo21OhC2tPwFenTyX50ts3km2nt7ezqNcnicfzbVy48MzOsyntX7xW1KvCM3Gslsg1J5Ndm/ca12tKnUknHank1IuIqjTpUnKFhR0kkpRrNZ7NzySIvEYJXleaq03nVl7qbb3/ANiKeNyTpro0yYtI9pY7tspZ06jgs88vEysOpOnUe1SWmn8OfU+owjOtKbjFZp5y25ZZ7936f3K+V43Dj1m2rTxK25NdfhnUdkqWkktsNrg1u957SwwCm4YfpS2e0m5ZfRL9iXwu0nf3kYwjFJfFKKWS7Xs+yLC6q08Ow2pU3Qo03l4vqOTBT33S9HJOulYef47W9vjV3UT2e0aX02fsYB9lJzm5Sebk82fCZfRUrtrFegABYAAAwMTuvZw9jB+9Je94Iybq4jbUnN5Nv4V2mhnOVSbnJ5ybzbNKV/bzfO8jbHHX5lxABs8UAAAAAAAAAMmxtnc1kn8EdsmJ9lq1m9orHyyLGwVSKq1lnFr3UmbOEIU46MIqK8EckkkkkklsSXUDnm0y+iwePTFWIiPcABV0AAAAAAAAAAAAAAAAAAAAADf9EMRVriDtqjyp19i8JdRb1qNOvSlTqxUoS3pnlUZOMlKLyknmmuo9E6P4rHFLFOTXt6eSqL9/qa0n9S8j8hgmJ5Y/y0OL9Hq1rpVLVOrb73FfFH/BOVqam2/hqLen18meqmlxjAaN2nWoQjGstri1skTEWxW34/l5szF423edtZPJ7z7GTg01vW7wN/8A9LtrmL2SpVY7Gt+T+TNbPDKntZU6X5ji8m4vNL5nXT8jhyRtyxownxb0nWksLS2ZaKy7Mjj+hmLD6qjGVRaMJfx5rRX1NpTwi2oUvaV5uo96UdiF/O8fDP8A641kr4+S/wDNOjTUqaXvVN/VHmb3CsGusQkp5OlRbzlUktr+RtsFwCnJRurmkoxe2FNdniUsYqMVGKSSWSS6jkvN89t+T/TeNuONtGPY2VCwoKlQjkut9bJ7ppiCVKnYU5e9J6dRLqXUigxG+pYdZzuKz2RWxdcn2Hmt3c1Ly6qXFZ5zm834C86RpDu8DDN78k/Ef9ukANqMXKTSit7bySMXtTMR7yAxamIW1PP39N9kVmY1XFntVGll4zf7FopMua/l4afvX+zZtqMXKTSit7fUam9vZV9KFDNUl8Uut/4MSvcVbh51Jt9i6kdRrWmjzPI82cv8NfaHKVSc4xjKTajuT6jifdKXE/ufdre9Mu4Z93E+rxWY0X2M+BDlNRzzg3l2PqOIATPuAAIAAASzeSN/aUFb28YfxPbJ+Jr8JoadV1pL3YfD/UbcyyT+nr/j8Gkck/4AAZPVAAAAAAAAAAAAAAAAAAAAAAAADJw++rYfdwuKD96O9PdJdjMYBExFo0l6ZhWKW+KW6qUXlJfHBvbFmceV2t1Xs68a1vUdOcetFfhfS2hXyp3y9jPjW2L5G1bxPy8TyPBtSd2P3hnYphH4mr+ItmoVv4luUv8AJqVgt/SgvypNRz+GcdL6FTSrU60FOlUjOL64vM7CtsNLTrLii9q+yQo4Rf1KSaozhlxSSyfgjYYdgUozhO9ycYfDTzzzfj1G/OMpRhFynJRS628hXBSs6pnJafZ9Om7u6Nlbyr3E1CEf18EanE+lFlZpwoP8RW7I/CvmyJxjG6l3V9te1dn8NOO5fJfuXm36h0YvFtb+LJ/DVl43i9XFrnSecKMfgh2eL8TT17qjQXvzWlwrazV3WI1a3uw/Lh2J7X82Yb2vaVimvvLov51aRswx7NhWxWck1RgoLie1mFUqzqy0qk3J+LOANIiI+Hn5Mt8k/wAU6gAJZgB9zSW7b2gEm9yzGTW/YfcpPcmfVBaOcppeC2sjVba4AAlUPuzLxPgAAAAcqVOVWpGnBZyk8kfIxcmlFNt7kjc4fZ/h4OdRL2klu4UVtOkN/HwTmvtj4ZNGlGjSjThuivu+05gHO+jrWKxEQAALAAAAAAAAAAAAAAAAAAAAAAC/1UwruqnqMaqYV3VT1GX45ef6ji+0AC/1UwruqnqMaqYV3VT1GOOT1HF9oAF/qphXdVPUY1UwruqnqMccnqOL7QlG4rW8tKjVnTl2wk0bGn0jxamsldykv5op/sVWqmFd1U9RjVTCu6qeoydloUt5vj2/mrr/AIhLT6S4tJZfitH5QjyMC4vbq6ede4q1f6pNlnc9HMEtLepcXClTpU1pSlKo8kjznpBiVpWupUsJhOlaxWi5yk3Kp4+C8BstPyiPM8envSvv/aHC8xKNP3LdqUuuXUuZqpzlUk5Tk5Se9t5nEGsREfDzc2e+WdbSAAliAAAAAB9zPgAZt72AAAAA+ra0JJxk096eTEfiWe7M+1G3Uk2023m2gn20cqNGdeooU1m3+huY4fbRgoumpNb5NvN/qfejV/ZQuqVniNupUak1H2sJ6Dg31vqaPRl0VwmSTjTm09qaqMpaLT8O3x7+PjjW8az/AGefU6VOksqcIx2ZZpbfucy/1UwruqnqMaqYV3VT1GU2WdsefgrGkRP+kAC/1UwruqnqMaqYV3VT1GRxyn1DF9oAF/qphXdVPUY1UwruqnqMccnqOL7QAL/VTCu6qeoxqphXdVPUY45PUcX2gAX+qmFd1U9RjVTCu6qeoxxyeo4vtAAv9VMK7qp6jGqmFd1U9Rjjk9RxfaABf6qYV3VT1GNVMK7qp6jHHJ6hi+0AC/1UwruqnqMaqYV3VT1GOOT1DF9oAF/qphXdVPUY1UwruqnqMccnqOL7QAL/AFUwruqnqMaqYV3VT1GOOT1HF9oAF/qphXdVPUY1UwruqnqMccnqOL7bsAG7wwAAAAAOq5uKNpbzr3FSNOlTWlKUnsSO085/1JxipO5p4VSnlSglOql/FJ7k/lv+oGm6VdKK+O3Hs6elSsoP3KfXJ8UvH+xPAAAAASbeSWbZzqRUPclGUakW1LN/scA3nvA+5+7lkt+eZ8AAAAAAAAzNtgOHWOKX1K0uLqpbTnsUmk4t9n9jh0gwWtgeJTtarc4ZaVOplkpoDWAAD7ovR0snluzyPh2U69Wll7OpKKTzyT2Z/I7ZVraclOdvLSa95Qmoxz7Usnl8gMY9B/096RUo0lg93UcZ6TdCUnsf8vh1tERGFG5jJU4eyqqLklpZxlltaWe55eLzFlYX15UX4K2rVZJ7HTi3l9QPdT6Q+F49jeEToQ6Rwpq0l7jquUXUh2OSi930LanOFWnGpTkpQks4yTzTQHIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADy//UXCriji7xFQlK3rxScktkZJZZM9QOFWlTr0pUq0I1KcllKMlmmvFAeBA9drdBsBqz0lazp7N0KjSOtdAsBTT9jWfzqsDybJvctwPabPoxg1k5ujY03px0JafvZr6mRb4Lhdq4uhh9rCUcspKlHPZ45ZgeOWWDYlf5O1sq1SL3SUcl9zhTwu+q3c7WlaVZ14S0ZQjFvJ+J7ofQPHcV6J3+EYRC/u3BaU1GVOO1wTWxt7t+z7GhPeby1o31pVtbiCnSqx0ZI8sxvoTieHVpytaUry2zzjKms5Jdjjvz+QEyDZx6O4zJJrC7vJ9tJo+ro3jT/+LuvTYGrBu9UMf/8AranmjzOyn0Lx6om/wLhlxTiv3A0KbTTTaa3NHoNhXp9L+i9W3rx9pidlByp575PLY/HPczRR6B49JZ+wpLwdVFJ0P6K4nguJ/irmpRVOdNxnCMm34dWQEz0W6PTxO4uJXa9nb0oNVNJZNNp5Pb2NE9NKM5RTzSbSfae149ht1ilk7W2vvwkZ5qo/Z6blF9W9ZEtS/wBM6KkvbYnUmutQoqP7sJedg9Rpf6dYRDPTrXVT5zS/sjYW/QzAreEo/glU0uupJthDyS0m6d3Rmkm4zTye7ebvBsRtLS2ubXEL2+hbwqZwoWr0faPc839F1noUeh+AxmpKwjmnmvelzPsuiGAzk5PD4Zt5v3pcwIKPSjD7R/7DALZfz3EnVm/q9xZdAcQlfYFJSgoexqyhFLPLR2NZffL6GbS6JYFSmpxw6k2t2lnJfZvI29KlTo0406UI04R2KMVkl9AOYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACZ15wrguPIuY15wrguPIuZpxX6V317UwJnXnCuC48i5jXnCuC48i5jiv0b69qYEzrzhXBceRcxrzhXBceRcxxX6N9e1MCZ15wrguPIuY15wrguPIuY4r9G+vamBM684VwXHkXMa84VwXHkXMcV+jfXtTAmdecK4LjyLmNecK4LjyLmOK/Rvr2pgTOvOFcFx5FzGvOFcFx5FzHFfo317UwJnXnCuC48i5jXnCuC48i5jiv0b69qYEzrzhXBceRcxrzhXBceRcxxX6N9e1MCZ15wrguPIuY15wrguPIuY4r9G+vamBM684VwXHkXMa84VwXHkXMcV+jfXtTAmdecK4LjyLmNecK4LjyLmOK/Rvr2pgTOvOFcFx5FzGvOFcFx5FzHFfo317UwJnXnCuC48i5jXnCuC48i5jiv0b69qYEzrzhXBceRcxrzhXBceRcxxX6N9e1MCZ15wrguPIuY15wrguPIuY4r9G+vamBM684VwXHkXMa84VwXHkXMcV+jfXtTAmdecK4LjyLmNecK4LjyLmOK/Rvr2pgTOvOFcFx5FzGvOFcFx5FzHFfo317UwJnXnCuC48i5jXnCuC48i5jiv0b69qYEzrzhXBceRcxrzhXBceRcxxX6N9e1MCZ15wrguPIuY15wrguPIuY4r9G+vamBM684VwXHkXMa84VwXHkXMcV+jfXtTAmdecK4LjyLmNecK4LjyLmOK/Rvr2pgTOvOFcFx5FzGvOFcFx5FzHFfo317ecgA9NyAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/9k=\"></p><p><strong style=\"color: rgb(0, 0, 0);\">EN CONCACAF LA LIGA TICA ES LA SEGUNDA</strong></p><p>Costa Rica no solo a nivel de Centro América está bien posicionada, también a nivel del área de Concacaf.</p><p>La liga costarricense es la segunda mejor, dejando atrás a la MLS, que se ubica como la tercera mejor liga de nuestra confederación.</p><p>La que está en el podio como la mejor liga de Concacaf es la MX de México.</p>','La Liga Nacional de Honduras es la tercera en Centro América, mientras que ','2022-02-10');
/*!40000 ALTER TABLE `news_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `profile_img` text,
  `half_body_img` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (32,'Alexis Matamoros','player123.png','1643382189277_Udyr.jpg'),(33,'Alexis Matamoros','player123.png','1643382199874_Udyr.jpg'),(34,'Alexis Matamoros','player123.png','1643382301668_image.png'),(35,'Alexis Matamoros','player123.png','1643382502410_image.png'),(36,'Alexis Matamoros','player123.png','1643382523382_image.png'),(37,'Alexis Matamoros','player123.png','1643382733362_image.png'),(38,'Alexis Matamoros','player123.png','1643382759151_image.png'),(39,'Alexis Matamoros','player123.png','1643382907052_image.png'),(40,'Alexis Matamoros','1643382991514_Keylor_Navas.jpg','1643382991519_Udyr.jpg'),(41,'Jugador 1','player123.png',''),(42,'Jugador 2','player123.png',''),(43,'Jugador 3','player123.png',''),(44,'Jugador 4','player123.png',''),(45,'Jugador 5','player123.png',''),(46,'Jugador 1','player123.png',''),(47,'Jugador 2','player123.png',''),(48,'Jugador 3','player123.png',''),(49,'Jugador 4','player123.png',''),(50,'Jugador 5','player123.png',''),(51,'Jugador 1','player123.png',''),(52,'Jugador 2','player123.png',''),(53,'Jugador 3','player123.png',''),(54,'Jugador 5','player123.png',''),(55,'Jugador 4','player123.png',''),(56,'Jugador 3','1644012566614_Jugador3.png',''),(57,'Jugador 1','1644012566610_Jugador1.jpg',''),(58,'Jugador 2','1644012566614_Jugador2.jpg',''),(59,'Jugador 5','1644012566646_Jugador5.png',''),(60,'Jugador 4','1644012566634_Jugador4.png',''),(61,'Jugador 1','1644012566610_Jugador1.jpg',''),(62,'Jugador 2','1644012566614_Jugador2.jpg',''),(63,'Jugador 3','1644012566614_Jugador3.png',''),(64,'Jugador 4','1644012566634_Jugador4.png',''),(65,'Jugador 5','1644012566646_Jugador5.png',''),(66,'Jugador 5','1644012566646_Jugador5.png',''),(67,'Jugador 1','1644012566610_Jugador1.jpg',''),(68,'Jugador 2','1644012566614_Jugador2.jpg',''),(69,'Jugador 3','1644012566614_Jugador3.png',''),(70,'Jugador 4','1644012566634_Jugador4.png',''),(71,'Jugador 3','1644199028312_Jugador3.png','1644199028318_Jugador3.png'),(72,'Jugador 2','1644199028312_Jugador2.jpg','1644199028317_Jugador2.jpg'),(73,'Jugador 1','1644199028308_Jugador1.jpg','1644199028314_Jugador1.jpg'),(74,'Jugador 4','1644199028313_Jugador4.png','1644199028319_Jugador4.png'),(75,'Jugador 5','1644199028313_Jugador5.png','1644199028320_Jugador5.png'),(76,'Jugador 1','1644199028308_Jugador1.jpg','1644199028314_Jugador1.jpg'),(77,'Jugador 2','1644199028312_Jugador2.jpg','1644199028317_Jugador2.jpg'),(78,'Jugador 3','1644199028312_Jugador3.png','1644199028318_Jugador3.png'),(79,'Jugador 4','1644199028313_Jugador4.png','1644199028319_Jugador4.png'),(80,'Jugador 5','1644199028313_Jugador5.png','1644199028320_Jugador5.png'),(81,'Jugador 2','1644199028312_Jugador2.jpg','1644199028317_Jugador2.jpg'),(82,'Jugador 3','1644199028312_Jugador3.png','1644199028318_Jugador3.png'),(83,'Jugador 1','1644199028308_Jugador1.jpg','1644199028314_Jugador1.jpg'),(84,'Jugador 4','1644199028313_Jugador4.png','1644199028319_Jugador4.png'),(85,'Jugador 5','1644199028313_Jugador5.png','1644199028320_Jugador5.png'),(86,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(87,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(88,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(89,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(90,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(91,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(92,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(93,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(94,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(95,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(96,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(97,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(98,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(99,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(100,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(101,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(102,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(103,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(104,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(105,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(106,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(107,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(108,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(109,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(110,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(111,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(112,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(113,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(114,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(115,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(116,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(117,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(118,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(119,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(120,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(121,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png'),(122,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(123,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(124,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(125,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(126,'Jugador 2','1644341451656_Jugador2.jpg','1644341451660_Jugador2.png'),(127,'Jugador 3','1644341451657_Jugador3.png','1644341451661_Jugador3.png'),(128,'Jugador 4','1644341451658_Jugador4.png','1644341451662_Jugador4.png'),(129,'Jugador 5','1644341451658_Jugador5.png','1644341451663_Jugador5.png'),(130,'Jugador 1','1644341451652_Jugador1.jpg','1644341451659_Jugador1.png');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_stadistics`
--

DROP TABLE IF EXISTS `player_stadistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_stadistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `goals` int NOT NULL DEFAULT '0',
  `yellowCards` int NOT NULL DEFAULT '0',
  `redCards` int NOT NULL DEFAULT '0',
  `assists` int NOT NULL DEFAULT '0',
  `playedGames` int NOT NULL DEFAULT '0',
  `playerNumber` int NOT NULL DEFAULT '0',
  `totalShots` int NOT NULL DEFAULT '0',
  `dorShoots` int NOT NULL DEFAULT '0',
  `outOfAreaShots` int NOT NULL DEFAULT '0',
  `invictDors` int NOT NULL DEFAULT '0',
  `madeFaults` int NOT NULL DEFAULT '0',
  `receivedFaults` int NOT NULL DEFAULT '0',
  `playedMins` int NOT NULL DEFAULT '0',
  `playerId` int DEFAULT NULL,
  `seasonId` int DEFAULT NULL,
  `teamId` int DEFAULT NULL,
  `competenceId` int DEFAULT NULL,
  `roundId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a2fa4b69464ba55533d23db15f8` (`playerId`),
  KEY `FK_198d9818acb68cf63896deb3fff` (`seasonId`),
  KEY `FK_770c77d3605b8ee645444a92fcb` (`teamId`),
  KEY `FK_36f092be145859bac1c237a7044` (`competenceId`),
  KEY `FK_8b1bc16f393a2bb782cfda7171c` (`roundId`),
  CONSTRAINT `FK_198d9818acb68cf63896deb3fff` FOREIGN KEY (`seasonId`) REFERENCES `season` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_36f092be145859bac1c237a7044` FOREIGN KEY (`competenceId`) REFERENCES `competence` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_770c77d3605b8ee645444a92fcb` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8b1bc16f393a2bb782cfda7171c` FOREIGN KEY (`roundId`) REFERENCES `rounds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_a2fa4b69464ba55533d23db15f8` FOREIGN KEY (`playerId`) REFERENCES `player` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_stadistics`
--

LOCK TABLES `player_stadistics` WRITE;
/*!40000 ALTER TABLE `player_stadistics` DISABLE KEYS */;
INSERT INTO `player_stadistics` VALUES (150,0,0,0,0,0,0,0,0,0,0,0,0,0,88,5,19,2,10),(151,0,0,0,0,0,0,0,0,0,0,0,0,0,86,5,19,2,10),(152,0,0,0,0,0,0,0,0,0,0,0,0,0,90,5,19,2,10),(153,0,0,0,0,0,0,0,0,0,0,0,0,0,91,5,19,2,10),(154,0,0,0,0,0,0,0,0,0,0,0,0,0,95,5,19,2,10),(155,0,0,0,0,0,0,0,0,0,0,0,0,0,89,5,19,2,10),(156,0,0,0,0,0,0,0,0,0,0,0,0,0,93,5,19,2,10),(157,0,0,0,0,0,0,0,0,0,0,0,0,0,94,5,19,2,10),(158,0,0,0,0,0,0,0,0,0,0,0,0,0,92,5,19,2,10),(159,0,0,0,0,0,0,0,0,0,0,0,0,0,87,5,19,2,10),(160,0,0,0,0,0,0,0,0,0,0,0,0,0,96,5,19,2,10),(161,0,0,0,0,0,0,0,0,0,0,0,0,0,97,5,19,2,10),(162,0,0,0,0,0,0,0,0,0,0,0,0,0,99,5,19,2,10),(163,0,0,0,0,0,0,0,0,0,0,0,0,0,98,5,19,2,10),(164,0,0,0,0,0,0,0,0,0,0,0,0,0,100,5,19,2,10),(165,0,0,0,0,0,0,0,0,0,0,0,0,0,104,5,20,2,10),(166,0,0,0,0,0,0,0,0,0,0,0,0,0,105,5,20,2,10),(167,0,0,0,0,0,0,0,0,0,0,0,0,0,108,5,20,2,10),(168,0,0,0,0,0,0,0,0,0,0,0,0,0,110,5,20,2,10),(169,0,0,0,0,0,0,0,0,0,0,0,0,0,106,5,20,2,10),(170,0,0,0,0,0,0,0,0,0,0,0,0,0,103,5,20,2,10),(171,0,0,0,0,0,0,0,0,0,0,0,0,0,109,5,20,2,10),(172,0,0,0,0,0,0,0,0,0,0,0,0,0,107,5,20,2,10),(173,0,0,0,0,0,0,0,0,0,0,0,0,0,102,5,20,2,10),(174,0,0,0,0,0,0,0,0,0,0,0,0,0,101,5,20,2,10),(175,0,0,0,0,0,0,0,0,0,0,0,0,0,111,5,20,2,10),(176,0,0,0,0,0,0,0,0,0,0,0,0,0,113,5,20,2,10),(177,0,0,0,0,0,0,0,0,0,0,0,0,0,112,5,20,2,10),(178,0,0,0,0,0,0,0,0,0,0,0,0,0,115,5,20,2,10),(179,0,0,0,0,0,0,0,0,0,0,0,0,0,114,5,20,2,10),(180,0,0,0,0,0,0,0,0,0,0,0,0,0,116,5,21,2,10),(181,0,0,0,0,0,0,0,0,0,0,0,0,0,117,5,21,2,10),(182,0,0,0,0,0,0,0,0,0,0,0,0,0,122,5,21,2,10),(183,0,0,0,0,0,0,0,0,0,0,0,0,0,123,5,21,2,10),(184,0,0,0,0,0,0,0,0,0,0,0,0,0,121,5,21,2,10),(185,0,0,0,0,0,0,0,0,0,0,0,0,0,124,5,21,2,10),(186,0,0,0,0,0,0,0,0,0,0,0,0,0,118,5,21,2,10),(187,0,0,0,0,0,0,0,0,0,0,0,0,0,119,5,21,2,10),(188,0,0,0,0,0,0,0,0,0,0,0,0,0,120,5,21,2,10),(189,0,0,0,0,0,0,0,0,0,0,0,0,0,125,5,21,2,10),(190,0,0,0,0,0,0,0,0,0,0,0,0,0,130,5,21,2,10),(191,0,0,0,0,0,0,0,0,0,0,0,0,0,127,5,21,2,10),(192,0,0,0,0,0,0,0,0,0,0,0,0,0,129,5,21,2,10),(193,0,0,0,0,0,0,0,0,0,0,0,0,0,126,5,21,2,10),(194,0,0,0,0,0,0,0,0,0,0,0,0,0,128,5,21,2,10),(195,1,1,0,1,1,1,1,1,1,1,1,1,90,88,5,19,2,11),(196,1,1,0,1,1,2,1,1,1,1,1,1,90,86,5,19,2,11),(197,1,0,0,1,1,3,1,1,1,1,1,1,90,90,5,19,2,11),(198,1,0,0,1,1,4,1,1,1,1,1,1,90,91,5,19,2,11),(199,1,0,0,1,1,5,1,1,1,1,1,1,90,95,5,19,2,11),(200,0,0,0,1,1,6,1,1,1,1,1,1,90,89,5,19,2,11),(201,1,0,0,1,1,7,1,1,1,1,1,1,90,93,5,19,2,11),(202,0,0,0,1,1,8,1,1,1,1,1,1,90,94,5,19,2,11),(203,1,0,0,1,1,9,1,1,1,1,1,1,90,92,5,19,2,11),(204,0,0,0,1,1,10,1,1,1,1,1,1,90,87,5,19,2,11),(205,1,0,0,1,1,11,1,1,1,1,1,1,90,96,5,19,2,11),(206,0,0,0,1,1,12,1,1,1,1,1,1,90,97,5,19,2,11),(207,1,0,0,1,1,13,1,1,1,1,1,1,90,99,5,19,2,11),(208,0,0,0,1,1,14,1,1,1,1,1,1,90,98,5,19,2,11),(209,0,0,0,1,1,15,1,1,1,1,1,1,90,100,5,19,2,11),(210,1,0,0,1,1,1,1,1,1,1,1,1,90,104,5,20,2,11),(211,0,0,0,1,1,2,1,1,1,1,1,1,90,105,5,20,2,11),(212,1,0,0,1,1,3,1,1,1,1,1,1,90,108,5,20,2,11),(213,0,1,0,1,1,4,1,1,1,1,1,1,90,110,5,20,2,11),(214,0,1,0,1,1,5,1,1,1,1,1,1,90,106,5,20,2,11),(215,0,0,0,1,1,6,1,1,1,1,1,1,90,103,5,20,2,11),(216,1,0,0,1,1,7,1,1,1,1,1,1,90,109,5,20,2,11),(217,0,0,0,1,1,8,1,1,1,1,1,1,90,107,5,20,2,11),(218,0,0,0,1,1,9,1,1,1,1,1,1,90,102,5,20,2,11),(219,1,0,0,1,1,10,1,1,1,1,1,1,90,101,5,20,2,11),(220,0,0,0,1,1,11,1,1,1,1,1,1,90,111,5,20,2,11),(221,0,0,0,1,1,12,1,1,1,1,1,1,90,113,5,20,2,11),(222,1,0,0,1,1,13,1,1,1,1,1,1,90,112,5,20,2,11),(223,1,0,0,1,1,14,1,1,1,1,1,1,90,115,5,20,2,11),(224,0,0,0,1,1,15,1,1,1,1,1,1,90,114,5,20,2,11),(225,1,0,0,1,1,1,1,1,1,1,1,1,90,116,5,21,2,11),(226,0,0,0,1,1,2,1,1,1,1,1,1,90,117,5,21,2,11),(227,0,0,0,1,1,3,1,1,1,1,1,1,90,122,5,21,2,11),(228,1,0,0,1,1,4,1,1,1,1,1,1,90,123,5,21,2,11),(229,0,0,0,1,1,5,1,1,1,1,1,1,90,121,5,21,2,11),(230,1,0,0,1,1,6,1,1,1,1,1,1,90,124,5,21,2,11),(231,0,0,1,1,1,7,1,1,1,1,1,1,90,118,5,21,2,11),(232,1,0,0,1,1,8,1,1,1,1,1,1,90,119,5,21,2,11),(233,1,0,0,1,1,9,1,1,1,1,1,1,90,120,5,21,2,11),(234,0,0,0,1,1,10,1,1,1,1,1,1,90,125,5,21,2,11),(235,1,0,0,1,1,11,1,1,1,1,1,1,90,130,5,21,2,11),(236,1,0,0,1,1,12,1,1,1,1,1,1,90,127,5,21,2,11),(237,0,0,0,1,1,13,1,1,1,1,1,1,90,129,5,21,2,11),(238,1,0,0,1,1,14,1,1,1,1,1,1,90,126,5,21,2,11),(239,0,0,0,1,1,15,1,1,1,1,1,1,90,128,5,21,2,11),(240,2,0,1,1,1,1,1,1,1,1,1,90,90,88,5,19,2,12),(241,2,0,1,1,1,1,1,1,1,1,1,90,90,86,5,19,2,12),(242,2,0,1,1,1,1,1,1,1,1,1,90,90,90,5,19,2,12),(243,2,0,1,1,1,1,1,1,1,1,1,90,90,91,5,19,2,12),(244,2,0,1,1,1,1,1,1,1,1,1,90,90,95,5,19,2,12),(245,2,0,1,1,1,0,1,1,1,1,1,90,90,89,5,19,2,12),(246,2,0,1,1,1,1,1,1,1,1,1,90,90,93,5,19,2,12),(247,2,0,1,1,1,0,1,1,1,1,1,90,90,94,5,19,2,12),(248,2,0,1,1,1,1,1,1,1,1,1,90,90,92,5,19,2,12),(249,2,0,1,1,1,0,1,1,1,1,1,90,90,87,5,19,2,12),(250,2,0,1,1,1,1,1,1,1,1,1,90,90,96,5,19,2,12),(251,2,0,1,1,1,0,1,1,1,1,1,90,90,97,5,19,2,12),(252,2,0,1,1,1,1,1,1,1,1,1,90,90,99,5,19,2,12),(253,2,0,1,1,1,0,1,1,1,1,1,90,90,98,5,19,2,12),(254,2,0,1,1,1,0,1,1,1,1,1,90,90,100,5,19,2,12),(255,2,0,1,1,1,1,1,1,1,1,1,90,90,104,5,20,2,12),(256,2,0,1,1,1,0,1,1,1,1,1,90,90,105,5,20,2,12),(257,2,0,1,1,1,1,1,1,1,1,1,90,90,108,5,20,2,12),(258,2,0,1,1,1,0,1,1,1,1,1,90,90,110,5,20,2,12),(259,2,0,1,1,1,0,1,1,1,1,1,90,90,106,5,20,2,12),(260,2,0,1,1,1,0,1,1,1,1,1,90,90,103,5,20,2,12),(261,2,0,1,1,1,1,1,1,1,1,1,90,90,109,5,20,2,12),(262,2,0,1,1,1,0,1,1,1,1,1,90,90,107,5,20,2,12),(263,2,0,1,1,1,0,1,1,1,1,1,90,90,102,5,20,2,12),(264,2,0,1,1,1,1,1,1,1,1,1,90,90,101,5,20,2,12),(265,2,0,1,1,1,0,1,1,1,1,1,90,90,111,5,20,2,12),(266,2,0,1,1,1,0,1,1,1,1,1,90,90,113,5,20,2,12),(267,2,0,1,1,1,1,1,1,1,1,1,90,90,112,5,20,2,12),(268,2,0,1,1,1,1,1,1,1,1,1,90,90,115,5,20,2,12),(269,2,0,1,1,1,0,1,1,1,1,1,90,90,114,5,20,2,12),(270,2,0,1,1,1,1,1,1,1,1,1,90,90,116,5,21,2,12),(271,2,0,1,1,1,0,1,1,1,1,1,90,90,117,5,21,2,12),(272,2,0,1,1,1,0,1,1,1,1,1,90,90,122,5,21,2,12),(273,2,0,1,1,1,1,1,1,1,1,1,90,90,123,5,21,2,12),(274,2,0,1,1,1,0,1,1,1,1,1,90,90,121,5,21,2,12),(275,2,0,1,1,1,1,1,1,1,1,1,90,90,124,5,21,2,12),(276,2,1,1,1,1,0,1,1,1,1,1,90,90,118,5,21,2,12),(277,2,0,1,1,1,1,1,1,1,1,1,90,90,119,5,21,2,12),(278,2,0,1,1,1,1,1,1,1,1,1,90,90,120,5,21,2,12),(279,2,0,1,1,1,1,1,1,1,1,1,90,90,130,5,21,2,12),(280,2,0,1,1,1,0,1,1,1,1,1,90,90,125,5,21,2,12),(281,2,0,1,1,1,1,1,1,1,1,1,90,90,127,5,21,2,12),(282,2,0,1,1,1,0,1,1,1,1,1,90,90,129,5,21,2,12),(283,2,0,1,1,1,1,1,1,1,1,1,90,90,126,5,21,2,12),(284,2,0,1,1,1,0,1,1,1,1,1,90,90,128,5,21,2,12);
/*!40000 ALTER TABLE `player_stadistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pop_up`
--

DROP TABLE IF EXISTS `pop_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pop_up` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `img` text,
  `link` varchar(100) NOT NULL,
  `page` varchar(100) NOT NULL,
  `page_name` varchar(100) NOT NULL,
  `isActive` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pop_up`
--

LOCK TABLES `pop_up` WRITE;
/*!40000 ALTER TABLE `pop_up` DISABLE KEYS */;
INSERT INTO `pop_up` VALUES (3,'!Gana Ya¡','Participa  y gana una  ps5 con FUTV','1644340069640_sorteo.jpg','https://www.facebook.com/FUTVCR/','estadisticas','Resumen de Estadisticas',1),(4,'¿Qué es tas esperando?','Participa en los sorteos de FUTV','1644340118403_sorteo2.jpg','https://www.facebook.com/FUTVCR/','','inicio',1),(5,'Gritalo con FUTV','Participa en los torneos de FUTV, y participa por muchos premios','1644340248578_sorteo.jpg','https://www.facebook.com/FUTVCR/','programacion','Programacion',1),(6,'Ven y gana con Nosotros','Grítalo con FUTV y gana miles de premios','1644340296908_sorteo2.jpg','https://www.facebook.com/FUTVCR/','tablas_estadisticas','Tablas de Resultados',1),(7,'Es tu única oportunidad','NO dejes ir la oportunidad y participa para ganar con FUTV','1644340336434_sorteo.jpg','https://www.facebook.com/FUTVCR/','premium','Premium',1);
/*!40000 ALTER TABLE `pop_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programation`
--

DROP TABLE IF EXISTS `programation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `img` text,
  `link` varchar(100) NOT NULL,
  `programationCategoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1839cd342ec5561c480bd77488a` (`programationCategoryId`),
  CONSTRAINT `FK_1839cd342ec5561c480bd77488a` FOREIGN KEY (`programationCategoryId`) REFERENCES `programation_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programation`
--

LOCK TABLES `programation` WRITE;
/*!40000 ALTER TABLE `programation` DISABLE KEYS */;
INSERT INTO `programation` VALUES (6,'A Fondo con FUTV','Descripción del Programa','1644339626237_afondocon.png','https://www.facebook.com/FUTVCR/',2),(7,'Analisis 360','Descripción del programa','1644339691437_analisis_360.png','https://www.facebook.com/FUTVCR/',2),(8,'El Profe bustos','Descripción del programa','1644339732965_elprofebustos.png','https://www.facebook.com/FUTVCR/',3),(9,'Acercandonos','Descripcion del programa','1644339753215_LOGOACERCANDONOS.png','https://www.facebook.com/FUTVCR/',3),(10,'El negocio del futbol','Descripción del programa','1644339776842_LOGOELNEGOCIODELFUTBOL.jpeg','https://www.facebook.com/FUTVCR/',2),(11,'El Ascenso','Descripción del programa','1644339799170_LOGOENASCENSO.png','https://www.facebook.com/FUTVCR/',2),(12,'FuTV','Descripción del programa','1644339818386_LOGOFUTBLTVYMAS.png','https://www.facebook.com/FUTVCR/',3),(13,'Tiempo Final','Descripcion del programa','1644339834876_LOGOTIEMPOFINAL.png','https://www.facebook.com/FUTVCR/',3),(14,'Únicamente Futbol','Descripción del programa','1644339858091_LOGOUNICAMENTEFUTBOL.png','https://www.facebook.com/FUTVCR/',3),(15,'El Zar se lo cuenta','Descripcion','1644339876018_LOGO_ELZARSELOCUENTA.jpg','https://www.facebook.com/FUTVCR/',3),(16,'Identidad Brumosa','Descripción del programa','1644339894624_logo_identidad_brumosa.jpeg','https://www.facebook.com/FUTVCR/',2),(17,'Somos el Team','Descripción del programa','1644339924082_logo_somoselteam.jpeg','https://www.facebook.com/FUTVCR/',3),(18,'Futbol AMP','Descripción del programa','1644339945443_Logo-Fútbol-AMP.png','https://www.facebook.com/FUTVCR/',2),(19,'Se Sabe ','Descripción del programa ','1644339968980_LOOLOQUENOSESABESOBRE.png','https://www.facebook.com/FUTVCR/',3),(20,'Mundo de futbol menor','Descripción del programa','1644340004450_MUNDODEFUTBOLMENOR.png','https://www.facebook.com/FUTVCR/',3);
/*!40000 ALTER TABLE `programation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programation_categories`
--

DROP TABLE IF EXISTS `programation_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programation_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programation_categories`
--

LOCK TABLES `programation_categories` WRITE;
/*!40000 ALTER TABLE `programation_categories` DISABLE KEYS */;
INSERT INTO `programation_categories` VALUES (2,'Categoria 1'),(3,'Categoria 2');
/*!40000 ALTER TABLE `programation_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rounds`
--

DROP TABLE IF EXISTS `rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roundNumber` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rounds`
--

LOCK TABLES `rounds` WRITE;
/*!40000 ALTER TABLE `rounds` DISABLE KEYS */;
INSERT INTO `rounds` VALUES (10,'0','2021-07-08'),(11,'1','2021-07-08'),(12,'2','2021-07-15'),(13,'3','2021-07-18'),(14,'4','2021-07-22'),(15,'5','2021-07-29'),(16,'06','2021-08-01');
/*!40000 ALTER TABLE `rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `init_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (5,'Torneo de Apertura 2021-2022','2021-07-08','2021-12-19'),(6,'Torneo de Clausura','2022-01-16','2022-06-05');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_x_competence`
--

DROP TABLE IF EXISTS `season_x_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season_x_competence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seasonId` int DEFAULT NULL,
  `competenceId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d20519abe7f9c5e05aa6905d28c` (`seasonId`),
  KEY `FK_c9336832dcb23b6596b5ce6969e` (`competenceId`),
  CONSTRAINT `FK_c9336832dcb23b6596b5ce6969e` FOREIGN KEY (`competenceId`) REFERENCES `competence` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_d20519abe7f9c5e05aa6905d28c` FOREIGN KEY (`seasonId`) REFERENCES `season` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_x_competence`
--

LOCK TABLES `season_x_competence` WRITE;
/*!40000 ALTER TABLE `season_x_competence` DISABLE KEYS */;
INSERT INTO `season_x_competence` VALUES (5,5,2),(6,6,2);
/*!40000 ALTER TABLE `season_x_competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_x_season_x_competence`
--

DROP TABLE IF EXISTS `shift_x_season_x_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_x_season_x_competence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seasonXCompetenceId` int DEFAULT NULL,
  `roundId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f0c17a5aaff68acbd8e1e13bd75` (`seasonXCompetenceId`),
  KEY `FK_c7ce9e877fd097fe2d796d627db` (`roundId`),
  CONSTRAINT `FK_c7ce9e877fd097fe2d796d627db` FOREIGN KEY (`roundId`) REFERENCES `rounds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_f0c17a5aaff68acbd8e1e13bd75` FOREIGN KEY (`seasonXCompetenceId`) REFERENCES `season_x_competence` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_x_season_x_competence`
--

LOCK TABLES `shift_x_season_x_competence` WRITE;
/*!40000 ALTER TABLE `shift_x_season_x_competence` DISABLE KEYS */;
INSERT INTO `shift_x_season_x_competence` VALUES (10,5,10),(11,5,11),(12,5,12),(13,5,13),(14,5,14),(15,5,15),(16,5,16);
/*!40000 ALTER TABLE `shift_x_season_x_competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) NOT NULL,
  `subscription_package` varchar(100) NOT NULL,
  `start_subscription_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_subscription_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isOpen` tinyint NOT NULL,
  `closeBy` varchar(150) NOT NULL,
  `openBy` varchar(150) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `historicConversation` text NOT NULL,
  `subscriptionId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b70aabfcbcd028f150d882f70d8` (`subscriptionId`),
  CONSTRAINT `FK_b70aabfcbcd028f150d882f70d8` FOREIGN KEY (`subscriptionId`) REFERENCES `subscriptions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `profile_img` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (19,'Deportivo Saprissa','1644341451645_DeportivoSaprissa.jpg'),(20,'Guadalupe','1644341451646_Guadalupe.png'),(21,'Liga Deportiva Alajuelense','1644341451648_LigaDeportivaAlajuelense.png');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_x_competence`
--

DROP TABLE IF EXISTS `team_x_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_x_competence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pts` int NOT NULL DEFAULT '0',
  `pj` int NOT NULL DEFAULT '0',
  `pg` int NOT NULL DEFAULT '0',
  `pp` int NOT NULL DEFAULT '0',
  `pe` int NOT NULL DEFAULT '0',
  `gf` int NOT NULL DEFAULT '0',
  `gc` int NOT NULL DEFAULT '0',
  `dg` int NOT NULL DEFAULT '0',
  `teamId` int DEFAULT NULL,
  `competenceId` int DEFAULT NULL,
  `seasonId` int DEFAULT NULL,
  `roundId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2e51206354b310644e808437c11` (`teamId`),
  KEY `FK_44309efd95c7b9f8e9d7f80cf8e` (`competenceId`),
  KEY `FK_8d6d2c0ce84e562b560f0ff1d91` (`seasonId`),
  KEY `FK_c60902587d777539f1d85bb6a8c` (`roundId`),
  CONSTRAINT `FK_2e51206354b310644e808437c11` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_44309efd95c7b9f8e9d7f80cf8e` FOREIGN KEY (`competenceId`) REFERENCES `competence` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8d6d2c0ce84e562b560f0ff1d91` FOREIGN KEY (`seasonId`) REFERENCES `season` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_c60902587d777539f1d85bb6a8c` FOREIGN KEY (`roundId`) REFERENCES `rounds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_x_competence`
--

LOCK TABLES `team_x_competence` WRITE;
/*!40000 ALTER TABLE `team_x_competence` DISABLE KEYS */;
INSERT INTO `team_x_competence` VALUES (25,0,0,0,0,0,0,0,0,19,2,5,10),(26,0,0,0,0,0,0,0,0,20,2,5,10),(27,0,0,0,0,0,0,0,0,21,2,5,10),(28,1,1,1,1,1,1,1,0,19,2,5,11),(29,2,1,1,1,1,1,1,0,20,2,5,11),(30,1,1,1,1,1,1,1,0,21,2,5,11),(31,2,2,2,1,1,2,0,2,19,2,5,12),(32,2,2,1,2,1,2,1,1,20,2,5,12),(33,2,2,2,1,1,2,0,2,21,2,5,12);
/*!40000 ALTER TABLE `team_x_competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_home`
--

DROP TABLE IF EXISTS `video_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_home` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `video_file` text,
  `device` varchar(100) NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_home`
--

LOCK TABLES `video_home` WRITE;
/*!40000 ALTER TABLE `video_home` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona_fan_content`
--

DROP TABLE IF EXISTS `zona_fan_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona_fan_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(250) NOT NULL,
  `image` text,
  `position` varchar(250) NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona_fan_content`
--

LOCK TABLES `zona_fan_content` WRITE;
/*!40000 ALTER TABLE `zona_fan_content` DISABLE KEYS */;
INSERT INTO `zona_fan_content` VALUES (1,'Nombre ','1644341700098_1.png','izquierda',1),(2,'Nombre','1644341717582_3.jpg','central',1),(3,'Nombre','1644341738867_2.jpg','derecha',1);
/*!40000 ALTER TABLE `zona_fan_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_futv_local'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-08 11:49:30
