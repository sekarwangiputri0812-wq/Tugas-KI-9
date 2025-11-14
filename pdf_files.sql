-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2025 at 10:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `upload_pdf_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `pdf_files`
--

CREATE TABLE `pdf_files` (
  `id` int(11) NOT NULL,
  `path` varchar(500) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pdf_files`
--

INSERT INTO `pdf_files` (`id`, `path`, `name`, `uploaded_at`) VALUES
(1, 'uploads/sekar1763111856_TEKS CERAMAH.pdf', 'TEKS CERAMAH.pdf', '2025-11-14 09:17:36'),
(2, 'uploads/sekar1763111861_TEKS CERAMAH.pdf', 'TEKS CERAMAH.pdf', '2025-11-14 09:17:41'),
(3, 'uploads/sekar1763111879_TEKS CERAMAH.pdf', 'TEKS CERAMAH.pdf', '2025-11-14 09:17:59'),
(4, 'uploads/sekar1763111965_PROPOSAL USAHA 1.pdf', 'PROPOSAL USAHA 1.pdf', '2025-11-14 09:19:25'),
(5, 'uploads/sekar1763112242_STUDI KASUS KELOMPOK 2.drawio.pdf', 'STUDI KASUS KELOMPOK 2.drawio.pdf', '2025-11-14 09:24:02'),
(6, 'uploads/sekar1763112598_STUDI KASUS KELOMPOK 2.drawio.pdf', 'STUDI KASUS KELOMPOK 2.drawio.pdf', '2025-11-14 09:29:58'),
(7, 'uploads/sekar1763113059_TEKS CERAMAH.pdf', 'TEKS CERAMAH.pdf', '2025-11-14 09:37:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pdf_files`
--
ALTER TABLE `pdf_files`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pdf_files`
--
ALTER TABLE `pdf_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
