-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2024 pada 08.26
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absensi_sp1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurnal_kelas`
--

CREATE TABLE `tb_jurnal_kelas` (
  `id_jurnal` varchar(15) NOT NULL,
  `id_rombel` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL,
  `hari_dantgl` date NOT NULL,
  `time_mulai` time NOT NULL,
  `time_akhir` time NOT NULL,
  `hadir` int(2) NOT NULL,
  `alpa` int(2) NOT NULL,
  `ijin` int(2) NOT NULL,
  `sakit` int(2) NOT NULL,
  `jumlah` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurnal_kelas`
--

INSERT INTO `tb_jurnal_kelas` (`id_jurnal`, `id_rombel`, `id_user`, `kode_mapel`, `hari_dantgl`, `time_mulai`, `time_akhir`, `hadir`, `alpa`, `ijin`, `sakit`, `jumlah`) VALUES
('JRNL0000000001', 1, 1, 'b_indo', '2024-02-05', '15:53:00', '15:53:00', 23, 2, 2, 1, 28);

--
-- Trigger `tb_jurnal_kelas`
--
DELIMITER $$
CREATE TRIGGER `also delete tb_jurnal_siswa` AFTER DELETE ON `tb_jurnal_kelas` FOR EACH ROW BEGIN
	delete from tb_jurnal_siswa where id_jurnal = old.id_jurnal;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurnal_siswa`
--

CREATE TABLE `tb_jurnal_siswa` (
  `id_jurnal_siswa` int(50) NOT NULL,
  `id_jurnal` varchar(15) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `kehadiran` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurnal_siswa`
--

INSERT INTO `tb_jurnal_siswa` (`id_jurnal_siswa`, `id_jurnal`, `id_siswa`, `kehadiran`) VALUES
(504, 'JRNL0000000001', 5, 'hadir'),
(505, 'JRNL0000000001', 6, 'hadir'),
(506, 'JRNL0000000001', 7, 'hadir'),
(507, 'JRNL0000000001', 8, 'hadir'),
(508, 'JRNL0000000001', 9, 'hadir'),
(509, 'JRNL0000000001', 10, 'hadir'),
(510, 'JRNL0000000001', 11, 'hadir'),
(511, 'JRNL0000000001', 12, 'hadir'),
(512, 'JRNL0000000001', 13, 'hadir'),
(513, 'JRNL0000000001', 14, 'hadir'),
(514, 'JRNL0000000001', 15, 'hadir'),
(515, 'JRNL0000000001', 16, 'hadir'),
(516, 'JRNL0000000001', 17, 'hadir'),
(517, 'JRNL0000000001', 18, 'hadir'),
(518, 'JRNL0000000001', 19, 'hadir'),
(519, 'JRNL0000000001', 20, 'hadir'),
(520, 'JRNL0000000001', 21, 'hadir'),
(521, 'JRNL0000000001', 22, 'hadir'),
(522, 'JRNL0000000001', 23, 'hadir'),
(523, 'JRNL0000000001', 24, 'hadir'),
(524, 'JRNL0000000001', 25, 'alpa'),
(525, 'JRNL0000000001', 26, 'alpa'),
(526, 'JRNL0000000001', 27, 'hadir'),
(527, 'JRNL0000000001', 28, 'sakit'),
(528, 'JRNL0000000001', 29, 'ijin'),
(529, 'JRNL0000000001', 30, 'ijin'),
(530, 'JRNL0000000001', 31, 'hadir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `id_jurusan` int(10) NOT NULL,
  `name_jurusan` varchar(50) NOT NULL,
  `singkat_jurusan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`id_jurusan`, `name_jurusan`, `singkat_jurusan`) VALUES
(1, 'Teknik Jaringan Komputer & Telekomunikasi', 'TJKT'),
(2, 'Desain Komunikasi Visual', 'DKV'),
(3, 'Akuntansi Keuangan Lembaga', 'AKL'),
(4, 'Multimedia', 'MM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(3) NOT NULL,
  `name_kelas` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `name_kelas`) VALUES
(1, 'X'),
(2, 'XI'),
(3, 'XII');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kel_jur_rombel`
--

CREATE TABLE `tb_kel_jur_rombel` (
  `id_rombel` int(10) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `id_jurusan` int(10) NOT NULL,
  `id_th_pelajaran` int(10) NOT NULL,
  `rombel` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kel_jur_rombel`
--

INSERT INTO `tb_kel_jur_rombel` (`id_rombel`, `id_kelas`, `id_jurusan`, `id_th_pelajaran`, `rombel`) VALUES
(1, 1, 3, 1, '1'),
(2, 2, 3, 1, '1'),
(3, 2, 3, 1, '2'),
(4, 3, 3, 1, '1'),
(5, 1, 1, 1, '1'),
(6, 1, 1, 1, '2'),
(7, 1, 1, 1, '3'),
(8, 2, 1, 1, '1'),
(9, 2, 1, 1, '2'),
(10, 2, 1, 1, '3'),
(11, 3, 1, 1, '1'),
(12, 3, 1, 1, '2'),
(13, 1, 2, 1, '1'),
(14, 2, 2, 1, '1'),
(15, 3, 4, 1, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_leveluser`
--

CREATE TABLE `tb_leveluser` (
  `id_level` int(5) NOT NULL,
  `name_level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_leveluser`
--

INSERT INTO `tb_leveluser` (`id_level`, `name_level`) VALUES
(1, 'admin'),
(2, 'guru');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id_mapel` int(10) NOT NULL,
  `name_mapel` varchar(50) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`id_mapel`, `name_mapel`, `kode_mapel`) VALUES
(1, 'Bahasa indonesia', 'b_indo'),
(2, 'PKWU', 'p_kwu'),
(3, 'Pilihan', 'pilihan'),
(4, 'PAPJDM', 'p_apjdm'),
(5, 'PALIP', 'p_alip'),
(6, 'Konsentrasi Keahlian', 'kons_keahl'),
(7, 'DPK', 'dpk'),
(8, 'PKWU', 'p_kwu'),
(9, 'Administrasi Pajak', 'admin_paja'),
(10, 'PAI BP', 'pai'),
(11, 'Koordinator P5', 'p5'),
(12, 'Komputer Akutansi', 'komp_akunt'),
(13, 'Konsentrasi Keahlian', 'kons_keahl'),
(14, 'Akutansi Keuangan', 'Akun_keuan'),
(15, 'Matematika', 'Mtk'),
(16, 'PIPAS', 'p_ipas'),
(17, 'Bahasa inggris', 'b_ing'),
(18, 'PJOK', 'pjok'),
(19, 'Seni Budaya', 'seni_b'),
(20, 'BK', 'bk'),
(21, 'Informatika', 'iftk'),
(22, 'Sejarah', 'sejarah'),
(23, 'AIJ', 'aij'),
(24, 'TLJ', 'tlj'),
(25, 'TPAV', 'tpav'),
(26, 'DMI', 'dmi'),
(27, 'Bahasa Jawa', 'b_jawa'),
(28, 'Bahasa Arab', 'b_arab');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rolsuser`
--

CREATE TABLE `tb_rolsuser` (
  `id_rols` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_level` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_rolsuser`
--

INSERT INTO `tb_rolsuser` (`id_rols`, `id_user`, `id_level`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(10) NOT NULL,
  `nis` varchar(10) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `name_siswa` varchar(50) NOT NULL,
  `id_rombel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nisn`, `name_siswa`, `id_rombel`) VALUES
(4, '233055', '0077129259', 'Abie Taris Nugroho', 1),
(5, '233056', '0086893752', 'ADELINA OKTAVIANI', 1),
(6, '233057', '3079596430', 'AMELIA PUTRI', 1),
(7, '233058', '0083737860', 'ANISA FIRDAUS SARI', 1),
(8, '233059', '0097519934', 'Aulia Azahra', 1),
(9, '233060', '0084734231', 'Bima Vahri Zeftito', 1),
(10, '233061', '0081165002', 'Cika Esa Pratiwi', 1),
(11, '233062', '0083427829', 'Deva Apriliani', 1),
(12, '233063', '0091771618', 'DWI LARAS SUKMA AYU', 1),
(13, '233064', '0089457126', 'FERZA ADI PUTRA', 1),
(14, '233065', '0089628657', 'FITRI OKTA AULIA', 1),
(15, '233066', '0089929865', 'Harnum Sari', 1),
(16, '233067', '0091056257', 'Indri Asmarani', 1),
(17, '233068', '0086418405', 'KEVIN DIANSYAH', 1),
(18, '233069', '0082803008', 'KHOIRO MUNAFIFAH', 1),
(19, '233070', '0071527298', 'Lutfan Faqih', 1),
(20, '233071', '0075479026', 'MOHAMAD HIBATUL WAFIE', 1),
(21, '233072', '0077455446', 'MUHAMMAD ZIDAN AL FATHA', 1),
(22, '233073', '0096878899', 'NAVISAH HUMAEROH', 1),
(23, '233074', '0082590715', 'NISFI LAILATUL ZAHRO', 1),
(24, '233075', '0075791144', 'Raisya Nuzulul Ramadhani', 1),
(25, '233076', '0084123323', 'RIANA EKA YULIANTY', 1),
(26, '233077', '0085190478', 'Rizkayatul Nur Fadlilah', 1),
(27, '233078', '0084231617', 'Rizki Muslimatul Khasanah', 1),
(28, '233079', '0083059921', 'Rosa Tri Utami', 1),
(29, '233080', '0089961715', 'SAKTI RAMA SAPUTRA', 1),
(30, '233081', '0073783189', 'Sasi Agustin', 1),
(31, '233083', '0088250395', 'ZALSA CINTYA BELLA', 1),
(32, '232035', '0085965789', 'Anjani Nawang sari', 13),
(33, '232036', '0079618654', 'BIMO ANANDA HERLAMBANG', 13),
(34, '232037', '0081967364', 'Bulan Malam', 13),
(35, '232038', '0075833162', 'CINDY RIYANI', 13),
(36, '232039', '0083042204', 'DELA SAFIRA', 13),
(37, '232040', '0078530464', 'Deswita Mutiara Cinta', 13),
(38, '232041', '0079277411', 'DEWI PUJI ASTUTI', 13),
(39, '232042', '0089393121', 'DINA AULIA', 13),
(40, '232043', '0088392084', 'FITRI ASMA\'UL KHASANAH', 13),
(41, '232044', '0071233304', 'ISMAIL NAUFAL WASHIF NABIGH', 13),
(42, '232046', '0099065949', 'Labibah Taqiyatul Fauziyah', 13),
(43, '232047', '0073740599', 'Lila Nuraeni', 13),
(44, '232048', '0087371814', 'LILYANA SHINTA DEWI', 13),
(45, '232049', '0075083804', 'Muhammad Ikhsan Sya\'bani', 13),
(46, '232050', '3066137299', 'NABILA AINUN FATIKHAH', 13),
(47, '232051', '0089187265', 'NAJWA NINDA AGUSTINA', 13),
(48, '232052', '0061487658', 'Rizal Aditya', 13),
(49, '232053', '0079846950', 'Siti Habsya Asita', 13),
(50, '232054', '0075520202', 'TATIA DWI FAJRI YULINSA', 13),
(51, '233055', '0077129259', 'Abie Taris Nugroho', 5),
(52, '233056', '0086893752', 'ADELINA OKTAVIANI', 5),
(53, '233057', '3079596430', 'AMELIA PUTRI', 5),
(54, '233058', '0083737860', 'ANISA FIRDAUS SARI', 5),
(55, '233059', '0097519934', 'Aulia Azahra', 5),
(56, '233060', '0084734231', 'Bima Vahri Zeftito', 5),
(57, '233061', '0081165002', 'Cika Esa Pratiwi', 5),
(58, '233062', '0083427829', 'Deva Apriliani', 5),
(59, '233063', '0091771618', 'DWI LARAS SUKMA AYU', 5),
(60, '233064', '0089457126', 'FERZA ADI PUTRA', 5),
(61, '233065', '0089628657', 'FITRI OKTA AULIA', 5),
(62, '233066', '0089929865', 'Harnum Sari', 5),
(63, '233067', '0091056257', 'Indri Asmarani', 5),
(64, '233068', '0086418405', 'KEVIN DIANSYAH', 5),
(65, '233069', '0082803008', 'KHOIRO MUNAFIFAH', 5),
(66, '233070', '0071527298', 'Lutfan Faqih', 5),
(67, '233071', '0075479026', 'MOHAMAD HIBATUL WAFIE', 5),
(68, '233072', '0077455446', 'MUHAMMAD ZIDAN AL FATHA', 5),
(69, '233073', '0096878899', 'NAVISAH HUMAEROH', 5),
(70, '233074', '0082590715', 'NISFI LAILATUL ZAHRO', 5),
(71, '233075', '0075791144', 'Raisya Nuzulul Ramadhani', 5),
(72, '233076', '0084123323', 'RIANA EKA YULIANTY', 5),
(73, '233077', '0085190478', 'Rizkayatul Nur Fadlilah', 5),
(74, '233078', '0084231617', 'Rizki Muslimatul Khasanah', 5),
(75, '233079', '0083059921', 'Rosa Tri Utami', 5),
(76, '233080', '0089961715', 'SAKTI RAMA SAPUTRA', 5),
(77, '233081', '0073783189', 'Sasi Agustin', 5),
(78, '233083', '0088250395', 'ZALSA CINTYA BELLA', 5),
(79, '233084', '0083123413', 'Aden Winangun', 6),
(80, '233085', '', 'Aldiansyah Putra Purnomo', 6),
(81, '233086', '0064827155', 'AWALINA RAMADHINI', 6),
(82, '233087', '0083775079', 'AYU NAWANG WULAN', 6),
(83, '233088', '0089795885', 'Desti Saskia Kasih', 6),
(84, '233089', '0079551519', 'DESY MURTI WULANDARI', 6),
(85, '233090', '0082395303', 'DIVAN FATUROCHMAN', 6),
(86, '233091', '0045892422', 'Farhan Abbas', 6),
(87, '233092', '0075764535', 'Gito Efendi', 6),
(88, '233093', '0088771686', 'Izzah Maulina Salma', 6),
(89, '233094', '0086573237', 'Kaesha Putri', 6),
(90, '233095', '0086010625', 'LULU SYARIFATUL HUSNA', 6),
(91, '233096', '0089355478', 'MUHAMMAD FAJAR RIZQI', 6),
(92, '233097', '0074009782', 'MUHAMMAD NABIL DHIYA ULHAQ', 6),
(93, '233098', '0086994478', 'Naysila Rahma Hisana', 6),
(94, '233099', '0083411411', 'Nazzila Aprilia', 6),
(95, '233100', '0071287726', 'Nervy Selviana', 6),
(96, '233101', '0088257429', 'NOVAL BAKHTIAR', 6),
(97, '233102', '0082927058', 'RAMA IKHFANUL MUHAIMIN', 6),
(98, '233103', '0081457417', 'RIFKA SYA\'BANIYAH AZIZAH', 6),
(99, '233104', '0085488443', 'SEKAR HANDAYANI', 6),
(100, '233105', '0085859821', 'SHOHBIROTIN AZALEA', 6),
(101, '233106', '0089925593', 'Tiara Aulia', 6),
(102, '233107', '0089264139', 'Tiara Dwi Barokah', 6),
(103, '233108', '0083916720', 'Ulili Maulidatur Rodiyani', 6),
(104, '233109', '0071152301', 'WAFI AWAL WAGINDRA', 6),
(105, '233110', '0084230997', 'WAFIQ AZIZAH', 6),
(106, '233111', '3077031229', 'WIDYANTI', 6),
(107, '233112', '0074910410', 'WIKA BANIAH SAPUTRI', 6),
(108, '233113', '0081884137', 'Zahrotu Zita Arifiani', 6),
(109, '233114', '0074771207', 'ANDIKA SAKTIAWAN', 7),
(110, '233115', '0082433952', 'CINDY DWI FATIKASARI', 7),
(111, '233116', '0077802949', 'DEFIAH ANDRIANI', 7),
(112, '233117', '0085320409', 'Devita Yuliana Safutri', 7),
(113, '233118', '0088948101', 'DEWI AMELIA', 7),
(114, '233119', '0084532581', 'Dewi Mawar Sari', 7),
(115, '233120', '0084443609', 'Diah Ayu Agustin', 7),
(116, '233121', '0091543164', 'DIANDRA JASMINE FERDITA', 7),
(117, '233122', '0082295995', 'Dwika Septi Ramdani', 7),
(118, '233123', '0085494410', 'EGI ARIF YULIANSYAH', 7),
(119, '233124', '0075491809', 'Fauzan Dwi Andhika', 7),
(120, '233125', '0083224785', 'Ghendis Kusuma Legowo', 7),
(121, '233126', '0087160338', 'HARMUKTI', 7),
(122, '233127', '0084425750', 'KHOERUL ANAM', 7),
(123, '233128', '0082914435', 'MEILAN NAYZILA', 7),
(124, '233129', '0083861040', 'MEISYA NATARAYA', 7),
(125, '233130', '0095348553', 'Muhammad Nur Arif Afiansyah', 7),
(126, '233131', '0099070622', 'Muhammad Syam Ghozi', 7),
(127, '233132', '0081929314', 'MUKHTAR MUNAZAT', 7),
(128, '233133', '0062813411', 'Nimas Soviarini', 7),
(129, '233134', '0081102973', 'Nurfita Amelia', 7),
(130, '233135', '0085690576', 'NURMILATI', 7),
(131, '233136', '0082997654', 'Pipit Dwi Aryani', 7),
(132, '233137', '0089801362', 'PUPUT RAHMAWATI', 7),
(133, '233138', '0086666394', 'Putri Mutiara', 7),
(134, '233139', '0074793333', 'Rara Lidiana Inda', 7),
(135, '233140', '0089190489', 'RESTI YULIANTI', 7),
(136, '233141', '0072148347', 'REVALDO HENDRA SAPUTRA', 7),
(137, '233142', '0086119933', 'SENIOR HINO HAFIL', 7),
(138, '233143', '0085799599', 'SRI YANI', 7),
(139, '233144', '0086446669', 'SYIFA AZZAHRA', 7),
(140, '233145', '0088621287', 'Tifani Clara Difia', 7),
(219, '221027', '0078562303', 'ANIS KAMELA AFIFAH', 3),
(220, '221028', '0074650811', 'AULIA NUR AFIFAH', 3),
(221, '221029', '0075014408', 'AYU DWI LESTARI', 3),
(222, '221030', '0064558253', 'Bunga Intan Setyogati', 3),
(223, '221031', '0075738817', 'Cahaya Sri Ayuning', 3),
(224, '221032', '0077732604', 'DEA ARYANTI', 3),
(225, '221033', '0079809246', 'DEVI MAHARANI', 3),
(226, '221034', '0083077238', 'Dewi Cornelya Agatha', 3),
(227, '221035', '0074927611', 'ELSA INDAH SELIYA', 3),
(228, '221036', '0071131594', 'Faiqotul Hikmah', 3),
(229, '221037', '0042693872', 'GUSTI LINTANG AMALIYA PUTRI', 3),
(230, '221038', '0066443011', 'ILMI AMALIA', 3),
(231, '221039', '', 'Indah Nur Nabila', 3),
(232, '221040', '0075327628', 'JIHAN AMILIA', 3),
(233, '221041', '0076461938', 'Linta Nuri Ahmad', 3),
(234, '221042', '0061325655', 'LIVIA RAMADANI', 3),
(235, '221043', '', 'Nazala Anindya Atmariani', 3),
(236, '221044', '0065793265', 'NIA RAMADHANI', 3),
(237, '221045', '0077579397', 'Nike Cahaya Putri Amelia', 3),
(238, '221046', '0064298423', 'NOVA PRIYANA', 3),
(239, '221047', '0077502262', 'RANI NAYLA PUTRI', 3),
(240, '221048', '0077373761', 'Rengganis Nuraini', 3),
(241, '221049', '0076065558', 'RESTY NUR AMAINAH', 3),
(242, '221050', '0068250472', 'SHINTA DEWI ASTUTI', 3),
(243, '221051', '0067230712', 'Shintia Ayu Diawati', 3),
(244, '221052', '0073472818', 'SRI DEWI LESTARI', 3),
(245, '222053', '0077860972', 'AISYAH NUR FEBRIYANTI', 14),
(246, '222054', '0075162481', 'Alfian Dwi Prasetyo', 14),
(247, '222055', '0072033388', 'BAROKAH FAUZIA', 14),
(248, '222056', '0077021814', 'DHINING PANGASTUTI', 14),
(249, '222057', '0078227239', 'EFI WULANDARI', 14),
(250, '222058', '0075096621', 'FANNIA MELANY', 14),
(251, '222059', '0076704738', 'Felia Afiyanti', 14),
(252, '222060', '0061743692', 'Firdaus Hasbi Arya Nugraha', 14),
(253, '222061', '0073007975', 'FITRI DIANITA', 14),
(254, '222062', '0075145000', 'Iif Fauziah Azzahro', 14),
(255, '222063', '0068871279', 'INTAN WULANDARI', 14),
(256, '222064', '0074080627', 'Ivan Sahbillal', 14),
(257, '222065', '0076765781', 'Krisna', 14),
(258, '222066', '0055834866', 'KURNIA DIYAH REHAYATI', 14),
(259, '222067', '0074370523', 'LARAS WATI', 14),
(260, '222068', '0065221910', 'Luthfi Ardiansyah', 14),
(261, '222069', '0074592674', 'MUHAMAD RIKI ALFA IDIN', 14),
(262, '222070', '3077815113', 'Muhammad Luthfi Maula Rizieq', 14),
(263, '222071', '0075574307', 'MUTIARA RAMADHANI', 14),
(264, '222072', '0071560039', 'PUTRI AMALIA SOLIKHAH', 14),
(265, '222073', '0071584735', 'Revalina Tistiyanti', 14),
(266, '222074', '0061833485', 'SALSAVA ARISTABELA', 14),
(267, '222075', '0078892340', 'Sela Amalia', 14),
(268, '222076', '0071637839', 'SELI RAHMA DEWI', 14),
(269, '222077', '0074154789', 'SRI MILASARI', 14),
(270, '222078', '0065880259', 'TIO ADI SEPTIAN', 14),
(271, '222079', '0073924319', 'YASMIN NAILA TSABITA', 14),
(272, '222080', '0077324819', 'YUNI AYU NAFISA', 14),
(273, '222081', '0079236253', 'Zahlul Shofi Mubarok', 14),
(274, '222082', '0071668083', 'Zain Nazala Syafi', 14),
(275, '222083', '0079009930', 'ZULFA AMBARA', 14),
(276, '223084', '0078106060', 'Ade Arya Prasetyo', 8),
(277, '223085', '0078194380', 'Aerien Aprilia Putri', 8),
(278, '223086', '0076398419', 'ALAEKA BADAWI', 8),
(279, '223087', '0072847777', 'ALIF FANI FEBRIANTI', 8),
(280, '223088', '0073756353', 'BIAND JOAH EXZANDY', 8),
(281, '223089', '0078073943', 'Cantika Alina Putri', 8),
(282, '223090', '0074918379', 'CHAIRIL AZMI', 8),
(283, '223091', '0072751562', 'Dimas Erlangga Firmansyah', 8),
(284, '223092', '0071993987', 'Dimas Maulana Malik Ibrahim', 8),
(285, '223093', '0056285862', 'ELSI ERVIKA', 8),
(286, '223094', '0067982628', 'ERIN SEPTRIANA LAYSAFIRNA', 8),
(287, '223095', '0073818463', 'EVA BILQIS RAMADHANI', 8),
(288, '223096', '0061659094', 'Fathan Fadhillah', 8),
(289, '223097', '0078556392', 'Giska Anelka', 8),
(290, '223098', '0062690203', 'Hendra Marsel', 8),
(291, '223099', '0077448602', 'HILDA KAYLA LOVINA ROSMAYA DEVI', 8),
(292, '223100', '0076756907', 'Lisa Amelia', 8),
(293, '223101', '0085982947', 'Maemanatul Izah', 8),
(294, '223102', '0073492449', 'MELICHA NOVA BRIANTY', 8),
(295, '223103', '0053400777', 'MOHAMMAD DENI SEFRIYAH', 8),
(296, '223104', '0074476955', 'Muhammad Wildhan', 8),
(297, '223105', '0067970848', 'MUSTAFIDAH', 8),
(298, '223106', '0078754769', 'Nindi Anggraeni', 8),
(299, '223107', '0072894033', 'NUR AMALIA NAELI IZAH', 8),
(300, '223108', '0055877298', 'Rayhan Afrizal Zulfi', 8),
(301, '223109', '0065100170', 'RENDI AL TESYA', 8),
(302, '223110', '0072691988', 'RISMA NATASYA ADINDA PUTRI', 8),
(303, '223111', '0068856911', 'Sakinatul Faizah', 8),
(304, '223112', '0073822361', 'Siswanto', 8),
(305, '223113', '0085023981', 'TITI WASTUTI', 8),
(306, '223114', '0072906961', 'WIWIN ROSALINDA', 8),
(307, '223115', '0075728259', 'YUYUN KARLINA', 8),
(308, '223116', '0072534434', 'ZAHWA AURA LEJAZ', 8),
(309, '223117', '0062891695', 'AFDAN RIFANSYAH', 9),
(310, '223118', '0077443117', 'Aisah Hadiyanti Ramadhoni', 9),
(311, '223119', '0079573658', 'AL ZACHARI WIBIKSONO', 9),
(312, '223120', '0076063586', 'Arya Suta Astamurti Adhipramana', 9),
(313, '223121', '0068724545', 'AUDY AHMAD RIFAI', 9),
(314, '223122', '0076267343', 'BAGUS KUMARA ESA', 9),
(315, '223123', '0071150996', 'DEA RISMA YUNIAR', 9),
(316, '223124', '0063512641', 'DIMAS AJI SAPUTRA', 9),
(317, '223125', '0078005647', 'Dimas Wahyu Hidayat', 9),
(318, '223126', '0077623376', 'ELVA ELMIZA', 9),
(319, '223127', '0074126029', 'FAHMA PRICILLA', 9),
(320, '223128', '0137666344', 'GHUFRON SUR RAMADHAN SAMA', 9),
(321, '223129', '0069679921', 'Karmilah', 9),
(322, '223130', '0074543812', 'KHOIRUL HIDAYAT', 9),
(323, '223131', '0065154218', 'Lia Novita sari', 9),
(324, '223132', '0074214763', 'MARSHA AMY SUKAHMAN', 9),
(325, '223133', '0072304554', 'MIFTA KHULJANAH', 9),
(326, '223134', '0066000640', 'MUHAMAD IDWAR ALDIYANSAH', 9),
(327, '223135', '0078267645', 'MUHAMMAD HAFIZD AINUL YAQIN', 9),
(328, '223136', '0066607260', 'NAILIL HADZIQOH', 9),
(329, '223137', '0066818124', 'Novita Nurul Aisyah', 9),
(330, '223138', '0066201407', 'Nur Azizah', 9),
(331, '223139', '0078011931', 'REFI MARISKA', 9),
(332, '223140', '0071179205', 'REVA ASIH', 9),
(333, '223141', '0076307540', 'REVANGGA AJI PERMANA', 9),
(334, '223142', '0085361677', 'RISALATUL MAGHFIROH', 9),
(335, '223143', '0065134904', 'SALMA KHOLIFATUL KHASANAH', 9),
(336, '223144', '0062543411', 'SITI ELINA', 9),
(337, '223145', '0076789121', 'TEGAR WIBOWO', 9),
(338, '223146', '0073344972', 'TIKA LAELATUS SAFITRI', 9),
(339, '223147', '0078216672', 'TIRTA HANDIKA', 9),
(340, '223148', '0074714290', 'TRI WINDI YULIANTI', 9),
(341, '223177', '0063564293', 'WISNU FADJARKHARIM', 9),
(342, '223149', '0071219052', 'AILA DWI APRILIANI', 10),
(343, '223149', '0054310779', 'Alya Nur Ramadhani', 10),
(344, '223150', '0069564172', 'ANDO WIDODO', 10),
(345, '223151', '0069276465', 'AVIKA MILA', 10),
(346, '223152', '0073650138', 'BAGAS DAFFA ADITYA', 10),
(347, '223153', '0072338020', 'BRIYAN PRASETYO', 10),
(348, '223154', '0061528350', 'CANDRA ANDIKA', 10),
(349, '223155', '0073363354', 'Dian Risobri', 10),
(350, '223156', '0061001045', 'EVI KURNIAWATI', 10),
(351, '223157', '0078233902', 'Faraghina Aurelia', 10),
(352, '223158', '0074716380', 'FATIH TEANA HAFIZ', 10),
(353, '223159', '0075190222', 'FATMAH LIA KINANTI', 10),
(354, '223160', '0079057865', 'GHAZIYAH SHAFARINA HANAN', 10),
(355, '223161', '0076770497', 'Ghofar Abdul Jabar', 10),
(356, '223163', '0062444378', 'HAFIZH NAUFAL AZZAM', 10),
(357, '223164', '0074023293', 'IKA SALSABILA PRAMESTI', 10),
(358, '223165', '0079513863', 'LOLITA FEBRIYANTI', 10),
(359, '223166', '0077654358', 'Mohamad Arif Rahman Hakim', 10),
(360, '223167', '0079810357', 'Muhammad Saiful Mizan', 10),
(361, '223168', '0077345588', 'Nabila Ati Fakriatun', 10),
(362, '223169', '0072125206', 'RAIHAN AFANDIKA', 10),
(363, '223170', '0072255051', 'RINDA SARI', 10),
(364, '223171', '0073000785', 'SALWA RAMADHANI', 10),
(365, '223172', '0055809215', 'SEPTA MUTHOHAROH', 10),
(366, '223173', '0064453129', 'SITI BELLA NAPSIAH', 10),
(367, '223174', '0089733817', 'Syahrul Mukarrom', 10),
(368, '223175', '0063925617', 'TYAS NUR HIDAYAH', 10),
(369, '223176', '0075364717', 'Vanny Nuraeny', 10),
(370, '223178', '0072811095', 'YESSI SETIA WATI', 10),
(371, '233146', '0077441529', 'Zirah Adillah Mutfakhrozi', 10),
(372, '2672', '0068071274', 'AIRIN FEBRIANI', 4),
(373, '2673', '0053417305', 'ASTRI NOVILA ANGGRAENI', 4),
(374, '2674', '0068813080', 'AURA DEVINTA CAHYA', 4),
(375, '2675', '0065466501', 'DELON ARYANT SAHRONI', 4),
(376, '2676', '0068204077', 'Desti Elasari', 4),
(377, '2677', '0062236634', 'ELIZIA SEFELYNE', 4),
(378, '2678', '0056201066', 'INDI AYU LESTARI', 4),
(379, '2679', '0067240776', 'KARINA AULIA RISANTI', 4),
(380, '2680', '0063002453', 'META ERINDA', 4),
(381, '2681', '0061211455', 'Mulia Khasanah', 4),
(382, '2682', '0062743661', 'NAELA TUSY AZAHRA', 4),
(383, '2683', '0072865948', 'Natasya Pebriyanti', 4),
(384, '2684', '0061051137', 'NIA FADHILAH', 4),
(385, '2685', '0052539515', 'PUTRI FELISKA', 4),
(386, '2686', '0064171385', 'SANDRA NALIATI', 4),
(387, '2687', '0078596782', 'Sheril Uzlifatil Janah', 4),
(388, '2688', '3067695680', 'Widya Meilani', 4),
(389, '2690', '0065267789', 'Anggela Vritza Pepriani', 4),
(390, '2691', '0069882550', 'Anisa Indriani', 4),
(391, '2692', '0056824979', 'AULIA MEIDIAN', 4),
(392, '2693', '0053289116', 'BINTANG AYU RAMADANI', 4),
(393, '2694', '0069775514', 'Desta Maharani', 4),
(394, '2695', '0054489771', 'DIAH AYU OKTAVIA', 4),
(395, '2696', '0069607640', 'Jihan Nayla Atikah', 4),
(396, '2697', '0069103591', 'LISA DINI RESTYANA', 4),
(397, '2698', '0061255966', 'MIFA KURNIASIH', 4),
(398, '2700', '0065922568', 'NAYLA MILLATINA ASKA', 4),
(399, '2701', '0053693339', 'Nia Puspitasari', 4),
(400, '2702', '3068374245', 'Nor Indah Wijayanti', 4),
(401, '2703', '0052388328', 'NOVA ADELIA SHIFA SALSABILA', 4),
(402, '2704', '0055444478', 'Renita Eka Auliana Rahmadiani', 4),
(403, '2705', '0062163083', 'Sharmila Ayu Kusuma dewi', 4),
(404, '2707', '0068302045', 'Virgiawan Puji Pertama', 4),
(405, '2708', '0079530652', 'ZAHLIKA GITA GUTANTI', 4),
(406, '2802', '0056391949', 'SILMI NURUL UMAMI', 4),
(407, '2709', '0063040851', 'AIS LAILA AYU', 15),
(408, '2710', '0052186125', 'ALDI PUTRA WINATA', 15),
(409, '2711', '0066637699', 'ALFIN DWI PAMUNGKAS', 15),
(410, '2712', '0072131652', 'Alvin Nur Rosyid', 15),
(411, '2713', '0068310271', 'Amirotun Khasanah', 15),
(412, '2714', '0066962841', 'CHELLI DESTI NILASARI', 15),
(413, '2715', '0067614961', 'DAHLIA PRAWITASARI', 15),
(414, '2716', '0058077350', 'Dewi Sartika Ramadhani', 15),
(415, '2717', '0064655553', 'Dian Puspitasari', 15),
(416, '2718', '0063800378', 'DINA SURYANTI', 15),
(417, '2719', '0067171634', 'FINA ANDINI', 15),
(418, '2720', '0067247858', 'Hasta Dwi Meisha Putri', 15),
(419, '2721', '0053155709', 'MUHAMMAD BAYU SAPUTRO', 15),
(420, '2722', '0065584593', 'MUSYA ARYADILA FITRA', 15),
(421, '2723', '0065203289', 'ROSINTA SEPTI', 15),
(422, '2724', '3053878046', 'Safitri Widia Sari', 15),
(423, '2725', '0053396286', 'Sari Martizza', 15),
(424, '2726', '0072064714', 'SIFAUL KHORIDAH', 15),
(425, '2727', '3062316090', 'Wulan Alifathu Sa\'diah', 15),
(426, '2728', '0066972607', 'YANI AGUSTINA', 15),
(427, '2729', '0064551822', 'ZALFA NAURA APRILIANTI', 15),
(428, '2730', '0066294807', 'Afellia Nilam Eriska', 11),
(429, '2731', '0044268153', 'ANGGA PRADIPTA UTAMA', 11),
(430, '2732', '0067652449', 'Arivah Wijayanti', 11),
(431, '2733', '0064624634', 'ARYA DWI KURNIAWAN', 11),
(432, '2734', '0064925091', 'BENING SETIAWATI', 11),
(433, '2735', '0063025074', 'DANI WIDEYANTO', 11),
(434, '2736', '0069970715', 'Della Tahta Pratiwi', 11),
(435, '2737', '3062207765', 'Dhea Nur Fadlilah', 11),
(436, '2738', '0065192132', 'FAHMI MUBAROK', 11),
(437, '2739', '0053417304', 'Faisal Candra Dinova', 11),
(438, '2740', '0053674835', 'Fauzal Ramadhani', 11),
(439, '2741', '0061242094', 'HAFIS ANINDA', 11),
(440, '2743', '0055478547', 'INE MUTIARA PUTRI', 11),
(441, '2744', '0035366340', 'JUNIAN PUSPITA SARI', 11),
(442, '2745', '0061941208', 'KEVIN ATSIS AGUSTINO', 11),
(443, '2746', '0064461034', 'KUSRIATUN', 11),
(444, '2747', '3063594556', 'Marseleno Ponco Saputra', 11),
(445, '2748', '0066987934', 'Mohammad Khusni Faqih', 11),
(446, '2749', '0061238235', 'MUHAMAD ARIFIN', 11),
(447, '2752', '0052428622', 'NOFA ULI FIYAH', 11),
(448, '2753', '0063951498', 'Nurul Karomah', 11),
(449, '2754', '0072593523', 'PEBRI RIZKI SAPUTRA', 11),
(450, '2755', '0066266196', 'RENITA INDRIYANI', 11),
(451, '2756', '0063252267', 'Sindi Nazalia', 11),
(452, '2757', '0052539536', 'SIYAMSARI', 11),
(453, '2758', '3063411332', 'Tatia Nurul Hikmah', 11),
(454, '2759', '3068492284', 'Ummi Sairotul Milati Ulfiah', 11),
(455, '2760', '0051654567', 'VIOLA ADE FRASTIKA', 11),
(456, '2761', '0061583474', 'Wahyu Tri gunarso', 11),
(457, '2762', '0052668954', 'ZASKIA MILANDA', 11),
(458, '2763', '0065622250', 'ADINDA SILVIANI', 12),
(459, '2764', '0052670272', 'AHMAD ARIFIN', 12),
(460, '2765', '0053095585', 'Anugrah Tegar Ardiansyah', 12),
(461, '2766', '0062928601', 'ARIEL ASHA ROSUL', 12),
(462, '2767', '0053827802', 'AYU SAFITRI', 12),
(463, '2768', '0053856437', 'CHOIROTUL MUKAROMAH', 12),
(464, '2769', '0061264584', 'DEA SEPTIANI', 12),
(465, '2772', '0069393110', 'DWI AGUSTIN', 12),
(466, '2773', '9013372046', 'Fadil Syah Muzakki', 12),
(467, '2774', '0065665361', 'FITRI AZIZAH', 12),
(468, '2775', '0088817654', 'HENDRIK RIFKI MAULANA', 12),
(469, '2776', '0065985296', 'INDRI SETIANI', 12),
(470, '2777', '0053417301', 'IRFAN SYA BAN MAULANA', 12),
(471, '2779', '0065506865', 'LESTARI PUJI ASTUTI', 12),
(472, '2780', '0069771382', 'MEI DWI USNUL KHOTIMAH', 12),
(473, '2781', '0052166604', 'MUHAMMAD SYAHRONI', 12),
(474, '2782', '0063415634', 'Nisa Khaerunnisa', 12),
(475, '2783', '0066682938', 'Novalda Nurul Hikmah', 12),
(476, '2785', '0054438829', 'PANGGIH MAY DIA', 12),
(477, '2786', '0069521824', 'RATNA DWI MUKTI', 12),
(478, '2788', '0066745190', 'RESICA RINDI FITRIANA ALI', 12),
(479, '2789', '0053373872', 'ROY DEWANTORO', 12),
(480, '2790', '0060198638', 'SALSA AYUNINGTYAS', 12),
(481, '2791', '0069093285', 'SALSYA NUR ASAKU', 12),
(482, '2792', '0065329734', 'SASKIA PUJI MEILANI', 12),
(483, '2793', '0074285634', 'Sayidina Hernan Salsadila', 12),
(484, '2795', '0063742740', 'SUKMA PRAMESTI', 12),
(485, '2796', '0068795091', 'ULUNG ZENSYA PRATAMA', 12),
(486, '2797', '0058355969', 'VINA SUKMA RAHMA DINI', 12),
(487, '2798', '0069478923', 'WAHYU PRATAMA', 12),
(488, '2799', '0062499517', 'WULAN DIAH PRIHASTARI', 12),
(489, '2801', '0060198636', 'NATHASYA MEC\'KA AULIA', 12),
(490, '221001', '0073421928', 'AGNI PUTRI AMELIA', 2),
(491, '221003', '0068201886', 'Ainun Nisa', 2),
(492, '221004', '0084418150', 'CHIRANA RESCHA CHIKA MENTARI', 2),
(493, '221005', '0075333803', 'Dinda Cantika Apsari', 2),
(494, '221006', '0053811494', 'DIVA RIVANA', 2),
(495, '221007', '0071682423', 'Dwi Septiani', 2),
(496, '221009', '0076644301', 'GITA CAHAYA NINGSIH', 2),
(497, '221010', '0074011544', 'ICHA APRILIANI', 2),
(498, '221011', '0076324689', 'IKE PURWANINGRUM', 2),
(499, '221012', '0066617105', 'Intan Permata Sari', 2),
(500, '221013', '0073505921', 'JUWITA EKA ARGYANTI', 2),
(501, '221015', '0073511597', 'Lutfiah Lailatul Faroh', 2),
(502, '221016', '0078443689', 'MILA SAFINATUNAJAH', 2),
(503, '221017', '0079538028', 'NAELA IZATUROHMAH', 2),
(504, '221018', '0064928895', 'Novel Adelia Putri', 2),
(505, '221019', '0074268403', 'Qeikan Austria Safiana Putri', 2),
(506, '221020', '0075457215', 'Ramadani Isnaeni', 2),
(507, '221021', '0073336488', 'REYSTA AZUAN NAFIA', 2),
(508, '221022', '0067040454', 'Reza Nurvianah', 2),
(509, '221023', '0071206262', 'RISMA WIDIYANI', 2),
(510, '221024', '0072171661', 'Saskia Ratna Dilla', 2),
(511, '221025', '0072992193', 'Sekar Mentari Handayani', 2),
(512, '221026', '0074472982', 'ZAHRA IFA AULIA', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_th_pelajaran`
--

CREATE TABLE `tb_th_pelajaran` (
  `id_th_pelajaran` int(10) NOT NULL,
  `th_pelajaran` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_th_pelajaran`
--

INSERT INTO `tb_th_pelajaran` (`id_th_pelajaran`, `th_pelajaran`) VALUES
(1, '2023/2024'),
(2, '2024/2025'),
(3, '2025/2026'),
(4, '2026/2027'),
(5, '2027/2028'),
(6, '2028/2029'),
(7, '2029/2030');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nipy` varchar(20) NOT NULL,
  `nama_depan` varchar(10) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nipy`, `nama_depan`, `nama_lengkap`) VALUES
(1, '32120220202', '32120220202', '32120220202', 'irfa', 'Muhammad Irfa Nufaiyal Kharish'),
(2, '1234', '1234', '1234', 'admin', 'administrator'),
(3, '32120050027', '32120050027', '32120050027', 'Munasir', 'MUNASIR, S.Pd, M.T'),
(4, '31120050018', '31120050018', '31120050018', 'Nurlaeli', 'NURLAELI,SE'),
(5, '31120070036', '31120070036', '31120070036', 'Nasokhi', 'NASOKHI, S.Ag'),
(6, '31120050021', '31120050021', '31120050021', 'Aan', 'AAN ZULIANTI,S.IP'),
(7, '31120050022', '31120050022', '31120050022', 'Yudiyanti', 'YUDIYANTI KURNIA AKMALA, S.Pd'),
(8, '31120080050', '31120080050', '31120080050', 'Yakhya', 'YAKHYA EKA SAPUTRA,S.Pd'),
(9, '31120090070', '31120090070', '31120090070', 'Anita', 'ANITA LINDAWATI, S.Pd'),
(10, '31120110112', '31120110112', '31120110112', 'Firman', 'FIRMANSYAH, S.Si'),
(11, '31120130134', '31120130134', '31120130134', 'Heri', 'HERI PRAYITNO, S.Pd'),
(12, '31120150137', '31120150137', '31120150137', 'Eka', 'EKA DYA JUNITA, S.Pd'),
(13, '31120180139', '31120180139', '31120180139', 'Zahroh', 'AFIFATUZ ZAHROH, S.Pd'),
(14, '31120190140', '31120190140', '31120190140', 'Darmanto', 'DARMANTO, S.Kom'),
(15, '31120190142', '31120190142', '31120190142', 'Nurul', 'NURUL FAIQOH, S.Pd'),
(16, '31120210143', '31120210143', '31120210143', 'Bagus', 'BAGUS ESTI WALUYO, S.Pd'),
(17, '31120220145', '31120220145', '31120220145', 'Chandra', 'CHANDRA DWI WIDYANTORO, S.Pd'),
(18, '31120220146', '31120220146', '31120220146', 'Adi', 'ADI YUNI CANDRA, S.Kom'),
(19, '31120220147', '31120220147', '31120220147', 'Esti', 'ESTI RAHAYU, S.Pd'),
(20, '31120230149', '31120230149', '31120230149', 'Fitria', 'FITRIA ANA FADILAH,S.Pd'),
(21, '31120230148', '31120230148', '31120230148', 'Mifthafani', 'MITHAFANI GRANIETA, S.Pd'),
(22, '31120230150', '31120230150', '31120230150', 'Trisma', 'TRISMA FATKHIRIZQI, S.Kom'),
(23, '31120240151', '31120240151', '31120240151', 'Afifah', 'AFIFAH SUKMA LESTARI, S.Kom'),
(24, '31120240152', '31120240152', '31120240152', 'Riskon', 'MUHAMMAD RISKON HIDAYATULLAH, S.Kom'),
(25, '31220050024', '31220050024', '31220050024', 'Fadhilah', 'AHMAD FADHILAH'),
(26, '31220060035', '31220060035', '31220060035', 'Kalsum', 'KALSUM'),
(27, '31219990011', '31219990011', '31219990011', 'Ciswandi', 'CISWANDI'),
(28, '31220060033', '31220060033', '31220060033', 'Solecha', 'SOLECHA'),
(29, '31220060034', '31220060034', '31220060034', 'Eli', 'ELI SUCIANI'),
(30, '31220170138', '31220170138', '31220170138', 'Purnomo', 'PURNOMO'),
(31, '31220190141', '31220190141', '31220190141', 'Adi', 'ADI RIYANTO'),
(32, '31220210144', '31220210144', '31220210144', 'Faisal', 'Faisal Dwi Prasetyo');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_jurnal_kelas`
--
ALTER TABLE `tb_jurnal_kelas`
  ADD PRIMARY KEY (`id_jurnal`),
  ADD KEY `id_rombel` (`id_rombel`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `kode_mapel` (`kode_mapel`);

--
-- Indeks untuk tabel `tb_jurnal_siswa`
--
ALTER TABLE `tb_jurnal_siswa`
  ADD PRIMARY KEY (`id_jurnal_siswa`),
  ADD KEY `id_jurnal` (`id_jurnal`);

--
-- Indeks untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_kel_jur_rombel`
--
ALTER TABLE `tb_kel_jur_rombel`
  ADD PRIMARY KEY (`id_rombel`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_th_pelajaran` (`id_th_pelajaran`);

--
-- Indeks untuk tabel `tb_leveluser`
--
ALTER TABLE `tb_leveluser`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id_mapel`),
  ADD KEY `kode_mapel` (`kode_mapel`);

--
-- Indeks untuk tabel `tb_rolsuser`
--
ALTER TABLE `tb_rolsuser`
  ADD PRIMARY KEY (`id_rols`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_level` (`id_level`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_rombel` (`id_rombel`);

--
-- Indeks untuk tabel `tb_th_pelajaran`
--
ALTER TABLE `tb_th_pelajaran`
  ADD PRIMARY KEY (`id_th_pelajaran`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_jurnal_siswa`
--
ALTER TABLE `tb_jurnal_siswa`
  MODIFY `id_jurnal_siswa` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;

--
-- AUTO_INCREMENT untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  MODIFY `id_jurusan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_kel_jur_rombel`
--
ALTER TABLE `tb_kel_jur_rombel`
  MODIFY `id_rombel` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tb_leveluser`
--
ALTER TABLE `tb_leveluser`
  MODIFY `id_level` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  MODIFY `id_mapel` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tb_rolsuser`
--
ALTER TABLE `tb_rolsuser`
  MODIFY `id_rols` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT untuk tabel `tb_th_pelajaran`
--
ALTER TABLE `tb_th_pelajaran`
  MODIFY `id_th_pelajaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jurnal_kelas`
--
ALTER TABLE `tb_jurnal_kelas`
  ADD CONSTRAINT `tb_jurnal_kelas_ibfk_1` FOREIGN KEY (`id_rombel`) REFERENCES `tb_kel_jur_rombel` (`id_rombel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jurnal_kelas_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jurnal_kelas_ibfk_3` FOREIGN KEY (`kode_mapel`) REFERENCES `tb_mapel` (`kode_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jurnal_kelas_ibfk_4` FOREIGN KEY (`id_jurnal`) REFERENCES `tb_jurnal_siswa` (`id_jurnal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_kel_jur_rombel`
--
ALTER TABLE `tb_kel_jur_rombel`
  ADD CONSTRAINT `tb_kel_jur_rombel_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kel_jur_rombel_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kel_jur_rombel_ibfk_3` FOREIGN KEY (`id_th_pelajaran`) REFERENCES `tb_th_pelajaran` (`id_th_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_rolsuser`
--
ALTER TABLE `tb_rolsuser`
  ADD CONSTRAINT `tb_rolsuser_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_rolsuser_ibfk_2` FOREIGN KEY (`id_level`) REFERENCES `tb_leveluser` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_rombel`) REFERENCES `tb_kel_jur_rombel` (`id_rombel`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
