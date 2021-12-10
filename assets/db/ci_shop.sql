-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Des 2021 pada 01.25
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_shop`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `id_user`, `id_product`, `qty`, `subtotal`) VALUES
(2, 6, 3, 4, 12000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `slug`, `title`) VALUES
(1, 'baju waniita', 'Baju Wanita'),
(2, 'Baju Pria', 'Baju Pria'),
(3, 'Sepatu Wanita', 'Sepatu Wanita'),
(4, 'Sepatu Pria', 'Sepatu Pria'),
(5, 'Aksesoris', 'Aksesoris');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `invoice`, `total`, `name`, `address`, `phone`, `status`) VALUES
(4, 4, '2021-12-02', '420211202193519', 3500000, 'tukang_gambar', 'hajdsghasdhdas', '82278002635', 'paid'),
(5, 9, '2021-12-04', '920211204201131', 8000000, 'tukang_gambar', 'fddfgdfgsdfgadfg', '82278002635', 'waiting');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_confirm`
--

CREATE TABLE `orders_confirm` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `nominal` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders_confirm`
--

INSERT INTO `orders_confirm` (`id`, `id_orders`, `account_name`, `account_number`, `nominal`, `note`, `image`) VALUES
(1, 1, 'Amir', '42424123333', 36000000, '-', '520200318210456-20200319173859.jpg'),
(2, 2, 'Dio Brando', '344312321', 500000, 'Mantap kang', '520200319181238-20200319181447.jpg'),
(3, 4, '032-12321967', '09028389382', 3500000, '-', '420211202193519-20211202193810.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `qty` int(4) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`id`, `id_orders`, `id_product`, `qty`, `subtotal`) VALUES
(1, 1, 4, 6, 30000000),
(2, 1, 3, 2, 6000000),
(3, 2, 2, 1, 500000),
(4, 3, 3, 1, 3000000),
(5, 4, 2, 1, 500000),
(6, 4, 3, 1, 3000000),
(7, 5, 5, 1, 8000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `id_category`, `slug`, `title`, `description`, `price`, `is_available`, `image`) VALUES
(6, 1, 'baju-wanita', 'baju wanita', 'baju atasan muslim korean style', 125000, 1, 'baju-wanita-20211204132059.jpeg'),
(7, 1, 'Atasan-wanita', 'Atasan wanita', 'baju atasan wanita muslim korean style', 135000, 1, 'atasan-wanita-20211204132333.jpeg'),
(8, 1, 'tunik', 'tunik', 'atasan wanita muslim', 100000, 1, 'tunik-20211204133316.jpeg'),
(9, 1, 'baju', 'baju', 'atasan wanita', 150000, 1, 'baju-20211204133423.jpeg'),
(10, 1, 'atasan-tunik', 'atasan tunik', 'baju wanita muslim korean stylee', 175000, 1, 'atasan-tunik-20211204140728.jpeg'),
(11, 2, 'kemeja', 'kemeja', 'kemeja pria ', 175000, 1, 'kemeja-20211204141640.jpeg'),
(12, 2, 'sweter', 'sweter', 'new sweter pria korean stylee', 125000, 1, 'sweter-20211204141824.jpeg'),
(13, 2, 'rajut', 'rajut', 'atasan rajut', 135000, 1, 'rajut-20211204142227.jpeg'),
(14, 2, 'atasan-pria', 'atasan pria', 'baju pria korean stylee', 165000, 1, 'atasan-pria-20211204142424.jpeg'),
(15, 2, 'kemeja-pria', 'kemeja pria', 'kemeja pria warna cream', 190000, 1, 'kemeja-pria-20211204142526.jpeg'),
(16, 3, 'sandal-selop', 'sandal selop', ' sandal selop putih wanita size 37-40', 115000, 1, 'sepatu-20211204145113.jpeg'),
(17, 3, 'selop-wanita', 'selop wanita', 'sandal selop wanita warna hitam size 37-40', 150000, 1, 'selop-wanita-20211204145335.jpeg'),
(18, 3, 'sandal-kondangan', 'sandal kondangan', 'sandal buat santai dan kondangan size 37-40', 175000, 1, 'sandal-kondangan-20211204145511.jpeg'),
(19, 3, 'sepatu', 'sepatu ', 'sepatu kerja min so ah size 37-39', 250000, 1, 'sepatu-20211204145802.jpeg'),
(20, 3, 'sepatu-kerja', 'sepatu kerja', 'sepatu kerja seo dal mi size 37-40', 199500, 1, 'sepatu-kerja-20211204145927.jpeg'),
(21, 4, 'sepatu-kulit', 'sepatu kulit', 'sepatu kulit sehun exo size 39-43', 210000, 1, 'sepatu-kulit-20211204150413.jpeg'),
(22, 4, 'sepatu-pria', 'sepatu pria', 'sepatu han ji pyeoung size 38-44', 199500, 1, 'sepatu-pria-20211204150533.jpeg'),
(23, 4, 'sepatu-jefri-nichole', 'sepatu jefri nichole', 'size 39-43', 150000, 1, 'sepatu-jefri-nichole-20211204150823.jpeg'),
(24, 4, 'sepatu-do-kyungso', 'sepatu Do Kyungso', 'size 37-41', 175000, 1, 'sepatu-do-kyungso-20211204150915.jpeg'),
(25, 4, 'sepatu-zayn-malik', 'sepatu zayn malik', 'size 40-45', 200000, 1, 'sepatu-zayn-malik-20211204151032.jpeg'),
(26, 5, 'tas-mantuy', 'tas mantuy', 'tas mantuy color brown limited edition', 100000, 1, 'tas-mantuy-20211204205229.jpeg'),
(27, 5, 'tas-ransel', 'Tas Ransel', 'anggap aja tasnya lee jong suk :v', 299900, 1, 'tas-ransel-20211204205545.jpeg'),
(28, 5, 'tas-cewe-imut', 'tas cewe imut', 'warna kalem aja gusy yuk diborong :v', 150000, 1, 'tas-cewe-imut-20211204210026.jpeg'),
(29, 5, 'tas-cewe-elegan', 'tas cewe elegan', 'tas nya lucinta luna :v', 175000, 1, 'tas-cewe-elegan-20211204210158.jpeg'),
(30, 5, 'tas-slempang', 'tas slempang', 'cocok bet buat kodangan trus massukin daging muat banyak :v', 200000, 1, 'tas-slempang-20211204210355.jpeg'),
(31, 5, 'tas-cewe', 'tas cewe', 'ini si cocoknya buat belanja kepasar ya bund :v', 115000, 1, 'tas-cewe-20211204210528.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `is_active`, `image`) VALUES
(4, 'Admin', 'admin@admin.com', '$2y$10$mLyToNOtVeLG.ziTUFPpCOOGD1P8cXZJj6ufU7J74TB63qVs2JjqK', 'admin', 1, 'admin-20200315212825.png'),
(5, 'Member', 'member@member.com', '$2y$10$ghbQkKwENFZnOxWAwtgSaeDV2gcI63ZorQEQkSxqlaUlrFUMNnLpy', 'member', 1, 'member-20200315232137.png'),
(6, 'Devtrian', 'fitrianidevv11@gmail.com', '$2y$10$UBsdIKWwICnMKOnELDOTgONVv/s.zTpZAKLsaCrmBwF5K2RK4pth.', 'member', 1, 'devtrian-20211130211205.png'),
(7, 'depi', 'pemilik@gmail.com', '12345678', 'admin', 1, NULL),
(9, 'tukang_copas', 'devtrian@gmail.com', '$2y$10$lY2UVfiJsvwAs.4AxUWUL.xWtatTeWTNiSdlg.XNfKOZ2KwXrSsLm', 'member', 1, 'tukang_copas-20211204201051.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `orders_confirm`
--
ALTER TABLE `orders_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
