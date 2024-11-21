-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2024 at 08:13 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monev_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `batch_uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'login', 'login', NULL, 'logged', NULL, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 03:41:35', '2024-10-08 03:41:35'),
(2, 'logout', 'logout aplikasi', 'App\\Models\\User', 'logout', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 03:41:47', '2024-10-08 03:41:47'),
(3, 'login', 'login', NULL, 'logged', NULL, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 03:48:13', '2024-10-08 03:48:13'),
(4, 'settings', 'memperbarui  data konfigurasi aplikasi', 'App\\Models\\Setting', 'updated', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 03:51:35', '2024-10-08 03:51:35'),
(5, 'user', 'memperbarui  profil akun', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"old\":{\"id\":1,\"username\":\"superadmin\",\"name\":\"Avril Lavigne\",\"email\":\"avril@gmail.com\",\"email_verified_at\":null,\"avatar\":\"users\\/usRilDDhGEAooa1SaASDLpWuOiecOWZCnW1EKrY8.png\",\"is_active\":1,\"unker_id\":0,\"created_at\":\"2022-08-10T21:40:00.000000Z\",\"updated_at\":\"2024-10-08T03:41:47.000000Z\",\"deleted_at\":null},\"new\":{\"id\":1,\"username\":\"superadmin\",\"name\":\"Avril Lavigne\",\"email\":\"avril@gmail.com\",\"email_verified_at\":null,\"avatar\":\"users\\/355E1lzftbUPLgzn6yjEJMPyVYpYwejxoSCKDdfT.jpg\",\"is_active\":1,\"unker_id\":0,\"created_at\":\"2022-08-11 04:40:00\",\"updated_at\":\"2024-10-08 10:51:48\",\"deleted_at\":null}}', NULL, '2024-10-08 03:51:48', '2024-10-08 03:51:48'),
(6, 'logout', 'logout aplikasi', 'App\\Models\\User', 'logout', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 03:51:57', '2024-10-08 03:51:57'),
(7, 'login', 'login', NULL, 'logged', NULL, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 04:00:44', '2024-10-08 04:00:44'),
(8, 'logout', 'logout aplikasi', 'App\\Models\\User', 'logout', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 04:07:42', '2024-10-08 04:07:42'),
(9, 'login', 'login', NULL, 'logged', NULL, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 04:07:54', '2024-10-08 04:07:54'),
(10, 'settings', 'memperbarui  data konfigurasi aplikasi', 'App\\Models\\Setting', 'updated', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 06:03:38', '2024-10-08 06:03:38'),
(11, 'settings', 'memperbarui  data konfigurasi aplikasi', 'App\\Models\\Setting', 'updated', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 06:03:42', '2024-10-08 06:03:42'),
(12, 'logout', 'logout aplikasi', 'App\\Models\\User', 'logout', 1, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 06:03:52', '2024-10-08 06:03:52'),
(13, 'login', 'login', NULL, 'logged', NULL, 'App\\Models\\User', 1, '[]', NULL, '2024-10-08 06:04:03', '2024-10-08 06:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `chat_sessions`
--

CREATE TABLE `chat_sessions` (
  `id_session` bigint UNSIGNED NOT NULL,
  `id_ticket` bigint UNSIGNED DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `feedback_text` text,
  `given_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `period_start` timestamp NOT NULL,
  `period_end` timestamp NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `master_kegiatan`
--

CREATE TABLE `master_kegiatan` (
  `id_kegiatan` int NOT NULL,
  `id_program` int DEFAULT NULL,
  `kode_rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kegiatan` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_unker` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_kegiatan`
--

INSERT INTO `master_kegiatan` (`id_kegiatan`, `id_program`, `kode_rekening`, `nama_kegiatan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(1, 1, '1.01.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(2, 1, '1.01.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(3, 1, '1.01.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(4, 1, '1.01.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(5, 1, '1.01.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(6, 1, '1.01.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(7, 1, '1.01.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(8, 1, '1.01.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(9, 2, '1.01.02.1.01', 'Pengelolaan Pendidikan Sekolah Menengah Atas', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(10, 2, '1.01.02.1.02', 'Pengelolaan Pendidikan Sekolah Menengah Kejuruan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(11, 2, '1.01.02.1.03', 'Pengelolaan Pendidikan Khusus', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(12, 3, '1.01.04.1.01', 'Pemindahan Pendidik dan Tenaga Kependidikan Lintas Kabupaten/Kota dalam 1 (Satu) Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(13, 4, '1.02.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(14, 4, '1.02.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(15, 4, '1.02.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(16, 4, '1.02.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(17, 4, '1.02.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(18, 4, '1.02.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(19, 4, '1.02.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(20, 4, '1.02.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(21, 4, '1.02.01.1.10', 'Peningkatan Pelayanan BLUD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(22, 5, '1.02.02.1.01', 'Penyediaan Fasilitas Pelayanan  Sarana  Prasarana dan Alat Kesehatan untuk UKP Rujukan  UKM dan UKM Rujukan Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(23, 5, '1.02.02.1.02', 'Penyediaan Layanan Kesehatan untuk UKP Rujukan  UKM dan UKM Rujukan Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(24, 5, '1.02.02.1.03', 'Penyelenggaraan Sistem Informasi Kesehatan Secara Terintegrasi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(25, 5, '1.02.02.1.04', 'Penerbitan Izin Rumah Sakit Kelas B dan Fasilitas Pelayanan Kesehatan Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(26, 6, '1.02.03.1.01', 'Perencanaan Kebutuhan Sumber Daya Manusia Kesehatan untuk UKM dan UKP Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(27, 6, '1.02.03.1.02', 'Pengembangan Mutu dan Peningkatan Kompetensi Teknis Sumber Daya Manusia Kesehatan Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(28, 7, '1.02.04.1.01', 'Penerbitan Pengakuan Pedagang Besar Farmasi (PBF) Cabang dan Cabang Penyalur Alat Kesehatan (PAK)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(29, 7, '1.02.04.1.02', 'Penerbitan Izin Usaha Kecil Obat Tradisional (UKOT)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(30, 8, '1.02.05.1.01', 'Advokasi  Pemberdayaan  Kemitraan  Peningkatan Peran Serta Masyarakat dan Lintas Sektor Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(31, 8, '1.02.05.1.03', 'Pengembangan dan Pelaksanaan Upaya Kesehatan Bersumber Daya Masyarakat (UKBM) Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(32, 9, '1.03.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(33, 9, '1.03.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(34, 9, '1.03.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(35, 9, '1.03.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(36, 9, '1.03.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(37, 9, '1.03.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(38, 9, '1.03.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(39, 10, '1.03.02.1.02', 'Pengembangan dan Pengelolaan Sistem Irigasi Primer dan Sekunder pada Daerah Irigasi yang Luasnya 1000 Ha-3000 Ha dan Daerah Irigasi Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(40, 11, '1.03.03.1.01', 'Pengelolaan dan Pengembangan Sistem Penyediaan Air Minum (SPAM) Lintas Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(41, 12, '1.03.04.1.01', 'Pengembangan Sistem dan Pengelolaan Persampahan Regional', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(42, 13, '1.03.05.1.01', 'Pengelolaan dan Pengembangan Sistem Air Limbah Domestik Regional', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(43, 14, '1.03.07.1.01', 'Penyelenggaraan Infrastruktur pada Permukiman di Kawasan Strategis Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(44, 15, '1.03.08.1.01', 'Penetapan dan Penyelenggaraan Bangunan Gedung untuk Kepentingan Strategis Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(45, 16, '1.03.09.1.01', 'Penyelenggaraan Penataan Bangunan dan Lingkungan di Kawasan Strategis Daerah Provinsi dan Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(46, 17, '1.03.10.1.01', 'Penyelenggaraan Jalan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(47, 18, '1.03.11.1.01', 'Penyelenggaraan Pelatihan Tenaga Ahli Konstruksi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(48, 18, '1.03.11.1.02', 'Penyelenggaraan Sistem Informasi Jasa Konstruksi (SIPJAKI) Cakupan Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(49, 19, '1.03.12.1.01', 'Penetapan Rencana Tata Ruang Wilayah dan Rencana Rinci Tata Ruang Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(50, 19, '1.03.12.1.02', 'Koordinasi dan Sinkronisasi Perencanaan Tata Ruang', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(51, 19, '1.03.12.1.03', 'Koordinasi dan Sinkronisasi Pemanfataan Ruang Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(52, 19, '1.03.12.1.04', 'Koordinasi dan Sinkronisasi Pengendalian Pemanfataan Ruang Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(53, 20, '1.04.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(54, 20, '1.04.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(55, 20, '1.04.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(56, 20, '1.04.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(57, 20, '1.04.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(58, 20, '1.04.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(59, 20, '1.04.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(60, 20, '1.04.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(61, 21, '1.04.03.1.01', 'Penataan Kawasan Permukiman Kumuh dengan Luas 10 (Sepuluh) Ha sampai dengan di Bawah 15 (Lima Belas) Ha', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(62, 21, '1.04.03.1.02', 'Peningkatan Kualitas Kawasan Permukiman Kumuh dengan Luas 10 (Sepuluh) Ha sampai dengan di Bawah 15 (Lima Belas) Ha', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(63, 22, '1.04.05.1.01', 'Urusan Penyelenggaraan PSU Permukiman', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(64, 23, '1.05.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(65, 23, '1.05.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(66, 23, '1.05.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(67, 23, '1.05.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(68, 23, '1.05.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(69, 23, '1.05.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(70, 23, '1.05.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(71, 23, '1.05.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(72, 23, '1.05.02.1.01', 'Penanganan Gangguan Ketenteraman dan Ketertiban Umum Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(73, 23, '1.05.02.1.02', 'Penegakan Peraturan Daerah Provinsi dan Peraturan Gubernur', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(74, 23, '1.05.02.1.03', 'Pembinaan Penyidik Pegawai Negeri Sipil (PPNS) Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(75, 23, '1.05.03.1.01', 'Pelayanan Informasi Rawan Bencana Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(76, 23, '1.05.03.1.02', 'Pelayanan Pencegahan dan Kesiapsiagaan Terhadap Bencana', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(77, 23, '1.05.03.1.03', 'Pelayanan Penyelamatan dan Evakuasi Korban Bencana', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(78, 23, '1.05.03.1.04', 'Penataan Sistem Dasar Penanggulangan Bencana', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(79, 24, '1.06.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(80, 24, '1.06.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(81, 24, '1.06.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(82, 24, '1.06.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(83, 24, '1.06.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(84, 24, '1.06.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(85, 24, '1.06.02.1.01', 'Penerbitan Izin Pengumpulan Sumbangan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(86, 24, '1.06.02.1.02', 'Pemberdayaan Potensi Sumber Kesejahteraan Sosial Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(87, 25, '1.06.03.1.01', 'Pemulangan Warga Negara Migran Korban Tindak Kekerasan dari Titik Debarkasi di Daerah Provinsi untuk Dipulangkan ke Daerah Kabupaten/Kota Asal', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(88, 26, '1.06.04.1.01', 'Rehabilitasi Sosial Dasar Penyandang Disabilitas TerlAntar di dalam Panti', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(89, 26, '1.06.04.1.02', 'Rehabilitasi Sosial Dasar Anak TerlAntar di dalam Panti', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(90, 26, '1.06.04.1.03', 'Rehabilitasi Sosial Dasar Lanjut Usia Terlantar di dalam Panti', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(91, 26, '1.06.04.1.04', 'Rehabilitasi Sosial Dasar Gelandangan dan Pengemis di dalam Panti', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(92, 26, '1.06.04.1.05', 'Rehabilitasi Sosial bagi Penyandang Masalah Kesejahteraan Sosial (PMKS) Lainnya di Luar HIV/AIDS dan NAPZA di dalam Panti', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(93, 28, '1.06.06.1.01', 'Perlindungan Sosial Korban Bencana Alam dan Sosial Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(94, 29, '1.06.07.1.01', 'Pengelolaan Taman Makam Pahlawan Nasional Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(95, 30, '2.07.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(96, 30, '2.07.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(97, 30, '2.07.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(98, 30, '2.07.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(99, 30, '2.07.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(100, 30, '2.07.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(101, 30, '2.07.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(102, 30, '2.07.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(103, 31, '2.07.02.1.01', 'Penyusunan Rencana Tenaga Kerja (RTK)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(104, 32, '2.07.03.1.01', 'Pelaksanaan Latihan Kerja Berdasarkan Klaster Kompetensi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(105, 32, '2.07.03.1.02', 'Pelaksanaan Akreditasi Lembaga Pelatihan Kerja', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(106, 32, '2.07.03.1.03', 'Konsultansi Produktivitas pada Perusahaan Menengah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(107, 32, '2.07.03.1.04', 'Pengukuran Produktivitas Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(108, 33, '2.07.04.1.01', 'Pelayanan Antar Kerja Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(109, 33, '2.07.04.1.03', 'Pengelolaan Informasi Pasar Kerja', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(110, 33, '2.07.04.1.04', 'Pelindungan PMI (Pra dan Purna Penempatan) di Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(111, 34, '2.07.05.1.01', 'Pengesahan Peraturan Perusahaan dan Pendaftaran Perjanjian Kerja Bersama untuk yang Mempunyai Wilayah Kerja lebih dari 1 (satu) Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(112, 34, '2.07.05.1.02', 'Pencegahan dan Penyelesaian Perselisihan Hubungan Industrial  Mogok Kerja  dan Penutupan Perusahaan yang Berakibat/Berdampak pada Kepentingan di 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(113, 34, '2.07.05.1.03', 'Penetapan Upah Minimum Provinsi (UMP)  Upah Minimum Sektoral Provinsi (UMSP)  Upah Minimum Kabupaten/Kota (UMK)  dan Upah Minimum Sektoral Kabupaten/Kota (UMSK)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(114, 35, '2.07.06.1.01', 'Penyelenggaraan Pengawasan Ketenagakerjaan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(115, 36, '2.08.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(116, 36, '2.08.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(117, 36, '2.08.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(118, 36, '2.08.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(119, 36, '2.08.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(120, 36, '2.08.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(121, 36, '2.08.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(122, 36, '2.08.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(123, 37, '2.08.02.1.01', 'Pelembagaan Pengarusutamaan Gender (PUG) pada Lembaga Pemerintah Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(124, 37, '2.08.02.1.02', 'Pemberdayaan Perempuan Bidang Politik  Hukum  Sosial  dan Ekonomi pada Organisasi KeMasyarakatan Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(125, 37, '2.08.02.1.03', 'Penguatan dan Pengembangan Lembaga Penyedia Layanan Pemberdayaan Perempuan Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(126, 38, '2.08.03.1.01', 'Pencegahan Kekerasan terhadap Perempuan yang melibatkan para Pihak Lingkup Daerah Provinsi dan Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(127, 38, '2.08.03.1.02', 'Penyediaan Layanan Rujukan Lanjutan bagi Perempuan Korban Kekerasan yang memerlukan Koordinasi Tingkat Daerah Provinsi dan Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(128, 38, '2.08.03.1.03', 'Penguatan dan Pengembangan Lembaga Penyedia Layanan Perlindungan Perempuan Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(129, 40, '2.08.05.1.01', 'Pengumpulan  Pengolahan Analisis dan Penyajian Data Gender dan Anak dalam Kelembagaan Data di Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(130, 41, '2.08.06.1.02', 'Penguatan dan Pengembangan Lembaga Penyedia Layanan Peningkatan Kualitas Hidup Anak Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(131, 42, '2.08.07.1.01', 'Pencegahan Kekerasan terhadap Anak yang Melibatkan para Pihak Lingkup Daerah Provinsi dan Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(132, 42, '2.08.07.1.03', 'Penguatan dan Pengembangan Lembaga Penyedia Layanan bagi Anak yang Memerlukan Perlindungan Khusus Tingkat Daerah Provinsi dan Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(133, 43, '2.09.03.1.04', 'Promosi Pencapaian Target Konsumsi Pangan Perkapita/Tahun sesuai dengan Angka Kecukupan Gizi Melalui Media Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(134, 43, '2.10.06.1.01', 'Penetapan Subyek dan Obyek Redistribusi Tanah Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(135, 44, '2.10.10.1.01', 'Perencanaan Penggunaan Tanah yang Hamparannya Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(136, 45, '2.11.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(137, 45, '2.11.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(138, 45, '2.11.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(139, 45, '2.11.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(140, 45, '2.11.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(141, 45, '2.11.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(142, 45, '2.11.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(143, 45, '2.11.01.1.10', 'Peningkatan Pelayanan BLUD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(144, 46, '2.11.02.1.01', 'Rencana Perlindungan dan Pengelolaan Lingkungan Hidup (RPPLH) Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(145, 46, '2.11.02.1.02', 'Penyelenggaraan Kajian Lingkungan Hidup Strategis (KLHS) Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(146, 47, '2.11.03.1.01', 'Pencegahan Pencemaran dan/atau Kerusakan Lingkugan Hidup', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(147, 47, '2.11.03.1.02', 'Penanggulangan Pencemaran dan/atau Kerusakan Lingkungan Hidup', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(148, 47, '2.11.03.1.03', 'Pemulihan Pencemaran dan/atau Kerusakan Lingkungan Hidup', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(149, 48, '2.11.04.1.01', 'Pengelolaan Keanekaragaman Hayati Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(150, 49, '2.11.05.1.01', 'Pengumpulan Limbah B3 Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(151, 50, '2.11.06.1.01', 'Pembinaan dan Pengawasan Izin Lingkungan dan Izin PPLH yang diterbitkan oleh Pemerintah Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(152, 51, '2.11.08.1.01', 'Penyelenggaraan Pendidikan  Pelatihan  dan Penyuluhan Lingkungan Hidup untuk Lembaga KeMasyarakatan Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(153, 52, '2.11.09.1.01', 'Pemberian Penghargaan Lingkungan Hidup Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(154, 53, '2.11.10.1.01', 'Penyelesaian Pengaduan Masyarakat di Bidang Perlindungan dan Pengelolaan Lingkungan Hidup (PPLH) Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(155, 54, '2.11.11.1.01', 'Penanganan Sampah di TPA/TPST Regional', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(156, 55, '2.12.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(157, 55, '2.12.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(158, 55, '2.12.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(159, 55, '2.12.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(160, 55, '2.12.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(161, 55, '2.12.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(162, 55, '2.12.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(163, 55, '2.12.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(164, 56, '2.12.02.1.01', 'Pelayanan Pendaftaran Kependudukan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(165, 56, '2.12.02.1.02', 'Penyelenggaraan Pendaftaran Kependudukan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(166, 56, '2.12.02.1.03', 'Pembinaan dan Pengawasan Penyelenggaraan Pendaftaran Kependudukan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(167, 57, '2.12.03.1.01', 'Pelayanan Pencatatan Sipil', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(168, 57, '2.12.03.1.02', 'Penyelenggaraan Pencatatan Sipil di Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(169, 57, '2.12.03.1.03', 'Pemberian Konsultasi Penyelenggaraan Pencatatan Sipil', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(170, 58, '2.12.04.1.02', 'Penyelenggaraan Pengelolaan Informasi Administrasi Kependudukan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(171, 58, '2.12.04.1.03', 'Pembinaan dan Pengawasan Pengelolaan Informasi Administrasi Kependudukan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(172, 59, '2.12.05.1.01', 'Penyediaan Profil Kependudukan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(173, 60, '2.13.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(174, 60, '2.13.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(175, 60, '2.13.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(176, 60, '2.13.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(177, 60, '2.13.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(178, 60, '2.13.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(179, 60, '2.13.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(180, 61, '2.13.03.1.01', 'Fasilitasi Kerja Sama antar desa yang Menjadi Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(181, 61, '2.13.04.1.01', 'Pembinaan dan Pengawasan Penyelenggaraan Pemerintahan Desa', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(182, 61, '2.13.05.1.01', 'Pemberdayaan Lembaga keMasyarakatan yang Bergerak di Bidang Pemberdayaan Desa dan Lembaga Adat Tingkat Daerah Provinsi serta Pemberdayaan Masyarakat Hukum Adat yang Masyarakat Pelakunya Hukum Adat yang Sama Berada di Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(183, 62, '2.14.02.1.01', 'Pemaduan dan Sinkronisasi Kebijakan Pemerintah Pusat dengan Pemerintah Daerah Provinsi dalam rangka Pengendalian Kuantitas Penduduk', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(184, 63, '2.14.03.1.01', 'Pengembangan Desain Program  Pengelolaan dan Pelaksanaan Advokasi  Komunikasi  Informasi dan Edukasi (KIE) Pengendalian Penduduk dan Keluarga Berencana (KB) Sesuai Kearifan Budaya Lokal', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(185, 64, '2.14.04.1.01', 'Pengelolaan Pelaksanaan Desain Program Pembangunan Keluarga Melalui Pembinaan Ketahanan dan Kesejahteraan Keluarga', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(186, 64, '2.14.04.1.02', 'Pemberdayaan dan Peningkatan Peran serta Organisasi KeMasyarakatan Tingkat Daerah Provinsi dalam Pembangunan Keluarga Melalui Pembinaan Ketahanan dan Kesejahteraan Keluarga', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(187, 65, '2.15.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(188, 65, '2.15.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(189, 65, '2.15.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(190, 65, '2.15.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(191, 65, '2.15.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(192, 65, '2.15.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(193, 65, '2.15.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(194, 66, '2.15.02.1.01', 'Penetapan Rencana Induk Jaringan LLAJ Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(195, 66, '2.15.02.1.02', 'Penyediaan Perlengkapan Jalan di Jalan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(196, 66, '2.15.02.1.03', 'Pengelolaan Terminal Penumpang Tipe B', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(197, 66, '2.15.02.1.05', 'Pelaksanaan Manajemen dan Rekayasa Lalu Lintas untuk Jaringan Jalan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(198, 66, '2.15.02.1.07', 'Audit dan Inspeksi Keselamatan LLAJ di Jalan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(199, 66, '2.15.02.1.09', 'Penetapan Kawasan Perkotaan untuk Pelayanan Angkutan Perkotaan yang Melampaui Batas 1 (satu) Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(200, 66, '2.15.02.1.13', 'Penerbitan Izin Penyelenggaraan Angkutan Orang dalam Trayek Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(201, 67, '2.15.03.1.06', 'Penerbitan Izin Usaha Jasa Terkait Berupa Bongkar Muat Barang  Jasa Pengurusan Transportasi  Angkutan Perairan Pelabuhan  Penyewaan Peralatan Angkutan Laut atau Peralatan Jasa Terkait Dengan Angkutan Laut  Tally Mandiri  dan Depo Peti Kemas', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(202, 67, '2.15.03.1.09', 'Pembangunan  Penerbitan Izin Pembangunan dan Pengoperasian Pelabuhan Pengumpan Regional', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(203, 67, '2.15.03.1.11', 'Penerbitan Izin Usaha untuk Badan Usaha Pelabuhan di Pelabuhan Pengumpan Regional', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(204, 68, '2.15.05.1.06', 'Penetapan Jaringan Pelayanan Perkeretaapian pada Jaringan Jalur Perkeretaapian Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(205, 69, '2.16.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(206, 69, '2.16.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(207, 69, '2.16.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(208, 69, '2.16.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(209, 69, '2.16.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(210, 69, '2.16.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(211, 69, '2.16.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(212, 69, '2.16.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(213, 70, '2.16.02.1.01', 'Pengelolaan Informasi dan Komunikasi Publik Pemerintah Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(214, 71, '2.16.03.1.02', 'Pengelolaan E-government di Lingkup Pemerintah Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(215, 72, '2.17.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(216, 72, '2.17.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(217, 72, '2.17.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(218, 72, '2.17.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(219, 72, '2.17.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(220, 72, '2.17.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(221, 72, '2.17.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(222, 72, '2.17.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(223, 73, '2.17.02.1.01', 'Penerbitan Izin Usaha Simpan Pinjam untuk Koperasi dengan Wilayah Keanggotaan Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(224, 73, '2.17.02.1.02', 'Penerbitan Izin Pembukaan Kantor Cabang  Cabang Pembantu dan Kantor Kas Koperasi Simpan Pinjam untuk Koperasi dengan Wilayah Keanggotaan Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(225, 74, '2.17.03.1.01', 'Pemeriksaan dan Pengawasan Koperasi yang Wilayah Keanggotaannya Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(226, 75, '2.17.04.1.01', 'Penilaian Kesehatan Koperasi Simpan Pinjam/Unit Simpan Pinjam Koperasi yang Wilayah Keanggotaanya Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(227, 75, '2.17.05.1.01', 'Pendidikan dan Latihan Perkoperasian bagi Koperasi yang Wilayah Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(228, 76, '2.17.06.1.01', 'Pemberdayaan dan Perlindungan Koperasi yang Keanggotaannya Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(229, 76, '2.17.07.1.01', 'Pemberdayaan Usaha Kecil yang dilakukan Melalui Pendataan  Kemitraan  Kemudahan Perijinan  Penguatan Kelembagaan dan Koordinasi Dengan Para Pemangku Kepentingan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(230, 77, '2.17.08.1.01', 'Pengembangan Usaha Kecil dengan Orientasi Peningkatan Skala Usaha Menjadi Usaha Menengah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(231, 78, '2.18.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(232, 78, '2.18.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(233, 78, '2.18.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(234, 78, '2.18.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(235, 78, '2.18.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(236, 78, '2.18.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(237, 78, '2.18.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(238, 78, '2.18.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(239, 79, '2.18.02.1.01', 'Penetapan Pemberian Fasilitas/Insentif dibidang Penanaman Modal yang Menjadi Kewenangan Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(240, 79, '2.18.02.1.02', 'Pembuatan Peta Potensi Investasi Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(241, 79, '2.18.03.1.01', 'Penyelenggaraan Promosi Penanaman Modal yang Menjadi Kewenangan Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(242, 80, '2.18.04.1.02', 'Penanaman Modal yang Menurut Ketentuan Peraturan Perundangan-Undangan Menjadi Kewenangan Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(243, 81, '2.18.05.1.01', 'Pengendalian Pelaksanaan Penanaman Modal yang Menjadi Kewenangan Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(244, 81, '2.18.06.1.01', 'Urusan Pengelolaan Data dan Informasi Perizinan dan Non Perizinan Penanaman Modal yang Terintegrasi pada Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(245, 82, '2.19.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(246, 82, '2.19.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(247, 82, '2.19.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(248, 82, '2.19.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(249, 82, '2.19.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(250, 82, '2.19.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(251, 82, '2.19.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(252, 83, '2.19.02.1.01', 'Penyadaran  Pemberdayaan  dan Pengembangan Pemuda dan Kepemudaan Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(253, 83, '2.19.02.1.02', 'Pemberdayaan dan Pengembangan Organisasi Kepemudaan Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(254, 84, '2.19.03.1.01', 'Pembinaan dan Pengembangan Olahraga Pendidikan pada Jenjang Pendidikan yang Menjadi Kewenangan Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(255, 84, '2.19.03.1.02', 'Penyelenggaraan Kejuaraan Olahraga', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(256, 84, '2.19.03.1.04', 'Pembinaan dan Pengembangan Organisasi Olahraga', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(257, 85, '2.19.04.1.01', 'Pembinaan dan Pengembangan Organisasi Kepramukaan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(258, 86, '2.20.02.1.01', 'Penyelenggaraan Statistik Sektoral di Lingkup Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(259, 87, '2.21.02.1.01', 'Penyelenggaraan Persandian untuk Pengamanan Informasi Pemerintah Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(260, 87, '2.21.02.1.02', 'Penetapan Pola Hubungan Komunikasi Sandi antar Perangkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(261, 88, '2.22.02.1.01', 'Pengelolaan Kebudayaan yang Masyarakat Pelakunya Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(262, 89, '2.22.03.1.01', 'Pembinaan Kesenian yang Masyarakat Pelakunya Lintas Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(263, 90, '2.22.04.1.01', 'Pembinaan Sejarah Lokal Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(264, 91, '2.22.05.1.02', 'Pengelolaan Cagar Budaya Peringkat Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(265, 93, '2.23.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(266, 93, '2.23.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(267, 93, '2.23.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(268, 93, '2.23.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(269, 93, '2.23.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(270, 93, '2.23.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(271, 93, '2.23.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(272, 93, '2.23.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(273, 94, '2.23.02.1.01', 'Pengelolaan Perpustakaan Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(274, 94, '2.23.02.1.02', 'Pembudayaan Gemar Membaca Tingkat Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(275, 95, '2.23.03.1.01', 'Pelestarian Karya Cetak dan Karya Rekam Koleksi Daerah di Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(276, 95, '2.23.03.1.02', 'Penerbitan Katalog Induk Daerah dan Bibliografi Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(277, 95, '2.23.03.1.03', 'Pelestarian Naskah Kuno Milik Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(278, 96, '2.24.02.1.01', 'Pengelolaan Arsip Dinamis Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(279, 96, '2.24.02.1.02', 'Pengelolaan Arsip Statis Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(280, 96, '2.24.02.1.03', 'Pengelolaan Simpul Jaringan dalam Sistem Informasi Kearsipan Nasional Tingkat Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(281, 97, '3.25.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(282, 97, '3.25.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(283, 97, '3.25.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(284, 97, '3.25.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(285, 97, '3.25.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(286, 97, '3.25.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(287, 97, '3.25.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(288, 98, '3.25.02.1.01', 'Pengelolaan Ruang Laut Sampai Dengan 12 Mil di Luar Minyak dan Gas Bumi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(289, 98, '3.25.02.1.02', 'Penerbitan Izin Pemanfaatan Ruang Laut di Bawah 12 Mil di Luar Minyak dan Gas Bumi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(290, 98, '3.25.02.1.03', 'Pemberdayaan Masyarakat Pesisir dan Pulau-Pulau Kecil', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(291, 99, '3.25.03.1.01', 'Pengelolaan Penangkapan Ikan di Wilayah Laut Sampai Dengan 12 Mil', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(292, 99, '3.25.03.1.02', 'Pengelolaan Penangkapan Ikan di Wilayah Sungai  Danau  Waduk  Rawa  dan Genangan Air Lainnya yang dapat Diusahakan Lintas Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(293, 99, '3.25.03.1.03', 'Penerbitan Izin Usaha Perikanan Tangkap untuk Kapal Perikanan Berukuran di atas 10 GT sampai dengan 30 GT', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(294, 99, '3.25.03.1.06', 'Penetapan Lokasi Pembangunan serta Pengelolaan Pelabuhan Perikanan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(295, 99, '3.25.03.1.09', 'Pendaftaran Kapal Perikanan di atas 10 GT sampai dengan 30 GT', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(296, 100, '3.25.04.1.05', 'Pengelolaan Pembudidayaan Ikan di Laut', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(297, 100, '3.25.04.1.06', 'Pengelolaan Pembudidayaan Ikan di Perairan Darat', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(298, 101, '3.25.05.1.01', 'Pengawasan Sumber Daya Kelautan dan Perikanan sampai dengan 12 Mil', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(299, 101, '3.25.05.1.02', 'Pengawasan Sumber Daya Perikanan di Wilayah Sungai  Danau  Waduk  Rawa  dan Genangan Air Lainnya yang Dapat Diusahakan Lintas Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(300, 102, '3.25.06.1.01', 'Penerbitan Izin Usaha Pemasaran dan Pengolahan Hasil Perikanan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(301, 102, '3.25.06.1.03', 'Penyediaan dan Penyaluran Bahan Baku Industri Pengolahan Ikan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(302, 103, '3.26.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(303, 103, '3.26.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(304, 103, '3.26.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(305, 103, '3.26.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(306, 103, '3.26.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(307, 103, '3.26.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(308, 103, '3.26.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(309, 103, '3.26.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(310, 104, '3.26.02.1.01', 'Pengelolaan Daya Tarik Wisata Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(311, 104, '3.26.02.1.03', 'Pengelolaan Destinasi Pariwisata Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(312, 104, '3.26.02.1.04', 'Penetapan Tanda Daftar Usaha Pariwisata Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(313, 105, '3.26.03.1.01', 'Pemasaran Pariwisata Dalam dan Luar Negeri Daya Tarik  Destinasi dan Kawasan Strategis Pariwisata Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(314, 106, '3.26.04.1.01', 'Penyediaan Sarana dan Prasarana Kota Kreatif', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(315, 106, '3.26.04.1.02', 'Pengembangan Ekosistem Ekonomi Kreatif ', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(316, 107, '3.26.05.1.01', 'Pelaksanaan Peningkatan Kapasitas Sumber Daya Manusia Pariwisata dan Ekonomi Kreatif Tingkat Lanjutan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(317, 107, '3.26.05.1.02', 'Pengembangan Kapasitas Pelaku Ekonomi Kreatif', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(318, 108, '3.27.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(319, 108, '3.27.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(320, 108, '3.27.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(321, 108, '3.27.01.1.04', 'Administrasi Pendapatan Daerah Kewenangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(322, 108, '3.27.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(323, 108, '3.27.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(324, 108, '3.27.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(325, 108, '3.27.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(326, 109, '3.27.02.1.01', 'Pengawasan Peredaran Sarana Pertanian', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(327, 109, '3.27.02.1.02', 'Pengawasan Mutu  Penyediaan dan Peredaran Benih Tanaman', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(328, 109, '3.27.02.1.04', 'Peningkatan Ketersediaan dan Mutu Benih/Bibit Ternak dan Tanaman Pakan Ternak  Bahan Pakan  serta Pakan Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(329, 109, '3.27.02.1.05', 'Pengendalian dan Pengawasan Penyediaan dan Peredaran Benih/Bibit Ternak dan Tanaman Pakan Ternak serta Pakan Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(330, 109, '3.27.02.1.06', 'Pengawasan Peredaran Obat Hewan di Tingkat Distributor', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(331, 110, '3.27.03.1.01', 'Penataan Prasarana Pertanian', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(332, 111, '3.27.04.1.01', 'Penjaminan Kesehatan Hewan  Penutupan dan Pembukaan Daerah Wabah Penyakit Hewan Menular Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(333, 111, '3.27.04.1.02', 'Pengawasan Pemasukan dan Pengeluaran Hewan dan Produk Hewan Lintas Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(334, 111, '3.27.04.1.03', 'Penerapan Persyaratan Teknis Sertifikasi Zona/Kompartemen Bebas Penyakit dan Unit Usaha Produk Hewan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(335, 111, '3.27.04.1.04', 'Sertifikasi Persyaratan Teknis Kesehatan Masyarakat Veteriner', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(336, 111, '3.27.04.1.05', 'Kesejahteraan Hewan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(337, 112, '3.27.05.1.01', 'Pengendalian dan Penanggulangan Bencana Pertanian Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(338, 113, '3.27.06.1.01', 'Penerbitan Izin Usaha Pertanian yang Kegiatan Usahanya dalam Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(339, 114, '3.27.07.1.02', 'Pengembangan Penerapan Penyuluhan Pertanian', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(340, 114, '3.27.07.1.03', 'Pengembangan Kapasitas Kelembagaan Ekonomi Petani Berbasis Kawasan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(341, 115, '3.28.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(342, 115, '3.28.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(343, 115, '3.28.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(344, 115, '3.28.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(345, 115, '3.28.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(346, 115, '3.28.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(347, 115, '3.28.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL);
INSERT INTO `master_kegiatan` (`id_kegiatan`, `id_program`, `kode_rekening`, `nama_kegiatan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(348, 115, '3.28.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(349, 116, '3.28.03.1.01', 'Pengelolaan Rencana Tata Hutan Kesatuan Pengelolaan Hutan (KPH) Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(350, 116, '3.28.03.1.02', 'Rencana Pengelolaan Kesatuan Pengelolaan Hutan kecuali pada Kesatuan Pengelolaan Hutan Konservasi (KPHK)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(351, 116, '3.28.03.1.03', 'Pemanfaatan Hutan di Kawasan Hutan Produksi dan Hutan Lindung', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(352, 116, '3.28.03.1.04', 'Pelaksanaan Rehabilitasi di Luar Kawasan Hutan Negara', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(353, 116, '3.28.03.1.05', 'Pelaksanaan Perlindungan Hutan di Hutan Lindung dan Hutan Produksi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(354, 116, '3.28.03.1.06', 'Pelaksanaan Pengolahan Hasil Hutan Bukan Kayu (HHBK)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(355, 116, '3.28.03.1.07', 'Pelaksanaan Pengolahan Hasil Hutan Kayu dengan Kapasitas Produksi <6000 m3/Tahun', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(356, 116, '3.28.03.1.09', 'Perbenihan Tanaman Hutan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(357, 117, '3.28.04.1.01', 'Pengelolaan Taman Hutan Raya (TAHURA) Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(358, 117, '3.28.04.1.02', 'Perlindungan Tumbuhan dan Satwa Liar yang Tidak Dilindungi dan/atau Tidak Masuk dalam Lampiran (Appendix) CITES (Convension On International Trade In Endangered Species) untuk Kewenangan Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(359, 117, '3.28.04.1.03', 'Pengelolaan Kawasan Bernilai Ekosistem Penting  Daerah Penyangga Kawasan Suaka Alam dan Kawasan Pelestarian Alam', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(360, 118, '3.28.05.1.01', 'Pelaksanaan Penyuluhan Kehutanan Provinsi dan Pemberdayaan Masyarakat di Bidang Kehutanan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(361, 119, '3.28.06.1.01', 'Pelaksanaan Pengelolaan DAS Lintas Daerah Kabupaten/Kota dan dalam Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(362, 120, '3.29.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(363, 120, '3.29.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(364, 120, '3.29.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(365, 120, '3.29.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(366, 120, '3.29.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(367, 120, '3.29.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(368, 120, '3.29.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(369, 121, '3.29.02.1.01', 'Penetapan Zona Konservasi Air Tanah pada Cekungan Air Tanah dalam Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(370, 121, '3.29.02.1.03', 'Penetapan Nilai Perolehan Air Tanah dalam Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(371, 122, '3.29.03.1.01', 'Penetapan Wilayah Izin Usaha Pertambangan Mineral Bukan Logam dan Batuan dalam 1 (satu) Daerah Provinsi dan Wilayah Laut sampai dengan 12 Mil', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(372, 122, '3.29.03.1.03', 'Penatausahaan Izin Usaha Pertambangan Mineral Bukan Logam dan Batuan dalam rangka Penanaman Modal Dalam Negeri pada Wilayah Izin Usaha Pertambangan Daerah yang Berada dalam 1 (satu) Daerah Provinsi termasuk Wilayah Laut sampai dengan 12 Mil Laut', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(373, 123, '3.29.05.1.03', 'Penatausahaan Izin  Pembinaan  dan Pengawasan Usaha Niaga Bahan Bakar Nabati (Biofuel) sebagai Bahan Bakar Lain dengan Kapasitas Penyediaan sampai dengan 10.000 (sepuluh ribu) Ton Per Tahun', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(374, 123, '3.29.05.1.04', 'Pelaksanaan Konservasi Energi di Wilayah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(375, 124, '3.29.06.1.01', 'Penatausahaan Izin Usaha Penyediaan Tenaga Listrik Non Badan Usaha Milik Negara dan Penjualan Tenaga Listrik serta Penyewaan Jaringan kepada Penyedia Tenaga Listrik dalam Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(376, 124, '3.29.06.1.02', 'Penatausahaan Izin Operasi yang Fasilitas Instalasinya dalam Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(377, 124, '3.29.06.1.05', 'Penatausahaan Izin Usaha Jasa Penunjang Tenaga Listrik bagi Badan Usaha Dalam Negeri/Mayoritas Sahamnya Dimiliki oleh Penanam Modal Dalam Negeri', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(378, 124, '3.29.06.1.06', 'Penganggaran untuk Kelompok Masyarakat Tidak Mampu  Pembangunan Sarana Penyediaan Tenaga Listrik Belum Berkembang  Daerah Terpencil dan Perdesaan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(379, 125, '3.30.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(380, 125, '3.30.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(381, 125, '3.30.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(382, 125, '3.30.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(383, 125, '3.30.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(384, 125, '3.30.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(385, 126, '3.30.03.1.01', 'Pembangunan dan Pengelolaan Pusat Distribusi Regional dan Pusat Distribusi Provinsi serta Pasar Lelang Komoditas', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(386, 127, '3.30.04.1.03', 'Pengawasan Pupuk dan Pestisida Tingkat Daerah Provinsi dalam Melakukan Pelaksanaan Pengadaan  Penyaluran dan Penggunaan Pupuk Bersubsidi di Wilayah Kerjanya', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(387, 129, '3.30.06.1.01', 'Pelaksanaan Perlindungan Konsumen di Seluruh Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(388, 129, '3.30.06.1.02', 'Pelaksanaan Pengujian dan Sertifikasi Mutu Produk di Seluruh Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(389, 129, '3.30.06.1.03', 'Pelaksanaan Pengawasan Barang Beredar dan/atau Jasa di Seluruh Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(390, 130, '3.30.07.1.01', 'Pelaksanaan Promosi Produk Dalam Negeri', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(391, 131, '3.31.02.1.01', 'Penyusunan  Penerapan  dan Evaluasi Rencana Pembangunan Industri Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(392, 132, '3.31.03.1.01', 'Penerbitan Izin Usaha Industri (IUI)  Izin Perluasan Usaha Industri (IPUI)  Izin Usaha Kawasan Industri (IUKI)  dan Izin Perluasan Kawasan Industri (IPKI) Kewenangan Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(393, 133, '3.31.04.1.01', 'Penyediaan Informasi Industri untuk IUI  IPUI  IUKI  dan IPKI Kewenangan Provinsi Berbasis Sistem Informasi Industri Nasional (SIINas)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(394, 135, '3.32.03.1.01', 'Penataan Persebaran Penduduk yang Berasal dari Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(395, 136, '3.32.04.1.01', 'Pengembangan Satuan Permukiman pada Tahap Pemantapan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(396, 137, '4.01.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(397, 137, '4.01.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(398, 137, '4.01.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(399, 137, '4.01.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(400, 137, '4.01.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(401, 137, '4.01.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(402, 137, '4.01.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(403, 137, '4.01.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(404, 137, '4.01.01.1.13', 'Fasilitasi Materi dan Komunikasi Pimpinan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(405, 137, '4.01.01.1.14', 'Fasilitasi Keprotokolan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(406, 138, '4.01.02.1.01', 'Fasilitasi Kelembagaan dan Analisis Jabatan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(407, 138, '4.01.02.1.02', 'Fasilitasi Reformasi Birokrasi dan Akuntabilitas Kinerja', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(408, 139, '4.01.03.1.01', 'Pelaksanaan Tugas Pemerintahan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(409, 139, '4.01.03.1.02', 'Pelaksanaan Otonomi Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(410, 139, '4.01.03.1.03', 'Fasilitasi Kerja Sama Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(411, 140, '4.01.04.1.01', 'Fasilitasi Pembinaan Mental Spiritual', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(412, 140, '4.01.04.1.02', 'Fasilitasi Pengembangan Kesejahteraan Rakyat Pelayanan Dasar', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(413, 140, '4.01.04.1.03', 'Fasilitasi Pengembangan Kesejahteraan Rakyat Non Pelayanan Dasar', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(414, 141, '4.01.05.1.01', 'Fasilitasi Penyusunan Perundang-Undangan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(415, 141, '4.01.05.1.02', 'Fasilitasi Bantuan Hukum', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(416, 142, '4.01.06.1.01', 'Pengelolaan Kebijakan dan Koordinasi Perekonomian', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(417, 142, '4.01.06.1.02', 'Pengelolaan Kebijakan dan Koordinasi Sumber Daya Alam', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(418, 142, '4.01.06.1.03', 'Pengelolaan Kebijakan dan Koordinasi BUMD dan BLUD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(419, 143, '4.01.07.1.01', 'Pengelolaan Pengadaan Barang dan Jasa', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(420, 143, '4.01.07.1.02', 'Pengelolaan Layanan Pengadaan Secara Elektronik', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(421, 143, '4.01.07.1.03', 'Pembinaan dan Advokasi Pengadaan Barang dan Jasa', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(422, 144, '4.01.08.1.01', 'Pengendalian Administrasi Pelaksanaan Pembangunan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(423, 144, '4.01.08.1.02', 'Pelaporan Pelaksanaan Pembangunan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(424, 145, '4.02.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(425, 145, '4.02.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(426, 145, '4.02.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(427, 145, '4.02.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(428, 145, '4.02.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(429, 145, '4.02.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(430, 145, '4.02.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(431, 145, '4.02.01.1.15', 'Layanan Keuangan dan Kesejahteraan DPRD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(432, 145, '4.02.01.1.16', 'Layanan Administrasi DPRD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(433, 146, '4.02.02.1.01', 'Pembentukan Perda dan Peraturan DPRD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(434, 146, '4.02.02.1.02', 'Pembahasan Kebijakan Anggaran', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(435, 146, '4.02.02.1.03', 'Pengawasan Penyelenggaraan Pemerintahan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(436, 146, '4.02.02.1.05', 'Penyerapan dan Penghimpunan Aspirasi Masyarakat', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(437, 146, '4.02.02.1.06', 'Pelaksanaan dan Pengawasan Kode Etik DPRD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(438, 146, '4.02.02.1.08', 'Fasilitasi Tugas DPRD', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(439, 147, '5.01.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(440, 147, '5.01.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(441, 147, '5.01.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(442, 147, '5.01.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(443, 147, '5.01.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(444, 147, '5.01.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(445, 147, '5.01.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(446, 147, '5.01.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(447, 148, '5.01.02.1.01', 'Penyusunan Perencanaan dan Pendanaan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(448, 148, '5.01.02.1.02', 'Analisis Data dan Informasi Pemerintahan Daerah Bidang Perencanaan Pembangunan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(449, 148, '5.01.02.1.03', 'Pengendalian  Evaluasi dan Pelaporan Bidang Perencanaan Pembangunan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(450, 148, '5.01.02.1.04', 'Implementasi Sistem Informasi Pemerintahan Daerah di Bidang Pembangunan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(451, 149, '5.01.03.1.01', 'Koordinasi Perencanaan Bidang Pemerintahan dan Pembangunan Manusia', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(452, 149, '5.01.03.1.02', 'Koordinasi Perencanaan Bidang Perekonomian dan SDA (Sumber Daya Alam)', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(453, 149, '5.01.03.1.03', 'Koordinasi Perencanaan Bidang Infrastruktur dan Kewilayahan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(454, 150, '5.02.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(455, 150, '5.02.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(456, 150, '5.02.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(457, 150, '5.02.01.1.04', 'Administrasi Pendapatan Daerah Kewenangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(458, 150, '5.02.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(459, 150, '5.02.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(460, 150, '5.02.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(461, 150, '5.02.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(462, 151, '5.02.02.1.01', 'Koordinasi dan Penyusunan Rencana Anggaran Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(463, 151, '5.02.02.1.02', 'Pembinaan Pengelolaan Keuangan Daerah Kabupaten/Kota', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(464, 151, '5.02.02.1.03', 'Koordinasi dan Pengelolaan Perbendaharaan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(465, 151, '5.02.02.1.04', 'Koordinasi dan Pelaksanaan Akuntansi dan Pelaporan Keuangan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(466, 151, '5.02.02.1.05', 'Penunjang Urusan Kewenangan Pengelolaan Keuangan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(467, 151, '5.02.02.1.06', 'Pengelolaan Data dan Implementasi Sistem Informasi Pemerintah Daerah Lingkup Keuangan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(468, 152, '5.02.03.1.01', 'Pengelolaan Barang Milik Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(469, 153, '5.02.04.1.01', 'Kegiatan Pengelolaan Pendapatan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(470, 154, '5.03.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(471, 154, '5.03.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(472, 154, '5.03.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(473, 154, '5.03.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(474, 155, '5.03.02.1.01', 'Pengadaan  Pemberhentian dan Informasi Kepegawaian ASN', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(475, 155, '5.03.02.1.02', 'Mutasi dan Promosi ASN', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(476, 155, '5.03.02.1.03', 'Pengembangan Kompetensi ASN', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(477, 155, '5.03.02.1.04', 'Penilaian dan Evaluasi Kinerja Aparatur', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(478, 156, '5.04.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(479, 156, '5.04.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(480, 156, '5.04.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(481, 156, '5.04.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(482, 156, '5.04.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(483, 156, '5.04.01.1.07', 'Pengadaan Barang Milik Daerah PenunjangUrusan Pemerintah Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(484, 156, '5.04.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(485, 157, '5.04.02.1.01', 'Pengembangan Kompetensi Teknis', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(486, 157, '5.04.02.1.02', 'Sertifikasi  Kelembagaan  Pengembangan Kompetensi Manajerial dan Fungsional', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(487, 158, '5.05.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(488, 158, '5.05.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(489, 158, '5.05.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(490, 158, '5.05.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(491, 158, '5.05.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(492, 158, '5.05.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(493, 158, '5.05.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(494, 159, '5.05.02.1.01', 'Penelitian dan Pengembangan Bidang Penyelenggaraan Pemerintahan dan Pengkajian Peraturan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(495, 159, '5.05.02.1.02', 'Penelitian dan Pengembangan Bidang Sosial dan Kependudukan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(496, 159, '5.05.02.1.03', 'Penelitian dan Pengembangan Bidang Ekonomi dan Pembangunan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(497, 159, '5.05.02.1.04', 'Pengembangan Inovasi dan Teknologi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(498, 160, '5.07.01.1.01', 'Perencanaan  Penganggaran  dan Evaluasi Kinerja Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(499, 160, '5.07.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(500, 160, '5.07.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(501, 160, '5.07.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(502, 160, '5.07.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(503, 160, '5.07.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(504, 161, '5.07.02.1.01', 'Pelaksanaan Pelayanan Penghubung', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(505, 162, '6.01.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(506, 162, '6.01.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(507, 162, '6.01.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(508, 162, '6.01.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(509, 162, '6.01.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(510, 162, '6.01.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(511, 163, '6.01.02.1.01', 'Penyelenggaraan Pengawasan Internal', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(512, 163, '6.01.02.1.02', 'Penyelenggaraan Pengawasan dengan Tujuan Tertentu', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(513, 164, '6.01.03.1.01', 'Perumusan Kebijakan Teknis di BidangPengawasan dan Fasilitasi Pengawasan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(514, 164, '6.01.03.1.02', 'Pendampingan dan Asistensi', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(515, 165, '8.01.01.1.02', 'Administrasi Keuangan Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(516, 165, '8.01.01.1.03', 'Administrasi Barang Milik Daerah padaPerangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(517, 165, '8.01.01.1.05', 'Administrasi Kepegawaian Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(518, 165, '8.01.01.1.06', 'Administrasi Umum Perangkat Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(519, 165, '8.01.01.1.08', 'Penyediaan Jasa Penunjang UrusanPemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(520, 165, '8.01.01.1.09', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(521, 167, '8.01.03.1.01', 'Perumusan Kebijakan Teknis dan Pemantapan Pelaksanaan Bidang Pendidikan Politik  Etika Budaya Politik  Peningkatan Demokrasi  Fasilitasi Kelembagaan Pemerintahan  Perwakilan dan Partai Politik  Pemilihan Umum/Pemilihan Umum Kepala Daerah  serta Pemantauan Situasi Politik', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(522, 168, '8.01.04.1.01', 'Perumusan Kebijakan Teknis dan Pemantapan Pelaksanaan Bidang Pemberdayaan dan Pengawasan Organisasi Kemasyarakatan', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL),
(523, 170, '8.01.06.1.01', 'Perumusan Kebijakan Teknis dan Pelaksanaan Pemantapan Kewaspadaan Nasional dan Penanganan Konflik Sosial', 1, 1, '2024-10-15 07:41:34', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_kegiatan_detail`
--

CREATE TABLE `master_kegiatan_detail` (
  `id_kegiatan_detail` int NOT NULL,
  `id_kegiatan` int DEFAULT NULL,
  `id_unker` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_misi_pemda`
--

CREATE TABLE `master_misi_pemda` (
  `id_misi` int NOT NULL,
  `nama_misi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tahun_awal` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tahun_akhir` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_misi_pemda`
--

INSERT INTO `master_misi_pemda` (`id_misi`, `nama_misi`, `deskripsi`, `tahun_awal`, `tahun_akhir`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 'Menciptakan Kehidupan yang religius (agamis), berbudaya, aman dan damai.', NULL, NULL, NULL, 1, 1, '2024-10-08 02:57:19', NULL, NULL),
(2, 'Mewujudkan \"good govenance\" untuk meningkatkan kualitas dan pemerataan pelayanan publik.', NULL, NULL, NULL, 1, 1, '2024-10-08 02:57:19', NULL, NULL),
(3, 'Meningkatkan kualitas sumber daya manusia dan mengembangkan upaya perlindungan anak, pemberdayaan perempuan dan penyandang disabilitas.', NULL, NULL, NULL, 1, 1, '2024-10-08 02:57:19', NULL, NULL),
(4, 'Mengembangkan infrastruktur guna meningkatkan efisiensi produksi dan konektivitas wilayah.', NULL, NULL, NULL, 1, 1, '2024-10-08 02:57:19', NULL, NULL),
(5, 'Membangun kekuatan ekonomi masyarakat berbasis pertanian dan wilayah perdesaan yang seimbang dengan wilayah perkotaan.', NULL, NULL, NULL, 1, 1, '2024-10-08 02:57:19', NULL, NULL),
(6, 'Mewujudkan pembangunan daerah berkelanjutan untuk kesejahteraan bersama.', NULL, NULL, NULL, 1, 1, '2024-10-08 02:57:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_program`
--

CREATE TABLE `master_program` (
  `id_program` int NOT NULL,
  `id_sub_urusan` int DEFAULT NULL,
  `kode_rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_program` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_unker` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_program`
--

INSERT INTO `master_program` (`id_program`, `id_sub_urusan`, `kode_rekening`, `nama_program`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(1, 1, '1.01.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(2, 1, '1.01.02', 'PROGRAM PENGELOLAAN PENDIDIKAN', 1, NULL, NULL, NULL, NULL, NULL),
(3, 1, '1.01.04', 'PROGRAM PENDIDIK DAN TENAGA KEPENDIDIKAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(4, 2, '1.02.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(5, 2, '1.02.02', 'PROGRAM PEMENUHAN UPAYA KESEHATAN PERORANGAN DAN UPAYA KESEHATAN MASYARAKAT ', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(6, 2, '1.02.03', 'PROGRAM PENINGKATAN KAPASITAS SUMBER DAYA MANUSIA KESEHATAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(7, 2, '1.02.04', 'PROGRAM SEDIAAN FARMASI, ALAT KESEHATAN DAN MAKANAN MINUMAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(8, 2, '1.02.05', 'PROGRAM PEMBERDAYAAN MASYARAKAT BIDANG KESEHATAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(9, 3, '1.03.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(10, 3, '1.03.02', 'PROGRAM PENGELOLAAN SUMBER DAYA AIR (SDA)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(11, 3, '1.03.03', 'PROGRAM PENGELOLAAN DAN PENGEMBANGAN SISTEM PENYEDIAAN AIR MINUM', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(12, 3, '1.03.04', 'PROGRAM PENGEMBANGAN SISTEM DAN PENGELOLAAN PERSAMPAHAN REGIONAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(13, 3, '1.03.05', 'PROGRAM PENGELOLAAN DAN PENGEMBANGAN SISTEM AIR LIMBAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(14, 3, '1.03.07', 'PROGRAM PENGEMBANGAN PERMUKIMAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(15, 3, '1.03.08', 'PROGRAM PENATAAN BANGUNAN GEDUNG', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(16, 3, '1.03.09', 'PROGRAM PENATAAN BANGUNAN DAN LINGKUNGANNYA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(17, 3, '1.03.10', 'PROGRAM PENYELENGGARAAN JALAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(18, 3, '1.03.11', 'PROGRAM PENGEMBANGAN JASA KONSTRUKSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(19, 3, '1.03.12', 'PROGRAM PENYELENGGARAAN PENATAAN RUANG', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(20, 4, '1.04.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(21, 4, '1.04.03', 'PROGRAM KAWASAN PERMUKIMAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(22, 4, '1.04.05', 'PROGRAM PENINGKATAN PRASARANA, SARANA DAN UTILITAS UMUM (PSU)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(23, 5, '1.05.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(24, 6, '1.06.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(25, 6, '1.06.03', 'PROGRAM PENANGANAN WARGA NEGARA MIGRAN KORBAN TINDAK KEKERASAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(26, 6, '1.06.04', 'PROGRAM REHABILITASI SOSIAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(27, 6, '1.06.05', 'PROGRAM PERLINDUNGAN DAN JAMINAN SOSIAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(28, 6, '1.06.06', 'PROGRAM PENANGANAN BENCANA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(29, 6, '1.06.07', 'PROGRAM PENGELOLAAN TAMAN MAKAM PAHLAWAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(30, 7, '2.07.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(31, 7, '2.07.02', 'PROGRAM PERENCANAAN TENAGA KERJA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(32, 7, '2.07.03', 'PROGRAM PELATIHAN KERJA DAN PRODUKTIVITAS TENAGA KERJA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(33, 7, '2.07.04', 'PROGRAM PENEMPATAN TENAGA KERJA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(34, 7, '2.07.05', 'PROGRAM HUBUNGAN INDUSTRIAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(35, 7, '2.07.06', 'PROGRAM PENGAWASAN KETENAGAKERJAAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(36, 8, '2.08.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(37, 8, '2.08.02', 'PROGRAM PENGARUSUTAMAAN GENDER DAN PEMBERDAYAAN PEREMPUAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(38, 8, '2.08.03', 'PROGRAM PERLINDUNGAN PEREMPUAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(39, 8, '2.08.04', 'PROGRAM PENINGKATAN KUALITAS KELUARGA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(40, 8, '2.08.05', 'PROGRAM PENGELOLAAN SISTEM DATA GENDER DAN ANAK', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(41, 8, '2.08.06', 'PROGRAM PEMENUHAN HAK ANAK (PHA)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(42, 8, '2.08.07', 'PROGRAM PERLINDUNGAN KHUSUS ANAK', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(43, 9, '2.09.03', 'PROGRAM PENINGKATAN DIVERSIFIKASI DAN KETAHANAN PANGAN MASYARAKAT', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(44, 10, '2.10.10', 'PROGRAM PENATAGUNAAN TANAH ', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(45, 11, '2.11.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(46, 11, '2.11.02', 'PROGRAM Perencanaan LINGKUNGAN HIDUP', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(47, 11, '2.11.03', 'PROGRAM PENGENDALIAN PENCEMARAN DAN/ATAU KERUSAKAN LINGKUNGAN HIDUP', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(48, 11, '2.11.04', 'PROGRAM PENGELOLAAN KEANEKARAGAMAN HAYATI (KEHATI)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(49, 11, '2.11.05', 'PROGRAM PENGENDALIAN BAHAN BERBAHAYA DAN BERACUN (B3) DAN LIMBAH BAHAN BERBAHAYA DAN BERACUN (LIMBAH B3)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(50, 11, '2.11.06', 'PROGRAM PEMBINAAN DAN PENGAWASAN TERHADAP IZIN LINGKUNGAN DAN IZIN PERLINDUNGAN DAN PENGELOLAAN LINGKUNGAN HIDUP (PPLH)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(51, 11, '2.11.08', 'PROGRAM PENINGKATAN PENDIDIKAN, PELATIHAN DAN PENYULUHAN LINGKUNGAN HIDUP UNTUK MASYARAKAT', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(52, 11, '2.11.09', 'PROGRAM PENGHARGAAN LINGKUNGAN HIDUP UNTUK MASYARAKAT', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(53, 11, '2.11.10', 'PROGRAM PENANGANAN PENGADUAN LINGKUNGAN HIDUP', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(54, 11, '2.11.11', 'PROGRAM PENGELOLAAN PERSAMPAHAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(55, 12, '2.12.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(56, 12, '2.12.02', 'PROGRAM PENDAFTARAN PENDUDUK', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(57, 12, '2.12.03', 'PROGRAM PENCATATAN SIPIL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(58, 12, '2.12.04', 'PROGRAM PENGELOLAAN INFORMASI ADMINISTRASI KEPENDUDUKAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(59, 12, '2.12.05', 'PROGRAM PENGELOLAAN PROFIL KEPENDUDUKAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(60, 13, '2.13.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(61, 13, '2.13.03', 'PROGRAM PENINGKATAN KERJA SAMA DESA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(62, 14, '2.14.02', 'PROGRAM PENGENDALIAN PENDUDUK', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(63, 14, '2.14.03', 'PROGRAM PEMBINAAN KELUARGA BERENCANA (KB)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(64, 14, '2.14.04', 'PROGRAM PEMBERDAYAAN DAN PENINGKATAN KELUARGA SEJAHTERA (KS)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(65, 15, '2.15.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(66, 15, '2.15.02', 'PROGRAM PENYELENGGARAAN LALU LINTAS DAN ANGKUTAN JALAN (LLAJ)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(67, 15, '2.15.03', 'PROGRAM PENGELOLAAN PELAYARAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(68, 15, '2.15.05', 'PROGRAM PENGELOLAAN PERKERETAAPIAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(69, 16, '2.16.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(70, 16, '2.16.02', 'PROGRAM PENGELOLAAN INFORMASI DAN KOMUNIKASI PUBLIK', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(71, 16, '2.16.03', 'PROGRAM PENGELOLAAN APLIKASI INFORMATIKA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(72, 16, '2.17.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(73, 16, '2.17.02', 'PROGRAM PELAYANAN IZIN USAHA SIMPAN PINJAM', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(74, 16, '2.17.03', 'PROGRAM PENGAWASAN DAN PEMERIKSAAN KOPERASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(75, 16, '2.17.04', 'PROGRAM PENILAIAN KESEHATAN KSP/USP KOPERASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(76, 16, '2.17.06', 'PROGRAM PEMBERDAYAAN DAN PERLINDUNGAN KOPERASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(77, 16, '2.17.08', 'PROGRAM PENGEMBANGAN UMKM', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(78, 17, '2.18.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(79, 17, '2.18.02', 'PROGRAM PENGEMBANGAN IKLIM PENANAMAN MODAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(80, 17, '2.18.04', 'PROGRAM PELAYANAN PENANAMAN MODAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(81, 17, '2.18.05', 'PROGRAM PENGENDALIAN PELAKSANAAN PENANAMAN MODAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(82, 18, '2.19.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(83, 18, '2.19.02', 'PROGRAM PENGEMBANGAN KAPASITAS DAYA SAING KEPEMUDAAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(84, 18, '2.19.03', 'PROGRAM PENGEMBANGAN DAYA SAING KEOLAHRAGAAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(85, 18, '2.19.04', 'PROGRAM PENGEMBANGAN KAPASITAS KEPRAMUKAAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(86, 19, '2.20.02', 'PROGRAM PENYELENGGARAAN STATISTIK SEKTORAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(87, 20, '2.21.02', 'PROGRAM PENYELENGGARAAN PERSANDIAN UNTUK PENGAMANAN INFORMASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(88, 21, '2.22.02', 'PROGRAM PENGEMBANGAN KEBUDAYAAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(89, 21, '2.22.03', 'PROGRAM PENGEMBANGAN KESENIAN TRADISIONAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(90, 21, '2.22.04', 'PROGRAM PEMBINAAN SEJARAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(91, 21, '2.22.05', 'PROGRAM PELESTARIAN DAN PENGELOLAAN CAGAR BUDAYA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(92, 21, '2.22.06', 'PROGRAM PENGELOLAAN PERMUSEUMAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(93, 22, '2.23.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(94, 22, '2.23.02', 'PROGRAM PEMBINAAN PERPUSTAKAAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(95, 22, '2.23.03', 'PROGRAM PELESTARIAN KOLEKSI NASIONAL DAN NASKAH KUNO', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(96, 23, '2.24.02', 'PROGRAM PENGELOLAAN ARSIP', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(97, 24, '3.25.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(98, 24, '3.25.02', 'PROGRAM PENGELOLAAN KELAUTAN, PESISIR DAN PULAU-PULAU KECIL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(99, 24, '3.25.03', 'PROGRAM PENGELOLAAN PERIKANAN TANGKAP', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(100, 24, '3.25.04', 'PROGRAM PENGELOLAAN PERIKANAN BUDIDAYA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(101, 24, '3.25.05', 'PROGRAM PENGAWASAN SUMBER DAYA KELAUTAN DAN PERIKANAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(102, 24, '3.25.06', 'PROGRAM PENGOLAHAN DAN PEMASARAN HASIL PERIKANAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(103, 25, '3.26.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(104, 25, '3.26.02', 'PROGRAM PENINGKATAN DAYA TARIK DESTINASI PARIWISATA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(105, 25, '3.26.03', 'PROGRAM PEMASARAN PARIWISATA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(106, 25, '3.26.04', 'PROGRAM PENGEMBANGAN EKONOMI KREATIF MELALUI PEMANFAATAN DAN PERLINDUNGAN HAK KEKAYAAN INTELEKTUAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(107, 25, '3.26.05', 'PROGRAM PENGEMBANGAN SUMBER DAYA PARIWISATA DAN EKONOMI KREATIF', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(108, 25, '3.27.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(109, 25, '3.27.02', 'PROGRAM PENYEDIAAN DAN PENGEMBANGAN SARANA PERTANIAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(110, 25, '3.27.03', 'PROGRAM PENYEDIAAN DAN PENGEMBANGAN PRASARANA PERTANIAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(111, 25, '3.27.04', 'PROGRAM PENGENDALIAN KESEHATAN HEWAN DAN KESEHATAN MASYARAKAT VETERINER', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(112, 25, '3.27.05', 'PROGRAM PENGENDALIAN DAN PENANGGULANGAN BENCANA PERTANIAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(113, 25, '3.27.06', 'PROGRAM PERIZINAN USAHA PERTANIAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(114, 25, '3.27.07', 'PROGRAM PENYULUHAN PERTANIAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(115, 26, '3.28.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(116, 26, '3.28.03', 'PROGRAM PENGELOLAAN HUTAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(117, 26, '3.28.04', 'PROGRAM KONSERVASI SUMBER DAYA ALAM HAYATI DAN EKOSISTEMNYA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(118, 26, '3.28.05', 'PROGRAM PENDIDIKAN DAN PELATIHAN, PENYULUHAN DAN PEMBERDAYAAN MASYARAKAT DI BIDANG KEHUTANAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(119, 26, '3.28.06', 'PROGRAM PENGELOLAAN DAERAH ALIRAN SUNGAI (DAS)', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(120, 27, '3.29.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(121, 27, '3.29.02', 'PROGRAM PENGELOLAAN ASPEK KEGEOLOGIAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(122, 27, '3.29.03', 'PROGRAM PENGELOLAAN MINERAL DAN BATUBARA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(123, 27, '3.29.05', 'PROGRAM PENGELOLAAN ENERGI BARU TERBARUKAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(124, 27, '3.29.06', 'PROGRAM PENGELOLAAN KETENAGALISTRIKAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(125, 28, '3.30.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(126, 28, '3.30.03', 'PROGRAM PENINGKATAN SARANA DISTRIBUSI PERDAGANGAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(127, 28, '3.30.04', 'PROGRAM STABILISASI HARGA BARANG Kebutuhan POKOK DAN BARANG PENTING', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(128, 28, '3.30.05', 'PROGRAM PENGEMBANGAN EKSPOR', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(129, 28, '3.30.06', 'PROGRAM STANDARDISASI DAN PERLINDUNGAN KONSUMEN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(130, 28, '3.30.07', 'PROGRAM PENGGUNAAN DAN PEMASARAN PRODUK DALAM NEGERI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(131, 29, '3.31.02', 'PROGRAM Perencanaan DAN PEMBANGUNAN INDUSTRI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(132, 29, '3.31.03', 'PROGRAM PENGENDALIAN IZIN USAHA INDUSTRI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(133, 29, '3.31.04', 'PROGRAM PENGELOLAAN SISTEM INFORMASI INDUSTRI NASIONAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(134, 30, '3.32.02', 'PROGRAM Perencanaan KAWASAN TRANSMIGRASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(135, 30, '3.32.03', 'PROGRAM PEMBANGUNAN KAWASAN TRANSMIGRASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(136, 30, '3.32.04', 'PROGRAM PENGEMBANGAN KAWASAN TRANSMIGRASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(137, 31, '4.01.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(138, 31, '4.01.02', 'PROGRAM PENATAAN ORGANISASI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(139, 31, '4.01.03', 'PROGRAM PEMERINTAHAN DAN OTONOMI DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(140, 31, '4.01.04', 'PROGRAM KESEJAHTERAAN RAKYAT', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(141, 31, '4.01.05', 'PROGRAM FASILITASI DAN KOORDINASI HUKUM', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(142, 31, '4.01.06', 'PROGRAM PEREKONOMIAN DAN PEMBANGUNAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(143, 31, '4.01.07', 'PROGRAM KEBIJAKAN DAN PELAYANAN PENGADAAN BARANG DAN JASA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(144, 31, '4.01.08', 'PROGRAM KEBIJAKAN ADMINISTRASI PEMBANGUNAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(145, 32, '4.02.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(146, 32, '4.02.02', 'PROGRAM DUKUNGAN PELAKSANAAN TUGAS DAN FUNGSI DPRD', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(147, 33, '5.01.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(148, 33, '5.01.02', 'PROGRAM PERENCANAAN PENGENDALIAN, DAN EVALUASI PEMBANGUNAN DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(149, 33, '5.01.03', 'PROGRAM KOORDINASI DAN SINKRONISASI PERENCANAAN PEMBANGUNAN DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(150, 34, '5.02.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(151, 34, '5.02.02', 'PROGRAM PENGELOLAAN KEUANGAN DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(152, 34, '5.02.03', 'PROGRAM PENGELOLAAN BARANG MILIK DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(153, 34, '5.02.04', 'PROGRAM PENGELOLAAN PENDAPATAN DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(154, 35, '5.03.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(155, 35, '5.03.02', 'PROGRAM KEPEGAWAIAN DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(156, 36, '5.04.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(157, 36, '5.04.02', 'PROGRAM PENGEMBANGAN SUMBER DAYA MANUSIA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(158, 37, '5.05.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(159, 37, '5.05.02', 'PROGRAM PENELITIAN DAN PENGEMBANGAN DAERAH', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(160, 38, '5.07.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(161, 38, '5.07.02', 'PROGRAM PELAYANAN PENGHUBUNG', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(162, 39, '6.01.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(163, 39, '6.01.02', 'PROGRAM PENYELENGGARAAN PENGAWASAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(164, 39, '6.01.03', 'PROGRAM PERUMUSAN KEBIJAKAN, PENDAMPINGAN DAN ASISTENSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(165, 40, '8.01.01', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(166, 40, '8.01.02', 'PROGRAM PENGUATAN IDEOLOGI PANCASILA DAN KARAKTER KEBANGSAAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(167, 40, '8.01.03', 'PROGRAM PENINGKATAN PERAN PARTAI POLITIK DAN LEMBAGA PENDIDIKAN MELALUI PENDIDIKAN POLITIK DAN PENGEMBANGAN ETIKA SERTA BUDAYA POLITIK', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(168, 40, '8.01.04', 'PROGRAM PEMBERDAYAAN DAN PENGAWASAN ORGANISASI KEMASYARAKATAN', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(169, 40, '8.01.05', 'PROGRAM PEMBINAAN DAN PENGEMBANGAN KETAHANAN EKONOMI, SOSIAL, DAN BUDAYA', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL),
(170, 40, '8.01.06', 'PROGRAM PENINGKATAN KEWASPADAAN NASIONAL DAN PENINGKATAN KUALITAS DAN FASILITASI PENANGANAN KONFLIK SOSIAL', 1, 1, '2024-10-15 04:54:54', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_program_detail`
--

CREATE TABLE `master_program_detail` (
  `id_program_detail` int NOT NULL,
  `id_program` int DEFAULT NULL,
  `id_unker` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_sub_kegiatan`
--

CREATE TABLE `master_sub_kegiatan` (
  `id_sub_kegiatan` int NOT NULL,
  `id_kegiatan` int DEFAULT NULL,
  `kode_rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_sub_kegiatan` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_unker` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_sub_kegiatan`
--

INSERT INTO `master_sub_kegiatan` (`id_sub_kegiatan`, `id_kegiatan`, `kode_rekening`, `nama_sub_kegiatan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(1, 1, '1.01.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(2, 1, '1.01.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(3, 2, '1.01.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(4, 2, '1.01.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(5, 3, '1.01.01.1.03.0002', 'Pengamanan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(6, 3, '1.01.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(7, 3, '1.01.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(8, 4, '1.01.01.1.05.0005', 'Monitoring  Evaluasi  dan Penilaian KinerjaPegawai', 1, NULL, NULL, NULL, NULL, NULL),
(9, 5, '1.01.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(10, 5, '1.01.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(11, 5, '1.01.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(12, 5, '1.01.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(13, 5, '1.01.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(14, 5, '1.01.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(15, 6, '1.01.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(16, 6, '1.01.01.1.07.0009', 'Pengadaan Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(17, 7, '1.01.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(18, 7, '1.01.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(19, 8, '1.01.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(20, 8, '1.01.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(21, 8, '1.01.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(22, 9, '1.01.02.1.01.0001', 'Pembangunan USB (Unit Sekolah Baru)', 1, NULL, NULL, NULL, NULL, NULL),
(23, 9, '1.01.02.1.01.0003', 'Pembangunan Ruang Guru/Kepala Sekolah/TU', 1, NULL, NULL, NULL, NULL, NULL),
(24, 9, '1.01.02.1.01.0010', 'Pembangunan Ruang Unit Kesehatan Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(25, 9, '1.01.02.1.01.0014', 'Pembangunan Sarana  Prasarana dan Utilitas Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(26, 9, '1.01.02.1.01.0019', 'Rehabilitasi Sedang/Berat Ruang Kelas Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(27, 9, '1.01.02.1.01.0020', 'Rehabilitasi Sedang/Berat Ruang Guru/Kepala Sekolah/TU', 1, NULL, NULL, NULL, NULL, NULL),
(28, 9, '1.01.02.1.01.0024', 'Rehabilitasi Sedang/Berat Ruang Laboratorium Komputer', 1, NULL, NULL, NULL, NULL, NULL),
(29, 9, '1.01.02.1.01.0026', 'Rehabilitasi Sedang/Berat Ruang Laboratorium IPA', 1, NULL, NULL, NULL, NULL, NULL),
(30, 9, '1.01.02.1.01.0027', 'Rehabilitasi Sedang/Berat Ruang Unit Kesehatan Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(31, 9, '1.01.02.1.01.0028', 'Rehabilitasi Sedang/Berat Perpustakaan Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(32, 9, '1.01.02.1.01.0041', 'Pengadaaan Alat Praktik dan Peraga Peserta Didik', 1, NULL, NULL, NULL, NULL, NULL),
(33, 9, '1.01.02.1.01.0045', 'Penyediaan Biaya Personil Peserta Didik Sekolah Menengah Atas', 1, NULL, NULL, NULL, NULL, NULL),
(34, 9, '1.01.02.1.01.0049', 'Pembinaan Minat  Bakat dan Kreativitas Siswa', 1, NULL, NULL, NULL, NULL, NULL),
(35, 9, '1.01.02.1.01.0052', 'Pembinaan Kelembagaan dan Manajemen Sekolah Menengah Atas', 1, NULL, NULL, NULL, NULL, NULL),
(36, 9, '1.01.02.1.01.0053', 'Pengelolaan Dana BOS Sekolah Menengah Atas', 1, NULL, NULL, NULL, NULL, NULL),
(37, 9, '1.01.02.1.01.0067', 'Pembangunan Rumah Dinas Kepala Sekolah/Guru/Penjaga Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(38, 9, '1.01.02.1.01.0068', 'Rehabilitasi sedang/berat Sarana  Prasarana dan Utilitas Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(39, 9, '1.01.02.1.01.0072', 'Pembangunan Ruang Kelas Baru', 1, NULL, NULL, NULL, NULL, NULL),
(40, 9, '1.01.02.1.01.0073', 'Rehabilitasi sedang/berat Rumah Dinas Kepala Sekolah/Guru/Penjaga Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(41, 9, '1.01.02.1.01.07', 'Pembangunan Ruang Laboratorium Komputer', 1, NULL, NULL, NULL, NULL, NULL),
(42, 9, '1.01.02.1.01.09', 'Pembangunan Ruang Laboratorium IPA', 1, NULL, NULL, NULL, NULL, NULL),
(43, 10, '1.01.02.1.02.0004', 'Pembangunan Ruang Praktik Siswa', 1, NULL, NULL, NULL, NULL, NULL),
(44, 10, '1.01.02.1.02.0005', 'Pembangunan Ruang Laboratorium', 1, NULL, NULL, NULL, NULL, NULL),
(45, 10, '1.01.02.1.02.0006', 'Pembangunan Ruang Unit Kesehatan Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(46, 10, '1.01.02.1.02.0007', 'Pembangunan Perpustakaan Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(47, 10, '1.01.02.1.02.0010', 'Pembangunan Sarana  Prasarana dan Utilitas Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(48, 10, '1.01.02.1.02.0016', 'Rehabilitasi Ruang Guru/Kepala Sekolah/TU', 1, NULL, NULL, NULL, NULL, NULL),
(49, 10, '1.01.02.1.02.0018', 'Rehabilitasi Ruang Laboratorium', 1, NULL, NULL, NULL, NULL, NULL),
(50, 10, '1.01.02.1.02.0033', 'Pengadaaan Alat Praktik dan Peraga Peserta Didik', 1, NULL, NULL, NULL, NULL, NULL),
(51, 10, '1.01.02.1.02.0037', 'Penyediaan Biaya Personil Peserta Didik Sekolah Menengah Kejuruan', 1, NULL, NULL, NULL, NULL, NULL),
(52, 10, '1.01.02.1.02.0041', 'Pembinaan Minat  Bakat dan Kreativitas Siswa', 1, NULL, NULL, NULL, NULL, NULL),
(53, 10, '1.01.02.1.02.0045', 'Pembinaan Kelembagaan dan Manajemen Sekolah Menengah Kejuruan', 1, NULL, NULL, NULL, NULL, NULL),
(54, 10, '1.01.02.1.02.0062', 'Rehabilitasi sedang/berat Sarana  Prasarana dan Utilitas Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(55, 10, '1.01.02.1.02.0063', 'Rehabilitasi Ruang Praktik Peserta Didik', 1, NULL, NULL, NULL, NULL, NULL),
(56, 10, '1.01.02.1.02.0069', 'Rehabilitasi sedang/berat Ruang Kelas Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(57, 10, '1.01.02.1.02.0075', 'Rehabilitasi sedang/berat Perpustakaan Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(58, 11, '1.01.02.1.03.0004', 'Pembangunan Ruang Unit Kesehatan Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(59, 11, '1.01.02.1.03.0008', 'Pembangunan Sarana  Prasarana dan Utilitas Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(60, 11, '1.01.02.1.03.0010', 'Pembangunan Kantin Sekolah', 1, NULL, NULL, NULL, NULL, NULL),
(61, 11, '1.01.02.1.03.0044', 'Penyediaan Biaya Personil Peserta Didik Pendidikan Khusus', 1, NULL, NULL, NULL, NULL, NULL),
(62, 11, '1.01.02.1.03.0048', 'Pembinaan Minat  Bakat dan Kreativitas Siswa', 1, NULL, NULL, NULL, NULL, NULL),
(63, 11, '1.01.02.1.03.0051', 'Pembinaan Kelembagaan dan Manajemen Sekolah Pendidikan Khusus', 1, NULL, NULL, NULL, NULL, NULL),
(64, 11, '1.01.02.1.03.0052', 'Pengelolaan Dana BOS Sekolah Pendidikan Khusus', 1, NULL, NULL, NULL, NULL, NULL),
(65, 11, '1.01.02.1.03.0070', 'Pembangunan Ruang Kelas Baru', 1, NULL, NULL, NULL, NULL, NULL),
(66, 12, '1.01.04.1.01.0001', 'Perhitungan dan Pemetaan Pendidik dan Tenaga Kependidikan Satuan Pendidikan Menengah dan Pendidikan Khusus', 1, NULL, NULL, NULL, NULL, NULL),
(67, 12, '1.01.04.1.01.0002', 'Penataan Pendistribusian Pendidik dan Tenaga Kependidikan Satuan Pendidikan Menengah dan Pendidikan Khusus', 1, NULL, NULL, NULL, NULL, NULL),
(68, 13, '1.02.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(69, 13, '1.02.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(70, 13, '1.02.01.1.01.0003', 'Koordinasi dan Penyusunan DokumenPerubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(71, 13, '1.02.01.1.01.0004', 'Koordinasi dan Penyusunan DPA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(72, 13, '1.02.01.1.01.0005', 'Koordinasi dan Penyusunan Perubahan DPA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(73, 13, '1.02.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(74, 13, '1.02.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(75, 14, '1.02.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(76, 14, '1.02.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(77, 14, '1.02.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(78, 14, '1.02.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(79, 14, '1.02.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(80, 14, '1.02.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(81, 14, '1.02.01.1.02.0008', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 1, NULL, NULL, NULL, NULL, NULL),
(82, 15, '1.02.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(83, 15, '1.02.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(84, 16, '1.02.01.1.05.0001', 'Peningkatan Sarana dan Prasarana DisiplinPegawai', 1, NULL, NULL, NULL, NULL, NULL),
(85, 16, '1.02.01.1.05.0003', 'Pendataan dan Pengolahan AdministrasiKepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(86, 16, '1.02.01.1.05.0005', 'Monitoring  Evaluasi  dan Penilaian KinerjaPegawai', 1, NULL, NULL, NULL, NULL, NULL),
(87, 16, '1.02.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(88, 16, '1.02.01.1.05.0010', 'Sosialisasi Peraturan Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(89, 17, '1.02.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(90, 17, '1.02.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(91, 17, '1.02.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(92, 17, '1.02.01.1.06.0004', 'Penyediaan Bahan Logistik Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(93, 17, '1.02.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(94, 17, '1.02.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(95, 17, '1.02.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(96, 18, '1.02.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(97, 18, '1.02.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(98, 18, '1.02.01.1.07.0009', 'Pengadaan Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(99, 18, '1.02.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(100, 19, '1.02.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(101, 19, '1.02.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(102, 20, '1.02.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(103, 20, '1.02.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(104, 20, '1.02.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(105, 20, '1.02.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(106, 21, '1.02.01.1.10.0001', 'Pelayanan dan Penunjang Pelayanan BLUD', 1, NULL, NULL, NULL, NULL, NULL),
(107, 22, '1.02.02.1.01.0004', 'Pengembangan Fasilitas Kesehatan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(108, 22, '1.02.02.1.01.0006', 'Pengembangan Pendekatan Pelayanan Kesehatan di DTPK (Pelayanan Kesehatan Bergerak  Gugus Pulau  Pelayanan Kesehatan Berbasis Telemedicine  dll)', 1, NULL, NULL, NULL, NULL, NULL),
(109, 22, '1.02.02.1.01.0008', 'Rehabilitasi dan Pemeliharaan Fasilitas Kesehatan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(110, 22, '1.02.02.1.01.0010', 'Pengadaan Alat Kesehatan/Alat Penunjang Medik Fasilitas Layanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(111, 22, '1.02.02.1.01.0013', 'Pengadaan dan Pemeliharaan Alat Kalibrasi', 1, NULL, NULL, NULL, NULL, NULL),
(112, 22, '1.02.02.1.01.0016', 'Pengadaan Barang Penunjang Operasional Rumah Sakit', 1, NULL, NULL, NULL, NULL, NULL),
(113, 22, '1.02.02.1.01.0017', 'Pemeliharaan Alat Kesehatan/Alat Penunjang Medik Fasilitas Layanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(114, 22, '1.02.02.1.01.0020', 'Penyediaan Telemedicine di Fasilitas Pelayanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(115, 22, '1.02.02.1.01.0026', 'Pengembangan Rumah Sakit', 1, NULL, NULL, NULL, NULL, NULL),
(116, 22, '1.02.02.1.01.0027', 'Pengadaan Obat  Bahan Habis Pakai  Bahan Medis Habis Pakai   Vaksin  Makanan dan Minuman di Fasilitas Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(117, 22, '1.02.02.1.01.11', 'Pengadaan Sarana di Fasilitas Layanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(118, 22, '1.02.02.1.01.12', 'Pengadaaaan Prasarana Fasilitas Layanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(119, 22, '1.02.02.1.01.14', 'Pengadaan Bahan Habis Pakai Lainnya (Sprei  Handuk dan Habis Pakai Lainnya)', 1, NULL, NULL, NULL, NULL, NULL),
(120, 22, '1.02.02.1.01.15', 'Pengadaan dan Pemeliharaan Alat-Alat Kesehatan/Peralatan Laboratorium Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(121, 22, '1.02.02.1.01.18', 'Pemeliharaan Sarana Fasilitas Layanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(122, 22, '1.02.02.1.01.19', 'Pemeliharaan Prasarana Fasilitas Layanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(123, 22, '1.02.02.1.01.23', 'Distribusi Bahan Medis Habis Pakai (BMHP) ke Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(124, 23, '1.02.02.1.02.0001', 'Pengelolaan Pelayanan Kesehatan bagi Penduduk Terdampak Krisis Kesehatan Akibat Bencana dan/atau Berpotensi Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(125, 23, '1.02.02.1.02.0002', 'Pengelolaan Pelayanan Kesehatan bagi Penduduk pada Kondisi Kejadian Luar Biasa (KLB)', 1, NULL, NULL, NULL, NULL, NULL),
(126, 23, '1.02.02.1.02.0003', 'Pengelolaan Pelayanan Kesehatan Ibu dan Anak', 1, NULL, NULL, NULL, NULL, NULL),
(127, 23, '1.02.02.1.02.0004', 'Pengelolaan Pelayanan Kesehatan Usia Produktif', 1, NULL, NULL, NULL, NULL, NULL),
(128, 23, '1.02.02.1.02.0005', 'Pengelolaan Pelayanan Kesehatan Usia Lanjut', 1, NULL, NULL, NULL, NULL, NULL),
(129, 23, '1.02.02.1.02.0006', 'Pengelolaan Pelayanan Kesehatan Gizi Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(130, 23, '1.02.02.1.02.0007', 'Pengelolaan Pelayanan Kesehatan Kerja dan Olahraga', 1, NULL, NULL, NULL, NULL, NULL),
(131, 23, '1.02.02.1.02.0008', 'Pengelolaan Pelayanan Kesehatan Lingkungan', 1, NULL, NULL, NULL, NULL, NULL),
(132, 23, '1.02.02.1.02.0009', 'Pengelolaan Pelayanan Promosi Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(133, 23, '1.02.02.1.02.0010', 'Pengelolaan Pelayanan Kesehatan Tradisonal  Akupuntur  Asuhan Mandiri dan Tradisional Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(134, 23, '1.02.02.1.02.0012', 'Pengelolaan Pelayanan Kesehatan Haji', 1, NULL, NULL, NULL, NULL, NULL),
(135, 23, '1.02.02.1.02.0013', 'Pengelolaan Pelayanan Kesehatan Orang dengan Masalah Kesehatan Jiwa (ODMK)', 1, NULL, NULL, NULL, NULL, NULL),
(136, 23, '1.02.02.1.02.0014', 'Pengelolaan Pelayanan Kesehatan Orang dengan Kecanduan NAPZA', 1, NULL, NULL, NULL, NULL, NULL),
(137, 23, '1.02.02.1.02.0016', 'Pengelolaan Jaminan Kesehatan Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(138, 23, '1.02.02.1.02.0017', 'Pengelolaan Surveilans Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(139, 23, '1.02.02.1.02.0018', 'Koordinasi dan Sinkronisasi Penerapan SPM Bidang Kesehatan Lintas Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(140, 23, '1.02.02.1.02.0020', 'Verifikasi dan Penilaian Kelayakan Puskesmas untuk Registrasi Puskesmas', 1, NULL, NULL, NULL, NULL, NULL),
(141, 23, '1.02.02.1.02.0021', 'Investigasi Lanjutan Kejadian Ikutan Pasca Imunisasi dan Pemberian Obat Massal oleh Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(142, 23, '1.02.02.1.02.0022', 'Operasional Pelayanan Rumah Sakit', 1, NULL, NULL, NULL, NULL, NULL),
(143, 23, '1.02.02.1.02.0023', 'Penyediaan dan Pengelolaan Sistem Penanganan Gawat Darurat Terpadu (SPGDT)', 1, NULL, NULL, NULL, NULL, NULL),
(144, 23, '1.02.02.1.02.0024', 'Pengelolaan Rujukan dan Rujuk Balik', 1, NULL, NULL, NULL, NULL, NULL),
(145, 23, '1.02.02.1.02.0025', 'Pengambilan dan Pengiriman Spesimen Penyakit Potensial KLB ke Lab Rujukan/Nasional', 1, NULL, NULL, NULL, NULL, NULL),
(146, 23, '1.02.02.1.02.0030', 'Pengelolaan Pelayanan Kesehatan Dasar Melalui Pendekatan Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(147, 23, '1.02.02.1.02.15', 'Pengelolaan Pelayanan Kesehatan Khusus', 1, NULL, NULL, NULL, NULL, NULL),
(148, 23, '1.02.02.1.02.27', 'Pendampingan Fasilitas Pelayanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(149, 23, '1.02.02.1.02.28', 'Pengelolaan Penelitian Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(150, 24, '1.02.02.1.03.0002', 'Pengelolaan Sistem Informasi Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(151, 24, '1.02.02.1.03.01', 'Pengelolaan Data dan Informasi Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(152, 25, '1.02.02.1.04.0001', 'Pengendalian dan Pengawasan serta Tindak Lanjut Perizinan Rumah Sakit Kelas B dan Fasilitas Pelayanan Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(153, 25, '1.02.02.1.04.0002', 'Peningkatan Tata Kelola Rumah Sakit', 1, NULL, NULL, NULL, NULL, NULL),
(154, 25, '1.02.02.1.04.0003', 'Peningkatan Mutu Pelayanan Fasilitas Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(155, 26, '1.02.03.1.01.0002', 'Distribusi dan Pemerataan Sumber Daya Manusia Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(156, 27, '1.02.03.1.02.0001', 'Peningkatan Kompetensi dan Kualifikasi Sumber Daya Manusia Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(157, 27, '1.02.03.1.02.0002', 'Pembinaan dan Pengawasan Sumber Daya Manusia Kesehatan', 1, NULL, NULL, NULL, NULL, NULL),
(158, 28, '1.02.04.1.01.02', 'Penyediaan dan Pengelolaan Data Perizinan Pengakuan PBF Cabang dan Cabang PAK Berbasis Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(159, 29, '1.02.04.1.02.0001', 'Pengendalian dan Pengawasan serta Tindak Lanjut Penerbitan Izin Usaha Kecil Obat Tradisional', 1, NULL, NULL, NULL, NULL, NULL),
(160, 29, '1.02.04.1.02.02', 'Penyediaan dan Pengelolaan Data Perizinan dan Tindak Lanjut Pengawasan Izin UKOT Berbasis Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(161, 30, '1.02.05.1.01.0001', 'Peningkatan Upaya Advokasi Kesehatan  Pemberdayaan  Penggalangan Kemitraan  Peran serta Masyarakat dan Lintas Sektor Tingkat Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(162, NULL, '1.02.05.1.02.0001', 'Penyelenggaraan Promosi Kesehatan dan Perilaku Hidup Bersih dan Sehat', 1, NULL, NULL, NULL, NULL, NULL),
(163, NULL, '1.02.05.1.02.0002', 'Penumbuhan Kesadaran Keluarga dalam Peningkatan Derajat Kesehatan Keluarga dan Lingkungan dengan Menerapkan Perilaku Hidup Bersih dan Sehat', 1, NULL, NULL, NULL, NULL, NULL),
(164, 31, '1.02.05.1.03.0001', 'Bimbingan Teknis dan Supervisi UKBM', 1, NULL, NULL, NULL, NULL, NULL),
(165, NULL, '1.03.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(166, NULL, '1.03.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(167, NULL, '1.03.01.1.01.0003', 'Koordinasi dan Penyusunan DokumenPerubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(168, NULL, '1.03.01.1.01.0004', 'Koordinasi dan Penyusunan DPA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(169, NULL, '1.03.01.1.01.0005', 'Koordinasi dan Penyusunan Perubahan DPA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(170, NULL, '1.03.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(171, NULL, '1.03.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(172, 32, '1.03.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(173, 32, '1.03.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(174, 32, '1.03.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(175, 32, '1.03.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(176, 33, '1.03.01.1.03.0002', 'Pengamanan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(177, 33, '1.03.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(178, 33, '1.03.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(179, 34, '1.03.01.1.05.0002', 'Pengadaan Pakaian Dinas Beserta AtributKelengkapannya', 1, NULL, NULL, NULL, NULL, NULL),
(180, 34, '1.03.01.1.05.0003', 'Pendataan dan Pengolahan AdministrasiKepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(181, 34, '1.03.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(182, 34, '1.03.01.1.05.0010', 'Sosialisasi Peraturan Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(183, 35, '1.03.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(184, 35, '1.03.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(185, 35, '1.03.01.1.06.0004', 'Penyediaan Bahan Logistik Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(186, 35, '1.03.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(187, 35, '1.03.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(188, 35, '1.03.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(189, 35, '1.03.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(190, 35, '1.03.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(191, 35, '1.03.01.1.06.0011', 'Dukungan Pelaksanaan Sistem Pemerintahan Berbasis Elektronik pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(192, 36, '1.03.01.1.07.0003', 'Pengadaan Alat Besar', 1, NULL, NULL, NULL, NULL, NULL),
(193, 36, '1.03.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(194, 36, '1.03.01.1.07.0009', 'Pengadaan Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(195, 37, '1.03.01.1.08.0001', 'Penyediaan Jasa Surat Menyurat', 1, NULL, NULL, NULL, NULL, NULL),
(196, 37, '1.03.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(197, 37, '1.03.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(198, 38, '1.03.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(199, 38, '1.03.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(200, 38, '1.03.01.1.09.0003', 'Penyediaan Jasa Pemeliharaan  BiayaPemeliharaan dan Perizinan Alat Besar', 1, NULL, NULL, NULL, NULL, NULL),
(201, 38, '1.03.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(202, 38, '1.03.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(203, NULL, '1.03.02.1.01.0009', 'Pembangunan Tanggul Sungai', 1, NULL, NULL, NULL, NULL, NULL),
(204, NULL, '1.03.02.1.01.0075', 'Koordinasi dan Sinkronisasi Peningkatan Kapasitas Kelembagaan Pengelolaan Sumber Daya Air Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(205, NULL, '1.03.02.1.01.0079', 'Normalisasi/Restorasi Sungai', 1, NULL, NULL, NULL, NULL, NULL),
(206, NULL, '1.03.02.1.01.0087', 'Evaluasi dan Rekomendasi Teknis (Rekomtek) Pemanfaatan Sumber Daya Air Wilayah Sungai Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(207, NULL, '1.03.02.1.01.0090', 'Pembinaan dan Pemberdayaan Kelembagaan Pengelolaan Sumber Daya Air Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(208, NULL, '1.03.02.1.01.0096', 'Pembangunan Seawall dan Bangunan Pengaman Pantai Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(209, NULL, '1.03.02.1.01.0101', 'Operasi dan Pemeliharaan Sungai', 1, NULL, NULL, NULL, NULL, NULL),
(210, NULL, '1.03.02.1.01.0103', 'Pengelolaan Hidrologi dan Kualitas Air Wilayah Sungai Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(211, NULL, '1.03.02.1.01.0116', 'Pembangunan Sumur Air Tanah untuk Air Baku', 1, NULL, NULL, NULL, NULL, NULL),
(212, NULL, '1.03.02.1.01.0117', 'Penyusunan Pola dan Rencana Pengelolaan SDA WS Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(213, NULL, '1.03.02.1.01.0119', 'Penyusunan Rencana Teknis dan Dokumen Lingkungan Hidup untuk Konstruksi Air Tanah dan Air Baku', 1, NULL, NULL, NULL, NULL, NULL),
(214, NULL, '1.03.02.1.01.0120', 'Pembangunan Embung dan Penampung Air Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(215, NULL, '1.03.02.1.01.0121', 'Penyusunan Rencana Teknis dan Dokumen Lingkungan Hidup untuk Konstruksi Bendungan  Embung  dan Bangunan Penampung Air Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(216, NULL, '1.03.02.1.01.0122', 'Penyusunan Rencana Teknis dan Dokumen Lingkungan Hidup untuk Konstruksi Pengendali Banjir  Lahar  dan Pengaman Pantai', 1, NULL, NULL, NULL, NULL, NULL),
(217, 39, '1.03.02.1.02.0003', 'Pembangunan Bendung Irigasi', 1, NULL, NULL, NULL, NULL, NULL),
(218, 39, '1.03.02.1.02.0014', 'Rehabilitasi Jaringan Irigasi Permukaan', 1, NULL, NULL, NULL, NULL, NULL),
(219, 39, '1.03.02.1.02.0022', 'Operasi dan Pemeliharaan Bendung Irigasi', 1, NULL, NULL, NULL, NULL, NULL),
(220, 39, '1.03.02.1.02.0032', 'Penyusunan Rencana Teknis dan Dokumen Lingkungan Hidup untuk Konstruksi Irigasi dan Rawa', 1, NULL, NULL, NULL, NULL, NULL),
(221, 39, '1.03.02.1.02.0037', 'Pengelolaan dan Pengawasan Alokasi Air di Daerah Irigasi', 1, NULL, NULL, NULL, NULL, NULL),
(222, 40, '1.03.03.1.01.0015', 'Penyusunan Rencana  Kebijakan  Strategi dan Teknis Sistem Penyediaan Air Minum (SPAM)', 1, NULL, NULL, NULL, NULL, NULL),
(223, 40, '1.03.03.1.01.0021', 'Fasilitasi Kerja Sama Penyelenggaraan Sistem Penyediaan Air Minum (SPAM) Lintas Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(224, 40, '1.03.03.1.01.12', 'Pembentukan Organisasi Pengelola SPAM Lintas Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(225, 41, '1.03.04.1.01.0016', 'Penyusunan Rencana  Kebijakan  Strategi dan Teknis Sistem Pengelolaan Persampahan', 1, NULL, NULL, NULL, NULL, NULL),
(226, 42, '1.03.05.1.01.0015', 'Penyusunan Rencana  Kebijakan  Strategi dan Teknis Sistem Pengelolaan Air Limbah Domestik (SPALD)', 1, NULL, NULL, NULL, NULL, NULL),
(227, 43, '1.03.07.1.01.03', 'Pengawasan dan Pengendalian Infrastruktur Kawasan Permukiman di Kawasan Strategis Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(228, 43, '1.03.07.1.01.04', 'Pembinaan Penyelenggaraan Infrastruktur Kawasan Permukiman di Kawasan Strategis Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(229, 44, '1.03.08.1.01.0016', 'Pengubahsuaian Bangunan Gedung untuk Kepentingan Strategis Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(230, 44, '1.03.08.1.01.0019', 'Pembangunan  Pemanfaatan  Pelestariaan dan Pembongkaran Bangunan Gedung untuk Kepentingan Strategis Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(231, 45, '1.03.09.1.01.0008', 'Penataan Bangunan dan Lingkungan Kawasan Cagar Budaya  Kawasan Pariwisata  Kawasan Sistem Perkotaan Nasional dan Kawasan Strategis Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(232, 45, '1.03.09.1.01.0009', 'Penyusunan Rencana dan Teknis Penataan Bangunan dan Lingkungan di Kawasan Strategis Daerah Provinsi dan Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(233, 45, '1.03.09.1.01.0010', 'Supervisi Penataan Bangunan dan Lingkungan Kawasan Cagar Budaya  Kawasan Pariwisata  Kawasan Sistem Perkotaan Nasional dan Kawasan Strategis Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(234, 46, '1.03.10.1.01.0024', 'Pengawasan Penyelenggaraan Jalan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(235, 46, '1.03.10.1.01.0025', 'Rehabilitasi Jembatan', 1, NULL, NULL, NULL, NULL, NULL),
(236, 46, '1.03.10.1.01.0027', 'Pemeliharaan Berkala Jembatan', 1, NULL, NULL, NULL, NULL, NULL),
(237, 46, '1.03.10.1.01.0028', 'Pemantauan dan Evaluasi Penyelenggaraan Jalan/Jembatan', 1, NULL, NULL, NULL, NULL, NULL),
(238, 46, '1.03.10.1.01.0030', 'Rehabilitasi Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(239, 46, '1.03.10.1.01.0031', 'Rekonstruksi Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(240, 46, '1.03.10.1.01.0032', 'Pembangunan Jembatan', 1, NULL, NULL, NULL, NULL, NULL),
(241, 46, '1.03.10.1.01.0033', 'Pemeliharaan Rutin Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(242, 46, '1.03.10.1.01.0035', 'Pelebaran Jalan Menambah Lajur', 1, NULL, NULL, NULL, NULL, NULL),
(243, 46, '1.03.10.1.01.0036', 'Penggantian Jembatan', 1, NULL, NULL, NULL, NULL, NULL),
(244, 46, '1.03.10.1.01.0038', 'Pemeliharaan Berkala Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(245, 46, '1.03.10.1.01.0040', 'Pelebaran Jalan Menuju Standar', 1, NULL, NULL, NULL, NULL, NULL),
(246, 46, '1.03.10.1.01.0041', 'Penyusunan Rencana  Kebijakan  Strategi dan Teknis Pengembangan Jaringan Jalan serta Perencanaan Teknis Penyelenggaraan Jalan dan Jembatan', 1, NULL, NULL, NULL, NULL, NULL),
(247, 46, '1.03.10.1.01.0042', 'Pembangunan Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(248, 46, '1.03.10.1.01.0044', 'Pengelolaan Leger Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(249, 46, '1.03.10.1.01.02', 'Pembebasan Lahan/Tanah untuk Penyelenggaraan Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(250, 47, '1.03.11.1.01.0011', 'Pelatihan Tenaga Kerja Konstruksi Kualifikasi Ahli', 1, NULL, NULL, NULL, NULL, NULL),
(251, 47, '1.03.11.1.01.0012', 'Pembinaan dan Peningkatan Kapasitas Kelembagaan Konstruksi', 1, NULL, NULL, NULL, NULL, NULL),
(252, 48, '1.03.11.1.02.0006', 'Operasionalisasi Layanan Informasi Jasa Konstruksi', 1, NULL, NULL, NULL, NULL, NULL),
(253, 49, '1.03.12.1.01.02', 'Pelaksanaan Persetujuan Substansi  Evaluasi dan Penetapan RRTR Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(254, 50, '1.03.12.1.02.03', 'Evaluasi Rancangan Peraturan Daerah tentang RTRW dan RRTR Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(255, 51, '1.03.12.1.03.0007', 'Pelaksanaan Sinkronisasi Program Pemanfaatan Ruang', 1, NULL, NULL, NULL, NULL, NULL),
(256, 52, '1.03.12.1.04.0004', 'Koordinasi Pelaksanaan Penataan Ruang', 1, NULL, NULL, NULL, NULL, NULL),
(257, 53, '1.04.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(258, 54, '1.04.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(259, 54, '1.04.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(260, 54, '1.04.01.1.02.0008', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 1, NULL, NULL, NULL, NULL, NULL),
(261, 55, '1.04.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(262, 55, '1.04.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(263, 56, '1.04.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(264, 57, '1.04.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(265, 57, '1.04.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(266, 57, '1.04.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(267, 57, '1.04.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(268, 57, '1.04.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(269, 57, '1.04.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(270, 57, '1.04.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(271, 58, '1.04.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(272, 59, '1.04.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(273, 59, '1.04.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(274, 60, '1.04.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(275, 60, '1.04.01.1.09.0007', 'Pemeliharaan Aset Tetap Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(276, 60, '1.04.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(277, 61, '1.04.03.1.01.0014', 'Pembinaan Kelompok Swadaya Masyarakat di Permukiman Kumuh', 1, NULL, NULL, NULL, NULL, NULL),
(278, 61, '1.04.03.1.01.0017', 'Koordinasi dan Sinkronisasi Penyelenggaraan Kawasan Permukiman', 1, NULL, NULL, NULL, NULL, NULL),
(279, 62, '1.04.03.1.02.0003', 'Perbaikan Rumah Tidak Layak Huni dalam Kawasan Permukiman dengan Luas 10 (Sepuluh) Ha sampai dengan di Bawah 15 (Lima Belas) Ha', 1, NULL, NULL, NULL, NULL, NULL),
(280, 63, '1.04.05.1.01.0001', 'Perencanaan Penyediaan PSU Permukiman', 1, NULL, NULL, NULL, NULL, NULL),
(281, 64, '1.05.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(282, 64, '1.05.01.1.01.0004', 'Koordinasi dan Penyusunan DPA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(283, 64, '1.05.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(284, 64, '1.05.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(285, 65, '1.05.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(286, 65, '1.05.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(287, 65, '1.05.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(288, 66, '1.05.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(289, 67, '1.05.01.1.05.0002', 'Pengadaan Pakaian Dinas Beserta AtributKelengkapannya', 1, NULL, NULL, NULL, NULL, NULL),
(290, 67, '1.05.01.1.05.0003', 'Pendataan dan Pengolahan AdministrasiKepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(291, 67, '1.05.01.1.05.0005', 'Monitoring  Evaluasi  dan Penilaian KinerjaPegawai', 1, NULL, NULL, NULL, NULL, NULL),
(292, 67, '1.05.01.1.05.0007', 'Pemulangan Pegawai yang Meninggal dalamMelaksanakan Tugas', 1, NULL, NULL, NULL, NULL, NULL),
(293, 67, '1.05.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(294, 67, '1.05.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(295, 68, '1.05.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(296, 68, '1.05.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(297, 68, '1.05.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(298, 68, '1.05.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(299, 68, '1.05.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(300, 68, '1.05.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(301, 68, '1.05.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(302, 69, '1.05.01.1.07.0002', 'Pengadaan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(303, 70, '1.05.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(304, 70, '1.05.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(305, 71, '1.05.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(306, 71, '1.05.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(307, 71, '1.05.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(308, 71, '1.05.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(309, 71, '1.05.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(310, 72, '1.05.02.1.01.0016', 'Pemberdayaan Perlindungan Masyarakat dalam rangka Ketenteraman dan Ketertiban Umum', 1, NULL, NULL, NULL, NULL, NULL),
(311, 72, '1.05.02.1.01.0017', 'Pencegahan Gangguan Ketenteraman  Ketertiban Umum dan Perlindungan Masyarakat Melalui Deteksi Dini dan Cegah Dini  Pembinaan dan Penyuluhan  Pelaksanaan Patroli  Pengamanan  dan Pengawalan', 1, NULL, NULL, NULL, NULL, NULL),
(312, 72, '1.05.02.1.01.0019', 'Penindakan atas Gangguan Ketenteraman   Ketertiban Umum dan Perlindungan Masyarakat Berdasarkan Perda dan Perkada Melalui Penerbitan dan Penanganan Unjuk Rasa dan Kerusuhan Massa', 1, NULL, NULL, NULL, NULL, NULL),
(313, 73, '1.05.02.1.02.0002', 'Pengawasan atas Kepatuhan Terhadap Pelaksanaan Peraturan Daerah dan Peraturan Gubernur', 1, NULL, NULL, NULL, NULL, NULL),
(314, 73, '1.05.02.1.02.0003', 'Penanganan atas Pelanggaran Peraturan Daerah dan Peraturan Gubernur', 1, NULL, NULL, NULL, NULL, NULL),
(315, 74, '1.05.02.1.03.0001', 'Pengembangan Kapasitas dan Karier PPNS', 1, NULL, NULL, NULL, NULL, NULL),
(316, 75, '1.05.03.1.01.0002', 'Sosialisasi  Komunikasi  Informasi dan Edukasi (KIE) Rawan Bencana Provinsi (Per Jenis Bencana)', 1, NULL, NULL, NULL, NULL, NULL),
(317, 75, '1.05.03.1.01.0003', 'Penyusunan Kajian Risiko Bencana Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(318, 76, '1.05.03.1.02.0012', 'Penyusunan Rencana Penanggulangan Bencana Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(319, 76, '1.05.03.1.02.0013', 'Penguatan Kapasitas Kawasan untuk Pencegahan dan Kesiapsiagaan bencana', 1, NULL, NULL, NULL, NULL, NULL),
(320, 76, '1.05.03.1.02.0014', 'Pengendalian Operasi dan Penyediaan Sarana Prasarana Kesiapsiagaan Terhadap Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(321, 76, '1.05.03.1.02.0015', 'Pengembangan Kapasitas Tim Reaksi Cepat (TRC) Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(322, 76, '1.05.03.1.02.0017', 'Penyusunan Rencana Kontijensi', 1, NULL, NULL, NULL, NULL, NULL),
(323, 76, '1.05.03.1.02.0020', 'Pengelolaan Risiko Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(324, 76, '1.05.03.1.02.0021', 'Penyediaan Peralatan Perlindungan dan Kesiapsiagaan Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(325, 77, '1.05.03.1.03.0002', 'Respon Cepat Penanganan Darurat Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(326, 77, '1.05.03.1.03.0004', 'Penyediaan Logistik Penyelamatan dan Evakuasi Korban Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(327, 77, '1.05.03.1.03.0005', 'Aktivasi Sistem Komando Penanganan Darurat Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(328, 78, '1.05.03.1.04.0006', 'Pelatihan Keluarga Tanggap Bencana Alam', 1, NULL, NULL, NULL, NULL, NULL),
(329, 78, '1.05.03.1.04.0007', 'Penanganan Pasca Bencana Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(330, 78, '1.05.03.1.04.0019', 'Kerja Sama Antar Lembaga dan Kemitraan dalam Penanggulangan Bencana', 1, NULL, NULL, NULL, NULL, NULL),
(331, 79, '1.06.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(332, 79, '1.06.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(333, 79, '1.06.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(334, NULL, '1.06.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(335, NULL, '1.06.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(336, NULL, '1.06.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(337, NULL, '1.06.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(338, NULL, '1.06.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(339, NULL, '1.06.01.1.02.0008', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 1, NULL, NULL, NULL, NULL, NULL),
(340, 80, '1.06.01.1.03.0001', 'Penyusunan Perencanaan Kebutuhan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(341, 80, '1.06.01.1.03.0003', 'Koordinasi dan Penilaian Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(342, 80, '1.06.01.1.03.0004', 'Pembinaan  Pengawasan  dan PengendalianBarang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(343, 80, '1.06.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(344, 80, '1.06.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(345, 81, '1.06.01.1.05.0005', 'Monitoring  Evaluasi  dan Penilaian KinerjaPegawai', 1, NULL, NULL, NULL, NULL, NULL),
(346, 81, '1.06.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(347, 82, '1.06.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(348, 82, '1.06.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(349, 82, '1.06.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(350, 82, '1.06.01.1.06.0004', 'Penyediaan Bahan Logistik Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(351, 82, '1.06.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(352, 82, '1.06.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(353, 82, '1.06.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(354, 82, '1.06.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(355, 83, '1.06.01.1.08.0001', 'Penyediaan Jasa Surat Menyurat', 1, NULL, NULL, NULL, NULL, NULL),
(356, 83, '1.06.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(357, 83, '1.06.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(358, 83, '1.06.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(359, 84, '1.06.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(360, 84, '1.06.01.1.09.0005', 'Pemeliharaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(361, 84, '1.06.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(362, 84, '1.06.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(363, 85, '1.06.02.1.01.0001', 'Koordinasi dan Sinkronisasi Penerbitan Izin Undian Gratis Berhadiah dan Pengumpulan Uang atau Barang', 1, NULL, NULL, NULL, NULL, NULL),
(364, 86, '1.06.02.1.02.0001', 'Peningkatan Kemampuan Potensi Pekerja Sosial Masyarakat Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(365, 86, '1.06.02.1.02.0002', 'Peningkatan Kemampuan Potensi Tenaga Kesejahteraan Sosial Kecamatan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(366, 86, '1.06.02.1.02.0003', 'Peningkatan Kemampuan Potensi Sumber Kesejahteraan Sosial Keluarga Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(367, 86, '1.06.02.1.02.0004', 'Peningkatan Kemampuan Potensi Sumber Kesejahteraan Sosial Kelembagaan Masyarakat Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(368, 87, '1.06.03.1.01.0001', 'Fasilitasi Pemulangan Warga Negara Migran Korban Tindak Kekerasan dari Titik Debarkasi di Daerah Provinsi untuk Dipulangkan ke Daerah Kabupaten/Kota Asal', 1, NULL, NULL, NULL, NULL, NULL),
(369, 88, '1.06.04.1.01.0001', 'Penyediaan Permakanan', 1, NULL, NULL, NULL, NULL, NULL),
(370, 88, '1.06.04.1.01.0002', 'Penyediaan Sandang', 1, NULL, NULL, NULL, NULL, NULL),
(371, 88, '1.06.04.1.01.0003', 'Penyediaan Asrama yang Mudah Diakses', 1, NULL, NULL, NULL, NULL, NULL),
(372, 88, '1.06.04.1.01.0004', 'Penyediaan Alat Bantu', 1, NULL, NULL, NULL, NULL, NULL),
(373, 88, '1.06.04.1.01.0005', 'Penyediaan Perbekalan Kesehatan di dalam Panti', 1, NULL, NULL, NULL, NULL, NULL),
(374, 88, '1.06.04.1.01.0006', 'Pemberian Bimbingan Fisik  Mental  Spiritual dan Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(375, 88, '1.06.04.1.01.0007', 'Pemberian Bimbingan Aktivitas Hidup Sehari-Hari', 1, NULL, NULL, NULL, NULL, NULL),
(376, 88, '1.06.04.1.01.0008', 'Fasilitasi Pembuatan Nomor Induk Kependudukan bagi Penyandang Disabilitas', 1, NULL, NULL, NULL, NULL, NULL),
(377, 88, '1.06.04.1.01.0009', 'Akses ke Layanan Pendidikan dan Kesehatan Dasar', 1, NULL, NULL, NULL, NULL, NULL),
(378, 88, '1.06.04.1.01.0010', 'Pemberian Pelayanan Penelusuran Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(379, 88, '1.06.04.1.01.0011', 'Pemberian Pelayanan Reunifikasi Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(380, 89, '1.06.04.1.02.0001', 'Pengasuhan', 1, NULL, NULL, NULL, NULL, NULL),
(381, 89, '1.06.04.1.02.0002', 'Penyediaan Makanan', 1, NULL, NULL, NULL, NULL, NULL),
(382, 89, '1.06.04.1.02.0003', 'Penyediaan Sandang', 1, NULL, NULL, NULL, NULL, NULL),
(383, 89, '1.06.04.1.02.0004', 'Penyediaan Asrama yang Mudah Diakses', 1, NULL, NULL, NULL, NULL, NULL),
(384, 89, '1.06.04.1.02.0006', 'Pemberian Bimbingan Fisik  Mental  Spiritual dan Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(385, 89, '1.06.04.1.02.0007', 'Pemberian Bimbingan Aktivitas Hidup Sehari-Hari', 1, NULL, NULL, NULL, NULL, NULL),
(386, 89, '1.06.04.1.02.0008', 'Fasilitasi Pembuatan Akta Kelahiran  Nomor Induk Kependudukan  dan Kartu Identitas Anak', 1, NULL, NULL, NULL, NULL, NULL),
(387, 89, '1.06.04.1.02.0009', 'Akses ke Layanan Pendidikan dan Kesehatan Dasar', 1, NULL, NULL, NULL, NULL, NULL),
(388, 89, '1.06.04.1.02.0010', 'Pemberian Pelayanan Penelusuran Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(389, 89, '1.06.04.1.02.0011', 'Pemberian Pelayanan Reunifikasi Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(390, 90, '1.06.04.1.03.0002', 'Penyediaan Sandang', 1, NULL, NULL, NULL, NULL, NULL),
(391, 90, '1.06.04.1.03.0003', 'Penyediaan Asrama yang Mudah Diakses', 1, NULL, NULL, NULL, NULL, NULL),
(392, 90, '1.06.04.1.03.0004', 'Penyediaan Alat Bantu', 1, NULL, NULL, NULL, NULL, NULL),
(393, 90, '1.06.04.1.03.0005', 'Penyediaan Perbekalan Kesehatan di dalam Panti Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(394, 90, '1.06.04.1.03.0006', 'Pemberian Bimbingan Fisik  Mental  Spritual dan Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(395, 90, '1.06.04.1.03.0007', 'Pemberian Bimbingan Aktivitas Hidup Sehari-Hari', 1, NULL, NULL, NULL, NULL, NULL),
(396, 90, '1.06.04.1.03.0008', 'Fasilitasi Pembuatan Nomor Induk Kependudukan bagi Penyandang Disabilitas', 1, NULL, NULL, NULL, NULL, NULL),
(397, 90, '1.06.04.1.03.0009', 'Akses ke Layanan Pendidikan dan Kesehatan Dasar', 1, NULL, NULL, NULL, NULL, NULL),
(398, 90, '1.06.04.1.03.0010', 'Pemberian Pelayanan Penelusuran Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(399, 90, '1.06.04.1.03.0011', 'Pemberian Pelayanan Reunifikasi Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(400, 90, '1.06.04.1.03.0012', 'Pemulasaraan', 1, NULL, NULL, NULL, NULL, NULL),
(401, 91, '1.06.04.1.04.0001', 'Penyediaan Permakanan', 1, NULL, NULL, NULL, NULL, NULL),
(402, 91, '1.06.04.1.04.0002', 'Penyediaan Sandang', 1, NULL, NULL, NULL, NULL, NULL),
(403, 91, '1.06.04.1.04.0003', 'Penyediaan Asrama/Wisma yang Mudah Diakses', 1, NULL, NULL, NULL, NULL, NULL),
(404, 91, '1.06.04.1.04.0004', 'Penyediaan Perbekalan Kesehatan di dalam Panti', 1, NULL, NULL, NULL, NULL, NULL),
(405, 91, '1.06.04.1.04.0005', 'Pemberian Bimbingan Fisik  Mental  Spritual dan Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(406, 91, '1.06.04.1.04.0006', 'Pemberian Bimbingan Aktivitas Hidup Sehari-Hari', 1, NULL, NULL, NULL, NULL, NULL),
(407, 91, '1.06.04.1.04.0007', 'Pemberian Bimbingan Keterampilan Dasar', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_kegiatan` (`id_sub_kegiatan`, `id_kegiatan`, `kode_rekening`, `nama_sub_kegiatan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(408, 91, '1.06.04.1.04.0008', 'Fasilitasi Pembuatan Nomor Induk Kependudukan  Kartu Tanda Penduduk  Akta Kelahiran  Surat Nikah  dan/atau Identitas Anak', 1, NULL, NULL, NULL, NULL, NULL),
(409, 91, '1.06.04.1.04.0009', 'Akses Kelayanan Pendidikan dan Kesehatan Dasar', 1, NULL, NULL, NULL, NULL, NULL),
(410, 91, '1.06.04.1.04.0010', 'Pemulangan ke Daerah Asal', 1, NULL, NULL, NULL, NULL, NULL),
(411, 91, '1.06.04.1.04.0011', 'Koordinasi  Sinkronisasi dan Pembinaan Pelaksanaan Rehabilitasi Sosial Dasar Gelandangan dan Pengemis Terlantar di dalam Panti', 1, NULL, NULL, NULL, NULL, NULL),
(412, 92, '1.06.04.1.05.0001', 'Penyediaan Permakanan', 1, NULL, NULL, NULL, NULL, NULL),
(413, 92, '1.06.04.1.05.0002', 'Penyediaan Sandang', 1, NULL, NULL, NULL, NULL, NULL),
(414, 92, '1.06.04.1.05.0005', 'Pemberian Bimbingan Fisik  Mental  Spritual dan Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(415, 92, '1.06.04.1.05.0006', 'Pemberian Bimbingan Aktivitas Hidup Sehari-Hari', 1, NULL, NULL, NULL, NULL, NULL),
(416, 92, '1.06.04.1.05.0007', 'Pemberian Bimbingan Keterampilan Dasar', 1, NULL, NULL, NULL, NULL, NULL),
(417, 92, '1.06.04.1.05.0009', 'Akses Kelayanan Pendidikan dan Kesehatan Dasar', 1, NULL, NULL, NULL, NULL, NULL),
(418, NULL, '1.06.05.1.02.0001', 'Fasilitasi Bantuan Sosial Kesejahteraan Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(419, NULL, '1.06.05.1.02.0002', 'Pengelolaan Fakir Miskin Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(420, NULL, '1.06.05.1.02.0003', 'Fasilitasi Bantuan Pengembangan Ekonomi Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(421, 93, '1.06.06.1.01.0001', 'Penyediaan Permakanan', 1, NULL, NULL, NULL, NULL, NULL),
(422, 93, '1.06.06.1.01.0002', 'Penyediaan Sandang', 1, NULL, NULL, NULL, NULL, NULL),
(423, 93, '1.06.06.1.01.0004', 'Penanganan Khusus bagi Kelompok Rentan', 1, NULL, NULL, NULL, NULL, NULL),
(424, 93, '1.06.06.1.01.0005', 'Pelayanan Dukungan Psikososial', 1, NULL, NULL, NULL, NULL, NULL),
(425, 94, '1.06.07.1.01.0001', 'Rehabilitasi Sarana dan Prasarana Taman Makam Pahlawan Nasional Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(426, 94, '1.06.07.1.01.0002', 'Pemeliharaan Taman Makam Pahlawan Nasional Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(427, 95, '2.07.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(428, 95, '2.07.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(429, 95, '2.07.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(430, 96, '2.07.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(431, 96, '2.07.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(432, 96, '2.07.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(433, 97, '2.07.01.1.03.0001', 'Penyusunan Perencanaan Kebutuhan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(434, 97, '2.07.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(435, 98, '2.07.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(436, 99, '2.07.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(437, 99, '2.07.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(438, 99, '2.07.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(439, 99, '2.07.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(440, 99, '2.07.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(441, 100, '2.07.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(442, 101, '2.07.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(443, 101, '2.07.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(444, 102, '2.07.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(445, 102, '2.07.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(446, 103, '2.07.02.1.01.0001', 'Penyusunan Rencana Tenaga Kerja Makro', 1, NULL, NULL, NULL, NULL, NULL),
(447, 103, '2.07.02.1.01.0004', 'Fasilitasi Penyusunan Rencana Tenaga Kerja Mikro', 1, NULL, NULL, NULL, NULL, NULL),
(448, 104, '2.07.03.1.01.0001', 'Proses Pelaksanaan Pendidikan dan Pelatihan Keterampilan bagi Pencari Kerja Berdasarkan Klaster Kompetensi', 1, NULL, NULL, NULL, NULL, NULL),
(449, 105, '2.07.03.1.02.0001', 'Survey dan Penilaian Akreditasi Kepada Lembaga Pelatihan Kerja', 1, NULL, NULL, NULL, NULL, NULL),
(450, 106, '2.07.03.1.03.0001', 'Pelaksanaan Konsultasi Produktivitas kepada Perusahaan Menengah', 1, NULL, NULL, NULL, NULL, NULL),
(451, 107, '2.07.03.1.04.0001', 'Pengukuran Kompetensi dan Produktivitas Tenaga Kerja', 1, NULL, NULL, NULL, NULL, NULL),
(452, 108, '2.07.04.1.01.0003', 'Penyuluhan dan Bimbingan Jabatan bagi Pencari Kerja', 1, NULL, NULL, NULL, NULL, NULL),
(453, 108, '2.07.04.1.01.0004', 'Pembinaan Operasionalisasi Pelayanan Penempatan Tenaga Kerja AKAD (Antar Kerja Antar Daerah) dan AKL (Antar Kerja Lokal)', 1, NULL, NULL, NULL, NULL, NULL),
(454, 110, '2.07.04.1.04.0001', 'Peningkatan Pelindungan dan Kompetensi Calon Pekerja Migran Indonesia (PMI)/Pekerja Migran Indonesia (PMI)', 1, NULL, NULL, NULL, NULL, NULL),
(455, 111, '2.07.05.1.01.0003', 'Penyelenggaraan Pendataan dan Informasi Sarana Hubungan Industrial dan Jaminan Sosial Tenaga Kerja', 1, NULL, NULL, NULL, NULL, NULL),
(456, 112, '2.07.05.1.02.0001', 'Pencegahan Perselisihan Hubungan Industrial  Mogok Kerja  dan Penutupan Perusahaan yang Berakibat/Berdampak pada Kepentingan di 1 (satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(457, 112, '2.07.05.1.02.0003', 'Penyelenggaraan Verifikasi dan Rekapitulasi Keanggotaan pada Organisasi Pengusaha  Federasi dan Konfederasi Serikat Pekerja/Serikat Buruh serta Non Afiliasi', 1, NULL, NULL, NULL, NULL, NULL),
(458, 113, '2.07.05.1.03.0001', 'Penetapan Upah Minimum Provinsi (UMP)', 1, NULL, NULL, NULL, NULL, NULL),
(459, 114, '2.07.06.1.01.0001', 'Pengawasan Pelaksanaan Norma Kerja di Perusahaan', 1, NULL, NULL, NULL, NULL, NULL),
(460, 114, '2.07.06.1.01.0002', 'Penegakan Hukum Ketenagakerjaan di Perusahaan', 1, NULL, NULL, NULL, NULL, NULL),
(461, 114, '2.07.06.1.01.0003', 'Pelayanan Keselamatan dan Kesehatan Kerja di Perusahaan', 1, NULL, NULL, NULL, NULL, NULL),
(462, 115, '2.08.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(463, 115, '2.08.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(464, 116, '2.08.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(465, 116, '2.08.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(466, 117, '2.08.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(467, 118, '2.08.01.1.05.0003', 'Pendataan dan Pengolahan AdministrasiKepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(468, 118, '2.08.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(469, 119, '2.08.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(470, 119, '2.08.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(471, 119, '2.08.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(472, 119, '2.08.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(473, 119, '2.08.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(474, 119, '2.08.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(475, 119, '2.08.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(476, 120, '2.08.01.1.07.0002', 'Pengadaan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(477, 120, '2.08.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(478, 121, '2.08.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(479, 121, '2.08.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(480, 121, '2.08.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(481, 122, '2.08.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(482, 122, '2.08.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(483, 122, '2.08.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(484, 123, '2.08.02.1.01.0008', 'Sosialisasi kebijakan Penyelenggaraan PUG Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(485, 124, '2.08.02.1.02.0003', 'Sosialisasi Peningkatan Partisipasi Perempuan di Bidang Politik  Hukum  Sosial dan Ekonomi Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(486, 125, '2.08.02.1.03.0006', 'Pengembangan Komunikasi Informasi dan Edukasi (KIE) Pemberdayaan Perempuan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(487, 126, '2.08.03.1.01.0001', 'Koordinasi dan Sinkronisasi Pelaksanaan Kebijakan  Program dan Kegiatan Pencegahan Kekerasan terhadap Perempuan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(488, 126, '2.08.03.1.01.0002', 'Advokasi Kebijakan dan Pendampingan Layanan Perlindungan Perempuan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(489, 127, '2.08.03.1.02.0002', 'Koordinasi dan Sinkronisasi Pelaksanaan Penyediaan Layanan Rujukan Lanjutan bagi Perempuan Korban Kekerasan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(490, 128, '2.08.03.1.03.0001', 'Advokasi Kebijakan dan Pendampingan Penyediaan Sarana Prasarana Layanan bagi Perempuan Korban Kekerasan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(491, 128, '2.08.03.1.03.0002', 'Peningkatan Kapasitas Sumber Daya Lembaga Penyedia Layanan Penanganan bagi Perempuan Korban Kekerasan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(492, NULL, '2.08.04.1.01.0003', 'Pengembangan Kegiatan Masyarakat untuk Peningkatan Kualitas Keluarga Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(493, 129, '2.08.05.1.01.0001', 'Penyediaan Data Gender dan Anak Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(494, 129, '2.08.05.1.01.0002', 'Penyajian dan Pemanfaatan Data Gender dan Anak dalam Kelembagaan Data Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(495, 130, '2.08.06.1.02.0001', 'Penyediaan Layanan Peningkatan Kualitas Hidup Anak Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(496, 130, '2.08.06.1.02.0005', 'Penguatan Jejaring Antar Lembaga Penyedia Layanan Pemenuhan Hak Anak Kewenangan Provinsi dan Lintas Daerah Kabupaten/ Kota', 1, NULL, NULL, NULL, NULL, NULL),
(497, 130, '2.08.06.1.02.0006', 'Pengembangan Komunikasi  Informasi dan Edukasi Pemenuhan Hak Anak', 1, NULL, NULL, NULL, NULL, NULL),
(498, 131, '2.08.07.1.01.0002', 'Koordinasi dan Sinkronisasi Pencegahan Kekerasan terhadap Anak Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(499, 132, '2.08.07.1.03.0007', 'Penyediaan Bantuan kebutuhan khusus bagi AMPK Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(500, 133, '2.09.03.1.04.0001', 'Promosi Penganekaragaman Konsumsi Pangan Berbasis Sumber Daya Lokal', 1, NULL, NULL, NULL, NULL, NULL),
(501, 134, '2.10.06.1.01.0002', 'Koordinasi Penetapan Redistribusi Tanah Objek Reforma Agraria Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(502, 135, '2.10.10.1.01.0001', 'Koordinasi dan Sinkronisasi Perencanaan Penggunaan Tanah', 1, NULL, NULL, NULL, NULL, NULL),
(503, 136, '2.11.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(504, 136, '2.11.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(505, 137, '2.11.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(506, 137, '2.11.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(507, 137, '2.11.01.1.02.0008', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 1, NULL, NULL, NULL, NULL, NULL),
(508, 138, '2.11.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(509, NULL, '2.11.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(510, 139, '2.11.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(511, 139, '2.11.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(512, 139, '2.11.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(513, 139, '2.11.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(514, 139, '2.11.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(515, 139, '2.11.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(516, 140, '2.11.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(517, 141, '2.11.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(518, 141, '2.11.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(519, 142, '2.11.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(520, 142, '2.11.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(521, 142, '2.11.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(522, 143, '2.11.01.1.10.0001', 'Pelayanan dan Penunjang Pelayanan BLUD', 1, NULL, NULL, NULL, NULL, NULL),
(523, 144, '2.11.02.1.01.0002', 'Pengendalian Pelaksanaan RPPLH Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(524, 145, '2.11.02.1.02.0002', 'Pembuatan dan Pelaksanaan KLHS RPJPD/RPJMD', 1, NULL, NULL, NULL, NULL, NULL),
(525, 146, '2.11.03.1.01.0001', 'Koordinasi  Sinkronisasi dan Pelaksanaan Pencegahan Pencemaran Lingkungan Hidup Dilaksanakan terhadap Media Tanah  Air  Udara  dan Laut', 1, NULL, NULL, NULL, NULL, NULL),
(526, 146, '2.11.03.1.01.0002', 'Koordinasi  Sinkronisasi dan Pelaksanaan Pengendalian Emisi Gas Rumah Kaca  Mitigasi dan Adaptasi Perubahan Iklim', 1, NULL, NULL, NULL, NULL, NULL),
(527, 147, '2.11.03.1.02.0001', 'Pemberian Informasi Peringatan Pencemaran dan/atau Kerusakan Lingkungan Hidup pada Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(528, 149, '2.11.04.1.01.0008', 'Pengelolaan Taman Keanekaragaman Hayati di Luar Kawasan Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(529, 150, '2.11.05.1.01.0002', 'Koordinasi dan Sinkronisasi Pengelolaan Limbah B3 dengan Pemerintah Pusat dalam rangka Pengangkutan  Pemanfaatan  Pengolahan  dan/atau Penimbunan', 1, NULL, NULL, NULL, NULL, NULL),
(530, 151, '2.11.06.1.01.03', 'Pengawasan Usaha dan/atau Kegiatan yang Izin Lingkungan Hidup  Izin PPLH yang diterbitkan oleh Pemerintah Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(531, 151, '2.11.06.1.01.04', 'Koordinasi dan Sinkronisasi Pengawasan dan Penerapan Sanksi Upaya dan Rencana PPLH', 1, NULL, NULL, NULL, NULL, NULL),
(532, 152, '2.11.08.1.01.0002', 'Pendampingan Gerakan Peduli Lingkungan Hidup', 1, NULL, NULL, NULL, NULL, NULL),
(533, 153, '2.11.09.1.01.0001', 'Penilaian Kinerja Masyarakat/Lembaga Masyarakat/Dunia Usaha/Dunia Pendidikan/ Filantropi dalam Perlindungan dan Pengelolaan Lingkungan Hidup', 1, NULL, NULL, NULL, NULL, NULL),
(534, 155, '2.11.11.1.01.0005', 'Koordinasi dan Sinkronisasi Penyediaan Prasarana dan Sarana Penanganan Sampah di TPA/TPST Regional', 1, NULL, NULL, NULL, NULL, NULL),
(535, 155, '2.11.11.1.01.01', 'Penyusunan Rencana  Kebijakan dan Teknis Penanganan Sampah Regional', 1, NULL, NULL, NULL, NULL, NULL),
(536, 156, '2.12.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(537, 156, '2.12.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(538, 156, '2.12.01.1.01.0003', 'Koordinasi dan Penyusunan DokumenPerubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(539, 156, '2.12.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(540, 157, '2.12.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(541, 157, '2.12.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(542, 157, '2.12.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(543, 157, '2.12.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(544, 157, '2.12.01.1.02.0008', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 1, NULL, NULL, NULL, NULL, NULL),
(545, 159, '2.12.01.1.05.0005', 'Monitoring  Evaluasi  dan Penilaian KinerjaPegawai', 1, NULL, NULL, NULL, NULL, NULL),
(546, 159, '2.12.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(547, 159, '2.12.01.1.05.0010', 'Sosialisasi Peraturan Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(548, 159, '2.12.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(549, 160, '2.12.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(550, 160, '2.12.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(551, 160, '2.12.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(552, 160, '2.12.01.1.06.0004', 'Penyediaan Bahan Logistik Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(553, 160, '2.12.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(554, 160, '2.12.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(555, 160, '2.12.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(556, 160, '2.12.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(557, 161, '2.12.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(558, 161, '2.12.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(559, 161, '2.12.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(560, 162, '2.12.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(561, 163, '2.12.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(562, 163, '2.12.01.1.09.0005', 'Pemeliharaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(563, 163, '2.12.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(564, 163, '2.12.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(565, 164, '2.12.02.1.01.0005', 'Penyusunan Tata Cara Perencanaan  Pelaksanaan  Pemantauan  Evaluasi  Pengendalian dan Penyusunan Pelaporan Adminduk terkait Pendaftaran Penduduk', 1, NULL, NULL, NULL, NULL, NULL),
(566, 165, '2.12.02.1.02.0002', 'Sosialisasi Terkait Pendaftaran Penduduk', 1, NULL, NULL, NULL, NULL, NULL),
(567, 166, '2.12.02.1.03.0001', 'Pembinaan dan Pengawasaan terkait Pendaftaran Penduduk', 1, NULL, NULL, NULL, NULL, NULL),
(568, 167, '2.12.03.1.01.0004', 'Fasilitasi Pelayanan Bidang Pencatatan Sipil di Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(569, 168, '2.12.03.1.02.0002', 'Sosialisasi terkait Pencatatan Sipil', 1, NULL, NULL, NULL, NULL, NULL),
(570, 169, '2.12.03.1.03.0001', 'Pembinaan dan Pengawasaan terkait Pencatatan Sipil', 1, NULL, NULL, NULL, NULL, NULL),
(571, 171, '2.12.04.1.03.0001', 'Pembinaan dan Pengawasan tekait Pengelolaan Informasi Administrasi Kependudukan', 1, NULL, NULL, NULL, NULL, NULL),
(572, 172, '2.12.05.1.01.0001', 'Penyediaan Data Kependudukan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(573, 173, '2.13.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(574, 173, '2.13.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(575, 173, '2.13.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(576, 174, '2.13.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(577, 174, '2.13.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(578, 174, '2.13.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(579, 175, '2.13.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(580, 175, '2.13.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(581, 176, '2.13.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(582, 176, '2.13.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(583, 177, '2.13.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(584, 177, '2.13.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(585, 177, '2.13.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(586, 177, '2.13.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(587, 177, '2.13.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(588, 177, '2.13.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(589, 177, '2.13.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(590, 177, '2.13.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(591, 177, '2.13.01.1.06.0011', 'Dukungan Pelaksanaan Sistem Pemerintahan Berbasis Elektronik pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(592, 178, '2.13.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(593, 179, '2.13.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(594, 179, '2.13.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(595, 179, '2.13.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(596, 180, '2.13.03.1.01.0003', 'Fasilitasi Pembangunan Kawasan Perdesaan', 1, NULL, NULL, NULL, NULL, NULL),
(597, 181, '2.13.04.1.01.Â 05', 'Fasilitasi Pengelolaan Keuangan Desa', 1, NULL, NULL, NULL, NULL, NULL),
(598, 181, '2.13.04.1.01.Â 08', 'Fasilitasi Evaluasi Perkembangan Desa serta Lomba Desa dan Kelurahan', 1, NULL, NULL, NULL, NULL, NULL),
(599, 181, '2.13.04.1.01.Â 10', 'Pembinaan Aparatur Pemerintah Desa', 1, NULL, NULL, NULL, NULL, NULL),
(600, 181, '2.13.04.1.01.Â 12', 'Pembinaan Percepatan Pembangunan Desa Melalui Bantuan Keuangan  Bantuan Pendampingan dan Bantuan Teknis', 1, NULL, NULL, NULL, NULL, NULL),
(601, 181, '2.13.04.1.01.Â 15', 'Pembinaan dan Pengawasan Penetapan Pengaturan BUM Desa Kabupaten/Kota dan Lembaga Kerja Sama antar Desa', 1, NULL, NULL, NULL, NULL, NULL),
(602, 181, '2.13.04.1.01.Â 18', 'Fasilitasi Pencatatan Data dan Informasi mengenai Pemerintahan Desa di Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(603, 182, '2.13.05.1.01.0001', 'Identifikasi dan Inventarisasi Masyarakat Hukum Adat', 1, NULL, NULL, NULL, NULL, NULL),
(604, 182, '2.13.05.1.01.0003', 'Peningkatan Kapasitas Kelembagaan Lembaga KeMasyarakatan Desa/Kelurahan (RT  RW  PKK  Posyandu  LPM  dan Karang Taruna)  Lembaga Adat Desa/Kelurahan dan Masyarakat Hukum Adat', 1, NULL, NULL, NULL, NULL, NULL),
(605, 182, '2.13.05.1.01.0005', 'Fasilitasi Pengembangan Usaha Ekonomi Masyarakat dan Pemerintah Desa dalam Meningkatkan Pendapatan Asli Desa', 1, NULL, NULL, NULL, NULL, NULL),
(606, 182, '2.13.05.1.01.0006', 'Fasilitasi Pemerintah Desa dalam Pemanfaatan Teknologi Tepat Guna', 1, NULL, NULL, NULL, NULL, NULL),
(607, 182, '2.13.05.1.01.0007', 'Fasilitasi Bulan Bhakti Gotong Royong Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(608, 182, '2.13.05.1.01.0009', 'Fasilitasi Tim Penggerak PKK dalam Penyelenggaraan Gerakan Pemberdayaan Masyarakat dan Kesejahteraan Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(609, 183, '2.14.02.1.01.0007', 'Advokasi dan Sosialisasi Pelaksanaan Pendidikan Kependudukan Jalur Formal di Satuan Pendidikan Jenjang SLTA-MA  Jalur Nonformal dan Informal Pada Ormas Pengelola Kelompok Kegiatan Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(610, 183, '2.14.02.1.01.0017', 'Penyerasian Kebijakan Pembangunan Daerah Provinsi terhadap Pembangunan Keluarga  Kependudukan  dan Keluarga Berencana (Bangga Kencana)', 1, NULL, NULL, NULL, NULL, NULL),
(611, 184, '2.14.03.1.01.0009', 'Penurunan Kehamilan yang tidak diinginkan', 1, NULL, NULL, NULL, NULL, NULL),
(612, 185, '2.14.04.1.01.0017', 'Pelaksanaan Fasilitasi  Pembimbingan  Pengembangan  dan Penguatan Penyiapan Pengasuhan 1000 HPK', 1, NULL, NULL, NULL, NULL, NULL),
(613, 186, '2.14.04.1.02.0008', 'Peningkatan Kapasitas Mitra dan Organisasi Kemasyarakatan dalam Pengelolaan Program Ketahanan Keluarga Melalui Bina Keluarga Balita (BKB)  Bina Keluarga Remaja (BKR)  Bina Keluarga Lansia (BKL)  Usaha Peningkatan Pendapatan Keluarga Akseptor (UPPKA) dan Pemberdayaan Ekonomi Keluarga', 1, NULL, NULL, NULL, NULL, NULL),
(614, 187, '2.15.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(615, 187, '2.15.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(616, 187, '2.15.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(617, 188, '2.15.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(618, 188, '2.15.01.1.02.0002', 'Penyediaan Administrasi Pelaksanaan TugasASN', 1, NULL, NULL, NULL, NULL, NULL),
(619, 188, '2.15.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(620, 189, '2.15.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(621, 190, '2.15.01.1.05.0002', 'Pengadaan Pakaian Dinas Beserta AtributKelengkapannya', 1, NULL, NULL, NULL, NULL, NULL),
(622, 190, '2.15.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(623, 190, '2.15.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(624, NULL, '2.15.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(625, NULL, '2.15.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(626, NULL, '2.15.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(627, NULL, '2.15.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(628, NULL, '2.15.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(629, NULL, '2.15.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(630, 191, '2.15.01.1.07.0002', 'Pengadaan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(631, 191, '2.15.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(632, 191, '2.15.01.1.07.0011', 'Pengadaan Sarana dan Prasarana Pendukung Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(633, 192, '2.15.01.1.08.0001', 'Penyediaan Jasa Surat Menyurat', 1, NULL, NULL, NULL, NULL, NULL),
(634, 192, '2.15.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(635, 192, '2.15.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(636, 193, '2.15.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(637, 193, '2.15.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(638, 193, '2.15.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(639, 194, '2.15.02.1.01.0001', 'Pelaksanaan Penyusunan Rencana Induk Jaringan LLAJ Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(640, 194, '2.15.02.1.01.0002', 'Penetapan Kebijakan dan Sosialisasi Rencana Induk Jaringan LLAJ Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(641, 195, '2.15.02.1.02.0002', 'Penyediaan Perlengkapan Jalan di Jalan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(642, 195, '2.15.02.1.02.0004', 'Rehabilitasi dan Pemeliharaan Perlengkapan Jalan', 1, NULL, NULL, NULL, NULL, NULL),
(643, 196, '2.15.02.1.03.0009', 'Peningkatan Kapasitas Kompetensi SDM Pengelola Terminal Penumpang Tipe B', 1, NULL, NULL, NULL, NULL, NULL),
(644, 196, '2.15.02.1.03.0011', 'Rehabilitasi dan Pemeliharaan Terminal Tipe B (Fasilitas Utama dan Penunjang)', 1, NULL, NULL, NULL, NULL, NULL),
(645, 197, '2.15.02.1.05.0001', 'Penataan Manajemen dan Rekayasa Lalu Lintas Untuk Jaringan Jalan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(646, 197, '2.15.02.1.05.0004', 'Pengawasan dan Pengendalian Efektivitas Pelaksanaan Kebijakan untuk Jalan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(647, 197, '2.15.02.1.05.0005', 'Forum Lalu Lintas dan Angkutan Jalan untuk Jaringan Jalan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(648, 197, '2.15.02.1.05.0007', 'Pengadaan dan Pemasangan Perlengkapan Jalan dalam rangka Manajemen dan Rekayasa Lalu Lintas', 1, NULL, NULL, NULL, NULL, NULL),
(649, 198, '2.15.02.1.07.0003', 'Pelaksanaan Inspeksi  Audit dan Pemantauan Terminal', 1, NULL, NULL, NULL, NULL, NULL),
(650, 198, '2.15.02.1.07.0005', 'Pelaksanaan Inspeksi  Audit dan Pemantauan Sistem Manajemen Keselamatan Perusahaan Angkutan Umum', 1, NULL, NULL, NULL, NULL, NULL),
(651, 198, '2.15.02.1.07.0015', 'Pelaksanaan Pengawasan Melalui Uji Petik terhadap Unit Pelaksana Uji Berkala Kendaraan Bermotor Inspeksi  Audit dan Pemantauan Unit Pelaksana Uji Berkala Kendaraan Bermotor', 1, NULL, NULL, NULL, NULL, NULL),
(652, NULL, '2.15.02.1.08.0002', 'Pengendalian dan Pengawasan Ketersediaan Angkutan Umum untuk Jasa Angkutan Orang dan/atau Barang Antar Kota dalam 1 (satu) Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(653, NULL, '2.15.02.1.08.0003', 'Penyediaan Angkutan Umum untuk Jasa Angkutan Orang dan/atau Barang Antar Kota dalam 1 (satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(654, 199, '2.15.02.1.09.0001', 'Perumusan Kebijakan Penetapan Kawasan Perkotaan untuk Angkutan Perkotaan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(655, 200, '2.15.02.1.13.0001', 'Fasilitasi Pemenuhan Persyaratan Perolehan Izin Penyelenggaraan Angkutan Orang dalam Trayek Kewenangan Provinsi dalam Sistem Pelayanan Perizinan Berusaha Terintegrasi Secara Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(656, 202, '2.15.03.1.09.0002', 'Pembangunan Pelabuhan Pengumpan Regional', 1, NULL, NULL, NULL, NULL, NULL),
(657, 202, '2.15.03.1.09.0003', 'Pengoperasian dan Pemeliharaan Pelabuhan Pengumpan Regional', 1, NULL, NULL, NULL, NULL, NULL),
(658, 203, '2.15.03.1.11.0002', 'Koordinasi dan Sinkronisasi Pengawasan Pelaksanaan Izin untuk Badan Usaha Pelabuhan di Pelabuhan Pengumpan Regional', 1, NULL, NULL, NULL, NULL, NULL),
(659, 204, '2.15.05.1.06.0002', 'Sosialisasi dan Uji Coba Pelaksanaan Kebijakan Penetapan Jaringan Pelayanan Perkeretaapian pada Jaringan Jalur Perkeretaapian Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(660, 205, '2.16.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(661, 205, '2.16.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(662, 205, '2.16.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(663, 206, '2.16.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(664, 206, '2.16.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(665, 206, '2.16.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(666, 206, '2.16.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(667, 207, '2.16.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(668, 208, '2.16.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(669, 209, '2.16.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(670, 209, '2.16.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(671, 209, '2.16.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(672, 209, '2.16.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(673, 209, '2.16.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(674, 210, '2.16.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(675, 211, '2.16.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(676, 211, '2.16.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(677, 212, '2.16.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(678, 212, '2.16.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(679, 212, '2.16.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(680, 213, '2.16.02.1.01.0002', 'Monitoring Opini dan Aspirasi Publik', 1, NULL, NULL, NULL, NULL, NULL),
(681, 213, '2.16.02.1.01.0003', 'Monitoring Informasi dan Penetapan Agenda Prioritas Komunikasi Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(682, 213, '2.16.02.1.01.0004', 'Pengelolaan Konten dan Perencanaan Media Komunikasi Publik', 1, NULL, NULL, NULL, NULL, NULL),
(683, 213, '2.16.02.1.01.0006', 'Pelayanan Informasi Publik', 1, NULL, NULL, NULL, NULL, NULL),
(684, 213, '2.16.02.1.01.0007', 'Layanan Hubungan Media', 1, NULL, NULL, NULL, NULL, NULL),
(685, 213, '2.16.02.1.01.0008', 'Kemitraan dengan Pemangku Kepentingan', 1, NULL, NULL, NULL, NULL, NULL),
(686, 213, '2.16.02.1.01.0010', 'Penguatan Kapasitas Sumber Daya Komunikasi Publik', 1, NULL, NULL, NULL, NULL, NULL),
(687, 213, '2.16.02.1.01.0011', 'Penguatan Tata Kelola Komisi Informasi di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(688, 213, '2.16.02.1.01.0012', 'Penyelenggaraan Hubungan Masyarakat  Media dan Kemitraan Komunitas', 1, NULL, NULL, NULL, NULL, NULL),
(689, 214, '2.16.03.1.02.0001', 'Penatalaksanaan dan Pengawasan E-government dalam Penyelenggaraan Pemerintahan Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(690, 214, '2.16.03.1.02.0002', 'Sinkronisasi Pengelolaan Rencana Induk dan Anggaran Pemerintahan Berbasis Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(691, 214, '2.16.03.1.02.0004', 'Penyelenggaraan Sistem Komunikasi Intra Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(692, 214, '2.16.03.1.02.0005', 'Koordinasi dan Sinkronisasi Sistem Keamanan Informasi', 1, NULL, NULL, NULL, NULL, NULL),
(693, 214, '2.16.03.1.02.0006', 'Koordinasi dan Sinkronisasi Data dan Informasi Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(694, 214, '2.16.03.1.02.0007', 'Pengembangan Aplikasi dan Proses Bisnis Pemerintahan Berbasis Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(695, 214, '2.16.03.1.02.0008', 'Penyelenggaran Sistem Penghubung Layanan Pemerintah', 1, NULL, NULL, NULL, NULL, NULL),
(696, 214, '2.16.03.1.02.0009', 'Pengembangan dan Pengelolaan Ekosistem Provinsi Cerdas dan Kota Cerdas', 1, NULL, NULL, NULL, NULL, NULL),
(697, 214, '2.16.03.1.02.0010', 'Pengembangan dan Pengelolaan Sumber Daya Teknologi Informasi dan Komunikasi Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(698, 215, '2.17.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(699, 215, '2.17.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(700, 216, '2.17.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(701, 216, '2.17.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(702, 216, '2.17.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(703, 217, '2.17.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(704, 217, '2.17.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(705, 218, '2.17.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(706, 218, '2.17.01.1.05.0010', 'Sosialisasi Peraturan Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(707, 218, '2.17.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(708, 219, '2.17.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(709, 219, '2.17.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(710, 219, '2.17.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(711, 219, '2.17.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(712, 219, '2.17.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(713, 219, '2.17.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(714, 219, '2.17.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(715, 220, '2.17.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(716, 221, '2.17.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(717, 221, '2.17.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(718, 222, '2.17.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(719, 222, '2.17.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(720, 222, '2.17.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(721, 222, '2.17.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(722, 223, '2.17.02.1.01.0002', 'Fasilitasi Izin Usaha Simpan Pinjam untuk Koperasi Dengan Wilayah Keanggotaan Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(723, 224, '2.17.02.1.02.0003', 'Fasilitasi Izin Usaha Pembukaan Kantor Cabang  Cabang Pembantu dan Kantor Kas Koperasi Simpan Pinjam untuk Koperasi dengan Wilayah Keanggotaan Lintas Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(724, 225, '2.17.03.1.01.0003', 'Penguatan Tata Kelola Kelembagaan Koperasi', 1, NULL, NULL, NULL, NULL, NULL),
(725, 225, '2.17.03.1.01.02', 'Peningkatan Kepatuhan Koperasi terhadap Peraturan Perundang-Undangan dan Terbentuknya Koperasi yang Kuat  Sehat  Mandiri  Tangguh  serta Akuntabel', 1, NULL, NULL, NULL, NULL, NULL),
(726, 226, '2.17.04.1.01.02', 'Mengukur Tingkat Kesehatan Koperasi', 1, NULL, NULL, NULL, NULL, NULL),
(727, 227, '2.17.05.1.01.0001', 'Peningkatan Pemahaman dan Pengetahuan Perkoperasian serta Kapasitas dan Kompetensi SDM Koperasi', 1, NULL, NULL, NULL, NULL, NULL),
(728, 228, '2.17.06.1.01.0002', 'Peningkatan Produktivitas  Nilai Tambah  Akses Pasar  Akses Pembiayaan  Penguatan Kelembagaan  Penataan Manajemen  Standarisasi  dan Restrukturisasi Usaha', 1, NULL, NULL, NULL, NULL, NULL),
(729, 229, '2.17.07.1.01.0001', 'Menumbuhkembangkan UMKM untuk Menjadi Usaha yang Tangguh dan Mandiri Sehingga dapat Meningkatkan Penciptaan Lapangan Kerja  Pemerataan Pendapatan  Pertumbuhan Ekonomi  dan Pengentasan Kemiskinan', 1, NULL, NULL, NULL, NULL, NULL),
(730, 229, '2.17.07.1.01.0002', 'Peningkatan Pemahaman dan Pengetahuan UMKM serta Kapasitas dan Kompetensi SDM UMKM dan Kewirausahaan', 1, NULL, NULL, NULL, NULL, NULL),
(731, 230, '2.17.08.1.01.0001', 'Produksi dan Pengolahan  Pemasaran  Sumber Daya Manusia  serta Desain dan Teknologi', 1, NULL, NULL, NULL, NULL, NULL),
(732, 231, '2.18.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(733, 231, '2.18.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(734, 231, '2.18.01.1.01.0003', 'Koordinasi dan Penyusunan DokumenPerubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(735, 231, '2.18.01.1.01.0004', 'Koordinasi dan Penyusunan DPA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(736, 231, '2.18.01.1.01.0005', 'Koordinasi dan Penyusunan Perubahan DPA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(737, 231, '2.18.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(738, 231, '2.18.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(739, 232, '2.18.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(740, 232, '2.18.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(741, 232, '2.18.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(742, 232, '2.18.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(743, 233, '2.18.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(744, 233, '2.18.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(745, 234, '2.18.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(746, 235, '2.18.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(747, 235, '2.18.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(748, 235, '2.18.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(749, 235, '2.18.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(750, 235, '2.18.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(751, 235, '2.18.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(752, 236, '2.18.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(753, 237, '2.18.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(754, 237, '2.18.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(755, 238, '2.18.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(756, 238, '2.18.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(757, 238, '2.18.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(758, 239, '2.18.02.1.01.0001', 'Penetapan Kebijakan Daerah dalam Pemberian Fasilitas/Insentif dan Kemudahan Penanaman Modal', 1, NULL, NULL, NULL, NULL, NULL),
(759, 239, '2.18.02.1.01.0004', 'Rekomendasi Kebijakan Sektor Usaha yang Regulasinya Diharmonisasi Terkait Perizinan Berusaha Berbasis Resiko', 1, NULL, NULL, NULL, NULL, NULL),
(760, 240, '2.18.02.1.02.0005', 'Penyusunan Peta Potensi Investasi Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(761, 241, '2.18.03.1.01.0002', 'Pelaksanaan Kegiatan Promosi Penanaman Modal Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(762, 242, '2.18.04.1.02.0005', 'Koordinasi dan Sinkronisasi Penetapan Pemberian Fasilitas/Insentif Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(763, 242, '2.18.04.1.02.0006', 'Penyediaan dan pengelolaan Layanan Konsultasi Perizinan Berusaha Berbasis Risiko', 1, NULL, NULL, NULL, NULL, NULL),
(764, 242, '2.18.04.1.02.0007', 'Penyediaan Pelayanan Perizinan Berusaha melalui Sistem Perizinan Berusaha Berbasis Risiko Terintegrasi secara Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(765, 243, '2.18.05.1.01.0004', 'Pengawasan Penanaman Modal', 1, NULL, NULL, NULL, NULL, NULL),
(766, 243, '2.18.05.1.01.0005', 'Penyelesaian Permasalahan dan Hambatan yang dihadapi Pelaku Usaha dalam merealisasikan Kegiatan Usahanya', 1, NULL, NULL, NULL, NULL, NULL),
(767, 243, '2.18.05.1.01.0006', 'Bimbingan Teknis kepada Pelaku Usaha', 1, NULL, NULL, NULL, NULL, NULL),
(768, 244, '2.18.06.1.01.0002', 'Pengolahan  Penyajian dan Pemanfaatan Data dan Informasi Perizinan Berbasis Sistem Pelayanan Perizinan Berusaha Terintegrasi secara Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(769, 245, '2.19.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(770, 245, '2.19.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(771, 246, '2.19.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(772, 246, '2.19.01.1.02.0002', 'Penyediaan Administrasi Pelaksanaan TugasASN', 1, NULL, NULL, NULL, NULL, NULL),
(773, 246, '2.19.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(774, 246, '2.19.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(775, 246, '2.19.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(776, NULL, '2.19.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(777, NULL, '2.19.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(778, NULL, '2.19.01.1.03.0007', 'Pemanfaatan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(779, 247, '2.19.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(780, 248, '2.19.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(781, 248, '2.19.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(782, 248, '2.19.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(783, 248, '2.19.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(784, 248, '2.19.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(785, 249, '2.19.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(786, 250, '2.19.01.1.08.0001', 'Penyediaan Jasa Surat Menyurat', 1, NULL, NULL, NULL, NULL, NULL),
(787, 250, '2.19.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(788, 250, '2.19.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(789, 250, '2.19.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_kegiatan` (`id_sub_kegiatan`, `id_kegiatan`, `kode_rekening`, `nama_sub_kegiatan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(790, 251, '2.19.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(791, 251, '2.19.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(792, 251, '2.19.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(793, 252, '2.19.02.1.01.0003', 'Koordinasi  Sinkronisasi dan Penyelenggaraan Peningkatan Kapasitas Daya Saing Pemuda Kader Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(794, 252, '2.19.02.1.01.0005', 'Perencanaan  Pengadaan  Pemanfaatan  Pemeliharaan  dan Pengawasan Prasarana dan Sarana Kepemudaan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(795, 252, '2.19.02.1.01.0010', 'Pemberian Penghargaan Kepemudaan bagi yang berprestasi dan/atau berjasa dalam memajukan potensi pemuda', 1, NULL, NULL, NULL, NULL, NULL),
(796, 252, '2.19.02.1.01.0013', 'Koordinasi  Sinkronisasi dan Penyelenggaraan Pengembangan Kepeloporan Pemuda bagi Pemuda Pelopor Tingkat Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(797, 252, '2.19.02.1.01.0015', 'Koordinasi  Sinkronisasi  dan Penyelenggaraan Pengembangan Kewirausahaan Pemuda Bagi Wirausaha Muda Tingkat Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(798, 252, '2.19.02.1.01.04', 'Penyelenggaraan Seleksi dan Pelatihan Pasukan Pengibar Bendera', 1, NULL, NULL, NULL, NULL, NULL),
(799, 253, '2.19.02.1.02.0003', 'Koordinasi  Sinkronisasi  dan penyelenggaraan Pemberdayaan organisasi kepemudaan melalui kemitraan berbasis peneguhan kemandirian ekonomi pemuda', 1, NULL, NULL, NULL, NULL, NULL),
(800, 254, '2.19.03.1.01.0001', 'Koordinasi  Sinkronisasi dan Pelaksanaan Pembentukan dan Pengembangan Pusat Pembinaan dan Pelatihan Olahraga serta Sekolah Olahraga yang Diselenggarakan oleh Masyarakat dan Dunia Usaha', 1, NULL, NULL, NULL, NULL, NULL),
(801, 254, '2.19.03.1.01.0004', 'Koordinasi dan sinkronisasi penyediaan prasarana olahraga melalui perencanaan  pengadaan  pemanfaatan  pemeliharaan  dan pengawasan Prasarana Olahraga di tingkat provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(802, 255, '2.19.03.1.02.0004', 'Keikutsertaan anggota kontingen provinsi dalam Penyelenggaraan pekan dan kejuaraan olahraga', 1, NULL, NULL, NULL, NULL, NULL),
(803, 255, '2.19.03.1.02.0005', 'Penyelenggaraan Pekan dan Kejuaraan Paralimpik Pelajar Tingkat Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(804, 255, '2.19.03.1.02.0006', 'Penyelenggaraan Pekan dan Kejuaraan Olahraga Tingkat Nasional dan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(805, NULL, '2.19.03.1.03.0001', 'Seleksi Atlet Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(806, NULL, '2.19.03.1.03.0006', 'Pemberian Penghargaan olahraga bagi yang berprestasi dan/atau berjasa dalam memajukan Olahraga', 1, NULL, NULL, NULL, NULL, NULL),
(807, NULL, '2.19.03.1.03.0009', 'Pembinaan dan Pengembangan Olahragawan Berprestasi Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(808, 256, '2.19.03.1.04.0005', 'Pelaksanaan Standar nasional pengelolaan Organisasi Keolahragaan di provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(809, 257, '2.19.04.1.01.0003', 'Pengembangan Kapasitas SDM Kepramukaan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(810, 258, '2.20.02.1.01.0001', 'Koordinasi dan Sinkronisasi Pengumpulan  Pengolahan  Analisis dan Diseminasi Data Statistik Sektoral', 1, NULL, NULL, NULL, NULL, NULL),
(811, 258, '2.20.02.1.01.0002', 'Peningkatan Kapasitas SDM Pemerintah Daerah dalam Peningkatan Mutu Statistik Daerah yang Terintegrasi', 1, NULL, NULL, NULL, NULL, NULL),
(812, 258, '2.20.02.1.01.0003', 'Membangun Metadata Statistik Sektoral', 1, NULL, NULL, NULL, NULL, NULL),
(813, 258, '2.20.02.1.01.0004', 'Peningkatan Kapasitas Kelembagaan Statistik Sektoral', 1, NULL, NULL, NULL, NULL, NULL),
(814, 258, '2.20.02.1.01.0005', 'Pengembangan Infrastruktur', 1, NULL, NULL, NULL, NULL, NULL),
(815, 258, '2.20.02.1.01.0006', 'Penyelenggaraan Otorisasi Statistik Sektoral di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(816, 259, '2.21.02.1.01.0001', 'Penetapan Kebijakan Tata Kelola Keamanan Informasi dan Jaring Komunikasi Sandi Pemerintah Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(817, 259, '2.21.02.1.01.0002', 'Pelaksanaan Analisis Kebutuhan dan Pengelolaan Sumber Daya Keamanan Informasi Pemerintah Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(818, 259, '2.21.02.1.01.0003', 'Pelaksanaan Keamanan Informasi Pemerintahan Daerah Provinsi Berbasis Elektronik dan Non Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(819, 259, '2.21.02.1.01.0004', 'Penyediaan Layanan Keamanan Informasi Pemerintah Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(820, 260, '2.21.02.1.02.Â 01', 'Operasionalisasi Jaring Komunikasi Sandi Pemerintah Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(821, 261, '2.22.02.1.01.0001', 'Pelindungan  Pengembangan  Pemanfaatan Objek Pemajuan Kebudayaan', 1, NULL, NULL, NULL, NULL, NULL),
(822, 261, '2.22.02.1.01.0002', 'Pembinaan Sumber Daya Manusia  Lembaga  dan Pranata Kebudayaan', 1, NULL, NULL, NULL, NULL, NULL),
(823, 261, '2.22.02.1.01.0003', 'Penyediaan dan Pemeliharaan Sarana dan Prasarana Taman Budaya', 1, NULL, NULL, NULL, NULL, NULL),
(824, 262, '2.22.03.1.01.0001', 'Peningkatan Pendidikan dan Pelatihan Sumber Daya Manusia Kesenian Tradisional', 1, NULL, NULL, NULL, NULL, NULL),
(825, 263, '2.22.04.1.01.0001', 'Pemberdayaan Sumber Daya Manusia dan Lembaga Sejarah Lokal Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(826, 264, '2.22.05.1.02.0004', 'Pembinaan dan Peningkatan Kapasitas Tenaga Pelestari Cagar Budaya', 1, NULL, NULL, NULL, NULL, NULL),
(827, NULL, '2.22.06.1.01.0001', 'Pelindungan  Pengembangan  dan Pemanfataan Koleksi Secara Terpadu', 1, NULL, NULL, NULL, NULL, NULL),
(828, NULL, '2.22.06.1.01.0003', 'Peningkatan Pelayanan dan Akses Masyarakat terhadap Museum', 1, NULL, NULL, NULL, NULL, NULL),
(829, NULL, '2.22.06.1.01.0004', 'Penyediaan dan Pemeliharaan Sarana dan Prasarana Museum', 1, NULL, NULL, NULL, NULL, NULL),
(830, 265, '2.23.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(831, 265, '2.23.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(832, 265, '2.23.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(833, 266, '2.23.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(834, 266, '2.23.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(835, 267, '2.23.01.1.03.0001', 'Penyusunan Perencanaan Kebutuhan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(836, 267, '2.23.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(837, 268, '2.23.01.1.05.0002', 'Pengadaan Pakaian Dinas Beserta AtributKelengkapannya', 1, NULL, NULL, NULL, NULL, NULL),
(838, 269, '2.23.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(839, 269, '2.23.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(840, 269, '2.23.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(841, 269, '2.23.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(842, 269, '2.23.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(843, 269, '2.23.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(844, 269, '2.23.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(845, 269, '2.23.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(846, 270, '2.23.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(847, 271, '2.23.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(848, 271, '2.23.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(849, 272, '2.23.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(850, 272, '2.23.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(851, 273, '2.23.02.1.01.0002', 'Pengembangan Perpustakaan di Tingkat Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(852, 273, '2.23.02.1.01.0004', 'Pembinaan Perpustakaan pada Satuan Pendidikan Menengah dan Pendidikan Khusus di Seluruh Wilayah Provinsi sesuai dengan Standar Nasional Perpustakaan', 1, NULL, NULL, NULL, NULL, NULL),
(853, 273, '2.23.02.1.01.0006', 'Peningkatan Kapasitas Tenaga Perpustakaan dan Pustakawan Tingkat Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(854, 273, '2.23.02.1.01.0007', 'Pengembangan Layanan Perpustakaan Rujukan Tingkat Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(855, 273, '2.23.02.1.01.0009', 'Pengelolaan dan Pengembangan Bahan Pustaka', 1, NULL, NULL, NULL, NULL, NULL),
(856, 273, '2.23.02.1.01.0015', 'Pengembangan dan Pemeliharaan Layanan Perpustakaan Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(857, 274, '2.23.02.1.02.0001', 'Sosialisasi Budaya Baca dan Literasi pada Satuan Pendidikan Tingkat Menengah dan Pendidikan Khusus serta Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(858, 274, '2.23.02.1.02.0004', 'Pengembangan Literasi Berbasis Inklusi Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(859, 275, '2.23.03.1.01.0001', 'Penghimpunan dan Pengelolaan Serah Simpan Karya Cetak dan Karya Rekam', 1, NULL, NULL, NULL, NULL, NULL),
(860, 276, '2.23.03.1.02.0001', 'Penerbitan Katalog Induk Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(861, 276, '2.23.03.1.02.0002', 'Penerbitan Bibliografi Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(862, 277, '2.23.03.1.03.0002', 'Pengembangan  Pengolahan dan Pengalihmediaan Naskah Kuno yang dimiliki oleh Masyarakat untuk Dilestarikan dan Didayagunakan', 1, NULL, NULL, NULL, NULL, NULL),
(863, 278, '2.24.02.1.01.0005', 'Pelaksanaan Alih Media Arsip Dinamis dan Autentikasi', 1, NULL, NULL, NULL, NULL, NULL),
(864, 278, '2.24.02.1.01.0006', 'Penciptaan dan Pemeliharaan Arsip Dinamis', 1, NULL, NULL, NULL, NULL, NULL),
(865, 279, '2.24.02.1.02.0001', 'Pengumpulan dan Penyampaian Salinan Otentik Naskah Asli Arsip Terjaga kepada ANRI', 1, NULL, NULL, NULL, NULL, NULL),
(866, 279, '2.24.02.1.02.0005', 'Akuisisi Arsip Statis', 1, NULL, NULL, NULL, NULL, NULL),
(867, 280, '2.24.02.1.03.0001', 'Penyediaan Informasi  Akses dan Layanan Kearsipan Tingkat Daerah Provinsi Melalui JIKN', 1, NULL, NULL, NULL, NULL, NULL),
(868, 280, '2.24.02.1.03.0002', 'Pemberdayaan Kapasitas Unit Kearsipan dan Lembaga Kearsipan Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(869, 281, '3.25.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(870, 281, '3.25.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(871, 281, '3.25.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(872, 282, '3.25.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(873, 282, '3.25.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(874, 282, '3.25.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(875, 283, '3.25.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(876, 283, '3.25.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(877, 284, '3.25.01.1.05.0002', 'Pengadaan Pakaian Dinas Beserta AtributKelengkapannya', 1, NULL, NULL, NULL, NULL, NULL),
(878, 284, '3.25.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(879, 284, '3.25.01.1.05.0010', 'Sosialisasi Peraturan Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(880, 285, '3.25.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(881, 285, '3.25.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(882, 285, '3.25.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(883, 285, '3.25.01.1.06.0004', 'Penyediaan Bahan Logistik Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(884, 285, '3.25.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(885, 285, '3.25.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(886, 285, '3.25.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(887, 285, '3.25.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(888, 285, '3.25.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(889, 286, '3.25.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(890, 286, '3.25.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(891, 287, '3.25.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(892, 287, '3.25.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(893, 287, '3.25.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(894, NULL, '3.25.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(895, NULL, '3.25.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(896, NULL, '3.25.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(897, 288, '3.25.02.1.01.0001', 'Penyusunan dan Penetapan Rencana Zonasi Wilayah Pesisir dan Pulau-Pulau Kecil', 1, NULL, NULL, NULL, NULL, NULL),
(898, 288, '3.25.02.1.01.0002', 'Pengelolaan Kawasan Konservasi di Wilayah Pesisir dan Pulau-Pulau Kecil Berdasarkan Penetapan dari Pemerintah Pusat', 1, NULL, NULL, NULL, NULL, NULL),
(899, 288, '3.25.02.1.01.0003', 'Rehabilitasi Wilayah Perairan Pesisir dan Pulau-Pulau Kecil', 1, NULL, NULL, NULL, NULL, NULL),
(900, 288, '3.25.02.1.01.0004', 'Mitigasi Bencana Wilayah Pesisir dan Pulau-Pulau Kecil', 1, NULL, NULL, NULL, NULL, NULL),
(901, 289, '3.25.02.1.02.0002', 'Penerbitan Rekomendasi Izin Lokasi dan Izin Pengelolaan Ruang Laut di Bawah 12 Mil di Luar Minyak dan Gas Bumi', 1, NULL, NULL, NULL, NULL, NULL),
(902, 290, '3.25.02.1.03.0001', 'Pengembangan Kapasitas Masyarakat Pesisir dan Pulau-Pulau Kecil', 1, NULL, NULL, NULL, NULL, NULL),
(903, 290, '3.25.02.1.03.0002', 'Penguatan dan Pengembangan Kelembagaan Masyarakat Pesisir dan Pulau-Pulau Kecil', 1, NULL, NULL, NULL, NULL, NULL),
(904, 291, '3.25.03.1.01.0002', 'Penyediaan Prasarana Usaha Perikanan Tangkap', 1, NULL, NULL, NULL, NULL, NULL),
(905, 291, '3.25.03.1.01.0003', 'Penjaminan Ketersediaan Sarana Usaha Perikanan Tangkap', 1, NULL, NULL, NULL, NULL, NULL),
(906, 292, '3.25.03.1.02.0001', 'Penyediaan Data dan Informasi Sumber Daya Ikan', 1, NULL, NULL, NULL, NULL, NULL),
(907, 292, '3.25.03.1.02.0003', 'Penjaminan Ketersediaan Sarana Usaha Perikanan Tangkap', 1, NULL, NULL, NULL, NULL, NULL),
(908, 293, '3.25.03.1.03.0002', 'Penerbitan Rekomendasi Izin Usaha Perikanan Tangkap untuk Kapal Perikanan Berukuran di Atas 10 GT sampai dengan 30 GT', 1, NULL, NULL, NULL, NULL, NULL),
(909, 294, '3.25.03.1.06.0001', 'Penentuan Lokasi Pembangunan Pelabuhan Perikanan', 1, NULL, NULL, NULL, NULL, NULL),
(910, 294, '3.25.03.1.06.0002', 'Penyediaan Sarana dan Prasarana Pelabuhan Perikanan', 1, NULL, NULL, NULL, NULL, NULL),
(911, 294, '3.25.03.1.06.0003', 'Pelaksanaan Fungsi Pemerintahan dan Pengusahaan Pelabuhan Perikanan', 1, NULL, NULL, NULL, NULL, NULL),
(912, 295, '3.25.03.1.09.0002', 'Penerbitan Pendaftaran Kapal Perikanan dengan Ukuran di atas 10 GT sampai dengan 30 GT', 1, NULL, NULL, NULL, NULL, NULL),
(913, NULL, '3.25.04.1.01.0002', 'Penerbitan Rekomendasi Izin Usaha Perikanan Bidang Pembudidayaan Ikan', 1, NULL, NULL, NULL, NULL, NULL),
(914, 296, '3.25.04.1.05.0001', 'Penyediaan Data dan Informasi Pembudidayaan Ikan di Laut dan Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(915, 296, '3.25.04.1.05.0002', 'Penyediaan Prasarana Pembudidayaan Ikan di Laut', 1, NULL, NULL, NULL, NULL, NULL),
(916, 296, '3.25.04.1.05.0004', 'Penjaminan Ketersediaan Sarana Pembudidayaan Ikan di Laut', 1, NULL, NULL, NULL, NULL, NULL),
(917, 296, '3.25.04.1.05.0006', 'Pengelolaan Kesehatan Ikan dan Lingkungan Budidaya di Laut dan Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(918, 296, '3.25.04.1.05.0007', 'Pembinaan dan Pemantauan Pembudidayaan Ikan di Laut dan di Kawasan Konservasi yang Dikelola oleh Pemerintah Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(919, 296, '3.25.04.1.05.05', 'Penyediaan Sarana Pembudidayaan Ikan di Air Payau dan Air Tawar yang Penggunaan Sumber Dayanya Lebih Efisien apabila Dilakukan oleh Daerah Provinsi dan/atau Manfaat atau Dampak Negatifnya Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(920, 297, '3.25.04.1.06.0001', 'Penyediaan Prasarana Pembudidayaan Ikan di Air Payau dan Air Tawar yang Penggunaan Sumber Dayanya Lebih Efisien apabila Dilakukan oleh Daerah Provinsi dan/atau Manfaat atau Dampak Negatifnya Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(921, 297, '3.25.04.1.06.0002', 'Penyediaan Sarana Pembudidayaan Ikan di Air Payau dan Air Tawar yang Penggunaan Sumber Dayanya Lebih Efisien apabila Dilakukan oleh Daerah Provinsi dan/atau Manfaat atau Dampak Negatifnya Lintas Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(922, 298, '3.25.05.1.01.0001', 'Pengawasan Pemanfaatan Ruang Laut sampai dengan 12 Mil', 1, NULL, NULL, NULL, NULL, NULL),
(923, 298, '3.25.05.1.01.0003', 'Pengawasan Usaha Perikanan Bidang Pembudidayaan Ikan di Laut sampai dengan 12 Mil', 1, NULL, NULL, NULL, NULL, NULL),
(924, 298, '3.25.05.1.01.0004', 'Penumbuhan dan Pengembangan Kelompok Masyarakat Pengawas (POKMASWAS)', 1, NULL, NULL, NULL, NULL, NULL),
(925, 299, '3.25.05.1.02.0001', 'Pengawasan Usaha Perikanan Tangkap di Wilayah Sungai  Danau  Waduk  Rawa  dan Genangan Air Lainnya yang Dapat Diusahakan Lintas Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi Sesuai dengan Kewenangannya', 1, NULL, NULL, NULL, NULL, NULL),
(926, 299, '3.25.05.1.02.0002', 'Pengawasan Usaha Perikanan Bidang Pembudidayaan Ikan di Wilayah Sungai  Danau  Waduk  Rawa  dan Genangan Air Lainnya yang Dapat Diusahakan Lintas Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi Sesuai dengan Kewenangannya', 1, NULL, NULL, NULL, NULL, NULL),
(927, 299, '3.25.05.1.02.0003', 'Pengawasan Usaha Pemasaran dan Pengolahan Hasil Perikanan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(928, 300, '3.25.06.1.01.0002', 'Penerbitan Rekomendasi Izin Usaha Pemasaran dan Pengolahan Hasil Perikanan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(929, 300, '3.25.06.1.01.0003', 'Penyediaan Data dan Informasi Usaha Pemasaran dan Pengolahan Hasil Perikanan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(930, NULL, '3.25.06.1.02.0001', 'Pelaksanaan Bimbingan dan Penerapan Persyaratan atau Standar Pada Usaha Pengolahan dan Pemasaran Skala Menengah dan Besar', 1, NULL, NULL, NULL, NULL, NULL),
(931, NULL, '3.25.06.1.02.0002', 'Pelaksanaan Bimbingan  Fasilitasi  Pemantauan  dan Evaluasi Terhadap Mutu dan Keamanan Hasil Perikanan dalam rangka Menghasilkan Produk yang Aman untuk Dikonsumsi atau Digunakan  dan Berdaya Saing', 1, NULL, NULL, NULL, NULL, NULL),
(932, 301, '3.25.06.1.03.0001', 'Pemetaaan dan Pemantauan Kebutuhan Bahan Baku Usaha Pengolahan/Distribusi Ikan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(933, 301, '3.25.06.1.03.0002', 'Pemberian Insentif dan Fasilitasi bagi Pelaku Usaha Perikanan Lintas Daerah Kabupaten/Kota dalam 1 (Satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(934, 302, '3.26.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(935, 302, '3.26.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(936, 303, '3.26.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(937, 303, '3.26.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(938, 303, '3.26.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(939, 303, '3.26.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(940, 304, '3.26.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(941, 304, '3.26.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(942, 305, '3.26.01.1.05.0003', 'Pendataan dan Pengolahan AdministrasiKepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(943, 305, '3.26.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(944, 306, '3.26.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(945, 306, '3.26.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(946, 306, '3.26.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(947, 306, '3.26.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(948, 306, '3.26.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(949, 306, '3.26.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(950, 306, '3.26.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(951, 307, '3.26.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(952, 307, '3.26.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(953, 307, '3.26.01.1.07.0011', 'Pengadaan Sarana dan Prasarana Pendukung Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(954, 308, '3.26.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(955, 308, '3.26.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(956, 308, '3.26.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(957, 309, '3.26.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(958, 309, '3.26.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(959, 310, '3.26.02.1.01.0008', 'Peningkatan Kapasitas SDM Pengelola Daya Tarik Wisata Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(960, 311, '3.26.02.1.03.0002', 'Perencanaan Destinasi Pariwisata Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(961, 311, '3.26.02.1.03.0007', 'Penerapan Destinasi Pariwisata Berkelanjutan dalam Pengelolaan Destinasi Pariwisata Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(962, 311, '3.26.02.1.03.0010', 'Peningkatan Kapasitas SDM Pengelola Destinasi Pariwisata Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(963, 312, '3.26.02.1.04.0011', 'Penyediaan Layanan Konsultasi Pendaftaran Perizinan Berusaha Berbasis Risiko Sektor Pariwisata di Tingkat Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(964, 312, '3.26.02.1.04.0013', 'Kesediaaan pelaku usaha memenuhi standar usaha pariwisata', 1, NULL, NULL, NULL, NULL, NULL),
(965, 313, '3.26.03.1.01.0001', 'Penguatan Promosi Melalui Media Cetak  Elektronik  dan Media Lainnya Baik Dalam dan Luar Negeri', 1, NULL, NULL, NULL, NULL, NULL),
(966, 313, '3.26.03.1.01.0006', 'Fasilitasi Kegiatan Pemasaran Pariwisata Baik Dalam dan Luar Negeri', 1, NULL, NULL, NULL, NULL, NULL),
(967, 313, '3.26.03.1.01.03', 'Penyediaan Data dan Penyebaran Informasi Pariwisata Provinsi  Baik Dalam dan Luar Negeri', 1, NULL, NULL, NULL, NULL, NULL),
(968, 313, '3.26.03.1.01.04', 'Peningkatan Kerja Sama dan Kemitraan Pariwisata Dalam dan Luar Negeri', 1, NULL, NULL, NULL, NULL, NULL),
(969, 314, '3.26.04.1.01.0006', 'Perluasan Pasar Produk Kreatif Baik di Pasar Ekspor maupun Pasar Domestik', 1, NULL, NULL, NULL, NULL, NULL),
(970, 314, '3.26.04.1.01.01', 'Layanan Penyediaan Sarana dan Prasarana Kota Kreatif', 1, NULL, NULL, NULL, NULL, NULL),
(971, 315, '3.26.04.1.02.0005', 'Pengembangan Sistem Pemasaran', 1, NULL, NULL, NULL, NULL, NULL),
(972, 315, '3.26.04.1.02.0018', 'Fasilitasi Pendaftaran Kekayaan Intelektual', 1, NULL, NULL, NULL, NULL, NULL),
(973, 316, '3.26.05.1.01.0004', 'Fasilitasi Sertifikasi Kompetensi bagi Tenaga Kerja Bidang Pariwisata', 1, NULL, NULL, NULL, NULL, NULL),
(974, 316, '3.26.05.1.01.0014', 'Pemberdayaan dan Pembinaan Masyarakat untuk Pengembangan Pariwisata', 1, NULL, NULL, NULL, NULL, NULL),
(975, 316, '3.26.05.1.01.0015', 'Diklat Teknis Kepariwisataan Tingkat Lanjutan bagi Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(976, 317, '3.26.05.1.02.0001', 'Pelatihan  Bimbingan Teknis  dan Pendampingan Ekonomi Kreatif', 1, NULL, NULL, NULL, NULL, NULL),
(977, 318, '3.27.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(978, 318, '3.27.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(979, 319, '3.27.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(980, 319, '3.27.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(981, 319, '3.27.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(982, 319, '3.27.01.1.02.0008', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 1, NULL, NULL, NULL, NULL, NULL),
(983, 320, '3.27.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(984, 320, '3.27.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(985, 321, '3.27.01.1.04.0007', 'Pelaporan Pengelolaan Retribusi Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(986, 322, '3.27.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(987, 323, '3.27.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(988, 323, '3.27.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(989, 323, '3.27.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(990, 323, '3.27.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(991, 323, '3.27.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(992, 323, '3.27.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(993, 323, '3.27.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(994, 323, '3.27.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(995, 324, '3.27.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(996, 324, '3.27.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(997, 324, '3.27.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(998, 325, '3.27.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(999, 325, '3.27.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1000, 325, '3.27.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1001, 325, '3.27.01.1.09.0011', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Pendukung Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1002, 326, '3.27.02.1.01.0001', 'Pengawasan Sebaran Pupuk  Pestisida  Alsintan  dan Sarana Pendukung Pertanian', 1, NULL, NULL, NULL, NULL, NULL),
(1003, 326, '3.27.02.1.01.0002', 'Koordinasi dan Sinkronisasi Pengawasan Peredaran Sarana Pertanian', 1, NULL, NULL, NULL, NULL, NULL),
(1004, 327, '3.27.02.1.02.0001', 'Pengelolaan Penerbitan Sertifikat Benih', 1, NULL, NULL, NULL, NULL, NULL),
(1005, 327, '3.27.02.1.02.04', 'Pengawasan Mutu  Penyediaan dan Peredaran Benih/Bibit Perkebunan', 1, NULL, NULL, NULL, NULL, NULL),
(1006, 328, '3.27.02.1.04.02', 'Pengembangan dan Pelaksanaan Sistem Manajemen Mutu Benih/Bibit Ternak dan Tanaman Pakan Ternak  Bahan Pakan  serta Pakan Kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1007, 329, '3.27.02.1.05.0003', 'Pengawasan Peredaran dan Sertifikasi Benih/Bibit Ternak', 1, NULL, NULL, NULL, NULL, NULL),
(1008, 329, '3.27.02.1.05.01', 'Pengendalian Penyediaan dan Produksi Benih/Bibit Ternak dan Hijauan Pakan Ternak', 1, NULL, NULL, NULL, NULL, NULL),
(1009, 330, '3.27.02.1.06.0001', 'Pemeriksaan Mutu  Khasiat dan Keamanan Peredaran Obat Hewan', 1, NULL, NULL, NULL, NULL, NULL),
(1010, 331, '3.27.03.1.01.0001', 'Perencanaan Pengembangan Prasarana  Kawasan dan Komoditas Pertanian', 1, NULL, NULL, NULL, NULL, NULL),
(1011, 331, '3.27.03.1.01.0007', 'Pembangunan dan Pemeliharaan Laboratorium Pertanian', 1, NULL, NULL, NULL, NULL, NULL),
(1012, 331, '3.27.03.1.01.0009', 'Koordinasi  Sinkronisasi dan Penataan Prasarana Pendukung Pertanian Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1013, 331, '3.27.03.1.01.0010', 'Pembangunan  Rehabilitasi dan Pemeliharaan Rutin Gedung UPTD Pertanian serta Sarana Pendukungnya', 1, NULL, NULL, NULL, NULL, NULL),
(1014, 332, '3.27.04.1.01.01', 'Pengendalian Risiko dan Penanggulangan Penyakit Hewan dan Zoonosis', 1, NULL, NULL, NULL, NULL, NULL),
(1015, 333, '3.27.04.1.02.01', 'Penilaian Risiko Penyakit Hewan dan Keamanan Produk Hewan', 1, NULL, NULL, NULL, NULL, NULL),
(1016, 334, '3.27.04.1.03.0001', 'Pemenuhan Persyaratan Teknis Sertifikasi Zona/Kompartemen Bebas Penyakit', 1, NULL, NULL, NULL, NULL, NULL),
(1017, 334, '3.27.04.1.03.0002', 'Pembinaan Penerapan Persyaratan Teknis Sertifikasi Unit Usaha Produk Hewan', 1, NULL, NULL, NULL, NULL, NULL),
(1018, 334, '3.27.04.1.03.0003', 'Pengujian Laboratorium Kesehatan Hewan dan Kesehatan Masyarakat Veteriner', 1, NULL, NULL, NULL, NULL, NULL),
(1019, 335, '3.27.04.1.04.01', 'Pengelolaan Penerbitan Sertifikasi Keamanan Produk Hewan', 1, NULL, NULL, NULL, NULL, NULL),
(1020, 336, '3.27.04.1.05.01', 'Pengelolaan Penerbitan Sertifikat Kesejahteraan Hewan dan Nomor Kontrol Veteriner (NKV)', 1, NULL, NULL, NULL, NULL, NULL),
(1021, 337, '3.27.05.1.01.0001', 'Pengendalian Organisme Pengganggu Tumbuhan (OPT) Tanaman Pangan  Hortikultura  dan Perkebunan', 1, NULL, NULL, NULL, NULL, NULL),
(1022, 337, '3.27.05.1.01.0003', 'Pencegahan  Penanganan Kebakaran Lahan  dan Gangguan Usaha Tanaman Pangan  Hortikultura  dan Perkebunan', 1, NULL, NULL, NULL, NULL, NULL),
(1023, 338, '3.27.06.1.01.03', 'Pembinaan dan Pengawasan Penerapan Izin Usaha Pertanian', 1, NULL, NULL, NULL, NULL, NULL),
(1024, 339, '3.27.07.1.02.0001', 'Diseminasi Informasi Teknis  Sosial  Ekonomi dan Inovasi Pertanian', 1, NULL, NULL, NULL, NULL, NULL),
(1025, 339, '3.27.07.1.02.0002', 'Pelaksanaan Penyuluhan dan Pemberdayaan Petani', 1, NULL, NULL, NULL, NULL, NULL),
(1026, 340, '3.27.07.1.03.01', 'Pembentukan dan Penguatan Kelembagaan Koorporasi Petani', 1, NULL, NULL, NULL, NULL, NULL),
(1027, 340, '3.27.07.1.03.02', 'Pendampingan Manajemen Koorporasi Petani', 1, NULL, NULL, NULL, NULL, NULL),
(1028, 341, '3.28.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1029, 341, '3.28.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1030, 342, '3.28.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1031, 343, '3.28.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1032, 344, '3.28.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1033, 345, '3.28.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1034, 345, '3.28.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1035, 345, '3.28.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1036, 345, '3.28.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1037, 345, '3.28.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1038, 345, '3.28.01.1.06.0011', 'Dukungan Pelaksanaan Sistem Pemerintahan Berbasis Elektronik pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1039, 346, '3.28.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(1040, 346, '3.28.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1041, 346, '3.28.01.1.07.0009', 'Pengadaan Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1042, 346, '3.28.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1043, 347, '3.28.01.1.08.0001', 'Penyediaan Jasa Surat Menyurat', 1, NULL, NULL, NULL, NULL, NULL),
(1044, 347, '3.28.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1045, 347, '3.28.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1046, 348, '3.28.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1047, 348, '3.28.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1048, 348, '3.28.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1049, 348, '3.28.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1050, 349, '3.28.03.1.01.0004', 'Koordinasi dan Sinkronisasi Usulan Perubahan Fungsi dan Peruntukan Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(1051, 350, '3.28.03.1.02.0001', 'Penyusunan Rencana Pengelolaan Kesatuan Pengelolaan Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(1052, 351, '3.28.03.1.03.0001', 'Penyediaan Data dan Informasi Wilayah Usaha di Kawasan Hutan Produksi', 1, NULL, NULL, NULL, NULL, NULL),
(1053, 351, '3.28.03.1.03.0002', 'Penyediaan Data dan Informasi Wilayah Usaha di Kawasan Hutan Lindung', 1, NULL, NULL, NULL, NULL, NULL),
(1054, 351, '3.28.03.1.03.0003', 'Pelayanan Perizinan Usaha/Kerja Sama Melalui Sistem Pelayanan Perizinan Berusaha Terintegrasi Secara Elektronik  di Kawasan Hutan Produksi dan Hutan Lindung pada Blok Pemanfaatan Kecuali pada Wilayah Perum Perhutani', 1, NULL, NULL, NULL, NULL, NULL),
(1055, 351, '3.28.03.1.03.0004', 'Koordinasi dan Sinkronisasi Pengendalian Izin Usaha atau Kerjasama Pemanfaatan di Kawasan Hutan Produksi', 1, NULL, NULL, NULL, NULL, NULL),
(1056, 352, '3.28.03.1.04.0001', 'Penyusunan Rencana Tahunan Rehabilitasi Lahan (RTnRL)', 1, NULL, NULL, NULL, NULL, NULL),
(1057, 352, '3.28.03.1.04.0004', 'Pembangunan Penghijauan Lingkungan di Luar Kawasan Hutan Negara', 1, NULL, NULL, NULL, NULL, NULL),
(1058, 352, '3.28.03.1.04.0008', 'Pembinaan dan/atau Pengawasan dalam rangka Pengembangan Rehabilitasi Lahan', 1, NULL, NULL, NULL, NULL, NULL),
(1059, 353, '3.28.03.1.05.0001', 'Pencegahan dan Pembatasan Kerusakan Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(1060, 353, '3.28.03.1.05.0002', 'Pencegahan dan Pembatasan Kerusakan Kawasan Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(1061, 353, '3.28.03.1.05.0003', 'Pencegahan dan Pembatasan Kerusakan Hasil Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(1062, 353, '3.28.03.1.05.0004', 'Koordinasi  Sinkronisasi dan Pelaksanaan Perlindungan Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(1063, 353, '3.28.03.1.05.0005', 'Koordinasi  Sinkronisasi dan Pelaksanaan Pencegahan/Penanggulangan Kebakaran Hutan dan Lahan', 1, NULL, NULL, NULL, NULL, NULL),
(1064, 354, '3.28.03.1.06.0004', 'Pengawasan Perizinan Pengolahan Hasil Hutan Bukan Kayu', 1, NULL, NULL, NULL, NULL, NULL),
(1065, 355, '3.28.03.1.07.0002', 'Pembinaan dan Pelaksanaan Pengolahan Hasil Hutan Kayu dengan Kapasitas Produksi <6000 m3/Tahun', 1, NULL, NULL, NULL, NULL, NULL),
(1066, 355, '3.28.03.1.07.0003', 'Fasilitasi Pemenuhan Komitmen Izin Usaha Industri Primer Hasil Hutan Kayu (IUIPHHK) dengan Kapasitas Produksi <6000 m3/Tahun melalui Sistem Pelayanan Perizinan Berusaha Terintegrasi secara Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(1067, 356, '3.28.03.1.09.0001', 'Penetapan Pengadaan Benih dan Pengedar Benih dan/atau Bibit Terdaftar', 1, NULL, NULL, NULL, NULL, NULL),
(1068, 357, '3.28.04.1.01.0002', 'Pengamanan Kawasan TAHURA Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1069, 357, '3.28.04.1.01.0003', 'Pengawetan Tumbuhan  Satwa  serta Habitat TAHURA Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1070, 357, '3.28.04.1.01.0005', 'Pemulihan Ekosistem atau Penutupan Kawasan sesuai Rencana Pengelolaan TAHURA Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1071, 357, '3.28.04.1.01.0006', 'Pemanfaatan Jasa Lingkungan TAHURA Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1072, 357, '3.28.04.1.01.0007', 'Kerja Sama Penyelenggaraaan TAHURA Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1073, 357, '3.28.04.1.01.0008', 'Penguatan Kapasitas dan Pemberdayaan Masyarakat di sekitar TAHURA Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1074, 357, '3.28.04.1.01.0011', 'Perencanaan Pengelolaan TAHURA', 1, NULL, NULL, NULL, NULL, NULL),
(1075, 357, '3.28.04.1.01.01', 'Pencegahan  Penanggulangan dan Pembatasan Kerusakan Kawasan TAHURA', 1, NULL, NULL, NULL, NULL, NULL),
(1076, 357, '3.28.04.1.01.04', 'Pengawetan Koridor Hidupan Liar', 1, NULL, NULL, NULL, NULL, NULL),
(1077, 358, '3.28.04.1.02.0001', 'Pengendalian dan Pengawasan Tumbuhan dan Satwa Liar yang tidak Dilindungi dan/atau Tidak Masuk dalam Lampiran CITES', 1, NULL, NULL, NULL, NULL, NULL),
(1078, 359, '3.28.04.1.03.0005', 'Penguatan Kapasitas dan Pemberdayaan Masyarakat di Kawasan Bernilai Ekosistem Penting Kewenangan Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1079, 360, '3.28.05.1.01.0001', 'Peningkatan Kapasitas dan Kompetensi Penyuluh Kehutanan dan SDM Bidang Kehutanan', 1, NULL, NULL, NULL, NULL, NULL),
(1080, 360, '3.28.05.1.01.0002', 'Penguatan dan Pendampingan Kelembagaan Kelompok Tani Hutan', 1, NULL, NULL, NULL, NULL, NULL),
(1081, 360, '3.28.05.1.01.0003', 'Penyiapan dan Pengembangan Perhutanan Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(1082, 361, '3.28.06.1.01.0004', 'Pemberdayaan Masyarakat dalam Kegiatan Pengelolaan DAS', 1, NULL, NULL, NULL, NULL, NULL),
(1083, 361, '3.28.06.1.01.06', 'Peningkatan Koordinasi dan Sinkronisasi Pengelolaan DAS', 1, NULL, NULL, NULL, NULL, NULL),
(1084, 362, '3.29.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1085, 362, '3.29.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1086, 362, '3.29.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1087, 362, '3.29.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1088, NULL, '3.29.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1089, NULL, '3.29.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1090, 363, '3.29.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1091, 363, '3.29.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1092, 364, '3.29.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1093, 365, '3.29.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1094, 365, '3.29.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1095, 365, '3.29.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1096, 365, '3.29.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1097, 365, '3.29.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1098, 366, '3.29.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(1099, 366, '3.29.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1100, 367, '3.29.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1101, 367, '3.29.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1102, 368, '3.29.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1103, 368, '3.29.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1104, 368, '3.29.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1105, 369, '3.29.02.1.01.0001', 'Pengumpulan dan Pengolahan Data Zona Konservasi Air Tanah pada Cekungan Air Tanah', 1, NULL, NULL, NULL, NULL, NULL),
(1106, 369, '3.29.02.1.01.0002', 'Penentuan dan Penetapan Zona Konservasi Air Tanah pada Cekungan Air Tanah', 1, NULL, NULL, NULL, NULL, NULL),
(1107, 369, '3.29.02.1.01.0003', 'Pengendalian dan Pengawasan Pemanfaatan Zona Konservasi Air Tanah pada Cekungan Air Tanah', 1, NULL, NULL, NULL, NULL, NULL),
(1108, 370, '3.29.02.1.03.0003', 'Pengendalian dan Pengawasan Pemanfaatan Air Tanah', 1, NULL, NULL, NULL, NULL, NULL),
(1109, 371, '3.29.03.1.01.0001', 'Pengumpulan dan Pengolahan Data dan Informasi Wilayah Izin Usaha Pertambangan Mineral Bukan Logam dan Batuan dalam 1 (satu) Daerah Provinsi dan Wilayah Laut sampai dengan 12 Mil', 1, NULL, NULL, NULL, NULL, NULL),
(1110, 372, '3.29.03.1.03.0004', 'Pengendalian dan Pengawasan Pelaksanaan Perizinan Usaha Pertambangan Mineral Bukan Logam dan Batuan dalam rangka Penanaman Modal Dalam Negeri pada Wilayah Izin Usaha Pertambangan Daerah yang Berada dalam 1 (satu) Daerah Provinsi termasuk Wilayah Laut sampai dengan 12 Mil Laut', 1, NULL, NULL, NULL, NULL, NULL),
(1111, 372, '3.29.03.1.03.0005', 'Pengawasan Teknis Kaidah Pertambangan yang baik Perizinan Usaha Pertambangan Mineral Bukan Logam dan Batuan dalam rangka Penanaman Modal Dalam Negeri pada Wilayah Izin Usaha Pertambangan Daerah yang Berada dalam 1 (satu) Daerah Provinsi Termasuk Wilayah Laut sampai dengan 12 Mil Laut', 1, NULL, NULL, NULL, NULL, NULL),
(1112, 373, '3.29.05.1.03.0004', 'Pengendalian dan Pengawasan Pelaksanaan Perizinan Usaha Niaga Bahan Bakar Nabati (Biofuel) Sebagai Bahan Bakar lain dengan Kapasitas Penyediaan sampai dengan 10.000 (sepuluh ribu) Ton Per Tahun', 1, NULL, NULL, NULL, NULL, NULL),
(1113, 374, '3.29.05.1.04.01', 'Perumusan dan Penetapan Kebijakan Strategi dan Program Konservasi Energi', 1, NULL, NULL, NULL, NULL, NULL),
(1114, 374, '3.29.05.1.04.03', 'Sosialisasi secara Menyeluruh dan Komprehensif untuk Penggunaan Teknologi yang Menerapkan Konservasi Energi', 1, NULL, NULL, NULL, NULL, NULL),
(1115, 374, '3.29.05.1.04.04', 'Pengalokasian Anggaran untuk Program Konservasi Energi', 1, NULL, NULL, NULL, NULL, NULL),
(1116, 375, '3.29.06.1.01.0003', 'Pengendalian dan Pengawasan Pelaksanaan Perizinan Usaha Penyediaan Tenaga Listrik Non Badan Usaha Milik Negara dan Penjualan Tenaga Listrik serta Penyewaan Jaringan kepada Penyedia Tenaga Listrik dalam Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1117, 376, '3.29.06.1.02.0003', 'Pengendalian dan Pengawasan Pelaksanaan Perizinan Operasi yang Fasilitas Instalasinya dalam Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1118, 377, '3.29.06.1.05.0003', 'Pengendalian dan Pengawasan Pelaksanaan Perizinan Usaha Jasa Penunjang Tenaga Listrik bagi Badan Usaha Dalam Negeri/Mayoritas Sahamnya Dimiliki oleh Penanam Modal Dalam Negeri', 1, NULL, NULL, NULL, NULL, NULL),
(1119, 378, '3.29.06.1.06.0004', 'Pengumpulan dan Pengolahan Data dan Informasi Sasaran Pembangunan Sarana Penyediaan Tenaga Listrik Belum Berkembang  Daerah Terpencil dan Perdesaan', 1, NULL, NULL, NULL, NULL, NULL),
(1120, 378, '3.29.06.1.06.0006', 'Pembangunan Sarana Penyediaan Tenaga Listrik Belum Berkembang  Daerah Terpencil dan Perdesaan', 1, NULL, NULL, NULL, NULL, NULL),
(1121, 379, '3.30.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1122, 380, '3.30.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1123, 380, '3.30.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1124, 380, '3.30.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1125, 380, '3.30.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1126, 381, '3.30.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1127, 381, '3.30.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1128, 382, '3.30.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1129, 383, '3.30.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1130, 383, '3.30.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1131, 383, '3.30.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1132, 383, '3.30.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1133, 383, '3.30.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1134, 383, '3.30.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1135, 384, '3.30.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1136, 384, '3.30.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1137, NULL, '3.30.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1138, NULL, '3.30.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1139, NULL, '3.30.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1140, 385, '3.30.03.1.01.0003', 'Penataan  Pembinaan  dan Pengembangan Pasar Lelang Komoditas', 1, NULL, NULL, NULL, NULL, NULL),
(1141, NULL, '3.30.04.1.02.0001', 'Pemantauan Harga dan Stok Barang Kebutuhan Pokok dan Barang Penting pada Pelaku Usaha Distribusi Barang Lintas Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1142, NULL, '3.30.04.1.02.0002', 'Operasi Pasar dalam rangka Stabilisasi Harga Pangan Pokok yang Dampaknya Beberapa Daerah Kabupaten/Kota dalam 1 (satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1143, 386, '3.30.04.1.03.0003', 'Pengawasan Penyaluran dan Penggunaan Pupuk Bersubsidi', 1, NULL, NULL, NULL, NULL, NULL),
(1144, 386, '3.30.04.1.03.0004', 'Koordinasi dan Sinkronisasi Pengawasan Pupuk Bersubsidi dan Pestisida', 1, NULL, NULL, NULL, NULL, NULL),
(1145, NULL, '3.30.05.1.01.0001', 'Pameran Dagang Internasional/Nasional', 1, NULL, NULL, NULL, NULL, NULL),
(1146, NULL, '3.30.05.1.01.0004', 'Peningkatan Citra Produk Ekspor', 1, NULL, NULL, NULL, NULL, NULL),
(1147, NULL, '3.30.05.1.01.05', 'Pembinaan Pelaku Usaha Ekspor', 1, NULL, NULL, NULL, NULL, NULL),
(1148, 387, '3.30.06.1.01.0001', 'Pemberdayaan Konsumen dan Kelembagaan Perlindungan Konsumen', 1, NULL, NULL, NULL, NULL, NULL),
(1149, 387, '3.30.06.1.01.0002', 'Peningkatan Hubungan Kerja dengan Lembaga Perlindungan Konsumen', 1, NULL, NULL, NULL, NULL, NULL),
(1150, 387, '3.30.06.1.01.0003', 'Koordinasi dan Sinkronisasi Penanganan dan Penyelesaian Sengketa Konsumen', 1, NULL, NULL, NULL, NULL, NULL),
(1151, 388, '3.30.06.1.02.0004', 'Pengembangan Layanan Kalibrasi', 1, NULL, NULL, NULL, NULL, NULL),
(1152, 388, '3.30.06.1.02.0005', 'Pengembangan Layanan Pengujian', 1, NULL, NULL, NULL, NULL, NULL),
(1153, 388, '3.30.06.1.02.0006', 'Pemantauan Mutu Produk', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_kegiatan` (`id_sub_kegiatan`, `id_kegiatan`, `kode_rekening`, `nama_sub_kegiatan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(1154, 388, '3.30.06.1.02.0007', 'Pengembangan Layanan Sertifikasi/Lembaga Inspeksi', 1, NULL, NULL, NULL, NULL, NULL),
(1155, 389, '3.30.06.1.03.0003', 'Peningkatan Kapasitas dan Pelaksanaan Pengawasan Barang Beredar dan/atau Jasa serta Kegiatan Perdagangan sesuai Parameter Ketentuan Perlindungan Konsumen dan Tertib Niaga', 1, NULL, NULL, NULL, NULL, NULL),
(1156, 389, '3.30.06.1.03.0004', 'Fasilitasi Penanganan terhadap Pelanggaran Atas Ketentuan Perlindungan Konsumen dan Tertib Niaga', 1, NULL, NULL, NULL, NULL, NULL),
(1157, 390, '3.30.07.1.01.0002', 'Fasilitasi Promosi Penggunaan Produk Dalam Negeri di Tingkat Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1158, NULL, '3.30.07.1.03.0005', 'Fasilitasi Peningkatan Penggunaan Produk Dalam Negeri di Tingkat Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1159, NULL, '3.30.07.1.03.03', 'Peningkatan Sistem dan Jaringan Informasi Perdagangan', 1, NULL, NULL, NULL, NULL, NULL),
(1160, 391, '3.31.02.1.01.0001', 'Penyusunan Rencana Pembangunan Industri Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1161, 391, '3.31.02.1.01.0002', 'Koordinasi  Sinkronisasi  dan Pelaksanaan Kebijakan Percepatan Pengembangan  Penyebaran dan Perwilayahan Industri', 1, NULL, NULL, NULL, NULL, NULL),
(1162, 391, '3.31.02.1.01.0003', 'Koordinasi  Sinkronisasi  dan Pelaksanaan Pembangunan Sumber Daya Industri', 1, NULL, NULL, NULL, NULL, NULL),
(1163, 391, '3.31.02.1.01.0004', 'Koordinasi  Sinkronisasi  dan Pelaksanaan Pembangunan Sarana dan Prasarana Industri', 1, NULL, NULL, NULL, NULL, NULL),
(1164, 391, '3.31.02.1.01.0005', 'Koordinasi  Sinkronisasi  dan Pelaksanaan Pemberdayaan Industri dan Peran Serta Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(1165, 391, '3.31.02.1.01.0006', 'Evaluasi terhadap Pelaksanaan Rencana Pembangunan Industri', 1, NULL, NULL, NULL, NULL, NULL),
(1166, 392, '3.31.03.1.01.0003', 'Koordinasi dan Sinkronisasi Pengawasan terhadap Perizinan Berusaha sektor perindustrian yang menjadi kewenangan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1167, 392, '3.31.03.1.01.0004', 'Fasilitasi verifikasi pemenuhan persyaratan/standar kegiatan usaha sektor perindustrian dalam rangka penerbitan perizinan berusaha berbasis risiko melalui Sistem Informasi Industri Nasional (SIINas) yang terintegrasi dengan Sistem Online Single Submission Risk Base Approach (OSS RBA)', 1, NULL, NULL, NULL, NULL, NULL),
(1168, 393, '3.31.04.1.01.0002', 'Diseminasi dan Publikasi Data Informasi dan Analisis Industri Provinsi melalui SIINas', 1, NULL, NULL, NULL, NULL, NULL),
(1169, 393, '3.31.04.1.01.0003', 'Pemantauan dan Evaluasi Kepatuhan Perusahaan Industri dan Perusahaan Kawasan Industri Lingkup Provinsi dalam Penyampaian Data ke SIINas', 1, NULL, NULL, NULL, NULL, NULL),
(1170, NULL, '3.32.02.1.01.0002', 'Advokasi dan Musyawarah Penetapan Kawasan', 1, NULL, NULL, NULL, NULL, NULL),
(1171, 394, '3.32.03.1.01.0001', 'Koordinasi dan Sinkronisasi Kerjasama Pembangunan Transmigrasi Antar Pemerintah Daerah Kabupaten/kota dalam 1 (Satu) Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1172, 395, '3.32.04.1.01.0002', 'Penguatan Infrastruktur Sosial  Ekonomi dan Kelembagaan dalam rangka Pemantapan Satuan Pemukiman', 1, NULL, NULL, NULL, NULL, NULL),
(1173, 396, '4.01.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1174, 396, '4.01.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1175, 396, '4.01.01.1.01.0003', 'Koordinasi dan Penyusunan DokumenPerubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1176, 396, '4.01.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1177, 396, '4.01.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1178, 397, '4.01.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1179, 397, '4.01.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1180, 397, '4.01.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1181, 397, '4.01.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(1182, 397, '4.01.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1183, 398, '4.01.01.1.03.0001', 'Penyusunan Perencanaan Kebutuhan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1184, 398, '4.01.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1185, 398, '4.01.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1186, 398, '4.01.01.1.03.0007', 'Pemanfaatan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1187, 399, '4.01.01.1.05.0003', 'Pendataan dan Pengolahan AdministrasiKepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(1188, 399, '4.01.01.1.05.0005', 'Monitoring  Evaluasi  dan Penilaian KinerjaPegawai', 1, NULL, NULL, NULL, NULL, NULL),
(1189, 399, '4.01.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1190, 399, '4.01.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1191, 400, '4.01.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1192, 400, '4.01.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1193, 400, '4.01.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1194, 400, '4.01.01.1.06.0004', 'Penyediaan Bahan Logistik Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1195, 400, '4.01.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1196, 400, '4.01.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1197, 400, '4.01.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1198, 400, '4.01.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1199, 400, '4.01.01.1.06.0010', 'Penatausahaan Arsip Dinamis pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1200, 401, '4.01.01.1.07.0002', 'Pengadaan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1201, 401, '4.01.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(1202, 401, '4.01.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1203, 401, '4.01.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1204, 401, '4.01.01.1.07.0011', 'Pengadaan Sarana dan Prasarana Pendukung Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1205, 402, '4.01.01.1.08.0001', 'Penyediaan Jasa Surat Menyurat', 1, NULL, NULL, NULL, NULL, NULL),
(1206, 402, '4.01.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1207, 402, '4.01.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1208, 402, '4.01.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1209, 403, '4.01.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1210, 403, '4.01.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1211, 403, '4.01.01.1.09.0007', 'Pemeliharaan Aset Tetap Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1212, 403, '4.01.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1213, 403, '4.01.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1214, NULL, '4.01.01.1.11.0001', 'Penyediaan Gaji dan Tunjangan Kepala Daerah dan Wakil Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1215, NULL, '4.01.01.1.11.0002', 'Penyediaan Pakaian Dinas dan Atribut Kelengkapan Kepala Daerah dan Wakil Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1216, NULL, '4.01.01.1.11.0003', 'Pelaksanaan Medical Check Up Kepala Daerah dan Wakil Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1217, NULL, '4.01.01.1.11.0004', 'Penyediaan Dana Penunjang Operasional Kepala Daerah dan Wakil Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1218, NULL, '4.01.01.1.12.0001', 'Penyediaan Kebutuhan Rumah Tangga Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1219, NULL, '4.01.01.1.12.0002', 'Penyediaan Kebutuhan Rumah Tangga Wakil Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1220, NULL, '4.01.01.1.12.0003', 'Penyediaan Kebutuhan Rumah TanggaSekretariat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1221, 404, '4.01.01.1.13.0001', 'Penyiapan Materi Pimpinan', 1, NULL, NULL, NULL, NULL, NULL),
(1222, 404, '4.01.01.1.13.0002', 'Fasilitasi Komunikasi Pimpinan', 1, NULL, NULL, NULL, NULL, NULL),
(1223, 404, '4.01.01.1.13.0003', 'Pengelolaan Dokumentasi Pimpinan', 1, NULL, NULL, NULL, NULL, NULL),
(1224, 405, '4.01.01.1.14.0001', 'Fasilitasi dan Koordinasi Pelaksanaan Acara', 1, NULL, NULL, NULL, NULL, NULL),
(1225, 405, '4.01.01.1.14.0002', 'Fasilitasi Kunjungan Tamu Kepala Daerah dan Wakil Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1226, 405, '4.01.01.1.14.0003', 'Pengelolaan Hubungan Keprotokolan', 1, NULL, NULL, NULL, NULL, NULL),
(1227, 406, '4.01.02.1.01.0001', 'Fasilitasi Penataan Kelembagaan Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1228, 406, '4.01.02.1.01.0002', 'Fasilitasi Penataan Kelembagaan Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1229, 406, '4.01.02.1.01.0003', 'Penataan Analisis Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1230, 407, '4.01.02.1.02.0001', 'Pembinaan Pelaksanaan Reformasi Birokrasi', 1, NULL, NULL, NULL, NULL, NULL),
(1231, 407, '4.01.02.1.02.0002', 'Monitoring dan Evaluasi Akuntabilitas Kinerja', 1, NULL, NULL, NULL, NULL, NULL),
(1232, 407, '4.01.02.1.02.0003', 'Evaluasi Pelaksanaan Budaya Kerja', 1, NULL, NULL, NULL, NULL, NULL),
(1233, 407, '4.01.02.1.02.0004', 'Pengelolaan Tatalaksana Pemerintahan', 1, NULL, NULL, NULL, NULL, NULL),
(1234, 407, '4.01.02.1.02.0005', 'Fasilitasi Peningkatan Pelayanan Publik', 1, NULL, NULL, NULL, NULL, NULL),
(1235, 408, '4.01.03.1.01.0001', 'Pengelolaan Administrasi Kebijakan Pemerintahan', 1, NULL, NULL, NULL, NULL, NULL),
(1236, 408, '4.01.03.1.01.0002', 'Fasilitasi Pelaksanaan Pemerintahan Umum', 1, NULL, NULL, NULL, NULL, NULL),
(1237, 408, '4.01.03.1.01.0003', 'Fasilitasi Penataan Wilayah', 1, NULL, NULL, NULL, NULL, NULL),
(1238, 409, '4.01.03.1.02.0001', 'Fasilitasi Administrasi Kepala Daerah dan DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1239, 409, '4.01.03.1.02.0002', 'Pengembangan Otonomi dan Penataan Urusan', 1, NULL, NULL, NULL, NULL, NULL),
(1240, 409, '4.01.03.1.02.0003', 'Evaluasi dan Penyelenggaraan Pemerintahan', 1, NULL, NULL, NULL, NULL, NULL),
(1241, 410, '4.01.03.1.03.0001', 'Fasilitasi Kerja Sama Antar Pemerintah', 1, NULL, NULL, NULL, NULL, NULL),
(1242, 410, '4.01.03.1.03.0002', 'Fasilitasi Kerja Sama Badan Usaha/Swasta', 1, NULL, NULL, NULL, NULL, NULL),
(1243, 410, '4.01.03.1.03.0003', 'Evaluasi Pelaksanaan Kerja Sama', 1, NULL, NULL, NULL, NULL, NULL),
(1244, 411, '4.01.04.1.01.0001', 'Pengelolaan Sarana dan Prasarana Spiritual', 1, NULL, NULL, NULL, NULL, NULL),
(1245, 411, '4.01.04.1.01.0002', 'Fasilitasi Kelembagaan Bina Spiritual', 1, NULL, NULL, NULL, NULL, NULL),
(1246, 412, '4.01.04.1.02.0001', 'Fasilitasi  Koordinasi  Sinkronisasi  Evaluasi dan Capaian Kinerja Kebijakan Kesejahteraan Rakyat Bidang Pendidikan', 1, NULL, NULL, NULL, NULL, NULL),
(1247, 412, '4.01.04.1.02.0003', 'Fasilitasi  Koordinasi dan Sinkronisasi  Evaluasi dan Capaian Kinerja Kebijakan Kesejahteraan Rakyat Bidang Sosial', 1, NULL, NULL, NULL, NULL, NULL),
(1248, 413, '4.01.04.1.03.0001', 'Koordinasi dan Sinkronisasi Kebijakan Kesejahteraan Rakyat Bidang Kepemudaan  Olahraga  Kebudayaan  dan Pariwisata', 1, NULL, NULL, NULL, NULL, NULL),
(1249, 413, '4.01.04.1.03.0002', 'Koordinasi dan Sinkronisasi Kebijakan Kesejahteraan Rakyat Bidang Pemberdayaan Perempuan dan Perlindungan Anak  Pengendalian Penduduk dan Keluarga Berencana  Administrasi Kependudukan dan Pencatatan Sipil  Pemberdayaan Masyarakat dan Desa  Transmigrasi dan Tenaga Kerja', 1, NULL, NULL, NULL, NULL, NULL),
(1250, 414, '4.01.05.1.01.0001', 'Fasilitasi Penyusunan Produk HukumPengaturan', 1, NULL, NULL, NULL, NULL, NULL),
(1251, 414, '4.01.05.1.01.0003', 'Pendokumentasian Produk Hukum dan Naskah Hukum Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1252, 414, '4.01.05.1.01.0004', 'Fasilitasi dan Evaluasi Produk HukumKabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1253, 415, '4.01.05.1.02.0001', 'Fasilitasi Penyelesaian Masalah Hukum', 1, NULL, NULL, NULL, NULL, NULL),
(1254, 415, '4.01.05.1.02.0002', 'Fasilitasi Penyelesaian Masalah Non Litigasi dan HAM', 1, NULL, NULL, NULL, NULL, NULL),
(1255, 416, '4.01.06.1.01.0001', 'Fasilitasi Pengelolaan Kebijakan Ekonomi Makro', 1, NULL, NULL, NULL, NULL, NULL),
(1256, 417, '4.01.06.1.02.0001', 'Koordinasi  Sinkronisasi dan Evaluasi Kebijakan Pertanian  Kehutanan  Kelautan  dan Perikanan', 1, NULL, NULL, NULL, NULL, NULL),
(1257, 417, '4.01.06.1.02.0002', 'Koordinasi  Sinkronisasi dan Evaluasi Kebijakan Pertambangan dan Lingkungan Hidup', 1, NULL, NULL, NULL, NULL, NULL),
(1258, 417, '4.01.06.1.02.0003', 'Koordinasi  Sinkronisasi dan Evaluasi Kebijakan Energi dan Air', 1, NULL, NULL, NULL, NULL, NULL),
(1259, 418, '4.01.06.1.03.0001', 'Koordinasi  Sinkronisasi  Monitoring  dan Evaluasi Kebijakan Pengelolaan Badan Usaha Milik Daerah Jasa Keuangan dan Aneka Usaha', 1, NULL, NULL, NULL, NULL, NULL),
(1260, 418, '4.01.06.1.03.0002', 'Koordinasi  Sinkronisasi  Monitoring dan Evaluasi Kebijakan Pengelolaan Badan Usaha Milik Daerah Air Minum  Limbah dan Sanitasi', 1, NULL, NULL, NULL, NULL, NULL),
(1261, 419, '4.01.07.1.01.0001', 'Pengelolaan Strategi Pengadaan Barang dan Jasa', 1, NULL, NULL, NULL, NULL, NULL),
(1262, 419, '4.01.07.1.01.0002', 'Pelaksanaan Pengadaan Barang dan Jasa', 1, NULL, NULL, NULL, NULL, NULL),
(1263, 419, '4.01.07.1.01.0003', 'Pemantauan dan Evaluasi Pengadaan Barang dan Jasa', 1, NULL, NULL, NULL, NULL, NULL),
(1264, 420, '4.01.07.1.02.0001', 'Pengelolaan Sistem Pengadaan Secara Elektronik', 1, NULL, NULL, NULL, NULL, NULL),
(1265, 420, '4.01.07.1.02.0002', 'Pengembangan Sistem Informasi Pengadaan Barang dan Jasa', 1, NULL, NULL, NULL, NULL, NULL),
(1266, 421, '4.01.07.1.03.0001', 'Pembinaan Sumber Daya Manusia Pengadaan Barang dan Jasa', 1, NULL, NULL, NULL, NULL, NULL),
(1267, 421, '4.01.07.1.03.0002', 'Pembinaan Kelembagaan Pengadaan Barang dan Jasa', 1, NULL, NULL, NULL, NULL, NULL),
(1268, 421, '4.01.07.1.03.0003', 'Pendampingan  Konsultasi  dan/atau Bimbingan Teknis Pengadaan Barang dan Jasa', 1, NULL, NULL, NULL, NULL, NULL),
(1269, 422, '4.01.08.1.01.0001', 'Pengendalian Administrasi Pelaksanaan Pembangunan APBD', 1, NULL, NULL, NULL, NULL, NULL),
(1270, 422, '4.01.08.1.01.0002', 'Pengendalian Administrasi Pelaksanaan Pembangunan APBN', 1, NULL, NULL, NULL, NULL, NULL),
(1271, 422, '4.01.08.1.01.0003', 'Pengendalian Administrasi Pelaksanaan Pembangunan Wilayah', 1, NULL, NULL, NULL, NULL, NULL),
(1272, 423, '4.01.08.1.02.0001', 'Analisis Capaian Kinerja Pembangunan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1273, 423, '4.01.08.1.02.0002', 'Pelaporan Pelaksanaan Pembangunan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1274, 423, '4.01.08.1.02.0003', 'Fasilitasi Perumusan Kebijakan Teknis Pembangunan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1275, 424, '4.02.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1276, 424, '4.02.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1277, 424, '4.02.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1278, 424, '4.02.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1279, 425, '4.02.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1280, 425, '4.02.01.1.02.0002', 'Penyediaan Administrasi Pelaksanaan TugasASN', 1, NULL, NULL, NULL, NULL, NULL),
(1281, 425, '4.02.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1282, 425, '4.02.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1283, 425, '4.02.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1284, 425, '4.02.01.1.02.0006', 'Pengelolaan dan Penyiapan Bahan Tanggapan Pemeriksaan', 1, NULL, NULL, NULL, NULL, NULL),
(1285, 425, '4.02.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1286, 426, '4.02.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1287, 427, '4.02.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1288, 427, '4.02.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1289, 427, '4.02.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1290, 427, '4.02.01.1.06.0004', 'Penyediaan Bahan Logistik Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1291, 427, '4.02.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1292, 427, '4.02.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1293, 427, '4.02.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1294, 427, '4.02.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1295, 427, '4.02.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1296, 427, '4.02.01.1.06.0010', 'Penatausahaan Arsip Dinamis pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1297, 427, '4.02.01.1.06.0011', 'Dukungan Pelaksanaan Sistem Pemerintahan Berbasis Elektronik pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1298, 428, '4.02.01.1.07.0001', 'Pengadaan Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1299, 428, '4.02.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1300, 429, '4.02.01.1.08.0001', 'Penyediaan Jasa Surat Menyurat', 1, NULL, NULL, NULL, NULL, NULL),
(1301, 429, '4.02.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1302, 429, '4.02.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1303, 429, '4.02.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1304, 430, '4.02.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1305, 430, '4.02.01.1.09.0005', 'Pemeliharaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(1306, 430, '4.02.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1307, 430, '4.02.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1308, 431, '4.02.01.1.15.0001', 'Penyelenggaraan Administrasi Keuangan DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1309, 431, '4.02.01.1.15.0002', 'Penyediaan Pakaian Dinas dan Atribut DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1310, 431, '4.02.01.1.15.0003', 'Pelaksanaan Medical Check Up DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1311, 432, '4.02.01.1.16.0001', 'Penyelenggaraan Administrasi Keanggotaan DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1312, 432, '4.02.01.1.16.0002', 'Fasilitasi Fraksi DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1313, 432, '4.02.01.1.16.0003', 'Fasilitasi Rapat Koordinasi dan Konsultasi DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1314, 432, '4.02.01.1.16.0004', 'Penyediaan Kebutuhan Rumah Tangga DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1315, 433, '4.02.02.1.01.0001', 'Penyusunan dan Pembahasan ProgramPembentukan Peraturan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1316, 433, '4.02.02.1.01.0002', 'Pembahasan Rancangan Perda', 1, NULL, NULL, NULL, NULL, NULL),
(1317, 433, '4.02.02.1.01.0003', 'Penyelenggaraan Kajian Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1318, 433, '4.02.02.1.01.0005', 'Penyusunan Tata Tertib DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1319, 434, '4.02.02.1.02.0001', 'Pembahasan KUA dan PPAS', 1, NULL, NULL, NULL, NULL, NULL),
(1320, 434, '4.02.02.1.02.0003', 'Pembahasan APBD', 1, NULL, NULL, NULL, NULL, NULL),
(1321, 435, '4.02.02.1.03.0001', 'Pengawasan Urusan Pemerintahan Bidang Pemerintahan dan Hukum', 1, NULL, NULL, NULL, NULL, NULL),
(1322, 435, '4.02.02.1.03.0003', 'Pengawasan Urusan Pemerintahan Bidang Kesejahteraan Rakyat', 1, NULL, NULL, NULL, NULL, NULL),
(1323, 435, '4.02.02.1.03.0004', 'Pengawasan Urusan Pemerintahan Bidang Perekonomian', 1, NULL, NULL, NULL, NULL, NULL),
(1324, 435, '4.02.02.1.03.0005', 'Pengawasan Urusan Pemerintahan Bidang Sumber Daya Alam', 1, NULL, NULL, NULL, NULL, NULL),
(1325, 435, '4.02.02.1.03.0006', 'Pengawasan Tindak Lanjut Hasil Pemeriksaan Laporan Keuangan oleh Badan Pemeriksa Keuangan', 1, NULL, NULL, NULL, NULL, NULL),
(1326, 435, '4.02.02.1.03.0007', 'Pengawasan Penggunaan Anggaran', 1, NULL, NULL, NULL, NULL, NULL),
(1327, 435, '4.02.02.1.03.0008', 'Pembahasan Laporan Keterangan Pertanggungjawaban Kepala Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1328, NULL, '4.02.02.1.04.0002', 'Pendalaman Tugas DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1329, NULL, '4.02.02.1.04.0004', 'Penyediaan Kelompok Pakar dan Tim Ahli', 1, NULL, NULL, NULL, NULL, NULL),
(1330, NULL, '4.02.02.1.04.0005', 'Penyediaan Tenaga Ahli Fraksi', 1, NULL, NULL, NULL, NULL, NULL),
(1331, NULL, '4.02.02.1.04.0006', 'Penyelenggaraan Hubungan Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(1332, NULL, '4.02.02.1.04.0007', 'Penyusunan Program Kerja DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1333, NULL, '4.02.02.1.04.0008', 'Publikasi dan Dokumentasi DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1334, 436, '4.02.02.1.05.0002', 'Penyusunan Pokok-Pokok Pikiran DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1335, 436, '4.02.02.1.05.0003', 'Pelaksanaan Reses', 1, NULL, NULL, NULL, NULL, NULL),
(1336, 437, '4.02.02.1.06.0001', 'Penyusunan Kode Etik DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1337, 438, '4.02.02.1.08.0001', 'Koordinasi dan Konsultasi Pelaksanaan Tugas DPRD', 1, NULL, NULL, NULL, NULL, NULL),
(1338, 439, '5.01.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1339, 439, '5.01.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1340, 440, '5.01.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1341, 441, '5.01.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1342, 442, '5.01.01.1.05.0002', 'Pengadaan Pakaian Dinas Beserta AtributKelengkapannya', 1, NULL, NULL, NULL, NULL, NULL),
(1343, 442, '5.01.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1344, 443, '5.01.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1345, 443, '5.01.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1346, 443, '5.01.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1347, 443, '5.01.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1348, 443, '5.01.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1349, 443, '5.01.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1350, 444, '5.01.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1351, 445, '5.01.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1352, 445, '5.01.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1353, 445, '5.01.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1354, 446, '5.01.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1355, 446, '5.01.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1356, 446, '5.01.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1357, 447, '5.01.02.1.01.0003', 'Pelaksanaan Konsultasi Publik', 1, NULL, NULL, NULL, NULL, NULL),
(1358, 447, '5.01.02.1.01.0005', 'Pelaksanaan Musrenbang Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1359, 447, '5.01.02.1.01.0006', 'Koordinasi Penyusunan dan Penetapan Dokumen Perencanaan Pembangunan Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1360, 448, '5.01.02.1.02.0001', 'Analisis Data dan Informasi Perencanaan Pembangunan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1361, 448, '5.01.02.1.02.0002', 'Pembinaan dan Pemanfaatan Data dan Informasi Perencanaan Pembangunan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1362, 448, '5.01.02.1.02.0003', 'Pembinaan dan Pemanfaatan Data dan Informasi Pemerintahan Daerah Bidang Perencanaan Pembangunan Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1363, 448, '5.01.02.1.02.0004', 'Penyusunan Profil Pembangunan Daerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1364, 449, '5.01.02.1.03.0001', 'Koordinasi Pengendalian Perencanaan dan Pelaksanaan Pembangunan Daerah di Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1365, 449, '5.01.02.1.03.0003', 'Monitoring  Evaluasi dan Penyusunan Laporan Berkala Pelaksanaan Pembangunan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1366, 449, '5.01.02.1.03.0004', 'Fasilitasi/Evaluasi Dokumen Perencanaan Pembangunan Daerah Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1367, 450, '5.01.02.1.04.0001', 'Pengelolaan Data dalam Sistem Informasi Pemerintahan Daerah di Bidang Pembangunan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1368, 450, '5.01.02.1.04.0002', 'Penerapan Sistem Informasi Pemerintahan Daerah di Bidang Pembangunan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1369, 450, '5.01.02.1.04.0003', 'Pembinaan Sistem Informasi Pemerintahan Daerah di Bidang Pembangunan Daerah Pemerintah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1370, 451, '5.01.03.1.01.0001', 'Koordinasi Penyusunan Dokumen Perencanaan Pembangunan Daerah Bidang Pemerintahan (RPJPD  RPJMD dan RKPD)', 1, NULL, NULL, NULL, NULL, NULL),
(1371, 451, '5.01.03.1.01.0002', 'Asistensi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Pemerintahan', 1, NULL, NULL, NULL, NULL, NULL),
(1372, 451, '5.01.03.1.01.0003', 'Pelaksanaan Monitoring dan Evaluasi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Pemerintahan', 1, NULL, NULL, NULL, NULL, NULL),
(1373, 451, '5.01.03.1.01.0004', 'Koordinasi Pelaksanaan Sinergitas dan Harmonisasi Perencanaan Pembangunan Daerah Bidang Pemerintahan', 1, NULL, NULL, NULL, NULL, NULL),
(1374, 451, '5.01.03.1.01.0005', 'Koordinasi Penyusunan Dokumen Perencanaan Pembangunan Daerah Bidang Pembangunan Manusia (RPJPD  RPJMD dan RKPD)', 1, NULL, NULL, NULL, NULL, NULL),
(1375, 451, '5.01.03.1.01.0006', 'Asistensi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Pembangunan Manusia', 1, NULL, NULL, NULL, NULL, NULL),
(1376, 451, '5.01.03.1.01.0007', 'Pelaksanaan Monitoring dan Evaluasi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Pembangunan Manusia', 1, NULL, NULL, NULL, NULL, NULL),
(1377, 451, '5.01.03.1.01.0008', 'Koordinasi Pelaksanaan Sinergitas dan Harmonisasi Perencanaan Pembangunan Daerah Bidang Pembangunan Manusia', 1, NULL, NULL, NULL, NULL, NULL),
(1378, 452, '5.01.03.1.02.0001', 'Koordinasi Penyusunan Dokumen Perencanaan Pembangunan Daerah Bidang Perekonomian (RPJPD  RPJMD dan RKPD)', 1, NULL, NULL, NULL, NULL, NULL),
(1379, 452, '5.01.03.1.02.0002', 'Asistensi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Perekonomian', 1, NULL, NULL, NULL, NULL, NULL),
(1380, 452, '5.01.03.1.02.0003', 'Pelaksanaan Monitoring dan Evaluasi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Perekonomian', 1, NULL, NULL, NULL, NULL, NULL),
(1381, 452, '5.01.03.1.02.0004', 'Koordinasi Pelaksanaan Sinergitas dan Harmonisasi Perencanaan Pembangunan Daerah Bidang Perekonomian', 1, NULL, NULL, NULL, NULL, NULL),
(1382, 452, '5.01.03.1.02.0005', 'Koordinasi Penyusunan Dokumen Perencanaan Pembangunan Daerah Bidang SDA (RPJPD  RPJMD dan RKPD)', 1, NULL, NULL, NULL, NULL, NULL),
(1383, 452, '5.01.03.1.02.0006', 'Asistensi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang SDA', 1, NULL, NULL, NULL, NULL, NULL),
(1384, 452, '5.01.03.1.02.0007', 'Pelaksanaan Monitoring dan Evaluasi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang SDA', 1, NULL, NULL, NULL, NULL, NULL),
(1385, 452, '5.01.03.1.02.0008', 'Koordinasi Pelaksanaan Sinergitas dan Harmonisasi Perencanaan Pembangunan Daerah Bidang SDA', 1, NULL, NULL, NULL, NULL, NULL),
(1386, 453, '5.01.03.1.03.0001', 'Koordinasi Penyusunan Dokumen Perencanaan Pembangunan Daerah Bidang Infrastruktur (RPJPD  RPJMD dan RKPD)', 1, NULL, NULL, NULL, NULL, NULL),
(1387, 453, '5.01.03.1.03.0003', 'Pelaksanaan Monitoring dan Evaluasi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Infrastruktur', 1, NULL, NULL, NULL, NULL, NULL),
(1388, 453, '5.01.03.1.03.0004', 'Koordinasi Pelaksanaan Sinergitas dan Harmonisasi Perencanaan Pembangunan Daerah Bidang Infrastruktur', 1, NULL, NULL, NULL, NULL, NULL),
(1389, 453, '5.01.03.1.03.0005', 'Koordinasi Penyusunan Dokumen Perencanaan Pembangunan Daerah Bidang Kewilayahan (RPJPD  RPJMD dan RKPD)', 1, NULL, NULL, NULL, NULL, NULL),
(1390, 453, '5.01.03.1.03.0006', 'Asistensi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Kewilayahan', 1, NULL, NULL, NULL, NULL, NULL),
(1391, 453, '5.01.03.1.03.0007', 'Pelaksanaan Monitoring dan Evaluasi Penyusunan Dokumen Perencanaan Pembangunan Perangkat Daerah Bidang Kewilayahan', 1, NULL, NULL, NULL, NULL, NULL),
(1392, 453, '5.01.03.1.03.0008', 'Koordinasi Pelaksanaan Sinergitas dan Harmonisasi Perencanaan Pembangunan Daerah Bidang Kewilayahan', 1, NULL, NULL, NULL, NULL, NULL),
(1393, 454, '5.02.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1394, 454, '5.02.01.1.01.0003', 'Koordinasi dan Penyusunan DokumenPerubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1395, 454, '5.02.01.1.01.0004', 'Koordinasi dan Penyusunan DPA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1396, 454, '5.02.01.1.01.0005', 'Koordinasi dan Penyusunan Perubahan DPA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1397, 454, '5.02.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1398, 455, '5.02.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1399, 455, '5.02.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1400, 455, '5.02.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1401, 455, '5.02.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1402, 456, '5.02.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1403, 456, '5.02.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1404, 457, '5.02.01.1.04.0005', 'Pengolahan Data Retribusi Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1405, 458, '5.02.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1406, 458, '5.02.01.1.05.0010', 'Sosialisasi Peraturan Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1407, NULL, '5.02.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1408, NULL, '5.02.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1409, NULL, '5.02.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1410, NULL, '5.02.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1411, NULL, '5.02.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1412, NULL, '5.02.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1413, NULL, '5.02.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1414, NULL, '5.02.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1415, 459, '5.02.01.1.07.0002', 'Pengadaan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1416, 459, '5.02.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1417, 459, '5.02.01.1.07.0011', 'Pengadaan Sarana dan Prasarana Pendukung Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1418, 460, '5.02.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1419, 460, '5.02.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1420, 460, '5.02.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1421, 461, '5.02.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1422, 461, '5.02.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1423, 461, '5.02.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1424, 462, '5.02.02.1.01.0001', 'Koordinasi dan Penyusunan KUA dan PPAS', 1, NULL, NULL, NULL, NULL, NULL),
(1425, 462, '5.02.02.1.01.0002', 'Koordinasi dan Penyusunan Perubahan KUAdan Perubahan PPAS', 1, NULL, NULL, NULL, NULL, NULL),
(1426, 462, '5.02.02.1.01.0003', 'Koordinasi  Penyusunan dan Verifikasi RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1427, 462, '5.02.02.1.01.0004', 'Koordinasi  Penyusunan dan Verifikasi Perubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1428, 462, '5.02.02.1.01.0005', 'Koordinasi  Penyusunan dan Verifikasi DPA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1429, 462, '5.02.02.1.01.0006', 'Koordinasi  Penyusunan dan Verifikasi Perubahan DPA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1430, 462, '5.02.02.1.01.0007', 'Koordinasi dan Penyusunan Peraturan Daerah tentang APBD dan Peraturan Kepala Daerah tentang Penjabaran APBD', 1, NULL, NULL, NULL, NULL, NULL),
(1431, 462, '5.02.02.1.01.0008', 'Koordinasi dan Penyusunan Peraturan Daerah tentang Perubahan APBD dan Peraturan Kepala Daerah tentang Penjabaran Perubahan APBD', 1, NULL, NULL, NULL, NULL, NULL),
(1432, 462, '5.02.02.1.01.0010', 'Koordinasi Perencanaan Anggaran Pendapatan', 1, NULL, NULL, NULL, NULL, NULL),
(1433, 462, '5.02.02.1.01.0012', 'Koordinasi Perencanaan Anggaran Pembiayaan', 1, NULL, NULL, NULL, NULL, NULL),
(1434, 463, '5.02.02.1.02.0002', 'Evaluasi Rancangan Peraturan Daerah tentang APBD Kabupaten/Kota dan Rancangan Peraturan Kepala Daerah tentang Penjabaran APBD Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1435, 463, '5.02.02.1.02.0003', 'Evaluasi Rancangan Peraturan Daerah tentang Perubahan APBD Kabupaten/Kota dan Rancangan Peraturan Kepala Daerah tentang Penjabaran Perubahan APBD Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1436, 463, '5.02.02.1.02.0004', 'Evaluasi Rancangan Peraturan Daerah tentang Pertanggungjawaban Pelaksanaan APBD Kabupaten/Kota dan Rancangan Peraturan Kepala Daerah tentang Penjabaran Pertanggungjawaban Pelaksanaan APBD Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1437, 463, '5.02.02.1.02.0005', 'Asistensi Pengelolaan Keuangan Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1438, 463, '5.02.02.1.02.0006', 'Sosialisasi Regulasi Bidang Keuangan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1439, 464, '5.02.02.1.03.0001', 'Koordinasi dan Pengelolaan Kas Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1440, 464, '5.02.02.1.03.0002', 'Pengelolaan Sisa Lebih Perhitungan Anggaran Tahun Sebelumnya', 1, NULL, NULL, NULL, NULL, NULL),
(1441, 464, '5.02.02.1.03.0003', 'Penyiapan  Pelaksanaan Pengendalian dan Penerbitan Anggaran Kas dan SPD', 1, NULL, NULL, NULL, NULL, NULL),
(1442, 464, '5.02.02.1.03.0005', 'Koordinasi  Fasilitasi  Asistensi  Sinkronisasi  Supervisi  Monitoring  dan Evaluasi Pengelolaan Dana Perimbangan dan Dana Transfer Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1443, 464, '5.02.02.1.03.0006', 'Koordinasi  Pelaksanaan Kerja Sama dan Pemantauan Transaksi Non Tunai dengan Lembaga Keuangan Bank dan Lembaga Keuangan Bukan Bank', 1, NULL, NULL, NULL, NULL, NULL),
(1444, 464, '5.02.02.1.03.0007', 'Koordinasi dan Penyusunan Laporan Realisasi Penerimaan dan Pengeluaran Kas Daerah  Laporan Aliran Kas  dan Pelaksanaan Pemungutan/Pemotongan dan Penyetoran Perhitungan Fihak Ketiga (PFK)', 1, NULL, NULL, NULL, NULL, NULL),
(1445, 464, '5.02.02.1.03.0009', 'Rekonsiliasi Data Penerimaan dan Pengeluaran Kas serta Pemungutan dan Pemotongan atas SP2D dengan Instansi Terkait', 1, NULL, NULL, NULL, NULL, NULL),
(1446, 464, '5.02.02.1.03.0010', 'Penyusunan Petunjuk Teknis Administrasi Keuangan yang Berkaitan dengan Penerimaan dan Pengeluaran Kas serta Penatausahaan dan Pertanggungjawaban Sub Kegiatan', 1, NULL, NULL, NULL, NULL, NULL),
(1447, 465, '5.02.02.1.04.0001', 'Koordinasi Pelaksanaan Akuntansi Penerimaan dan Pengeluaran Kas Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1448, 465, '5.02.02.1.04.0005', 'Koordinasi dan Penyusunan Rancangan Peraturan Daerah tentang Pertanggungjawaban Pelaksanaan APBD Provinsi dan Rancangan Peraturan Kepala Daerah tentang Penjabaran Pertanggungjawaban Pelaksanaan APBD Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1449, 465, '5.02.02.1.04.0006', 'Penyusunan Tanggapan/Tindak Lanjut terhadap LHP BPK atas Laporan Pertanggungjawaban Pelaksanaan APBD', 1, NULL, NULL, NULL, NULL, NULL),
(1450, 465, '5.02.02.1.04.0007', 'Koordinasi  Sinkronisasi  dan Penyelesaian Tuntutan Perbendaharaan dan Tuntutan Kerugian Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1451, 465, '5.02.02.1.04.0009', 'Penyusunan Kebijakan dan Panduan Teknis Operasional Penyelenggaraan Akuntansi Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1452, 465, '5.02.02.1.04.0011', 'Pembinaan Akuntansi  Pelaporan dan Pertanggungjawaban Pemerintah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1453, 465, '5.02.02.1.04.0012', 'Pembinaan Pengelolaan Keuangan BLUD Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1454, 466, '5.02.02.1.05.0002', 'Analisis Investasi Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1455, 466, '5.02.02.1.05.0004', 'Analisis Perencanaan dan Pelaksanaan Pembayaran Cicilan Pokok dan Bunga Pinjaman Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1456, 466, '5.02.02.1.05.0009', 'Pengelolaan Dana Darurat dan Mendesak', 1, NULL, NULL, NULL, NULL, NULL),
(1457, 466, '5.02.02.1.05.0010', 'Pengelolaan Dana Bagi Hasil Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1458, 467, '5.02.02.1.06.0001', 'Inventarisasi dan Analisis Data Bidang Keuangan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1459, 467, '5.02.02.1.06.0002', 'Implementasi dan Pemeliharaan Sistem Informasi Pemerintah Daerah Bidang Keuangan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1460, 467, '5.02.02.1.06.0003', 'Pembinaan Sistem Informasi Pemerintah Daerah Bidang Keuangan Daerah Pemerintah Provinsi', 1, NULL, NULL, NULL, NULL, NULL),
(1461, 468, '5.02.03.1.01.0001', 'Penyusunan Standar Harga', 1, NULL, NULL, NULL, NULL, NULL),
(1462, 468, '5.02.03.1.01.0002', 'Penyusunan Standar Barang Milik Daerah dan Standar Kebutuhan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1463, 468, '5.02.03.1.01.0003', 'Penyusunan Rencana Kebutuhan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1464, 468, '5.02.03.1.01.0004', 'Penyusunan Kebijakan Pengelolaan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1465, 468, '5.02.03.1.01.0005', 'Penatausahaan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1466, 468, '5.02.03.1.01.0006', 'Inventarisasi Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1467, 468, '5.02.03.1.01.0007', 'Pengamanan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1468, 468, '5.02.03.1.01.0008', 'Penilaian Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1469, 468, '5.02.03.1.01.0009', 'Pengawasan dan Pengendalian Pengelolaan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1470, 468, '5.02.03.1.01.0010', 'Optimalisasi Penggunaan  Pemanfaatan  Pemindahtanganan  Pemusnahan  dan Penghapusan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1471, 468, '5.02.03.1.01.0011', 'Rekonsiliasi dalam rangka Penyusunan Laporan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1472, 468, '5.02.03.1.01.0012', 'Penyusunan Laporan Barang Milik Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1473, 469, '5.02.04.1.01.0002', 'Analisa dan Pengembangan Pajak Daerah  serta Penyusunan Kebijakan Pajak Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1474, 469, '5.02.04.1.01.0003', 'Penyuluhan dan Penyebarluasan Kebijakan Pajak Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1475, 469, '5.02.04.1.01.0004', 'Penyediaan Sarana dan Prasarana Pengelolaan Pajak Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1476, 469, '5.02.04.1.01.0005', 'Pendataan dan Pendaftaran Objek Pajak Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1477, 469, '5.02.04.1.01.0006', 'Pengolahan  Pemeliharaan  dan Pelaporan Basis Data Pajak Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1478, 469, '5.02.04.1.01.0010', 'Penagihan Pajak Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1479, 469, '5.02.04.1.01.0013', 'Pembinaan dan Pengawasan Pengelolaan Pajak Daerah dan Retribusi Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1480, 470, '5.03.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1481, 470, '5.03.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1482, 471, '5.03.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1483, 471, '5.03.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1484, 471, '5.03.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1485, 472, '5.03.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1486, 472, '5.03.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1487, 472, '5.03.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1488, 472, '5.03.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1489, 472, '5.03.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1490, 472, '5.03.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1491, 472, '5.03.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1492, 472, '5.03.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1493, 473, '5.03.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1494, 473, '5.03.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1495, NULL, '5.03.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1496, NULL, '5.03.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1497, NULL, '5.03.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1498, 474, '5.03.02.1.01.0002', 'Penyusunan Rencana Kebutuhan  Jenis dan Jumlah Jabatan untuk Pelaksanaan Pengadaan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1499, 474, '5.03.02.1.01.0006', 'Koordinasi Pelaksanaan Administrasi Pemberhentian', 1, NULL, NULL, NULL, NULL, NULL),
(1500, 474, '5.03.02.1.01.0008', 'Fasilitasi Lembaga Profesi ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1501, 474, '5.03.02.1.01.0011', 'Pengelolaan Data Kepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(1502, 475, '5.03.02.1.02.0001', 'Pengelolaan Mutasi ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1503, 475, '5.03.02.1.02.0002', 'Pengelolaan Kenaikan Pangkat ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1504, 475, '5.03.02.1.02.0003', 'Pengelolaan Promosi ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1505, 476, '5.03.02.1.03.0001', 'Peningkatan Kapasitas Kinerja ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1506, 476, '5.03.02.1.03.0014', 'Fasilitasi Pengembangan Karir dalam Jabatan Fungsional', 1, NULL, NULL, NULL, NULL, NULL),
(1507, 477, '5.03.02.1.04.0002', 'Pelaksanaan Penilaian dan Evaluasi Kinerja Aparatur', 1, NULL, NULL, NULL, NULL, NULL),
(1508, 477, '5.03.02.1.04.0007', 'Pembinaan Disiplin ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1509, 478, '5.04.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1510, 478, '5.04.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1511, 478, '5.04.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1512, 479, '5.04.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1513, 479, '5.04.01.1.02.0005', 'Koordinasi dan Penyusunan Laporan Keuangan Akhir Tahun SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1514, 479, '5.04.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1515, 480, '5.04.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1516, 480, '5.04.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1517, 481, '5.04.01.1.05.0003', 'Pendataan dan Pengolahan AdministrasiKepegawaian', 1, NULL, NULL, NULL, NULL, NULL),
(1518, 481, '5.04.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1519, 482, '5.04.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1520, 482, '5.04.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1521, 482, '5.04.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1522, 482, '5.04.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1523, 482, '5.04.01.1.06.0006', 'Penyediaan Bahan Bacaan dan PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1524, 482, '5.04.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1525, 482, '5.04.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1526, 482, '5.04.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1527, 482, '5.04.01.1.06.0010', 'Penatausahaan Arsip Dinamis pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1528, 483, '5.04.01.1.07.0001', 'Pengadaan Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1529, 483, '5.04.01.1.07.0005', 'Pengadaan Mebel', 1, NULL, NULL, NULL, NULL, NULL),
(1530, 483, '5.04.01.1.07.0006', 'Pengadaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1531, 483, '5.04.01.1.07.0010', 'Pengadaan Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1532, NULL, '5.04.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1533, NULL, '5.04.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1534, 484, '5.04.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1535, 484, '5.04.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1536, 484, '5.04.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1537, 485, '5.04.02.1.01.0003', 'Penyelenggaraan Pengembangan Kompetensi Teknis Umum  Inti  dan Pilihan bagi Jabatan Administrasi Penyelenggara Urusan Pemerintahan Konkuren  Perangkat Daerah Penunjang  dan Urusan Pemerintahan Umum', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `master_sub_kegiatan` (`id_sub_kegiatan`, `id_kegiatan`, `kode_rekening`, `nama_sub_kegiatan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(1538, 486, '5.04.02.1.02.0003', 'Pelaksanaan Sertifikasi Kompetensi di Lingkungan Pemerintah Provinsi dan Kabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1539, 486, '5.04.02.1.02.0004', 'Pengelolaan Kelembagaan  Tenaga Pengembang Kompetensi  dan Sumber Belajar', 1, NULL, NULL, NULL, NULL, NULL),
(1540, 486, '5.04.02.1.02.0005', 'Pelaksanaan Kerja Sama Antar Lembaga', 1, NULL, NULL, NULL, NULL, NULL),
(1541, 486, '5.04.02.1.02.0007', 'Penyelenggaraan Pengembangan Kompetensi bagi Pimpinan Daerah  Jabatan Pimpinan Tinggi  Jabatan Fungsional  Kepemimpinan  dan Prajabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1542, 486, '5.04.02.1.02.0008', 'Pembinaan  Pengoordinasian  Fasilitasi  Pemantauan  Evaluasi  dan Pelaporan Pelaksanaan Sertifikasi  Pengelolaan Kelembagaan dan Tenaga Pengembang Kompetensi  Pengelolaan Sumber Belajar  dan Kerja Sama  serta Pengembangan Kompetensi Pimpinan Daerah  Jabatan Pimpinan Tinggi  Kepemimpinan  dan Prajabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1543, 487, '5.05.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1544, 487, '5.05.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1545, 487, '5.05.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1546, 488, '5.05.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1547, 489, '5.05.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1548, 490, '5.05.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1549, 491, '5.05.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1550, 491, '5.05.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1551, 491, '5.05.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1552, 491, '5.05.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1553, 491, '5.05.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1554, 491, '5.05.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1555, 492, '5.05.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1556, 492, '5.05.01.1.08.0003', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1557, 492, '5.05.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1558, 493, '5.05.01.1.09.0001', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan dan Pajak Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 1, NULL, NULL, NULL, NULL, NULL),
(1559, 493, '5.05.01.1.09.0010', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1560, 494, '5.05.02.1.01.0002', 'Fasilitasi  Pelaksanaan dan Evaluasi Penelitian dan Pengembangan Bidang Pemerintahan Umum', 1, NULL, NULL, NULL, NULL, NULL),
(1561, 494, '5.05.02.1.01.0003', 'Fasilitasi  Pelaksanaan dan Evaluasi Penelitian dan Pengembangan Bidang Kelembagaan dan Ketatalaksanaan', 1, NULL, NULL, NULL, NULL, NULL),
(1562, 494, '5.05.02.1.01.0004', 'Fasilitasi  Pelaksanaan dan Evaluasi Penelitian dan Pengembangan Bidang Aparatur dan Reformasi Birokrasi', 1, NULL, NULL, NULL, NULL, NULL),
(1563, 494, '5.05.02.1.01.0005', 'Fasilitasi  Pelaksanaan dan Evaluasi Penelitian dan Pengembangan Bidang Keuangan dan Aset Daerah  Reformasi Birokrasi', 1, NULL, NULL, NULL, NULL, NULL),
(1564, 495, '5.05.02.1.02.0003', 'Penelitian dan Pengembangan Pendidikan dan Kebudayaan', 1, NULL, NULL, NULL, NULL, NULL),
(1565, 495, '5.05.02.1.02.0010', 'Penelitian dan Pengembangan Partisipasi Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(1566, 496, '5.05.02.1.03.0002', 'Penelitian dan Pengembangan Perindustrian dan Perdagangan', 1, NULL, NULL, NULL, NULL, NULL),
(1567, 496, '5.05.02.1.03.0004', 'Penelitian dan Pengembangan Pertanian  Perkebunan dan Pangan', 1, NULL, NULL, NULL, NULL, NULL),
(1568, 496, '5.05.02.1.03.0005', 'Penelitian dan Pengembangan Kelautan dan Perikanan', 1, NULL, NULL, NULL, NULL, NULL),
(1569, 496, '5.05.02.1.03.0007', 'Penelitian dan Pengembangan Lingkungan Hidup', 1, NULL, NULL, NULL, NULL, NULL),
(1570, 496, '5.05.02.1.03.0010', 'Penelitian dan Pengembangan Perhubungan', 1, NULL, NULL, NULL, NULL, NULL),
(1571, 497, '5.05.02.1.04.0001', 'Penelitian  Pengembangan  dan Perekayasaan di Bidang Teknologi dan Inovasi', 1, NULL, NULL, NULL, NULL, NULL),
(1572, 497, '5.05.02.1.04.0002', 'Uji Coba dan Penerapan Rancang Bangun/Model Replikasi dan Invensi di Bidang Difusi Inovasi dan Penerapan Teknologi', 1, NULL, NULL, NULL, NULL, NULL),
(1573, 497, '5.05.02.1.04.0003', 'Diseminasi Jenis  Prosedur dan Metode Penyelenggaraan Pemerintahan Daerah yang Bersifat Inovatif', 1, NULL, NULL, NULL, NULL, NULL),
(1574, 497, '5.05.02.1.04.0004', 'Sosialisasi dan Diseminasi Hasil-Hasil Kelitbangan', 1, NULL, NULL, NULL, NULL, NULL),
(1575, 498, '5.07.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1576, 498, '5.07.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1577, NULL, '5.07.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1578, NULL, '5.07.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1579, 499, '5.07.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1580, 499, '5.07.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1581, 500, '5.07.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1582, 501, '5.07.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1583, 501, '5.07.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1584, 501, '5.07.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1585, 501, '5.07.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1586, 501, '5.07.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1587, 501, '5.07.01.1.06.0010', 'Penatausahaan Arsip Dinamis pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1588, 502, '5.07.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1589, 502, '5.07.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1590, 503, '5.07.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1591, 503, '5.07.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1592, 503, '5.07.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1593, 504, '5.07.02.1.01.0001', 'Peningkatan Kualitas Pelayanan Publik bagiAparatur dan Masyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(1594, 504, '5.07.02.1.01.0002', 'Pelayanan Kelembagaan Aparatur danMasyarakat', 1, NULL, NULL, NULL, NULL, NULL),
(1595, 504, '5.07.02.1.01.0003', 'Peningkatan Fasilitasi Promosi ProdukUnggulan dan Pelestarian Seni Budaya', 1, NULL, NULL, NULL, NULL, NULL),
(1596, 504, '5.07.02.1.01.0004', 'Kegiatan Fasilitasi Pameran Produk Unggulan dan Pelestarian Seni Budaya', 1, NULL, NULL, NULL, NULL, NULL),
(1597, 504, '5.07.02.1.01.0005', 'Koordinasi dan Sinkronisasi PelaksanaanPelayanan Penghubung', 1, NULL, NULL, NULL, NULL, NULL),
(1598, NULL, '6.01.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1599, 505, '6.01.01.1.02.0001', 'Penyediaan Gaji dan Tunjangan ASN', 1, NULL, NULL, NULL, NULL, NULL),
(1600, 505, '6.01.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1601, 506, '6.01.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1602, 506, '6.01.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1603, 507, '6.01.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1604, 508, '6.01.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1605, 508, '6.01.01.1.06.0002', 'Penyediaan Peralatan dan Perlengkapan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1606, 508, '6.01.01.1.06.0003', 'Penyediaan Peralatan Rumah Tangga', 1, NULL, NULL, NULL, NULL, NULL),
(1607, 508, '6.01.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1608, 508, '6.01.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1609, 508, '6.01.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1610, 508, '6.01.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1611, 509, '6.01.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1612, 509, '6.01.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1613, 510, '6.01.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1614, 510, '6.01.01.1.09.0006', 'Pemeliharaan Peralatan dan Mesin Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1615, 510, '6.01.01.1.09.0009', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1616, 511, '6.01.02.1.01.0001', 'Pengawasan Kinerja Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1617, 511, '6.01.02.1.01.0002', 'Pengawasan Keuangan Pemerintah Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1618, 511, '6.01.02.1.01.0003', 'Reviu Laporan Kinerja', 1, NULL, NULL, NULL, NULL, NULL),
(1619, 511, '6.01.02.1.01.0004', 'Reviu Laporan Keuangan', 1, NULL, NULL, NULL, NULL, NULL),
(1620, 511, '6.01.02.1.01.0005', 'Pengawasan Umum dan TeknisKabupaten/Kota', 1, NULL, NULL, NULL, NULL, NULL),
(1621, 511, '6.01.02.1.01.0006', 'Kerjasama Pengawasan Internal', 1, NULL, NULL, NULL, NULL, NULL),
(1622, 511, '6.01.02.1.01.0007', 'Monitoring dan Evaluasi Tindak Lanjut Hasil Pemeriksaan BPK RI dan Tindak Lanjut Hasil Pemeriksaan APIP', 1, NULL, NULL, NULL, NULL, NULL),
(1623, 512, '6.01.02.1.02.0001', 'Penanganan Penyelesaian KerugianNegara/Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1624, 512, '6.01.02.1.02.0002', 'Pengawasan dengan Tujuan Tertentu', 1, NULL, NULL, NULL, NULL, NULL),
(1625, 513, '6.01.03.1.01.0002', 'Perumusan Kebijakan Teknis di BidangFasilitasi Pengawasan', 1, NULL, NULL, NULL, NULL, NULL),
(1626, 514, '6.01.03.1.02.0001', 'Pendampingan dan Asistensi UrusanPemerintahan Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1627, 514, '6.01.03.1.02.0002', 'Pendampingan  Asistensi  Verifikasi  danPenilaian Reformasi Birokrasi', 1, NULL, NULL, NULL, NULL, NULL),
(1628, 514, '6.01.03.1.02.0003', 'Koordinasi  Monitoring dan Evaluasi serta Verifikasi Pencegahan dan Pemberantasan Korupsi', 1, NULL, NULL, NULL, NULL, NULL),
(1629, 514, '6.01.03.1.02.0004', 'Pendampingan  Asistensi dan VerifikasiPenegakan Integritas', 1, NULL, NULL, NULL, NULL, NULL),
(1630, NULL, '8.01.01.1.01.0001', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1631, NULL, '8.01.01.1.01.0002', 'Koordinasi dan Penyusunan Dokumen RKA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1632, NULL, '8.01.01.1.01.0003', 'Koordinasi dan Penyusunan DokumenPerubahan RKA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1633, NULL, '8.01.01.1.01.0004', 'Koordinasi dan Penyusunan DPA-SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1634, NULL, '8.01.01.1.01.0005', 'Koordinasi dan Penyusunan Perubahan DPA- SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1635, NULL, '8.01.01.1.01.0006', 'Koordinasi dan Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1636, NULL, '8.01.01.1.01.0007', 'Evaluasi Kinerja Perangkat Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1637, 515, '8.01.01.1.02.0003', 'Pelaksanaan Penatausahaan danPengujian/Verifikasi Keuangan SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1638, 515, '8.01.01.1.02.0004', 'Koordinasi dan Pelaksanaan Akuntansi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1639, 515, '8.01.01.1.02.0007', 'Koordinasi dan Penyusunan Laporan Keuangan Bulanan/ Triwulanan/Semesteran SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1640, 516, '8.01.01.1.03.0001', 'Penyusunan Perencanaan Kebutuhan Barang Milik Daerah SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1641, 516, '8.01.01.1.03.0005', 'Rekonsiliasi dan Penyusunan Laporan Barang Milik Daerah pada SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1642, 516, '8.01.01.1.03.0006', 'Penatausahaan Barang Milik Daerah padaSKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1643, 517, '8.01.01.1.05.0009', 'Pendidikan dan Pelatihan Pegawai Berdasarkan Tugas dan Fungsi', 1, NULL, NULL, NULL, NULL, NULL),
(1644, 517, '8.01.01.1.05.0010', 'Sosialisasi Peraturan Perundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1645, 517, '8.01.01.1.05.0011', 'Bimbingan Teknis Implementasi PeraturanPerundang-Undangan', 1, NULL, NULL, NULL, NULL, NULL),
(1646, 518, '8.01.01.1.06.0001', 'Penyediaan Komponen InstalasiListrik/Penerangan Bangunan Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1647, 518, '8.01.01.1.06.0005', 'Penyediaan Barang Cetakan dan Penggandaan', 1, NULL, NULL, NULL, NULL, NULL),
(1648, 518, '8.01.01.1.06.0007', 'Penyediaan Bahan/Material', 1, NULL, NULL, NULL, NULL, NULL),
(1649, 518, '8.01.01.1.06.0008', 'Fasilitasi Kunjungan Tamu', 1, NULL, NULL, NULL, NULL, NULL),
(1650, 518, '8.01.01.1.06.0009', 'Penyelenggaraan Rapat Koordinasi danKonsultasi SKPD', 1, NULL, NULL, NULL, NULL, NULL),
(1651, 519, '8.01.01.1.08.0002', 'Penyediaan Jasa Komunikasi  Sumber Daya Air dan Listrik', 1, NULL, NULL, NULL, NULL, NULL),
(1652, 519, '8.01.01.1.08.0004', 'Penyediaan Jasa Pelayanan Umum Kantor', 1, NULL, NULL, NULL, NULL, NULL),
(1653, 520, '8.01.01.1.09.0002', 'Penyediaan Jasa Pemeliharaan  Biaya Pemeliharaan  Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 1, NULL, NULL, NULL, NULL, NULL),
(1654, 520, '8.01.01.1.09.0011', 'Pemeliharaan/Rehabilitasi Sarana dan Prasarana Pendukung Gedung Kantor atau Bangunan Lainnya', 1, NULL, NULL, NULL, NULL, NULL),
(1655, NULL, '8.01.02.1.01.0001', 'Penyusunan Program Kerja di Bidang Ideologi Wawasan Kebangsaan  Bela Negara  Karakter Bangsa  Pembauran Kebangsaan  Bhineka Tunggal Ika dan Sejarah Kebangsaan', 1, NULL, NULL, NULL, NULL, NULL),
(1656, NULL, '8.01.02.1.01.0002', 'Perumusan Kebijakan Teknis di Bidang Ideologi Wawasan Kebangsaan  Bela Negara  Karakter Bangsa  Pembauran Kebangsaan  Bhineka Tunggal Ika dan Sejarah Kebangsaan', 1, NULL, NULL, NULL, NULL, NULL),
(1657, NULL, '8.01.02.1.01.0003', 'Pelaksanaan Kebijakan di Bidang Ideologi Wawasan Kebangsaan  Bela Negara  Karakter Bangsa  Pembauran Kebangsaan  Bhineka Tunggal Ika dan Sejarah Kebangsaan', 1, NULL, NULL, NULL, NULL, NULL),
(1658, NULL, '8.01.02.1.01.0004', 'Pelaksanaan Koordinasi di Bidang Ideologi Wawasan Kebangsaan  Bela Negara  Karakter Bangsa  Pembauran Kebangsaan  Bhineka Tunggal Ika dan Sejarah Kebangsaan', 1, NULL, NULL, NULL, NULL, NULL),
(1659, NULL, '8.01.02.1.01.0005', 'Pelaksanaan Monitoring Evaluasi dan Pelaporan di Bidang Ideologi Wawasan Kebangsaan  Bela Negara  Karakter Bangsa  Pembauran Kebangsaan  Bhineka Tunggal Ika dan Sejarah Kebangsaan', 1, NULL, NULL, NULL, NULL, NULL),
(1660, 521, '8.01.03.1.01.0001', 'Penyusunan Program Kerja di Bidang Pendidikan Politik  Etika Budaya Politik  Peningkatan Demokrasi  Fasilitasi Kelembagaan Pemerintahan  Perwakilan dan Partai Politik  Pemilihan Umum/Pemilihan Umum Kepala Daerah  serta Pemantauan Situasi Politik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1661, 521, '8.01.03.1.01.0002', 'Penyusunan Bahan Perumusan Kebijakan di Bidang Pendidikan Politik  Etika Budaya Politik  Peningkatan Demokrasi  Fasilitasi Kelembagaan Pemerintahan  Perwakilan dan Partai Politik  Pemilihan Umum/Pemilihan Umum Kepala Daerah  serta Pemantauan Situasi Politik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1662, 521, '8.01.03.1.01.0003', 'Pelaksanaan Kebijakan di Bidang Pendidikan Politik  Etika Budaya Politik  Peningkatan Demokrasi  Fasilitasi Kelembagaan Pemerintahan  Perwakilan dan Partai Politik  Pemilihan Umum/Pemilihan Umum Kepala Daerah  serta Pemantauan Situasi Politik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1663, 521, '8.01.03.1.01.0004', 'Pelaksanaan Koordinasi di Bidang Pendidikan Politik  Etika Budaya Politik  Peningkatan Demokrasi  Fasilitasi Kelembagaan Pemerintahan  Perwakilan dan Partai Politik  Pemilihan Umum/Pemilihan Umum Kepala Daerah  serta Pemantauan Situasi Politik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1664, 521, '8.01.03.1.01.0005', 'Pelaksanaan Monitoring  Evaluasi dan Pelaporan di Bidang Pendidikan Politik  Etika Budaya Politik  Peningkatan Demokrasi  Fasilitasi Kelembagaan Pemerintahan  Perwakilan dan Partai Politik  Pemilihan Umum/Pemilihan Umum Kepala Daerah  serta Pemantauan Situasi Politik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1665, 522, '8.01.04.1.01.0003', 'Pelaksanaan Kebijakan Dibidang Pendaftaran Ormas  Pemberdayaan Ormas  Evaluasi dan Mediasi Sengketa Ormas  Pengawasan Ormas dan Ormas Asing di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1666, 522, '8.01.04.1.01.0005', 'Pelaksanaan Monitoring Evaluasi dan Pelaporan Dibidang Pendaftaran Ormas  Pemberdayaan Ormas  Evaluasi dan Mediasi Sengketa Ormas  Pengawasan Ormas dan Ormas Asing di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1667, NULL, '8.01.05.1.01.0003', 'Pelaksanaan Kebijakan di Bidang Ketahanan Ekonomi  Sosial  Budaya dan Fasilitasi Pencegahan Penyalagunaan Narkotika  Fasilitasi Kerukunan Umat Beragama dan Penghayat Kepercayaan di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1668, NULL, '8.01.05.1.01.0004', 'Pelaksanaan Koordinasi di Bidang Ketahanan Ekonomi  Sosial  Budaya dan Fasilitasi Pencegahan Penyalagunaan Narkotika  Fasilitasi Kerukunan Umat Beragama dan Penghayat Kepercayaan di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1669, NULL, '8.01.05.1.01.0005', 'Pelaksanaan Monitoring  Evaluasi dan Pelaporan di Bidang Ketahanan Ekonomi  Sosial  Budaya dan Fasilitasi Pencegahan Penyalagunaan Narkotika  Fasilitasi Kerukunan Umat Beragama dan Penghayat Kepercayaan di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1670, 523, '8.01.06.1.01.0002', 'Penyusunan Bahan Perumusan Kebijakan di Bidang Kewaspadaan Dini  Kerja Sama Intelijen  Pemantauan Orang Asing  Tenaga Kerja Asing dan Lembaga Asing  Kewaspadaan Perbatasan Antar Negara  Fasilitasi Kelembagaan Bidang Kewaspadaan  serta Penanganan Konflik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1671, 523, '8.01.06.1.01.0003', 'Pelaksanaan Kebijakan di Bidang Kewaspadaan Dini  Kerja Sama Intelijen  Pemantauan Orang Asing  Tenaga Kerja Asing dan Lembaga Asing  Kewaspadaan Perbatasan Antar Negara  Fasilitasi Kelembagaan Bidang Kewaspadaan  serta Penanganan Konflik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1672, 523, '8.01.06.1.01.0005', 'Pelaksanaan Monitoring  Evaluasi dan Pelaporan di Bidang Kewaspadaan Dini  Kerja Sama Intelijen  Pemantauan Orang Asing  Tenaga Kerja Asing dan Lembaga Asing  Kewaspadaan Perbatasan Antar Negara  Fasilitasi Kelembagaan Bidang Kewaspadaan  serta Penanganan Konflik di Daerah', 1, NULL, NULL, NULL, NULL, NULL),
(1673, 523, '8.01.06.1.01.0006', 'Pelaksanaan Forum Koordinasi PimpinanDaerah Provinsi', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_sub_kegiatan_detail`
--

CREATE TABLE `master_sub_kegiatan_detail` (
  `id_sub_kegiatan_detail` int NOT NULL,
  `id_sub_kegiatan` int DEFAULT NULL,
  `id_unker` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_sub_urusan`
--

CREATE TABLE `master_sub_urusan` (
  `id_sub_urusan` int NOT NULL,
  `id_urusan` int NOT NULL,
  `kode_rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_sub_urusan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_unker` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_sub_urusan`
--

INSERT INTO `master_sub_urusan` (`id_sub_urusan`, `id_urusan`, `kode_rekening`, `nama_sub_urusan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(1, 1, '1.01', 'URUSAN PEMERINTAHAN BIDANG PENDIDIKAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(2, 1, '1.02', 'URUSAN PEMERINTAHAN BIDANG KESEHATAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(3, 1, '1.03', 'URUSAN PEMERINTAHAN BIDANG PEKERJAAN UMUM DAN PENATAAN RUANG', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(4, 1, '1.04', 'URUSAN PEMERINTAHAN BIDANG PERUMAHAN DAN KAWASAN PERMUKIMAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(5, 1, '1.05', 'URUSAN PEMERINTAHAN BIDANG KETENTERAMAN DAN KETERTIBAN UMUM SERTA PERLINDUNGAN MASYARAKAT', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(6, 1, '1.06', 'URUSAN PEMERINTAHAN BIDANG SOSIAL', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(7, 2, '2.07', 'URUSAN PEMERINTAHAN BIDANG TENAGA KERJA', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(8, 2, '2.08', 'URUSAN PEMERINTAHAN BIDANG PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(9, 2, '2.09', 'URUSAN PEMERINTAHAN BIDANG PANGAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(10, 2, '2.10', 'URUSAN PEMERINTAHAN BIDANG PERTANAHAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(11, 2, '2.11', 'URUSAN PEMERINTAHAN BIDANG LINGKUNGAN HIDUP', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(12, 2, '2.12', 'URUSAN PEMERINTAHAN BIDANG ADMINISTRASI KEPENDUDUKAN DAN PENCATATAN SIPIL', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(13, 2, '2.13', 'URUSAN PEMERINTAHAN BIDANG PEMBERDAYAAN MASYARAKAT DAN DESA', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(14, 2, '2.14', 'URUSAN PEMERINTAHAN BIDANG PENGENDALIAN PENDUDUK DAN KELUARGA BERENCANA', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(15, 2, '2.15', 'URUSAN PEMERINTAHAN BIDANG PERHUBUNGAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(16, 2, '2.16', 'URUSAN PEMERINTAHAN BIDANG KOMUNIKASI DAN INFORMATIKA', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(17, 2, '2.18', 'URUSAN PEMERINTAHAN BIDANG PENANAMAN MODAL', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(18, 2, '2.19', 'URUSAN PEMERINTAHAN BIDANG KEPEMUDAAN DAN OLAHRAGA', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(19, 2, '2.20', 'URUSAN PEMERINTAHAN BIDANG STATISTIK', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(20, 2, '2.21', 'URUSAN PEMERINTAHAN BIDANG PERSANDIAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(21, 2, '2.22', 'URUSAN PEMERINTAHAN BIDANG KEBUDAYAAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(22, 2, '2.23', 'URUSAN PEMERINTAHAN BIDANG PERPUSTAKAAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(23, 2, '2.24', 'URUSAN PEMERINTAHAN BIDANG KEARSIPAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(24, 3, '3.25', 'URUSAN PEMERINTAHAN BIDANG KELAUTAN DAN PERIKANAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(25, 3, '3.26', 'URUSAN PEMERINTAHAN BIDANG PARIWISATA', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(26, 3, '3.28', 'URUSAN PEMERINTAHAN BIDANG KEHUTANAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(27, 3, '3.29', 'URUSAN PEMERINTAHAN BIDANG ENERGI DAN SUMBER DAYA MINERAL', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(28, 3, '3.30', 'URUSAN PEMERINTAHAN BIDANG PERDAGANGAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(29, 3, '3.31', 'URUSAN PEMERINTAHAN BIDANG PERINDUSTRIAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(30, 3, '3.32', 'URUSAN PEMERINTAHAN BIDANG TRANSMIGRASI', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(31, 4, '4.01', 'SEKRETARIAT DAERAH', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(32, 4, '4.02', 'SEKRETARIAT DPRD', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(33, 5, '5.01', 'PERENCANAAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(34, 5, '5.02', 'KEUANGAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(35, 5, '5.03', 'KEPEGAWAIAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(36, 5, '5.04', 'PENDIDIKAN DAN PELATIHAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(37, 5, '5.05', 'PENELITIAN DAN PENGEMBANGAN', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(38, 5, '5.07', 'PENGELOLAAN PENGHUBUNG', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(39, 6, '6.01', 'INSPEKTORAT DAERAH', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL),
(40, 8, '8.01', 'KESATUAN BANGSA DAN POLITIK', 1, 1, '2024-10-15 03:56:06', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_unker`
--

CREATE TABLE `master_unker` (
  `ID` int NOT NULL,
  `T_KUnker` varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Unit_Kerja` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Kepala` varchar(765) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_unker`
--

INSERT INTO `master_unker` (`ID`, `T_KUnker`, `Unit_Kerja`, `Kepala`, `Is_Active`) VALUES
(1, '1004010000', 'SEKRETARIAT DAERAH PROVINSI', 'SEKRETARIS DAERAH PROVINSI', 1),
(2, '1004020000', 'ASISTEN PEMERINTAHAN DAN KESEJAHTERAAN RAKYAT', 'ASISTEN PEMERINTAHAN DAN KESEJAHTERAAN RAKYAT', 1),
(3, '1004030000', 'ASISTEN PEREKONOMIAN, KEUANGAN DAN PEMBANGUNAN', 'ASISTEN PEREKONOMIAN, KEUANGAN DAN PEMBANGUNAN', 1),
(4, '1004040000', 'ASISTEN ADMINISTRASI UMUM', 'ASISTEN  ADMINISTRASI UMUM', 1),
(5, '1004050000', 'BIRO PEMERINTAHAN DAN OTONOMI DAERAH', 'KEPALA BIRO PEMERINTAHAN DAN OTONOMI DAERAH', 1),
(6, '1004060000', 'BIRO HUKUM', 'KEPALA BIRO HUKUM', 1),
(7, '1004070000', 'BIRO KESEJAHTERAAN RAKYAT', 'KEPALA BIRO KESEJAHTERAAN RAKYAT', 1),
(8, '1004080000', 'BIRO PEREKONOMIAN', 'KEPALA BIRO PEREKONOMIAN', 1),
(9, '1004090000', 'BIRO ADMINISTRASI PEMBANGUNAN', 'KEPALA BIRO ADMINISTRASI PEMBANGUNAN', 1),
(10, '1004100000', 'BIRO UMUM', 'KEPALA BIRO UMUM', 1),
(11, '1004110000', 'BIRO PENGADAAN BARANG DAN JASA', 'KEPALA BIRO PERLENGKAPAN', 1),
(12, '1004120000', 'BIRO ADMINISTRASI PIMPINAN', 'KEPALA BIRO HUBUNGAN MASYARAKAT DAN PROTOKOL', 1),
(13, '1004130000', 'BIRO ORGANISASI', 'KEPALA BIRO ORGANISASI', 1),
(14, '1004140000', 'STAF AHLI GUBERNUR BIDANG PEMERINTAHAN, HUKUM DAN POLITIK', 'STAF AHLI GUBERNUR BIDANG PEMERINTAHAN, HUKUM DAN POLITIK', 1),
(15, '1004150000', 'STAF AHLI GUBERNUR BIDANG EKONOMI, KEUANGAN DAN PEMBANGUNAN', 'STAF AHLI GUBERNUR BIDANG EKONOMI, KEUANGAN DAN PEMBANGUNAN', 1),
(16, '1004160000', 'STAF AHLI GUBERNUR BIDANG KEMASYARAKATAN DAN SUMBER DAYA MANUSIA', 'STAF AHLI GUBERNUR BIDANG KEMASYARAKATAN DAN SUMBER DAYA MANUSIA', 1),
(17, '1004170000', 'SEKRETARIAT DPRD', 'SEKRETARIS DPRD', 1),
(18, '1004180000', 'INSPEKTORAT PROVINSI', 'KEPALA INSPEKTORAT PROVINSI', 1),
(19, '1005010000', 'DINAS PENDIDIKAN DAN KEBUDAYAAN', 'KEPALA DINAS PENDIDIKAN DAN KEBUDAYAAN', 1),
(20, '1005020000', 'DINAS KESEHATAN', 'KEPALA DINAS KESEHATAN', 1),
(21, '1005030000', 'DINAS BINA MARGA DAN BINA KONSTRUKSI', 'KEPALA DINAS PEKERJAAN UMUM DAN PENATAAN RUANG', 1),
(22, '1005040000', 'DINAS PENGELOLAAN SUMBER DAYA AIR', 'KEPALA DINAS CIPTA KARYA DAN PENGELOLAAN SUMBER DAYA AIR', 1),
(23, '1005050000', 'SATUAN POLISI PAMONG PRAJA', 'KEPALA SATUAN POLISI PAMONG PRAJA', 1),
(24, '1005060000', 'DINAS SOSIAL', 'KEPALA DINAS SOSIAL', 1),
(25, '1005070000', 'DINAS TENAGA KERJA', 'KEPALA DINAS TENAGA KERJA', 1),
(26, '1005080000', 'DINAS PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK', 'KEPALA DINAS PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK', 1),
(27, '1005090000', 'DINAS PETERNAKAN DAN KESEHATAN HEWAN', 'KEPALA DINAS PETERNAKAN DAN KESEHATAN HEWAN', 1),
(28, '1005100000', 'DINAS LINGKUNGAN HIDUP', 'KEPALA DINAS LINGKUNGAN HIDUP', 1),
(29, '1005110000', 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL', 'KEPALA DINAS KEPENDUDUKAN DAN CATATAN SIPIL', 1),
(30, '1005120000', 'DINAS PEMBERDAYAAN MASYARAKAT, DESA DAN TRANSMIGRASI', 'KEPALA DINAS PEMBERDAYAAN MASYARAKAT, DESA DAN TRANSMIGRASI', 1),
(31, '1005130000', 'DINAS PERHUBUNGAN', 'KEPALA DINAS PERHUBUNGAN', 1),
(32, '1005140000', 'DINAS KOMUNIKASI, INFORMATIKA DAN STATISTIK', 'KEPALA DINAS KOMUNIKASI, INFORMATIKA DAN STATISTIK', 1),
(33, '1005150000', 'DINAS KOPERASI, USAHA KECIL DAN MENENGAH', 'KEPALA DINAS KOPERASI, USAHA KECIL DAN MENENGAH', 1),
(34, '1005160000', 'DINAS PENANAMAN MODAL DAN PELAYANAN TERPADU SATU PINTU', 'KEPALA DINAS PENANAMAN MODAL DAN PELAYANAN TERPADU SATU PINTU', 1),
(35, '1005170000', 'DINAS PEMUDA DAN OLAHRAGA', 'KEPALA DINAS PEMUDA DAN OLAHRAGA', 1),
(36, '1005180000', 'DINAS PERPUSTAKAAN DAN KEARSIPAN', 'KEPALA DINAS PERPUSTAKAAN DAN KEARSIPAN', 1),
(37, '1005190000', 'DINAS KELAUTAN DAN PERIKANAN', 'KEPALA DINAS KELAUTAN DAN PERIKANAN', 1),
(38, '1005200000', 'DINAS PARIWISATA DAN EKONOMI KREATIF', 'KEPALA DINAS PARIWISATA DAN EKONOMI KREATIF', 1),
(39, '1005210000', 'DINAS KETAHANAN PANGAN, TANAMAN PANGAN, DAN HORTIKULTURA', 'KEPALA DINAS KETAHANAN PANGAN, TANAMAN PANGAN, DAN HORTIKULTURA', 1),
(40, '1005220000', 'DINAS PERKEBUNAN', 'KEPALA DINAS PERKEBUNAN', 1),
(41, '1005230000', 'DINAS KEHUTANAN', 'KEPALA DINAS KEHUTANAN', 1),
(42, '1005240000', 'DINAS ENERGI DAN SUMBER DAYA MINERAL', 'KEPALA DINAS ENERGI DAN SUMBER DAYA MINERAL', 1),
(43, '1005250000', 'DINAS PERINDUSTRIAN DAN PERDAGANGAN', 'KEPALA DINAS PERINDUSTRIAN DAN PERDAGANGAN', 1),
(44, '1005270000', 'DINAS PERUMAHAN,KAWASAN PERMUKIMAN DAN CIPTA KARYA', 'KEPALA DINAS PERUMAHAN,KAWASAN PERMUKIMAN DAN CIPTA KARYA', 1),
(45, '1006010000', 'BADAN PERENCANAAN PEMBANGUNAN DAERAH', 'KEPALA BADAN PERENCANAAN PEMBANGUNAN DAERAH', 1),
(46, '1006020000', 'BADAN PENGELOLAAN KEUANGAN DAN ASET  DAERAH', 'KEPALA BADAN PENGELOLAAN KEUANGAN DAN ASET DAERAH', 1),
(47, '1006030000', 'BADAN PENDAPATAN DAERAH', 'KEPALA BADAN PENDAPATAN DAERAH', 1),
(48, '1006040000', 'BADAN KEPEGAWAIAN DAERAH', 'KEPALA BADAN KEPEGAWAIAN DAERAH', 1),
(49, '1006050000', 'BADAN PENGEMBANGAN SUMBER DAYA MANUSIA DAERAH', 'KEPALA BADAN PENGEMBANGAN SUMBER DAYA MANUSIA DAERAH', 1),
(50, '1006060000', 'BADAN PENELITIAN DAN PENGEMBANGAN DAERAH', 'KEPALA BADAN PENELITIAN DAN PENGEMBANGAN DAERAH', 1),
(51, '1006070000', 'BADAN PENGHUBUNG', 'KEPALA BADAN PENGHUBUNG', 1),
(52, '1006080000', 'BADAN PENANGGULANGAN BENCANA DAERAH', 'KEPALA BADAN PENANGGULANGAN BENCANA DAERAH', 1),
(53, '1007010000', 'BADAN KESATUAN BANGSA DAN POLITIK DAERAH', 'KEPALA BADAN KESATUAN BANGSA DAN POLITIK DAERAH', 1),
(54, '1007030000', 'RUMAH SAKIT UMUM DAERAH Dr. H. ABDUL MOELOEK', 'DIREKTUR UMUM RUMAH SAKIT UMUM DAERAH DR. Hi. ABDUL MOELOEK', 1),
(55, '1007040000', 'RUMAH SAKIT JIWA DAERAH', 'DIREKTUR RUMAH SAKIT JIWA DAERAH', 1),
(56, '1008010000', 'SMAN 1 BANDAR LAMPUNG', 'KEPALA SMAN 1 BANDAR LAMPUNG', 0),
(57, '1008020000', 'SMAN 2 BANDAR LAMPUNG', 'KEPALA SMAN 2 BANDAR LAMPUNG', 0),
(58, '1008030000', 'SMAN 3 BANDAR LAMPUNG', 'KEPALA SMAN 3 BANDAR LAMPUNG', 0),
(59, '1008040000', 'SMAN 4 BANDAR LAMPUNG', 'KEPALA SMAN 4 BANDAR LAMPUNG', 0),
(60, '1008050000', 'SMAN 5 BANDAR LAMPUNG', 'KEPALA SMAN 5 BANDAR LAMPUNG', 0),
(61, '1008060000', 'SMAN 6 BANDAR LAMPUNG', 'KEPALA SMAN 6 BANDAR LAMPUNG', 0),
(62, '1008070000', 'SMAN 7 BANDAR LAMPUNG', 'KEPALA SMAN 7 BANDAR LAMPUNG', 0),
(63, '1008080000', 'SMAN 8 BANDAR LAMPUNG', 'KEPALA SMAN 8 BANDAR LAMPUNG', 0),
(64, '1008090000', 'SMAN 9 BANDAR LAMPUNG', 'KEPALA SMAN 9 BANDAR LAMPUNG', 0),
(65, '1008100000', 'SMAN 10 BANDAR LAMPUNG', 'KEPALA SMAN 10 BANDAR LAMPUNG', 0),
(66, '1008110000', 'SMAN 11 BANDAR LAMPUNG', 'KEPALA SMAN 11 BANDAR LAMPUNG', 0),
(67, '1008120000', 'SMAN 12 BANDAR LAMPUNG', 'KEPALA SMAN 12 BANDAR LAMPUNG', 0),
(68, '1008130000', 'SMAN 13 BANDAR LAMPUNG', 'KEPALA SMAN 13 BANDAR LAMPUNG', 0),
(69, '1008140000', 'SMAN 14 BANDAR LAMPUNG', 'KEPALA SMAN 14 BANDAR LAMPUNG', 0),
(70, '1008150000', 'SMAN 15 BANDAR LAMPUNG', 'KEPALA SMAN 15 BANDAR LAMPUNG', 0),
(71, '1008160000', 'SMAN 16 BANDAR LAMPUNG', 'KEPALA SMAN 16 BANDAR LAMPUNG', 0),
(72, '1008170000', 'SMAN 17 BANDAR LAMPUNG', 'KEPALA SMAN 17 BANDAR LAMPUNG', 0),
(73, '1008180000', 'SMKN 1 BANDAR LAMPUNG', 'KEPALA SMKN 1 BANDAR LAMPUNG', 0),
(74, '1008190000', 'SMKN 2 BANDAR LAMPUNG', 'KEPALA SMKN 2 BANDAR LAMPUNG', 0),
(75, '1008200000', 'SMKN 3 BANDAR LAMPUNG', 'KEPALA SMKN 3 BANDAR LAMPUNG', 0),
(76, '1008210000', 'SMKN 4 BANDAR LAMPUNG', 'KEPALA SMKN 4 BANDAR LAMPUNG', 0),
(77, '1008220000', 'SMKN 5 BANDAR LAMPUNG', 'KEPALA SMKN 5 BANDAR LAMPUNG', 0),
(78, '1008230000', 'SMKN 6 BANDAR LAMPUNG', 'KEPALA SMKN 6 BANDAR LAMPUNG', 0),
(79, '1008240000', 'SMKN 7 BANDAR LAMPUNG', 'KEPALA SMKN 7 BANDAR LAMPUNG', 0),
(80, '1008250000', 'SMKN 8 BANDAR LAMPUNG', 'KEPALA SMKN 8 BANDAR LAMPUNG', 0),
(81, '1008260000', 'SMAN 1 CANDIPURO LAMPUNG SELATAN', 'KEPALA SMAN 1 CANDIPURO LAMPUNG SELATAN', 0),
(82, '1008270000', 'SMAN 1 JATI AGUNG LAMPUNG SELATAN', 'KEPALA SMAN 1 JATI AGUNG LAMPUNG SELATAN', 0),
(83, '1008280000', 'SMAN 1 KALIANDA LAMPUNG SELATAN', 'KEPALA SMAN 1 KALIANDA LAMPUNG SELATAN', 0),
(84, '1008290000', 'SMAN 1 KATIBUNG LAMPUNG SELATAN', 'KEPALA SMAN 1 KATIBUNG LAMPUNG SELATAN', 0),
(85, '1008300000', 'SMAN 1 KETAPANG LAMPUNG SELATAN', 'KEPALA SMAN 1 KETAPANG LAMPUNG SELATAN', 0),
(86, '1008310000', 'SMAN 1 MERBAU MATARAM LAMPUNG SELATAN', 'KEPALA SMAN 1 MERBAU MATARAM LAMPUNG SELATAN', 0),
(87, '1008320000', 'SMAN 1 NATAR  LAMPUNG SELATAN', 'KEPALA SMAN 1 NATAR LAMPUNG SELATAN', 0),
(88, '1008330000', 'SMAN 1 PALAS LAMPUNG SELATAN', 'KEPALA SMAN 1 PALAS LAMPUNG SELATAN', 0),
(89, '1008340000', 'SMAN 1 PENENGAHAN LAMPUNG SELATAN', 'KEPALA SMAN 1 PENENGAHAN LAMPUNG SELATAN', 0),
(90, '1008350000', 'SMAN 1 RAJABASA LAMPUNG SELATAN', 'KEPALA SMAN 1 RAJABASA LAMPUNG SELATAN', 0),
(91, '1008360000', 'SMAN 1 SIDOMULYO LAMPUNG SELATAN', 'KEPALA SMAN 1 SIDOMULYO LAMPUNG SELATAN', 0),
(92, '1008370000', 'SMAN 1 SRAGI LAMPUNG SELATAN', 'KEPALA SMAN 1 SRAGI LAMPUNG SELATAN', 0),
(93, '1008380000', 'SMAN 1 TANJUNG BINTANG LAMPUNG SELATAN', 'KEPALA SMAN 1 TANJUNG BINTANG LAMPUNG SELATAN', 0),
(94, '1008390000', 'SMAN 1 WAY SULAN LAMPUNG SELATAN', 'KEPALA SMAN 1 WAY SULAN LAMPUNG SELATAN', 0),
(95, '1008400000', 'SMAN 2 KALIANDA LAMPUNG SELATAN', 'KEPALA SMAN 2 KALIANDA LAMPUNG SELATAN', 0),
(96, '1008410000', 'SMAN 2 NATAR LAMPUNG SELATAN', 'KEPALA SMAN 2 NATAR LAMPUNG SELATAN', 0),
(97, '1008420000', 'SMKN 1 BAKAUHENI LAMPUNG SELATAN', 'KEPALA SMKN 1 BAKAUHENI LAMPUNG SELATAN', 0),
(98, '1008430000', 'SMKN 1 CANDIPURO LAMPUNG SELATAN', 'KEPALA SMKN 1 CANDIPURO LAMPUNG SELATAN', 0),
(99, '1008440000', 'SMKN 1 KALIANDA LAMPUNG SELATAN', 'KEPALA SMKN 1 KALIANDA LAMPUNG SELATAN', 0),
(100, '1008450000', 'SMKN 1 KETAPANG LAMPUNG SELATAN', 'KEPALA SMKN 1 KETAPANG LAMPUNG SELATAN', 0),
(101, '1008460000', 'SMKN 1 NATAR LAMPUNG SELATAN', 'KEPALA SMKN 1 NATAR LAMPUNG SELATAN', 0),
(102, '1008470000', 'SMKN 1 SRAGI LAMPUNG SELATAN', 'KEPALA SMKN 1 SRAGI LAMPUNG SELATAN', 0),
(103, '1008480000', 'SMKN 2 KALIANDA LAMPUNG SELATAN', 'KEPALA SMKN 2 KALIANDA LAMPUNG SELATAN', 0),
(104, '1008490000', 'SMKN 1 SIDOMULYO LAMPUNG SELATAN', 'KEPALA SMKN SIDOMULYO LAMPUNG SELATAN', 0),
(105, '1008500000', 'SMKN TANJUNG SARI LAMPUNG SELATAN', 'KEPALA SMKN TANJUNG SARI LAMPUNG SELATAN', 0),
(106, '1008510000', 'SMAN 1 GEDONGTATAAN PESAWARAN', 'KEPALA SMAN 1 GEDONGTATAAN PESAWARAN', 0),
(107, '1008520000', 'SMAN 1 KEDONDONG PESAWARAN', 'KEPALA SMAN 1 KEDONDONG PESAWARAN', 0),
(108, '1008530000', 'SMAN 1 NEGERI KATON PESAWARAN', 'KEPALA SMAN 1 NEGERI KATON PESAWARAN', 0),
(109, '1008540000', 'SMAN 1 PADANG CERMIN PESAWARAN', 'KEPALA SMAN 1 PADANG CERMIN PESAWARAN', 0),
(110, '1008550000', 'SMAN 1 PUNDUH PEDADA PESAWARAN', 'KEPALA SMAN 1 PUNDUH PEDADA PESAWARAN', 0),
(111, '1008560000', 'SMAN 1 TEGINENENG PESAWARAN', 'KEPALA SMAN 1 TEGINENENG PESAWARAN', 0),
(112, '1008570000', 'SMAN 1 WAY KHILAU PESAWARAN', 'KEPALA SMAN 1 WAY KHILAU PESAWARAN', 0),
(113, '1008580000', 'SMAN 1 WAY LIMA PESAWARAN', 'KEPALA SMAN 1 WAY LIMA PESAWARAN', 0),
(114, '1008590000', 'SMAN 2 GEDONGTATAAN PESAWARAN', 'KEPALA SMAN 2 GEDONGTATAAN PESAWARAN', 0),
(115, '1008600000', 'SMAN 2 NEGERI KATON PESAWARAN', 'KEPALA SMAN 2 NEGERI KATON PESAWARAN', 0),
(116, '1008610000', 'SMAN 2 PADANG CERMIN PESAWARAN', 'KEPALA SMAN 2 PADANG CERMIN PESAWARAN', 0),
(117, '1008620000', 'SMAN 2 PUNDUH PEDADA PESAWARAN', 'KEPALA SMAN 2 PUNDUH PEDADA PESAWARAN', 0),
(118, '1008630000', 'SMAN 2 TEGINENENG PESAWARAN', 'KEPALA SMAN 2 TEGINENENG PESAWARAN', 0),
(119, '1008640000', 'SMKN 1 GEDONGTATAAN PESAWARAN', 'KEPALA SMKN 1 GEDONGTATAAN PESAWARAN', 0),
(120, '1008650000', 'SMKN 1 NEGERI KATON PESAWARAN', 'KEPALA SMKN 1 NEGERI KATON PESAWARAN', 0),
(121, '1008660000', 'SMKN 1 TEGINENENG PESAWARAN', 'KEPALA SMKN 1 TEGINENENG PESAWARAN', 0),
(122, '1008670000', 'SMKN PADANG CERMIN PESAWARAN', 'KEPALA SMKN PADANG CERMIN PESAWARAN', 0),
(123, '1008690000', 'SMKN 1 MERBAU MATARAM LAMPUNG SELATAN', 'KEPALA SMKN 1 MERBAU MATARAM LAMPUNG SELATAN', 0),
(124, '1008710000', 'SMKN 9 BANDAR LAMPUNG', 'KEPALA SMKN 9 BANDAR LAMPUNG', 0),
(125, '1008720000', 'SLB BINA INSANI BANDAR LAMPUNG', 'KEPALA SLB BINA INSANI BANDAR LAMPUNG', 0),
(126, '1008730000', 'SLB DHARMA BHAKTI DHARMA PERTIWI BANDAR LAMPUNG', 'KEPALA SLB DHARMA BHAKTI DHARMA PERTIWI BANDAR LAMPUNG', 0),
(127, '1008740000', 'SLB PKK PROVINSI LAMPUNG', 'KEPALA SLB PKK PROVINSI LAMPUNG', 0),
(128, '1008750000', 'SLB NEGERI SIDOMULYO LAMPUNG SELATAN', 'KEPALA SLB NEGERI SIDOMULYO LAMPUNG SELATAN', 0),
(131, '1008780000', 'SMAN 1 BAKAUHENI LAMPUNG SELATAN', 'KEPALA SMAN 1 BAKAUHENI LAMPUNG SELATAN', 0),
(132, '1008790000', 'SMKN 1 KETIBUNG LAMPUNG SELATAN', 'KEPALA SMKN 1 KETIBUNG LAMPUNG SELATAN', 0),
(133, '1008800000', 'SMAN 1 TANJUNG SARI LAMPUNG SELATAN', 'KEPALA SMAN 1 TANJUNG SARI LAMPUNG SELATAN', 0),
(134, '1009010000', 'SMAN 1 METRO', 'KEPALA SMAN 1 METRO', 0),
(135, '1009020000', 'SMAN 2 METRO', 'KEPALA SMAN 2 METRO', 0),
(136, '1009030000', 'SMAN 3 METRO', 'KEPALA SMAN 3 METRO', 0),
(137, '1009040000', 'SMAN 4 METRO', 'KEPALA SMAN 4 METRO', 0),
(138, '1009050000', 'SMAN 5 METRO', 'KEPALA SMAN 5 METRO', 0),
(139, '1009060000', 'SMAN 6 METRO', 'KEPALA SMAN 6 METRO', 0),
(140, '1009070000', 'SMAN OLAH RAGA METRO', 'KEPALA SMAN OLAH RAGA METRO', 0),
(142, '1009090000', 'SMKN 1 METRO', 'KEPALA SMKN 1 METRO', 0),
(143, '1009100000', 'SMKN 2 METRO', 'KEPALA SMKN 2 METRO', 0),
(144, '1009110000', 'SMKN 3 METRO', 'KEPALA SMKN 3 METRO', 0),
(145, '1009120000', 'SMKN 4 METRO', 'KEPALA SMKN 4 METRO', 0),
(146, '1009130000', 'SMAN 1 ANAK RATU AJI LAMPUNG TENGAH', 'KEPALA SMAN 1 ANAK RATU AJI LAMPUNG TENGAH', 0),
(147, '1009140000', 'SMAN 1 ANAK TUHA LAMPUNG TENGAH', 'KEPALA SMAN 1 ANAK TUHA LAMPUNG TENGAH', 0),
(148, '1009150000', 'SMAN 1 BANDAR SURABAYA LAMPUNG TENGAH', 'KEPALA SMAN 1 BANDAR SURABAYA LAMPUNG TENGAH', 0),
(149, '1009160000', 'SMAN 1 BANGUN REJO LAMPUNG TENGAH', 'KEPALA SMAN 1 BANGUN REJO LAMPUNG TENGAH', 0),
(150, '1009170000', 'SMAN 1 BUMI NABUNG LAMPUNG TENGAH', 'KEPALA SMAN 1 BUMI NABUNG LAMPUNG TENGAH', 0),
(151, '1009180000', 'SMAN 1 GUNUNG SUGIH LAMPUNG TENGAH', 'KEPALA SMAN 1 GUNUNG SUGIH LAMPUNG TENGAH', 0),
(152, '1009190000', 'SMAN 1 KALIREJO LAMPUNG TENGAH', 'KEPALA SMAN 1 KALIREJO LAMPUNG TENGAH', 0),
(153, '1009200000', 'SMAN 1 KOTA GAJAH LAMPUNG TENGAH', 'KEPALA SMAN 1 KOTA GAJAH LAMPUNG TENGAH', 0),
(154, '1009210000', 'SMAN 1 PADANG RATU LAMPUNG TENGAH', 'KEPALA SMAN 1 PADANG RATU LAMPUNG TENGAH', 0),
(155, '1009220000', 'SMAN 1 PUBIAN LAMPUNG TENGAH', 'KEPALA SMAN 1 PUBIAN LAMPUNG TENGAH', 0),
(156, '1009230000', 'SMAN 1 PUNGGUR LAMPUNG TENGAH', 'KEPALA SMAN 1 PUNGGUR LAMPUNG TENGAH', 0),
(157, '1009240000', 'SMAN 1 RUMBIA LAMPUNG TENGAH', 'KEPALA SMAN 1 RUMBIA LAMPUNG TENGAH', 0),
(158, '1009250000', 'SMAN 1 SENDANG AGUNG LAMPUNG TENGAH', 'KEPALA SMAN 1 SENDANG AGUNG LAMPUNG TENGAH', 0),
(159, '1009260000', 'SMAN 1 SEPUTIH AGUNG LAMPUNG TENGAH', 'KEPALA SMAN 1 SEPUTIH AGUNG LAMPUNG TENGAH', 0),
(160, '1009270000', 'SMAN 1 SEPUTIH BANYAK LAMPUNG TENGAH', 'KEPALA SMAN 1 SEPUTIH BANYAK LAMPUNG TENGAH', 0),
(161, '1009280000', 'SMAN 1 SEPUTIH MATARAM LAMPUNG TENGAH', 'KEPALA SMAN 1 SEPUTIH MATARAM LAMPUNG TENGAH', 0),
(162, '1009290000', 'SMAN 1 SEPUTIH RAMAN LAMPUNG TENGAH', 'KEPALA SMAN 1 SEPUTIH RAMAN LAMPUNG TENGAH', 0),
(163, '1009300000', 'SMAN 1 SEPUTIH SURABAYA LAMPUNG TENGAH', 'KEPALA SMAN 1 SEPUTIH SURABAYA LAMPUNG TENGAH', 0),
(164, '1009310000', 'SMAN 1 TERBANGGI BESAR LAMPUNG TENGAH', 'KEPALA SMAN 1 TERBANGGI BESAR LAMPUNG TENGAH', 0),
(165, '1009320000', 'SMAN 1 TERUSAN NUNYAI LAMPUNG TENGAH', 'KEPALA SMAN 1 TERUSAN NUNYAI LAMPUNG TENGAH', 0),
(166, '1009330000', 'SMAN 1 TRIMURJO LAMPUNG TENGAH', 'KEPALA SMAN 1 TRIMURJO LAMPUNG TENGAH', 0),
(167, '1009340000', 'SMAN 1 WAY PENGUBUAN LAMPUNG TENGAH', 'KEPALA SMAN 1 WAY PENGUBUAN LAMPUNG TENGAH', 0),
(168, '1009350000', 'SMKN 1 BUMIRATU NUBAN  LAMPUNG TENGAH', 'KEPALA SMKN 1 BUMIRATU NUBAN LAMPUNG TENGAH', 0),
(169, '1009360000', 'SMKN 1 SELAGAI LINGGA LAMPUNG TENGAH', 'KEPALA SMKN 1 SELAGAI LINGGA LAMPUNG TENGAH', 0),
(170, '1009370000', 'SMKN 1 SEPUTIH AGUNG LAMPUNG TENGAH', 'KEPALA SMKN 1 SEPUTIH AGUNG LAMPUNG TENGAH', 0),
(171, '1009380000', 'SMKN 1 SEPUTIH SURABAYA LAMPUNG TENGAH', 'KEPALA SMKN 1 SEPUTIH SURABAYA LAMPUNG TENGAH', 0),
(172, '1009390000', 'SMKN 1 TERBANGGI BESAR LAMPUNG TENGAH', 'KEPALA SMKN 1 TERBANGGI BESAR LAMPUNG TENGAH', 0),
(173, '1009400000', 'SMKN 1 TERUSAN NUNYAI  LAMPUNG TENGAH', 'KEPALA SMKN 1 TERUSAN NUNYAI LAMPUNG TENGAH', 0),
(174, '1009410000', 'SMKN 1 WAY PENGUBUAN LAMPUNG TENGAH', 'KEPALA SMKN 1 WAY PENGUBUAN LAMPUNG TENGAH', 0),
(175, '1009420000', 'SMKN 2 TERBANGGI BESAR LAMPUNG TENGAH', 'KEPALA SMKN 2 TERBANGGI BESAR LAMPUNG TENGAH', 0),
(176, '1009430000', 'SMKN 3 TERBANGGI BESAR LAMPUNG TENGAH', 'KEPALA SMKN 3 TERBANGGI BESAR LAMPUNG TENGAH', 0),
(177, '1009440000', 'SMAN 1 BANDAR SRIBAWONO LAMPUNG TIMUR', 'KEPALA SMAN 1 BANDAR SRIBAWONO LAMPUNG TIMUR', 0),
(178, '1009450000', 'SMAN 1 BATANGHARI LAMPUNG TIMUR', 'KEPALA SMAN 1 BATANGHARI LAMPUNG TIMUR', 0),
(179, '1009460000', 'SMAN 1 GUNUNG PELINDUNG LAMPUNG TIMUR', 'KEPALA SMAN 1 GUNUNG PELINDUNG LAMPUNG TIMUR', 0),
(180, '1009470000', 'SMAN 1 JABUNG LAMPUNG TIMUR', 'KEPALA SMAN 1 JABUNG LAMPUNG TIMUR', 0),
(181, '1009480000', 'SMAN 1 KIBANG LAMPUNG TIMUR', 'KEPALA SMAN 1 KIBANG LAMPUNG TIMUR', 0),
(182, '1009490000', 'SMAN 1 LABUHAN MARINGGAI LAMPUNG TIMUR', 'KEPALA SMAN 1 LABUHAN MARINGGAI LAMPUNG TIMUR', 0),
(183, '1009500000', 'SMAN 1 LABUHAN RATU LAMPUNG TIMUR', 'KEPALA SMAN 1 LABUHAN RATU LAMPUNG TIMUR', 0),
(184, '1009510000', 'SMAN 1 MARGA TIGA LAMPUNG TIMUR', 'KEPALA SMAN 1 MARGA TIGA LAMPUNG TIMUR', 0),
(185, '1009520000', 'SMAN 1 MELINTING LAMPUNG TIMUR', 'KEPALA SMAN 1 MELINTING LAMPUNG TIMUR', 0),
(186, '1009530000', 'SMAN 1 PASIR SAKTI LAMPUNG TIMUR', 'KEPALA SMAN 1 PASIR SAKTI LAMPUNG TIMUR', 0),
(187, '1009540000', 'SMAN 1 PEKALONGAN LAMPUNG TIMUR', 'KEPALA SMAN 1 PEKALONGAN LAMPUNG TIMUR', 0),
(188, '1009550000', 'SMAN 1 PURBOLINGGO LAMPUNG TIMUR', 'KEPALA SMAN 1 PURBOLINGGO LAMPUNG TIMUR', 0),
(189, '1009560000', 'SMAN 1 RAMAN UTARA LAMPUNG TIMUR', 'KEPALA SMAN 1 RAMAN UTARA LAMPUNG TIMUR', 0),
(190, '1009570000', 'SMAN 1 SEKAMPUNG LAMPUNG TIMUR', 'KEPALA SMAN 1 SEKAMPUNG LAMPUNG TIMUR', 0),
(191, '1009580000', 'SMAN 1 SEKAMPUNG UDIK LAMPUNG TIMUR', 'KEPALA SMAN 1 SEKAMPUNG UDIK LAMPUNG TIMUR', 0),
(192, '1009590000', 'SMAN 1 SUKADANA LAMPUNG TIMUR', 'KEPALA SMAN 1 SUKADANA LAMPUNG TIMUR', 0),
(193, '1009600000', 'SMAN 1 WAWAY KARYA LAMPUNG TIMUR', 'KEPALA SMAN 1 WAWAY KARYA LAMPUNG TIMUR', 0),
(194, '1009610000', 'SMAN 1 WAY BUNGUR LAMPUNG TIMUR', 'KEPALA SMAN 1 WAY BUNGUR LAMPUNG TIMUR', 0),
(195, '1009620000', 'SMAN 1 WAY JEPARA LAMPUNG TIMUR', 'KEPALA SMAN 1 WAY JEPARA LAMPUNG TIMUR', 0),
(196, '1009630000', 'SMAN 2 SEKAMPUNG  LAMPUNG TIMUR', 'KEPALA SMAN 2 SEKAMPUNG LAMPUNG TIMUR', 0),
(197, '1009640000', 'SMKN 1 BUMI AGUNG LAMPUNG TIMUR', 'KEPALA SMKN 1 BUMI AGUNG LAMPUNG TIMUR', 0),
(198, '1009650000', 'SMKN 1 GUNUNG PELINDUNG LAMPUNG TIMUR', 'KEPALA SMKN 1 GUNUNG PELINDUNG LAMPUNG TIMUR', 0),
(199, '1009660000', 'SMKN 1 MARGA SEKAMPUNG LAMPUNG TIMUR', 'KEPALA SMKN 1 MARGA SEKAMPUNG LAMPUNG TIMUR', 0),
(200, '1009670000', 'SMKN 1 PEKALONGAN LAMPUNG TIMUR', 'KEPALA SMKN 1 PEKALONGAN LAMPUNG TIMUR', 0),
(201, '1009680000', 'SMKN 1 RAMAN UTARA LAMPUNG TIMUR', 'KEPALA SMKN 1 RAMAN UTARA LAMPUNG TIMUR', 0),
(202, '1009690000', 'SMKN 1 SUKADANA LAMPUNG TIMUR', 'KEPALA SMKN 1 SUKADANA LAMPUNG TIMUR', 0),
(203, '1009700000', 'SMKN 1 WAY BUNGUR LAMPUNG TIMUR', 'KEPALA SMKN 1 WAY BUNGUR LAMPUNG TIMUR', 0),
(204, '1009710000', 'SMKN 1 TRIMURJO LAMPUNG TENGAH', 'KEPALA SMKN 1 TRIMURJO LAMPUNG TENGAH', 0),
(205, '1009720000', 'SMKN 1 LABUHAN MARINGGAI LAMPUNG TIMUR', 'KEPALA SMKN 1 LABUHAN MARINGGAI LAMPUNG TIMUR', 0),
(206, '1009750000', 'SMAN 1 WAY SEPUTIH LAMPUNG TENGAH', 'KEPALA SMAN 1 WAY SEPUTIH LAMPUNG TENGAH', 0),
(207, '1009760000', 'SMAN 1 BANDAR MATARAM LAMPUNG TENGAH', 'KEPALA SMAN 1 BANDAR MATARAM LAMPUNG TENGAH', 0),
(208, '1009770000', 'SMK UNGGUL TERPADU  LAMPUNG TENGAH', 'KEPALA SMK UNGGUL TERPADU LAMPUNG TENGAH', 0),
(209, '1009790000', 'SMKN 1 BRAJA SELEBAH LAMPUNG TIMUR', 'KEPALA SMKN 1 BRAJA SELEBAH LAMPUNG TIMUR', 0),
(210, '1009800000', 'SMKN 1 SEKAMPUNG LAMPUNG TIMUR', 'KEPALA SMKN 1 SEKAMPUNG LAMPUNG TIMUR', 0),
(211, '1009810000', 'SLB WIYATA DHARMA METRO', 'KEPALA SLB WIYATA DHARMA METRO', 0),
(212, '1009820000', 'SLB NEGERI LAMPUNG TIMUR', 'KEPALA SLB NEGERI LAMPUNG TIMUR', 0),
(213, '1009830000', 'SLB NEGERI METRO', 'KEPALA SLB NEGERI METRO', 0),
(214, '1009840000', 'SLB NEGERI KOTA GAJAH LAMPUNG TENGAH', 'KEPALA SLB NEGERI KOTA GAJAH', 0),
(216, '1009860000', 'SLB CATUR BINA BANGSA METRO', 'KEPALA SLB CATUR BINA BANGSA METRO', 0),
(217, '1010010000', 'SMAN 1 AIR NANINGAN TANGGAMUS', 'KEPALA SMAN 1 AIR NANINGAN TANGGAMUS', 0),
(218, '1010020000', 'SMAN 1 BULOK TANGGAMUS', 'KEPALA SMAN 1 BULOK TANGGAMUS', 0),
(219, '1010030000', 'SMAN 1 CUKUH BALAK TANGGAMUS', 'KEPALA SMAN 1 CUKUH BALAK TANGGAMUS', 0),
(220, '1010040000', 'SMAN 1 GUNUNG ALIP TANGGAMUS', 'KEPALA SMAN 1 GUNUNG ALIP TANGGAMUS', 0),
(221, '1010050000', 'SMAN 1 KELUMBAYAN TANGGAMUS', 'KEPALA SMAN 1 KELUMBAYAN TANGGAMUS', 0),
(222, '1010060000', 'SMAN 1 KELUMBAYAN BARAT TANGGAMUS', 'KEPALA SMAN 1 KELUMBAYAN BARAT TANGGAMUS', 0),
(223, '1010070000', 'SMAN 1 KOTA AGUNG TANGGAMUS', 'KEPALA SMAN 1 KOTA AGUNG TANGGAMUS', 0),
(224, '1010080000', 'SMAN 2 KOTA AGUNG TANGGAMUS', 'KEPALA SMAN 2 KOTA AGUNG TANGGAMUS', 0),
(225, '1010090000', 'SMAN 1 LIMAU TANGGAMUS', 'KEPALA SMAN 1 LIMAU TANGGAMUS', 0),
(226, '1010100000', 'SMAN 1 PULAU PANGGUNG TANGGAMUS', 'KEPALA SMAN 1 PULAU PANGGUNG TANGGAMUS', 0),
(227, '1010110000', 'SMAN 1 SEMAKA TANGGAMUS', 'KEPALA SMAN 1 SEMAKA TANGGAMUS', 0),
(228, '1010120000', 'SMAN 1 SUMBEREJO TANGGAMUS', 'KEPALA SMAN 1 SUMBEREJO TANGGAMUS', 0),
(229, '1010130000', 'SMAN 1 TALANG PADANG TANGGAMUS', 'KEPALA SMAN 1 TALANG PADANG TANGGAMUS', 0),
(230, '1010140000', 'SMAN 1 ULUBELU TANGGAMUS', 'KEPALA SMAN 1 ULUBELU TANGGAMUS', 0),
(231, '1010150000', 'SMAN 2 ULUBELU TANGGAMUS', 'KEPALA SMAN 2 ULUBELU TANGGAMUS', 0),
(232, '1010160000', 'SMAN 1 WONOSOBO TANGGAMUS', 'KEPALA SMAN 1 WONOSOBO TANGGAMUS', 0),
(233, '1010170000', 'SMKN 1 KOTA AGUNG BARAT TANGGAMUS', 'KEPALA SMKN 1 KOTA AGUNG BARAT TANGGAMUS', 0),
(234, '1010180000', 'SMKN 1 PUGUNG TANGGAMUS', 'KEPALA SMKN 1 PUGUNG TANGGAMUS', 0),
(235, '1010190000', 'SMKN 1 TALANG PADANG KABUPATEN TANGGAMUS', 'KEPALA SMKN 1 TALANG PADANG KABUPATEN TANGGAMUS', 0),
(236, '1010200000', 'SMKN 1 KOTA AGUNG TIMUR TANGGAMUS', 'KEPALA SMKN 1 KOTA AGUNG TIMUR TANGGAMUS', 0),
(237, '1010210000', 'SMAN 1 ADILUWIH PRINGSEWU', 'KEPALA SMAN 1 ADILUWIH PRINGSEWU', 0),
(238, '1010220000', 'SMAN 1 AMBARAWA PRINGSEWU', 'KEPALA SMAN 1 AMBARAWA PRINGSEWU', 0),
(239, '1010230000', 'SMAN 1 BANYUMAS PRINGSEWU', 'KEPALA SMAN 1 BANYUMAS PRINGSEWU', 0),
(240, '1010240000', 'SMAN 1 GADINGREJO PRINGSEWU', 'KEPALA SMAN 1 GADINGREJO PRINGSEWU', 0),
(241, '1010250000', 'SMAN 1 PAGELARAN PRINGSEWU', 'KEPALA SMAN 1 PAGELARAN PRINGSEWU', 0),
(242, '1010260000', 'SMAN 1 PARDASUKA PRINGSEWU', 'KEPALA SMAN 1 PARDASUKA PRINGSEWU', 0),
(243, '1010270000', 'SMAN 1 PRINGSEWU PRINGSEWU', 'KEPALA SMAN 1 PRINGSEWU', 0),
(244, '1010280000', 'SMAN 1 SUKOHARJO PRINGSEWU', 'KEPALA SMAN 1 SUKOHARJO PRINGSEWU', 0),
(245, '1010290000', 'SMAN 2 GADINGREJO PRINGSEWU', 'KEPALA SMAN 2 GADINGREJO PRINGSEWU', 0),
(246, '1010300000', 'SMAN 2 PRINGSEWU PRINGSEWU', 'KEPALA SMAN 2 PRINGSEWU PRINGSEWU', 0),
(247, '1010310000', 'SMKN 1 GADINGREJO PRINGSEWU', 'KEPALA SMKN 1 GADINGREJO PRINGSEWU', 0),
(248, '1010320000', 'SMKN PAGELARAN UTARA PRINGSEWU', 'KEPALA SMKN PAGELARAN UTARA PRINGSEWU', 0),
(249, '1010330000', 'SMKN SUKOHARJO PRINGSEWU', 'KEPALA SMKN SUKOHARJO PRINGSEWU', 0),
(250, '1010340000', 'SMAN 1 BENGKUNAT PESISIR BARAT', 'KEPALA SMAN 1 BENGKUNAT PESISIR BARAT', 0),
(251, '1010350000', 'SMAN 1 BENGKUNAT BELIMBING PESISIR BARAT', 'KEPALA SMAN 1 BENGKUNAT BELIMBING PESISIR BARAT', 0),
(252, '1010360000', 'SMAN 1 KARYA PENGGAWA PESISIR BARAT', 'KEPALA SMAN 1 KARYA PENGGAWA PESISIR BARAT', 0),
(253, '1010370000', 'SMAN 1 LEMONG PESISIR BARAT', 'KEPALA SMAN 1 LEMONG PESISIR BARAT', 0),
(254, '1010380000', 'SMAN 1 NGAMBUR PESISIR BARAT', 'KEPALA SMAN 1 NGAMBUR PESISIR BARAT', 0),
(255, '1010390000', 'SMAN 1 PESISIR SELATAN PESISIR BARAT', 'KEPALA SMAN 1 PESISIR SELATAN PESISIR BARAT', 0),
(256, '1010400000', 'SMAN 1 PESISIR TENGAH PESISIR BARAT', 'KEPALA SMAN 1 PESISIR TENGAH PESISIR BARAT', 0),
(257, '1010410000', 'SMAN 1 PESISIR UTARA PESISIR BARAT', 'KEPALA SMAN 1 PESISIR UTARA PESISIR BARAT', 0),
(258, '1010420000', 'SMKN 1 NGAMBUR PESISIR BARAT', 'KEPALA SMKN 1 NGAMBUR PESISIR BARAT', 0),
(259, '1010440000', 'SMAN 2 BENGKUNAT BELIMBING PESISIR BARAT', 'KEPALA SMAN 2 BENGKUNAT BELIMBING PESISIR BARAT', 0),
(260, '1010450000', 'SMKN 1 KRUI PESISIR BARAT', 'KEPALA SMKN 1 KRUI PESISIR BARAT', 0),
(261, '1010460000', 'SMAN 1 PEMATANG SAWA TANGGAMUS', 'KEPALA SMAN 1 PEMATANG SAWA TANGGAMUS', 0),
(262, '1010470000', 'SMKN 1 CUKUH BALAK TANGGAMUS', 'KEPALA SMKN 1 CUKUH BALAK TANGGAMUS', 0),
(263, '1010480000', 'SLB NEGERI PRINGSEWU', 'KEPALA SLB NEGERI PRINGSEWU', 0),
(264, '1010490000', 'SLB NEGERI TANGGAMUS', 'KEPALA SLB NEGERI TANGGAMUS', 0),
(265, '1010500000', 'SMKN 1 BENGKUNAT BELIMBING PESISIR BARAT', 'KEPALA SMKN 1 BENGKUNAT BELIMBING PESISIR BARAT', 0),
(266, '1011010000', 'SMAN SUNGKAI BARAT LAMPUNG UTARA', 'KEPALA SMAN SUNGKAI BARAT LAMPUNG UTARA', 0),
(267, '1011020000', 'SMAN 1 SUNGKAI JAYA LAMPUNG UTARA', 'KEPALA SMAN 1 SUNGKAI JAYA LAMPUNG UTARA', 0),
(268, '1011030000', 'SMAN 2 ABUNG SEMULI LAMPUNG UTARA', 'KEPALA SMAN 2 ABUNG SEMULI LAMPUNG UTARA', 0),
(269, '1011040000', 'SMAN 1 ABUNG PEKURUN LAMPUNG UTARA', 'KEPALA SMAN 1 ABUNG PEKURUN LAMPUNG UTARA', 0),
(270, '1011050000', 'SMAN 1 ABUNG SELATAN LAMPUNG UTARA', 'KEPALA SMAN 1 ABUNG SELATAN LAMPUNG UTARA', 0),
(271, '1011060000', 'SMAN 1 ABUNG SEMULI LAMPUNG UTARA', 'KEPALA SMAN 1 ABUNG SEMULI LAMPUNG UTARA', 0),
(272, '1011070000', 'SMAN 1 ABUNG TIMUR LAMPUNG UTARA', ' KEPALA SMAN 1 ABUNG TIMUR LAMPUNG UTARA', 0),
(273, '1011080000', 'SMAN 1 ABUNG TINGGI LAMPUNG UTARA', 'KEPALA SMAN 1 ABUNG TINGGI LAMPUNG UTARA', 0),
(274, '1011090000', 'SMAN 1 BUKIT KEMUNING LAMPUNG UTARA', 'KEPALA SMAN 1 BUKIT KEMUNING LAMPUNG UTARA', 0),
(275, '1011100000', 'SMAN 1 KOTABUMI LAMPUNG UTARA', 'KEPALA SMAN 1 KOTABUMI LAMPUNG UTARA', 0),
(276, '1011110000', 'SMAN 2 KOTABUMI LAMPUNG UTARA', 'KEPALA SMAN 2 KOTABUMI LAMPUNG UTARA', 0),
(277, '1011120000', 'SMAN 3 KOTABUMI LAMPUNG UTARA', 'KEPALA SMAN 3 KOTABUMI LAMPUNG UTARA', 0),
(278, '1011130000', 'SMAN 4 KOTABUMI LAMPUNG UTARA', 'KEPALA SMAN 4 KOTABUMI LAMPUNG UTARA', 0),
(279, '1011140000', 'SMAN 1 SUNGKAI SELATAN LAMPUNG UTARA', 'KEPALA SMAN 1 SUNGKAI SELATAN LAMPUNG UTARA', 0),
(280, '1011150000', 'SMAN 1 SUNGKAI UTARA LAMPUNG UTARA', 'KEPALA SMAN 1 SUNGKAI UTARA LAMPUNG UTARA', 0),
(281, '1011160000', 'SMAN 1 TANJUNG RAJA LAMPUNG UTARA', 'KEPALA SMAN 1 TANJUNG RAJA LAMPUNG UTARA', 0),
(282, '1011170000', 'SMAN 1 ABUNG BARAT LAMPUNG UTARA', 'KEPALA SMAN 1 ABUNG BARAT LAMPUNG UTARA', 0),
(283, '1011180000', 'SMKN 1 ABUNG SELATAN LAMPUNG UTARA', 'KEPALA SMKN 1 ABUNG SELATAN LAMPUNG UTARA', 0),
(284, '1011190000', 'SMKN 1 ABUNG SURAKARTA LAMPUNG UTARA', 'KEPALA SMKN 1 ABUNG SURAKARTA LAMPUNG UTARA', 0),
(285, '1011200000', 'SMKN 1 BUKIT KEMUNING LAMPUNG UTARA', 'KEPALA SMKN 1 BUKIT KEMUNING LAMPUNG UTARA', 0),
(286, '1011210000', 'SMKN 1 BUNGA MAYANG LAMPUNG UTARA', 'KEPALA SMKN 1 BUNGA MAYANG LAMPUNG UTARA', 0),
(287, '1011220000', 'SMKN 1 HULU SUNGKAI LAMPUNG UTARA', 'KEPALA SMKN 1 HULU SUNGKAI LAMPUNG UTARA', 0),
(288, '1011230000', 'SMKN 1 KOTABUMI LAMPUNG UTARA', 'KEPALA SMKN 1 KOTABUMI LAMPUNG UTARA', 0),
(289, '1011240000', 'SMKN 2 KOTABUMI LAMPUNG UTARA', 'KEPALA SMKN 2 KOTABUMI LAMPUNG UTARA', 0),
(290, '1011250000', 'SMKN 3 KOTABUMI LAMPUNG UTARA', 'KEPALA SMKN 3 KOTABUMI LAMPUNG UTARA', 0),
(291, '1011260000', 'SMAN 2 TANJUNG RAJA LAMPUNG UTARA', 'KEPALA SMAN 2 TANJUNG RAJA LAMPUNG UTARA', 0),
(292, '1011270000', 'SMAN 1 BANJIT WAY KANAN', 'KEPALA SMAN 1 BANJIT WAY KANAN', 0),
(293, '1011280000', 'SMAN 1 BARADATU WAY KANAN', 'KEPALA SMAN 1 BARADATU WAY KANAN', 0),
(294, '1011290000', 'SMAN 1 BLAMBANGAN UMPU WAY KANAN', 'KEPALA SMAN 1 BLAMBANGAN UMPU WAY KANAN', 0),
(295, '1011300000', 'SMAN 1 BUAY BAHUGA WAY KANAN', 'KEPALA SMAN 1 BUAY BAHUGA WAY KANAN', 0),
(296, '1011310000', 'SMAN 1 BUMI AGUNG WAY KANAN', 'KEPALA SMAN 1 BUMI AGUNG WAY KANAN', 0),
(297, '1011320000', 'SMAN 1 GUNUNG LABUHAN WAY KANAN', 'KEPALA SMAN 1 GUNUNG LABUHAN WAY KANAN', 0),
(298, '1011330000', 'SMAN 1 KASUI WAY KANAN', 'KEPALA SMAN 1 KASUI WAY KANAN', 0),
(299, '1011340000', 'SMAN 1 NEGARA BATIN WAY KANAN', 'KEPALA SMAN 1 NEGARA BATIN WAY KANAN', 0),
(300, '1011350000', 'SMAN 1 NEGERI AGUNG WAY KANAN', 'KEPALA SMAN 1 NEGERI AGUNG WAY KANAN', 0),
(301, '1011360000', 'SMAN 1 NEGERI BESAR WAY KANAN', 'KEPALA SMAN 1 NEGERI BESAR WAY KANAN', 0),
(302, '1011370000', 'SMAN 1 PAKUON RATU WAY KANAN', 'KEPALA SMAN 1 PAKUON RATU WAY KANAN', 0),
(303, '1011380000', 'SMAN 1 REBANG TANGKAS WAY KANAN', 'KEPALA SMAN 1 REBANG TANGKAS WAY KANAN', 0),
(304, '1011390000', 'SMAN 1 WAY TUBA WAY KANAN', 'KEPALA SMAN 1 WAY TUBA WAY KANAN', 0),
(305, '1011400000', 'SMAN 2 BLAMBANGAN UMPU WAY KANAN', 'KEPALA SMAN 2 BLAMBANGAN UMPU WAY KANAN', 0),
(306, '1011410000', 'SMAN 2 BUAY BAHUGA WAY KANAN', 'KEPALA SMAN 2 BUAY BAHUGA WAY KANAN', 0),
(308, '1011430000', 'SMAN 2 GUNUNG LABUHAN WAY KANAN', 'KEPALA SMAN 2 GUNUNG LABUHAN WAY KANAN', 0),
(309, '1011440000', 'SMAN 2 KASUI WAY KANAN', 'KEPALA SMAN 2 KASUI WAY KANAN', 0),
(310, '1011450000', 'SMAN 2 NEGARA BATIN WAY KANAN', 'KEPALA SMAN 2 NEGARA BATIN WAY KANAN', 0),
(311, '1011460000', 'SMAN 2 NEGERI AGUNG WAY KANAN', 'KEPALA SMAN 2 NEGERI AGUNG WAY KANAN', 0),
(312, '1011470000', 'SMAN 2 NEGERI BESAR WAY KANAN', 'KEPALA SMAN 2 NEGERI BESAR WAY KANAN', 0),
(313, '1011480000', 'SMKN 1 BAHUGA WAY KANAN', 'KEPALA SMKN 1 BAHUGA WAY KANAN', 0),
(314, '1011490000', 'SMKN 1 BANJIT WAY KANAN', 'KEPALA SMKN 1 BANJIT WAY KANAN', 0),
(315, '1011500000', 'SMKN 1 BARADATU WAY KANAN', 'KEPALA SMKN 1 BARADATU WAY KANAN', 0),
(316, '1011510000', 'SMKN 1 BLAMBANGAN UMPU WAY KANAN', 'KEPALA SMKN 1 BLAMBANGAN UMPU WAY KANAN', 0),
(317, '1011520000', 'SMKN 1 BUAY BAHUGA WAY KANAN', 'KEPALA SMKN 1 BUAY BAHUGA WAY KANAN', 0),
(318, '1011530000', 'SMKN 1 BUMI AGUNG WAY KANAN', 'KEPALA SMKN 1 BUMI AGUNG WAY KANAN', 0),
(319, '1011540000', 'SMKN 1 GUNUNG LABUHAN WAY KANAN', 'KEPALA SMKN 1 GUNUNG LABUHAN WAY KANAN', 0),
(320, '1011550000', 'SMKN 1 NEGARA BATIN WAY KANAN', 'KEPALA SMKN 1 NEGARA BATIN WAY KANAN', 0),
(321, '1011560000', 'SMKN 1 NEGERI AGUNG WAY KANAN', 'KEPALA SMKN 1 NEGERI AGUNG WAY KANAN', 0),
(322, '1011570000', 'SMKN 1 NEGERI BESAR WAY KANAN', 'KEPALA SMKN 1 NEGERI BESAR WAY KANAN', 0),
(323, '1011580000', 'SMKN 1 PAKUAN RATU WAY KANAN', 'KEPALA SMKN 1 PAKUAN RATU WAY KANAN', 0),
(324, '1011590000', 'SMKN 2 BANJIT WAY KANAN', 'KEPALA SMKN 2 BANJIT WAY KANAN', 0),
(325, '1011600000', 'SMAN 1 AIR HITAM LAMPUNG BARAT', 'KEPALA SMAN 1 AIR HITAM LAMPUNG BARAT', 0),
(326, '1011610000', 'SMAN 1 BATU BRAK LAMPUNG BARAT', 'KEPALA SMAN 1 BATU BRAK LAMPUNG BARAT', 0),
(327, '1011620000', 'SMAN 1 BELALAU LAMPUNG BARAT', 'KEPALA SMAN 1 BELALAU LAMPUNG BARAT', 0),
(328, '1011630000', 'SMAN 1 KEBUN TEBU LAMPUNG BARAT', 'KEPALA SMAN 1 KEBUN TEBU LAMPUNG BARAT', 0),
(329, '1011640000', 'SMAN 1 LIWA LAMPUNG BARAT', 'KEPALA SMAN 1 LIWA LAMPUNG BARAT', 0),
(330, '1011650000', 'SMAN 1 PAGAR DEWA LAMPUNG BARAT', 'KEPALA SMAN 1 PAGAR DEWA LAMPUNG BARAT', 0),
(331, '1011660000', 'SMAN 1 SEKINCAU LAMPUNG BARAT', 'KEPALA SMAN 1 SEKINCAU LAMPUNG BARAT', 0),
(332, '1011670000', 'SMAN 1 SUMBERJAYA LAMPUNG BARAT', 'KEPALA SMAN 1 SUMBERJAYA LAMPUNG BARAT', 0),
(333, '1011680000', 'SMAN 1 WAY TENONG LAMPUNG BARAT', 'KEPALA SMAN 1 WAY TENONG LAMPUNG BARAT', 0),
(334, '1011690000', 'SMAN 2 WAY TENONG LAMPUNG BARAT', 'KEPALA SMAN 2 WAY TENONG LAMPUNG BARAT', 0),
(335, '1011700000', 'SMAN 2 LIWA LAMPUNG BARAT', 'KEPALA SMAN 2 LIWA LAMPUNG BARAT', 0),
(336, '1011710000', 'SMAN 1 SUKAU LAMPUNG BARAT', 'KEPALA SMAN 1 SUKAU LAMPUNG BARAT', 0),
(337, '1011720000', 'SMKN 1 LIWA LAMPUNG BARAT', 'KEPALA SMKN 1 LIWA LAMPUNG BARAT', 0),
(338, '1011730000', 'SMKN 1 SUOH LAMPUNG BARAT', 'KEPALA SMKN 1 SUOH LAMPUNG BARAT', 0),
(339, '1011740000', 'SMKN 1 WAY TENONG LAMPUNG BARAT', 'KEPALA SMKN 1 WAY TENONG LAMPUNG BARAT', 0),
(340, '1011760000', 'SMKN 1 KEBUN TEBU LAMPUNG BARAT', 'KEPALA SMKN 1 KEBUN TEBU LAMPUNG BARAT', 0),
(341, '1011770000', 'SMAN 1 ABUNG TENGAH LAMPUNG UTARA', 'KEPALA SMAN 1 ABUNG TENGAH LAMPUNG BARAT', 0),
(342, '1011780000', 'SMAN 1 BANDAR NEGERI SUOH LAMPUNG BARAT', 'KEPALA SMAN 1 BANDAR NEGERI SUOH LAMPUNG BARAT', 0),
(343, '1011790000', 'SMAN 1 ABUNG KUNANG LAMPUNG UTARA', 'KEPALA SMAN 1 ABUNG KUNANG LAMPUNG BARAT', 0),
(344, '1011800000', 'SMAN 2 BANJIT WAY KANAN', 'KEPALA SMAN 2 BANJIT WAY KANAN', 0),
(345, '1011810000', 'SMAN BHAKTI MULYA LAMPUNG UTARA', 'KEPALA SMAN BHAKTI MULYA LAMPUNG UTARA', 0),
(346, '1011820000', 'SMKN 1 BATU KETULIS LAMPUNG BARAT', 'KEPALA SMKN 1 BATU KETULIS LAMPUNG BARAT', 0),
(347, '1011830000', 'SLB NEGERI SUKAMAJU LAMPUNG UTARA', 'KEPALA SLB NEGERI SUKAMAJU LAMPUNG UTARA', 0),
(348, '1011840000', 'SMAN 1 LUMBOK SEMINUNG LAMPUNG BARAT', 'KEPALA SMAN 1 LUMBOK SEMINUNG LAMPUNG BARAT', 0),
(349, '1011850000', 'SMAN 1 MUARA SUNGKAI LAMPUNG UTARA', 'KEPALA SMAN 1 MUARA SUNGKAI LAMPUNG UTARA', 0),
(350, '1011860000', 'SLB NEGERI BARADATU WAY KANAN', 'KEPALA SLB NEGERI BARADATU WAY KANAN', 0),
(351, '1011870000', 'SMAN 1 GEDUNG HARAPAN WAY KANAN', 'SMAN 1 GEDUNG HARAPAN WAY KANAN', 0),
(352, '1012010000', 'SMAN 1 BANJAR AGUNG TULANG BAWANG', 'KEPALA SMAN 1 BANJAR AGUNG TULANG BAWANG', 0),
(353, '1012020000', 'SMAN 1 BANJAR MARGO TULANG BAWANG', 'KEPALA SMAN 1 BANJAR MARGO TULANG BAWANG', 0),
(354, '1012030000', 'SMAN 1 DENTE TELADAS TULANG BAWANG', 'KEPALA SMAN 1 DENTE TELADAS TULANG BAWANG', 0),
(355, '1012040000', 'SMAN 1 GEDUNG AJI TULANG BAWANG', 'KEPALA SMAN 1 GEDUNG AJI TULANG BAWANG', 0),
(356, '1012050000', 'SMAN 1 GEDUNG AJI BARU TULANG BAWANG', 'KEPALA SMAN 1 GEDUNG AJI BARU TULANG BAWANG', 0),
(357, '1012060000', 'SMAN 1 GEDUNG MENENG TULANG BAWANG', 'KEPALA SMAN 1 GEDUNG MENENG TULANG BAWANG', 0),
(358, '1012070000', 'SMAN 1 MENGGALA TULANG BAWANG', 'KEPALA SMAN 1 MENGGALA TULANG BAWANG', 0),
(359, '1012080000', 'SMAN 2 MENGGALA TULANG BAWANG', 'KEPALA SMAN 2 MENGGALA TULANG BAWANG', 0),
(360, '1012090000', 'SMAN 3 MENGGALA TULANG BAWANG', 'KEPALA SMAN 3 MENGGALA TULANG BAWANG', 0),
(361, '1012100000', 'SMAN 1 MERAKSA AJI TULANG BAWANG', 'KEPALA SMAN 1 MERAKSA AJI TULANG BAWANG', 0),
(362, '1012110000', 'SMAN 1 PENAWAR AJI TULANG BAWANG', 'KEPALA SMAN 1 PENAWAR AJI TULANG BAWANG', 0),
(363, '1012120000', 'SMAN 1 PENAWARTAMA TULANG BAWANG', 'KEPALA SMAN 1 PENAWARTAMA TULANG BAWANG', 0),
(364, '1012130000', 'SMAN 1 RAWAJITU SELATAN TULANG BAWANG', 'KEPALA SMAN 1 RAWAJITU SELATAN TULANG BAWANG', 0),
(365, '1012140000', 'SMKN 1 DENTE TELADAS TULANG BAWANG', 'KEPALA SMKN 1 DENTE TELADAS TULANG BAWANG', 0),
(366, '1012150000', 'SMKN 1 GEDUNG AJI TULANG BAWANG', 'KEPALA SMKN 1 GEDUNG AJI TULANG BAWANG', 0),
(367, '1012160000', 'SMKN 1 MENGGALA TULANG BAWANG', 'KEPALA SMKN 1 MENGGALA TULANG BAWANG', 0),
(368, '1012170000', 'SMKN 1 RAWA PITU TULANG BAWANG', 'KEPALA SMKN 1 RAWA PITU TULANG BAWANG', 0),
(369, '1012180000', 'SMKN 1 RAWAJITU SELATAN TULANG BAWANG', 'KEPALA SMKN 1 RAWAJITU SELATAN TULANG BAWANG', 0),
(370, '1012190000', 'SMKN 1 RAWAJITU TIMUR TULANG BAWANG', 'KEPALA SMKN 1 RAWAJITU TIMUR TULANG BAWANG', 0),
(371, '1012210000', 'SMAN 1 GUNUNG AGUNG TULANG BAWANG BARAT', 'KEPALA SMAN 1 GUNUNG AGUNG TULANG BAWANG BARAT', 0),
(372, '1012220000', 'SMAN 1 GUNUNG TERANG TULANG BAWANG BARAT', 'KEPALA SMAN 1 GUNUNG TERANG TULANG BAWANG BARAT', 0),
(373, '1012230000', 'SMAN 1 LAMBU KIBANG TULANG BAWANG BARAT', 'KEPALA SMAN 1 LAMBU KIBANG TULANG BAWANG BARAT', 0),
(374, '1012240000', 'SMAN 1 PAGAR DEWA TULANG BAWANG BARAT', 'KEPALA SMAN 1 PAGAR DEWA TULANG BAWANG BARAT', 0),
(375, '1012250000', 'SMAN 1 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 'KEPALA SMAN 1 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 0),
(376, '1012260000', 'SMAN 2 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 'KEPALA SMAN 2 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 0),
(377, '1012270000', 'SMAN 3 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 'KEPALA SMAN 3 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 0),
(378, '1012280000', 'SMAN 1 TULANG BAWANG UDIK TULANG BAWANG BARAT', 'KEPALA SMAN 1 TULANG BAWANG UDIK TULANG BAWANG BARAT', 0),
(379, '1012290000', 'SMAN 2 TULANG BAWANG UDIK TULANG BAWANG BARAT', 'KEPALA SMAN 2 TULANG BAWANG UDIK TULANG BAWANG BARAT', 0),
(380, '1012300000', 'SMAN 1 TUMIJAJAR TULANG BAWANG BARAT', 'KEPALA SMAN 1 TUMIJAJAR TULANG BAWANG BARAT', 0),
(381, '1012310000', 'SMAN 2 TUMIJAJAR TULANG BAWANG BARAT', 'KEPALA SMAN 2 TUMIJAJAR TULANG BAWANG BARAT', 0),
(382, '1012320000', 'SMAN 1 WAY KENANGA TULANG BAWANG BARAT', 'KEPALA SMAN 1 WAY KENANGA TULANG BAWANG BARAT', 0),
(383, '1012330000', 'SMKN 1 GUNUNG AGUNG TULANG BAWANG BARAT', 'KEPALA SMKN 1 GUNUNG AGUNG TULANG BAWANG BARAT', 0),
(384, '1012340000', 'SMKN 1 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 'KEPALA SMKN 1 TULANG BAWANG TENGAH TULANG BAWANG BARAT', 0),
(385, '1012350000', 'SMAN 1 MESUJI LAMPUNG MESUJI', 'KEPALA SMAN 1 MESUJI LAMPUNG MESUJI', 0),
(386, '1012360000', 'SMAN 1 MESUJI TIMUR MESUJI', 'KEPALA SMAN 1 MESUJI TIMUR', 0),
(387, '1012370000', 'SMAN 1 PANCA JAYA MESUJI', 'KEPALA SMAN 1 PANCA JAYA MESUJI', 0),
(388, '1012380000', 'SMAN 1 SIMPANG PEMATANG MESUJI', 'KEPALA SMAN 1 SIMPANG PEMATANG MESUJI', 0),
(389, '1012390000', 'SMAN 1 TANJUNG RAYA MESUJI', 'KEPALA SMAN 1 TANJUNG RAYA MESUJI', 0),
(390, '1012400000', 'SMAN 1 WAY SERDANG MESUJI', 'KEPALA SMAN 1 WAY SERDANG MESUJI', 0),
(391, '1012410000', 'SMAN 2 WAY SERDANG MESUJI', 'KEPALA SMAN 2 WAY SERDANG MESUJI', 0),
(392, '1012420000', 'SMKN 1 PANCA JAYA MESUJI', 'KEPALA SMKN 1 PANCA JAYA MESUJI', 0),
(393, '1012430000', 'SMKN 1 RAWA JITU UTARA MESUJI', 'KEPALA SMKN 1 RAWA JITU UTARA MESUJI', 0),
(394, '1012440000', 'SMKN 1 SIMPANG PEMATANG MESUJI', 'KEPALA SMKN 1 SIMPANG PEMATANG MESUJI', 0),
(395, '1012450000', 'SMKN 1 TANJUNG RAYA MESUJI', 'KEPALA SMKN 1 TANJUNG RAYA MESUJI', 0),
(396, '1012460000', 'SMKN 2 TANJUNG RAYA MESUJI', 'KEPALA SMKN 2 TANJUNG RAYA MESUJI', 0),
(397, '1012470000', 'SMAN 1 BANJAR BARU TULANG BAWANG', 'KEPALA SMAN 1 BANJAR BARU TULANG BAWANG', 0),
(398, '1012480000', 'SMKN 1 BANJAR MARGO TULANG BAWANG', 'KEPALA SMKN 1 BANJAR MARGO TULANG BAWANG', 0),
(400, '1012500000', 'SMKN 1 PENAWARTAMA  TULANG BAWANG', 'KEPALA SMKN 1 PENAWARTAMA TULANG BAWANG', 0),
(401, '1012520000', 'SMAN 2 SIMPANG PEMATANG MESUJI', 'KEPALA SMAN 2 SIMPANG PEMATANG MESUJI', 0),
(402, '1012530000', 'SMA PGRI TUMIJAJAR TULANG BAWANG BARAT', 'KEPALA SMA PGRI TUMIJAJAR TULANG BAWANG BARAT', 0),
(403, '1012540000', 'SMKN 1 WAY SERDANG MESUJI', 'KEPALA SMKN 1 WAY SERDANG MESUJI', 0),
(404, '1012550000', 'SMKN 1 MESUJI TIMUR MESUJI', 'KEPALA SMKN 1 MESUJI TIMUR MESUJI', 0),
(405, '1012560000', 'SMAN 2 DENTE TELADAS TULANG BAWANG', 'KEPALA SMAN 2 DENTE TELADAS TULANG BAWANG', 0),
(406, '1012580000', 'SMAN 3 TUMIJAJAR TULANG BAWANG BARAT', 'KEPALA SMAN 3 TUMIJAJAR TULANG BAWANG BARAT', 0),
(407, '1012590000', 'SMAN 1 BATU PUTIH TULANG BAWANG BARAT', 'KEPALA SMAN 1 BATU PUTIH TULANG BAWANG BARAT', 0),
(408, '1012600000', 'SMAN 1 RAWAJITU UTARA MESUJI', 'KEPALA SMAN 1 RAWAJITU UTARA MESUJI', 0),
(409, '1012610000', 'SMAN 1 RAWA PITU TULANG BAWANG', 'KEPALA SMAN 1 RAWA PITU TULANG BAWANG', 0),
(410, '1012620000', 'SLB NEGERI TULANG BAWANG', 'KEPALA SLB NEGERI TULANG BAWANG', 0),
(411, '1012630000', 'SLB NEGERI MESUJI', 'KEPALA SLB NEGERI MESUJI', 0),
(412, '1012640000', 'SLB NEGERI TULANG BAWANG BARAT', 'KEPALA SLB NEGERI TULANG BAWANG BARAT', 0),
(413, '1012650000', 'SMKN 1 WAY KENANGA TULANG BAWANG BARAT', 'KEPALA SMKN 1 WAY KENANGA', 0),
(414, '1012660000', 'SMKN 1 BANJAR AGUNG TULANG BAWANG', 'KEPALA SMKN 1 BANJAR AGUNG TULANG BAWANG', 0),
(415, '1013010000', 'SEKRETARIAT KOMISI PEMILIHAN UMUM (KPU)', 'SEKRETARIS KOMISI PEMILIHAN UMUM (KPU)', 0),
(416, '1014010000', 'SEKRETARIAT BADAN NARKOTIKA NASIONAL', 'SEKRETARIS BADAN NARKOTIKA NASIONAL', 0),
(417, '1008810000', 'SMKN 1 WAY PANJI LAMPUNG SELATAN', 'KEPALA SMKN 1 WAY PANJI LAMPUNG SELATAN', 0),
(418, '1011880000', 'SMAN 2 REBANG TANGKAS WAY KANAN', 'KEPALA SMAN 2 REBANG TANGKAS WAY KANAN', 0),
(419, '1008820000', 'SMKN PERTANIAN PEMBANGUNAN LAMPUNG', 'KEPALA SMKN PERTANIAN PEMBANGUNAN LAMPUNG', 0),
(420, '1011890000', 'SMAN 1 BATU KETULIS LAMPUNG BARAT', 'KEPALA SMAN 1 BATU KETULIS LAMPUNG BARAT', 0),
(421, '1011900000', 'SMAN 1 HULU SUNGKAI LAMPUNG UTARA', 'KEPALA SMAN 1 HULU SUNGKAI LAMPUNG UTARA', 0),
(422, '1007050000', 'RUMAH SAKIT UMUM DAERAH BANDAR NEGARA HUSADA', 'DIREKTUR RUMAH SAKIT UMUM DAERAH BANDAR NEGARA HUSADA', 1),
(423, '1011910000', 'SMAN 1 BUNGA MAYANG LAMPUNG UTARA', 'KEPALA SMAN 1 BUNGA MAYANG LAMPUNG UTARA', 0),
(424, '1011920000', 'SMAN 3 BLAMBANGAN UMPU WAY KANAN', 'KEPALA SMAN 3 BLAMBANGAN UMPU WAY KANAN', 0),
(425, '1012670000', 'SMAN 4 TUMIJAJAR TULANG BAWANG BARAT', 'KEPALA SMAN 4 TUMIJAJAR TULANG BAWANG BARAT', 0),
(426, '1009870000', 'SMKN 1 PURBOLINGGO LAMPUNG TIMUR', 'KEPALA SMKN 1 PURBOLINGGO LAMPUNG TIMUR', 0),
(430, '1010520000', 'SMKN 1 AIR NANINGAN TANGGAMUS', 'KEPALA SEKOLAH SMKN 1 AIR NANINGAN TANGGAMUS', 0),
(432, '1011930000', 'SMKN 1 PAGAR DEWA KABUPATEN LAMPUNG BARAT', 'KEPALA SMKN 1 PAGAR DEWA KABUPATEN  LAMPUNG BARAT', 0),
(433, '1010530000', 'SLB NEGERI PESISIR BARAT', 'KEPALA SLB NEGERI PESISIR BARAT', 0),
(434, '1008830000', 'SMAN PULAU LEGUNDI PESAWARAN', 'KEPALA SMAN PULAU LEGUNDI PESAWARAN', 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_urusan`
--

CREATE TABLE `master_urusan` (
  `id_urusan` int NOT NULL,
  `kode_rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_urusan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_unker` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `master_urusan`
--

INSERT INTO `master_urusan` (`id_urusan`, `kode_rekening`, `nama_urusan`, `is_active`, `created_by`, `created_at`, `updated_by`, `updated_at`, `id_unker`) VALUES
(1, '1', 'URUSAN PEMERINTAHAN WAJIB YANG BERKAITAN DENGAN PELAYANAN DASAR', 1, NULL, NULL, NULL, NULL, NULL),
(2, '2', 'URUSAN PEMERINTAHAN WAJIB YANG TIDAK BERKAITAN DENGAN PELAYANAN DASAR', 1, NULL, NULL, NULL, NULL, NULL),
(3, '3', 'URUSAN PEMERINTAHAN PILIHAN', 1, NULL, NULL, NULL, NULL, NULL),
(4, '4', 'UNSUR PENDUKUNG URUSAN PEMERINTAHAN', 1, NULL, NULL, NULL, NULL, NULL),
(5, '5', 'UNSUR PENUNJANG URUSAN PEMERINTAHAN', 1, NULL, NULL, NULL, NULL, NULL),
(6, '6', 'UNSUR PENGAWASAN URUSAN PEMERINTAHAN', 1, NULL, NULL, NULL, NULL, NULL),
(7, '8', 'UNSUR PEMERINTAHAN UMUM', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id_message` bigint UNSIGNED NOT NULL,
  `id_ticket` bigint UNSIGNED DEFAULT NULL,
  `sender_id` bigint UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(14, '2022_08_10_042326_create_settings_table', 1),
(25, '2014_10_12_000000_create_users_table', 2),
(26, '2014_10_12_100000_create_password_resets_table', 2),
(27, '2019_08_19_000000_create_failed_jobs_table', 2),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(29, '2022_08_10_051452_create_settings_table', 2),
(30, '2022_08_11_044257_create_permission_tables', 3),
(31, '2022_08_11_124502_create_activity_log_table', 4),
(32, '2022_08_11_124503_add_event_column_to_activity_log_table', 4),
(33, '2022_08_11_124504_add_batch_uuid_column_to_activity_log_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(389, 'users read', 'web', '2024-02-01 04:34:21', '2024-02-01 04:34:21'),
(390, 'users create', 'web', '2024-02-01 04:34:21', '2024-02-01 04:34:21'),
(391, 'users update', 'web', '2024-02-01 04:34:21', '2024-02-01 04:34:21'),
(392, 'users delete', 'web', '2024-02-01 04:34:21', '2024-02-01 04:34:21'),
(393, 'users validation', 'web', '2024-02-01 04:34:21', '2024-02-01 04:34:21'),
(394, 'users privilege', 'web', '2024-02-01 04:34:21', '2024-02-01 04:34:21'),
(395, 'activity', 'web', '2024-02-01 04:34:27', '2024-02-01 04:34:27'),
(396, 'setting app', 'web', '2024-02-01 04:34:31', '2024-02-01 04:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2022-08-11 04:48:47', '2022-08-11 04:48:47'),
(2, 'admin', 'web', '2022-08-11 04:49:48', '2023-05-02 03:39:28'),
(3, 'validator', 'web', '2024-03-12 09:24:19', '2024-05-23 05:39:34'),
(4, 'unit kerja', 'web', '2024-03-16 07:18:51', '2024-07-27 02:35:21');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(389, 1),
(390, 1),
(391, 1),
(392, 1),
(393, 1),
(394, 1),
(395, 1),
(396, 1),
(389, 2),
(390, 2),
(391, 2),
(392, 2),
(393, 2),
(394, 2),
(395, 2),
(396, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `setting_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_var` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_val` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `setting_description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_type` enum('text','file','textarea') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_var`, `setting_val`, `setting_description`, `setting_type`, `created_at`, `updated_at`) VALUES
(1, 'Nama Aplikasi', 'app_name', 'eMonev', 'Silahkan isi nama aplikasi anda dengan benar.', 'text', '2022-08-11 08:18:22', '2024-07-05 07:25:18'),
(2, 'Logo Aplikasi', 'app_logo', 'settings/v7PDtYHqNTvUbRx0sq0Kkf0UdfWxDXC3ba3Y5nCZ.png', 'Silahkan upload logo aplikasi anda dengan benar.', 'file', '2022-08-11 08:18:22', '2024-10-08 03:51:35'),
(3, 'Author Aplikasi', 'app_author', 'TIM IT Bappeda', 'Silahkan isi Author aplikasi anda dengan benar.', 'text', '2022-08-11 08:18:22', '2024-02-28 01:20:42'),
(4, 'Versi Aplikasi', 'app_version', '1.0', 'Silahkan isi versi aplikasi anda dengan benar.', 'text', '2022-08-11 08:18:22', '2022-08-22 23:37:01'),
(5, 'Favicon Aplikasi', 'app_favicon', 'settings/UbLkcNMlQ5jCEtNjQZpy09ba3ZCCfVOb7R5F5l07.ico', 'Silahkan isi favicon aplikasi anda dengan benar.', 'file', '2022-08-11 08:18:22', '2024-10-08 03:51:35'),
(6, 'Deskripsi Aplikasi', 'app_description', 'Sistem Informasi Monitoring dan Evaluasi Pemerintahan Daerah Provinsi Lampung', 'Silahkan isi deskripsi aplikasi anda dengan benar.', 'text', '2022-08-11 08:18:22', '2024-10-08 06:03:42'),
(7, 'Keyword Aplikasi', 'app_keyword', 'monitoring, evaluasi', 'Silahkan isi keyword aplikasi anda dengan benar.', 'text', '2022-08-11 08:18:22', '2024-07-05 07:23:53'),
(8, 'Institusi Aplikasi', 'app_institution', 'Bappeda Provinsi Lampung', 'Silahkan isi institusi aplikasi', 'text', '2022-08-11 08:18:22', '2024-07-05 07:23:53'),
(9, 'Alamat', 'app_address', 'Bandar Lampung', 'Silahkan isi alamat', 'text', '2022-08-11 08:18:22', '2024-07-05 07:23:53'),
(11, 'Background Login', 'app_bg_login', 'settings/2pU8nYglNCMY2hPAFkwcEdlvZblAikPJaxQXq2NS.jpg', 'Silahkan pilih background untuk login', 'file', '2022-08-11 08:18:22', '2024-10-08 03:51:35'),
(12, 'Email', 'app_email', 'bappeda@lampungprov.go.id', 'Silahkan isi email resmi', 'text', '2022-08-11 08:18:22', '2024-05-23 03:54:14'),
(13, 'Telepon', 'app_telp', '0802834', 'Silahkan isi telepon yang dapat dihubungi', 'text', '2022-08-11 08:18:22', '2024-07-05 07:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `status` enum('open','in_progress','closed') DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_assignments`
--

CREATE TABLE `ticket_assignments` (
  `id_assignment` bigint UNSIGNED NOT NULL,
  `id_ticket` bigint UNSIGNED DEFAULT NULL,
  `agent_id` bigint UNSIGNED DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_iku`
--

CREATE TABLE `tr_iku` (
  `id_iku` int NOT NULL,
  `id_misi` int DEFAULT NULL,
  `nama_iku` varchar(255) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_iku_detail`
--

CREATE TABLE `tr_iku_detail` (
  `id` int NOT NULL,
  `id_iku_target_realisasi` int DEFAULT NULL,
  `periode` enum('bulan','triwulan','tahun') DEFAULT 'tahun',
  `bulan_or_triwulan` varchar(10) DEFAULT NULL,
  `realisasi_periode` varchar(200) DEFAULT NULL,
  `capaian_periode` varchar(200) DEFAULT NULL,
  `keterangan` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_iku_opd`
--

CREATE TABLE `tr_iku_opd` (
  `id_iku_opd` int NOT NULL,
  `id_iku_rpjmd` int DEFAULT NULL,
  `id_perangkat_daerah` int DEFAULT NULL,
  `nama_iku_opd` varchar(255) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `target_opd` varchar(200) DEFAULT NULL,
  `realisasi_opd` varchar(200) DEFAULT NULL,
  `capaian_opd` varchar(200) DEFAULT NULL,
  `keterangan` text,
  `id_program` int DEFAULT NULL,
  `id_kegiatan` int DEFAULT NULL,
  `id_sub_kegiatan` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_iku_rpjmd`
--

CREATE TABLE `tr_iku_rpjmd` (
  `id_iku_rpjmd` int NOT NULL,
  `id_misi` int DEFAULT NULL,
  `nama_iku_rpjmd` varchar(255) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `target` varchar(200) DEFAULT NULL,
  `realisasi` varchar(200) DEFAULT NULL,
  `capaian` varchar(200) DEFAULT NULL,
  `keterangan` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_iku_target_realisasi`
--

CREATE TABLE `tr_iku_target_realisasi` (
  `id` int NOT NULL,
  `id_iku` int DEFAULT NULL,
  `tahun` year DEFAULT NULL,
  `target` decimal(10,2) DEFAULT NULL,
  `realisasi` decimal(10,2) DEFAULT NULL,
  `capaian` decimal(5,2) DEFAULT NULL,
  `keterangan` text,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_indikator`
--

CREATE TABLE `tr_indikator` (
  `id_indikator` int NOT NULL,
  `id_program` int DEFAULT NULL,
  `id_kegiatan` int DEFAULT NULL,
  `id_sub_kegiatan` int DEFAULT NULL,
  `jenis_indikator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_unker` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_rencana_kerja_pd`
--

CREATE TABLE `tr_rencana_kerja_pd` (
  `id_rencana_kerja` bigint UNSIGNED NOT NULL,
  `id_unker` int DEFAULT NULL,
  `id_urusan` int DEFAULT NULL,
  `id_sub_urusan` int DEFAULT NULL,
  `id_program` int DEFAULT NULL,
  `id_kegiatan` int DEFAULT NULL,
  `id_sub_kegiatan` int DEFAULT NULL,
  `id_indikator` int DEFAULT NULL,
  `target_akhir_rpjmd` int DEFAULT NULL,
  `realisasi_thn_1` varchar(200) DEFAULT NULL,
  `prakiraan_thn_1` varchar(200) DEFAULT NULL,
  `target_thn_n` int DEFAULT NULL,
  `pagu_indikatif_thn_berjalan` varchar(200) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `sumber_dana` varchar(255) DEFAULT NULL,
  `prioritas_nasional` tinyint(1) DEFAULT NULL,
  `prioritas_daerah` tinyint(1) DEFAULT NULL,
  `kelompok_sasaran` varchar(255) DEFAULT NULL,
  `pagu_indikatif_thn_n` varchar(200) DEFAULT NULL,
  `perangkat_penanggung_jawab` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `unker_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `is_active`, `remember_token`, `unker_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'Avril Lavigne', 'avril@gmail.com', NULL, '$2y$10$wG8pqlTJ5/qJGNCm8Ahx/.qs6xV29NPCfl0NUcu/.3CaAFS7frtEO', 'users/355E1lzftbUPLgzn6yjEJMPyVYpYwejxoSCKDdfT.jpg', 1, 'Jo2jCcB1dw83hD7fKPwiIqWiuLTDJLukLpjtP4QN94yOaZy9BpFeSK24owZc', 0, '2022-08-10 21:40:00', '2024-10-08 06:03:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD PRIMARY KEY (`id_session`),
  ADD UNIQUE KEY `id_session` (`id_session`),
  ADD KEY `id_ticket` (`id_ticket`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD UNIQUE KEY `id_feedback` (`id_feedback`),
  ADD UNIQUE KEY `id_user` (`id_user`,`period_start`,`period_end`);

--
-- Indexes for table `master_kegiatan`
--
ALTER TABLE `master_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`),
  ADD UNIQUE KEY `kode_rekening` (`kode_rekening`),
  ADD KEY `id_program` (`id_program`),
  ADD KEY `fk_kegiatan_unker` (`id_unker`);

--
-- Indexes for table `master_kegiatan_detail`
--
ALTER TABLE `master_kegiatan_detail`
  ADD PRIMARY KEY (`id_kegiatan_detail`),
  ADD KEY `id_unker` (`id_unker`);

--
-- Indexes for table `master_misi_pemda`
--
ALTER TABLE `master_misi_pemda`
  ADD PRIMARY KEY (`id_misi`);

--
-- Indexes for table `master_program`
--
ALTER TABLE `master_program`
  ADD PRIMARY KEY (`id_program`),
  ADD UNIQUE KEY `kode_rekening` (`kode_rekening`),
  ADD KEY `id_sub_urusan` (`id_sub_urusan`),
  ADD KEY `fk_program_unker` (`id_unker`);

--
-- Indexes for table `master_program_detail`
--
ALTER TABLE `master_program_detail`
  ADD PRIMARY KEY (`id_program_detail`),
  ADD KEY `id_unker` (`id_unker`);

--
-- Indexes for table `master_sub_kegiatan`
--
ALTER TABLE `master_sub_kegiatan`
  ADD PRIMARY KEY (`id_sub_kegiatan`),
  ADD UNIQUE KEY `kode_rekening` (`kode_rekening`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `fk_sub_kegiatan_unker` (`id_unker`);

--
-- Indexes for table `master_sub_kegiatan_detail`
--
ALTER TABLE `master_sub_kegiatan_detail`
  ADD PRIMARY KEY (`id_sub_kegiatan_detail`),
  ADD KEY `id_unker` (`id_unker`);

--
-- Indexes for table `master_sub_urusan`
--
ALTER TABLE `master_sub_urusan`
  ADD PRIMARY KEY (`id_sub_urusan`),
  ADD UNIQUE KEY `kode_rekening` (`kode_rekening`),
  ADD KEY `id_urusan` (`id_urusan`),
  ADD KEY `fk_sub_urusan_unker` (`id_unker`);

--
-- Indexes for table `master_unker`
--
ALTER TABLE `master_unker`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `master_urusan`
--
ALTER TABLE `master_urusan`
  ADD PRIMARY KEY (`id_urusan`),
  ADD UNIQUE KEY `kode_rekening` (`kode_rekening`),
  ADD KEY `fk_urusan_unker` (`id_unker`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD UNIQUE KEY `id_message` (`id_message`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_setting_var_unique` (`setting_var`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD UNIQUE KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ticket_assignments`
--
ALTER TABLE `ticket_assignments`
  ADD PRIMARY KEY (`id_assignment`),
  ADD UNIQUE KEY `id_assignment` (`id_assignment`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `tr_iku`
--
ALTER TABLE `tr_iku`
  ADD PRIMARY KEY (`id_iku`),
  ADD KEY `id_misi` (`id_misi`);

--
-- Indexes for table `tr_iku_detail`
--
ALTER TABLE `tr_iku_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_iku_target_realisasi` (`id_iku_target_realisasi`);

--
-- Indexes for table `tr_iku_opd`
--
ALTER TABLE `tr_iku_opd`
  ADD PRIMARY KEY (`id_iku_opd`),
  ADD KEY `id_iku_rpjmd` (`id_iku_rpjmd`),
  ADD KEY `id_perangkat_daerah` (`id_perangkat_daerah`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_sub_kegiatan` (`id_sub_kegiatan`),
  ADD KEY `tr_iku_opd_ibfk_3` (`id_program`);

--
-- Indexes for table `tr_iku_rpjmd`
--
ALTER TABLE `tr_iku_rpjmd`
  ADD PRIMARY KEY (`id_iku_rpjmd`),
  ADD KEY `id_misi` (`id_misi`);

--
-- Indexes for table `tr_iku_target_realisasi`
--
ALTER TABLE `tr_iku_target_realisasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_iku` (`id_iku`);

--
-- Indexes for table `tr_indikator`
--
ALTER TABLE `tr_indikator`
  ADD PRIMARY KEY (`id_indikator`),
  ADD KEY `id_program` (`id_program`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_sub_kegiatan` (`id_sub_kegiatan`),
  ADD KEY `fk_indikator_unker` (`id_unker`);

--
-- Indexes for table `tr_rencana_kerja_pd`
--
ALTER TABLE `tr_rencana_kerja_pd`
  ADD PRIMARY KEY (`id_rencana_kerja`),
  ADD UNIQUE KEY `id_rencana_kerja` (`id_rencana_kerja`),
  ADD KEY `id_unker` (`id_unker`),
  ADD KEY `id_urusan` (`id_urusan`),
  ADD KEY `id_sub_urusan` (`id_sub_urusan`),
  ADD KEY `id_program` (`id_program`),
  ADD KEY `id_kegiatan` (`id_kegiatan`),
  ADD KEY `id_sub_kegiatan` (`id_sub_kegiatan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`password`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  MODIFY `id_session` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_kegiatan`
--
ALTER TABLE `master_kegiatan`
  MODIFY `id_kegiatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=524;

--
-- AUTO_INCREMENT for table `master_kegiatan_detail`
--
ALTER TABLE `master_kegiatan_detail`
  MODIFY `id_kegiatan_detail` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_misi_pemda`
--
ALTER TABLE `master_misi_pemda`
  MODIFY `id_misi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `master_program`
--
ALTER TABLE `master_program`
  MODIFY `id_program` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `master_program_detail`
--
ALTER TABLE `master_program_detail`
  MODIFY `id_program_detail` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_sub_kegiatan`
--
ALTER TABLE `master_sub_kegiatan`
  MODIFY `id_sub_kegiatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1674;

--
-- AUTO_INCREMENT for table `master_sub_kegiatan_detail`
--
ALTER TABLE `master_sub_kegiatan_detail`
  MODIFY `id_sub_kegiatan_detail` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_sub_urusan`
--
ALTER TABLE `master_sub_urusan`
  MODIFY `id_sub_urusan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `master_unker`
--
ALTER TABLE `master_unker`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=435;

--
-- AUTO_INCREMENT for table `master_urusan`
--
ALTER TABLE `master_urusan`
  MODIFY `id_urusan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=482;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_assignments`
--
ALTER TABLE `ticket_assignments`
  MODIFY `id_assignment` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_iku`
--
ALTER TABLE `tr_iku`
  MODIFY `id_iku` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_iku_detail`
--
ALTER TABLE `tr_iku_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_iku_opd`
--
ALTER TABLE `tr_iku_opd`
  MODIFY `id_iku_opd` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_iku_rpjmd`
--
ALTER TABLE `tr_iku_rpjmd`
  MODIFY `id_iku_rpjmd` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_iku_target_realisasi`
--
ALTER TABLE `tr_iku_target_realisasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_indikator`
--
ALTER TABLE `tr_indikator`
  MODIFY `id_indikator` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_rencana_kerja_pd`
--
ALTER TABLE `tr_rencana_kerja_pd`
  MODIFY `id_rencana_kerja` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD CONSTRAINT `chat_sessions_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_kegiatan`
--
ALTER TABLE `master_kegiatan`
  ADD CONSTRAINT `fk_kegiatan_unker` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `master_kegiatan_ibfk_1` FOREIGN KEY (`id_program`) REFERENCES `master_program` (`id_program`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `master_kegiatan_detail`
--
ALTER TABLE `master_kegiatan_detail`
  ADD CONSTRAINT `master_kegiatan_detail_ibfk_1` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `master_program`
--
ALTER TABLE `master_program`
  ADD CONSTRAINT `fk_program_unker` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `master_program_detail`
--
ALTER TABLE `master_program_detail`
  ADD CONSTRAINT `master_program_detail_ibfk_1` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `master_sub_kegiatan`
--
ALTER TABLE `master_sub_kegiatan`
  ADD CONSTRAINT `fk_sub_kegiatan_unker` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `master_sub_kegiatan_detail`
--
ALTER TABLE `master_sub_kegiatan_detail`
  ADD CONSTRAINT `master_sub_kegiatan_detail_ibfk_1` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `master_sub_urusan`
--
ALTER TABLE `master_sub_urusan`
  ADD CONSTRAINT `fk_sub_urusan_unker` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `master_sub_urusan_ibfk_1` FOREIGN KEY (`id_urusan`) REFERENCES `master_urusan` (`id_urusan`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `master_urusan`
--
ALTER TABLE `master_urusan`
  ADD CONSTRAINT `fk_urusan_unker` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_assignments`
--
ALTER TABLE `ticket_assignments`
  ADD CONSTRAINT `ticket_assignments_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_assignments_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tr_iku`
--
ALTER TABLE `tr_iku`
  ADD CONSTRAINT `tr_iku_ibfk_1` FOREIGN KEY (`id_misi`) REFERENCES `master_misi_pemda` (`id_misi`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tr_iku_detail`
--
ALTER TABLE `tr_iku_detail`
  ADD CONSTRAINT `tr_iku_detail_ibfk_1` FOREIGN KEY (`id_iku_target_realisasi`) REFERENCES `tr_iku_target_realisasi` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tr_iku_opd`
--
ALTER TABLE `tr_iku_opd`
  ADD CONSTRAINT `tr_iku_opd_ibfk_1` FOREIGN KEY (`id_iku_rpjmd`) REFERENCES `tr_iku_rpjmd` (`id_iku_rpjmd`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_iku_opd_ibfk_2` FOREIGN KEY (`id_perangkat_daerah`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_iku_opd_ibfk_3` FOREIGN KEY (`id_program`) REFERENCES `master_program` (`id_program`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_iku_opd_ibfk_4` FOREIGN KEY (`id_kegiatan`) REFERENCES `master_kegiatan` (`id_kegiatan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_iku_opd_ibfk_5` FOREIGN KEY (`id_sub_kegiatan`) REFERENCES `master_sub_kegiatan` (`id_sub_kegiatan`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tr_iku_rpjmd`
--
ALTER TABLE `tr_iku_rpjmd`
  ADD CONSTRAINT `tr_iku_rpjmd_ibfk_1` FOREIGN KEY (`id_misi`) REFERENCES `master_misi_pemda` (`id_misi`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tr_iku_target_realisasi`
--
ALTER TABLE `tr_iku_target_realisasi`
  ADD CONSTRAINT `tr_iku_target_realisasi_ibfk_1` FOREIGN KEY (`id_iku`) REFERENCES `tr_iku` (`id_iku`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tr_indikator`
--
ALTER TABLE `tr_indikator`
  ADD CONSTRAINT `fk_indikator_unker` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_indikator_ibfk_1` FOREIGN KEY (`id_program`) REFERENCES `master_program` (`id_program`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_indikator_ibfk_2` FOREIGN KEY (`id_kegiatan`) REFERENCES `master_kegiatan` (`id_kegiatan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_indikator_ibfk_3` FOREIGN KEY (`id_sub_kegiatan`) REFERENCES `master_sub_kegiatan` (`id_sub_kegiatan`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `tr_rencana_kerja_pd`
--
ALTER TABLE `tr_rencana_kerja_pd`
  ADD CONSTRAINT `tr_rencana_kerja_pd_ibfk_1` FOREIGN KEY (`id_unker`) REFERENCES `master_unker` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_rencana_kerja_pd_ibfk_2` FOREIGN KEY (`id_urusan`) REFERENCES `master_urusan` (`id_urusan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_rencana_kerja_pd_ibfk_3` FOREIGN KEY (`id_sub_urusan`) REFERENCES `master_sub_urusan` (`id_sub_urusan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_rencana_kerja_pd_ibfk_4` FOREIGN KEY (`id_program`) REFERENCES `master_program` (`id_program`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_rencana_kerja_pd_ibfk_5` FOREIGN KEY (`id_kegiatan`) REFERENCES `master_kegiatan` (`id_kegiatan`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `tr_rencana_kerja_pd_ibfk_6` FOREIGN KEY (`id_sub_kegiatan`) REFERENCES `master_sub_kegiatan` (`id_sub_kegiatan`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
