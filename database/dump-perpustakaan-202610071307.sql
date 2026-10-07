-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: perpustakaan
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buku` (
  `id_buku` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(150) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `tahun_terbit` int DEFAULT NULL,
  `stok` int DEFAULT '0',
  `id_kategori` int DEFAULT NULL,
  `id_penerbit` int DEFAULT NULL,
  PRIMARY KEY (`id_buku`),
  KEY `buku_kategori_FK` (`id_kategori`),
  KEY `buku_penerbit_FK` (`id_penerbit`),
  CONSTRAINT `buku_kategori_FK` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  CONSTRAINT `buku_penerbit_FK` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES (1,'Belajar PHP dan MySQL untuk Pemula','Budi Raharjo',2022,8,1,1),(2,'Dasar-Dasar Basis Data','Siti Aminah',2021,5,2,2),(3,'Pemrograman Web dengan HTML dan CSS','Andi Wijaya',2023,10,1,3),(4,'Perancangan Basis Data Relasional','Rina Kartika',2020,4,2,1),(5,'Jaringan Komputer untuk Mahasiswa','Dedi Santoso',2019,6,3,4),(6,'Analisis dan Perancangan Sistem Informasi','Maya Puspita',2022,7,4,2),(7,'Git dan GitHub untuk Kolaborasi Tim','Rizky Pratama',2024,9,1,5),(8,'Desain UI/UX Modern','Lestari Dewi',2023,3,5,3);
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL,
  `deskripsi` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'Pemrograman','Buku tentang bahasa dan logika pemrograman'),(2,'Basis Data','Buku tentang perancangan dan pengelolaan database'),(3,'Jaringan','Buku tentang jaringan komputer dan keamanan'),(4,'Sistem Informasi','Buku tentang analisis dan perancangan sistem'),(5,'Desain','Buku tentang desain antarmuka dan grafis');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penerbit`
--

DROP TABLE IF EXISTS `penerbit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penerbit` (
  `id_penerbit` int NOT NULL AUTO_INCREMENT,
  `nama_penerbit` varchar(100) NOT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_penerbit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penerbit`
--

LOCK TABLES `penerbit` WRITE;
/*!40000 ALTER TABLE `penerbit` DISABLE KEYS */;
INSERT INTO `penerbit` VALUES (1,'Informatika Bandung','Bandung','022-7500001'),(2,'Andi Offset','Yogyakarta','0274-561881'),(3,'Elex Media Komputindo','Jakarta','021-5365001'),(4,'Gava Media','Yogyakarta','0274-889398'),(5,'Deepublish','Sleman','0274-4533427');
/*!40000 ALTER TABLE `penerbit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'perpustakaan'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-07 13:07:44
