-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 06:07 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `nim` varchar(12) DEFAULT NULL,
  `no_hp_lama` varchar(14) DEFAULT NULL,
  `no_hp_baru` varchar(14) DEFAULT NULL,
  `tgl_diubah` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `nim`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
(1, '2147483647', '2147483649', '089669987444', '2019-10-29 15:29:36'),
(2, '161240000483', '2147483648', '085786303475', '2019-11-06 14:31:23'),
(3, '2147483647', '085786303475', '085786303475', '2019-11-06 14:31:37'),
(4, '2147483647', '089669987444', '089669987444', '2019-11-06 14:32:00');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(12) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(2) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `nomor_hp` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama_mahasiswa`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES
(1, '161240000482', 'Ahmad Feri Setyawan', 'L', 'Desa Sukosono, Kedung Jepara', '089669987444'),
(2, '161240000483', 'Septiar Robert', 'L', 'Desa Mambak, Pakis Aji Jepara', '085786303475'),
(3, '161240000485', 'Mustofa Kamal Pasha', 'L', 'Desa Mindahan, Batealit Jepara', '085786303475'),
(4, '161240000484', 'Syahlan Asyrowi', 'L', 'Desa Kaliwungu, Kaliwungu Demak', '089669987444'),
(6, '161240000411', 'Novia Kris Mulyani', 'P', 'Dermolo', NULL);

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `update_nomor` AFTER UPDATE ON `mahasiswa` FOR EACH ROW BEGIN
INSERT INTO log
set 
id = old.id,
nim = old.nim,
no_hp_lama = old.nomor_hp,
no_hp_baru = new.nomor_hp,
tgl_diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampilkan_data`
-- (See below for the actual view)
--
CREATE TABLE `tampilkan_data` (
`id` int(11)
,`nim` varchar(12)
,`nama_mahasiswa` varchar(50)
,`jenis_kelamin` varchar(2)
,`alamat` varchar(200)
,`nomor_hp` varchar(14)
);

-- --------------------------------------------------------

--
-- Structure for view `tampilkan_data`
--
DROP TABLE IF EXISTS `tampilkan_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampilkan_data`  AS  select `mahasiswa`.`id` AS `id`,`mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama_mahasiswa` AS `nama_mahasiswa`,`mahasiswa`.`jenis_kelamin` AS `jenis_kelamin`,`mahasiswa`.`alamat` AS `alamat`,`mahasiswa`.`nomor_hp` AS `nomor_hp` from `mahasiswa` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
