-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 28 Eki 2015, 18:29:13
-- Sunucu sürümü: 10.0.21-MariaDB
-- PHP Sürümü: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `filmmuhe_deck`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `anaHesap`
--

CREATE TABLE IF NOT EXISTS `anaHesap` (
  `id` int(255) NOT NULL,
  `screen_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `profilresmi` varchar(255) CHARACTER SET latin1 NOT NULL,
  `access_token` varchar(255) CHARACTER SET latin1 NOT NULL,
  `access_token_secret` varchar(255) NOT NULL,
  `acilistarihi` varchar(255) NOT NULL,
  `takipcisi` varchar(255) NOT NULL,
  `kazanilantakipci` varchar(255) NOT NULL,
  `giristarihi` varchar(255) NOT NULL,
  `kullanici` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `aktif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayarlar`
--

CREATE TABLE IF NOT EXISTS `ayarlar` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `consumer_key` varchar(255) NOT NULL,
  `consumer_secret_key` varchar(255) NOT NULL,
  `kacSaat` varchar(255) NOT NULL,
  `aktif` varchar(255) NOT NULL,
  `loginDuyuru` varchar(255) CHARACTER SET utf8 NOT NULL,
  `siteBaslik` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `emailPw` varchar(255) CHARACTER SET utf8 NOT NULL,
  `kayitOl` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Tablo döküm verisi `ayarlar`
--

INSERT INTO `ayarlar` (`id`, `consumer_key`, `consumer_secret_key`, `kacSaat`, `aktif`, `loginDuyuru`, `siteBaslik`, `email`, `emailPw`, `kayitOl`) VALUES
(1, 'TgHNMa7WZE7Cxi1JbkAMQ', 'SHy9mBMBPNj3Y17et9BF4g5XeqS4y3vkeW24PttDcY', '6', '1', 'Deckimize katılmak isteyenler iletisimgufran@gmail.com adresine mail atabilirler.', 'Boss', 'iletisimgufran@gmail.com', 'frsgtr0035', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `duyurular`
--

CREATE TABLE IF NOT EXISTS `duyurular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duyurutipi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `duyuru` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=29 ;

--
-- Tablo döküm verisi `duyurular`
--

INSERT INTO `duyurular` (`id`, `duyurutipi`, `duyuru`, `kullanici`) VALUES
(21, '1', 'RT DE SIKINTI VARDIR RT YAPMAYIN DÜZELTECEM HABER VERECEM', 'admin'),
(23, '1', 'Tüm buglar, RT yapmama sorunu hallolacak 1-2 gün içerisinde kusura bakmayın arkadaşlar.', 'admin'),
(25, '1', 'Twitter Windows Phone bizim deckin apisidir hesaplarınızdan çıkış yapmayın.', 'admin'),
(26, '3', 'Saat 18:30''a kadar benim yerime yetkili @ylmzcnblt ''tur onunla iletişime geçiniz akşam 18:30da eve gelmekteyim tüm sıkıntıları bitirecez yarın umarım.', 'admin'),
(27, '2', 'Hesap sayısı 25 / Toplam Takipçi Sayısı 880.786 Decki elimizden geldiği şekilde en yükseklere ulaştıracağız. 26.10.2015 tarihinde açıldı.	', 'admin'),
(28, '1', 'HOSTTA PROBLEM VARMIŞ HALLEDECEM BUGÜN', 'admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hesaplist`
--

CREATE TABLE IF NOT EXISTS `hesaplist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `password` text NOT NULL,
  `durum` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `kullanici` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Tablo döküm verisi `hesaplist`
--

INSERT INTO `hesaplist` (`id`, `username`, `password`, `durum`, `kullanici`) VALUES
(1, 'ttolduyala', '123147', 'yes', 'zafer'),
(2, 'retwetdeck', '123147', 'yes', 'zafer'),
(3, 'RTBayanda', '123147', 'yes', 'zafer');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Log`
--

CREATE TABLE IF NOT EXISTS `Log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tarih` varchar(255) NOT NULL,
  `icerik` varchar(255) NOT NULL,
  `islem` varchar(255) NOT NULL,
  `kullanici` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=335 ;

--
-- Tablo döküm verisi `Log`
--

INSERT INTO `Log` (`id`, `tarih`, `icerik`, `islem`, `kullanici`) VALUES
(1, '26.10.2015 17:41:15', 'https://twitter.com/gufranisback/status/658389963466264576', 'Retweet(Kredili İşlem)', 'admin'),
(2, '26.10.2015 19:33:08', 'https://twitter.com/ylmzcnblt/status/658687588048441344', 'Retweet(Kredili İşlem)', 'ylmzcnblt'),
(3, '26.10.2015 20:35:24', 'https://twitter.com/ylmzcnblt/status/658712985855246336', 'Retweet(Kredili İşlem)', 'ylmzcnblt'),
(4, '26.10.2015 20:41:10', 'https://twitter.com/johnkorey/status/657568998469586944', 'Retweet(Kredili İşlem)', 'rammstein'),
(5, '26.10.2015 20:42:02', 'https://twitter.com/johnkorey/status/657568998469586944', 'Favori(Kredili İşlem)', 'rammstein'),
(6, '26.10.2015 21:01:44', 'https://twitter.com/sirbrky/status/658672509877923840', 'Retweet(Kredili İşlem)', 'sirbrky'),
(7, '26.10.2015 21:01:53', 'https://twitter.com/sirbrky/status/658672509877923840', 'Favori(Kredili İşlem)', 'sirbrky'),
(8, '26.10.2015 21:28:26', 'https://twitter.com/eykaann/status/657602744086347776', 'Retweet(Kredili İşlem)', 'eykaann'),
(9, '26.10.2015 21:29:26', 'https://twitter.com/eykaann/status/657327567763087360', 'Retweet(Kredili İşlem)', 'eykaann'),
(10, '26.10.2015 21:29:38', 'https://twitter.com/eykaann/status/657327567763087360', 'Retweet(Kredili İşlem)', 'eykaann'),
(11, '26.10.2015 21:30:04', 'https://twitter.com/eykaann/status/657327567763087360', 'Favori(Kredili İşlem)', 'eykaann'),
(12, '26.10.2015 21:30:19', 'https://twitter.com/eykaann/status/657289867160899584', 'Retweet(Kredili İşlem)', 'eykaann'),
(13, '26.10.2015 21:30:43', 'https://twitter.com/eykaann/status/657289867160899584', 'RT(Kredisiz İşlem)', 'eykaann'),
(14, '26.10.2015 21:31:00', 'https://twitter.com/eykaann/status/657289867160899584', 'Favori(Kredili İşlem)', 'eykaann'),
(15, '26.10.2015 21:39:16', 'https://twitter.com/johnkorey/status/657893618129248256', 'Favori(Kredili İşlem)', 'RAMMSTEİN'),
(16, '26.10.2015 21:39:55', 'https://twitter.com/johnkorey/status/657893618129248256', 'Retweet(Kredili İşlem)', 'RAMMSTEİN'),
(17, '26.10.2015 21:43:21', 'https://twitter.com/konukulas/status/658730016176492545', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(18, '26.10.2015 21:53:14', 'https://twitter.com/sirbrky/status/657897999834697728', 'Retweet(Kredili İşlem)', 'sirbrky'),
(19, '26.10.2015 21:53:26', 'https://twitter.com/sirbrky/status/657897999834697728', 'Favori(Kredili İşlem)', 'sirbrky'),
(20, '26.10.2015 22:03:55', 'https://twitter.com/johnkorey/status/658289249859555328', 'Favori(Kredili İşlem)', 'RAMMSTEİN'),
(21, '26.10.2015 22:04:20', 'https://twitter.com/johnkorey/status/658289249859555328', 'Retweet(Kredili İşlem)', 'RAMMSTEİN'),
(22, '26.10.2015 22:08:16', 'https://twitter.com/ilkodun/status/656929695741661184', 'Favori(Kredili İşlem)', 'mertozkan'),
(23, '26.10.2015 22:22:41', 'https://twitter.com/johnkorey/status/658704726633091072', 'Favori(Kredili İşlem)', 'RAMMSTEİN'),
(24, '26.10.2015 22:23:16', 'https://twitter.com/johnkorey/status/658704726633091072', 'Retweet(Kredili İşlem)', 'RAMMSTEİN'),
(25, '26.10.2015 22:34:56', 'https://twitter.com/ylmzcnblt/status/658712985855246336', 'Favori(Kredili İşlem)', 'admin'),
(26, '26.10.2015 23:07:52', 'https://twitter.com/GufranIsBack/status/657963853880410112', 'Retweet(Kredili İşlem)', 'admin'),
(27, '26.10.2015 23:08:01', 'https://twitter.com/GufranIsBack/status/657963853880410112', 'Retweet(Kredili İşlem)', 'admin'),
(28, '26.10.2015 23:14:38', 'https://twitter.com/GufranIsBack/status/657963853880410112', 'Retweet(Kredili İşlem)', 'admin'),
(29, '26.10.2015 23:15:01', 'https://twitter.com/GufranIsBack/status/658753703546126336', 'Retweet(Kredili İşlem)', 'admin'),
(30, '26.10.2015 23:28:26', 'https://twitter.com/ylmzcnblt/status/658753037612294144', 'Retweet(Kredili İşlem)', 'admin'),
(31, '26.10.2015 23:28:34', 'https://twitter.com/ylmzcnblt/status/658753037612294144', 'Favori(Kredili İşlem)', 'admin'),
(32, '26.10.2015 23:32:24', 'https://twitter.com/Mertcanbeyy/status/658757872411635712', 'Retweet(Kredili İşlem)', 'Sakaryaspor'),
(33, '26.10.2015 23:37:09', 'https://twitter.com/Mertcanbeyy/status/658757872411635712', 'Favori(Kredili İşlem)', 'Sakaryaspor'),
(34, '26.10.2015 23:44:28', 'https://twitter.com/Mertcanbeyy/status/658757872411635712', 'Retweet(Kredili İşlem)', 'admin'),
(35, '26.10.2015 23:53:52', 'https://twitter.com/gufrankandemir/status/657678975293067265', 'Retweet(Kredili İşlem)', 'Gufran'),
(36, '26.10.2015 23:54:14', 'https://twitter.com/gufrankandemir/status/657678975293067265', 'Favori(Kredili İşlem)', 'Gufran'),
(37, '27.10.2015 00:51:37', 'https://twitter.com/ylmzcnblt/status/658753037612294144', 'Retweet(Kredili İşlem)', 'admin'),
(38, '27.10.2015 02:01:17', 'https://twitter.com/Mleugurlu/status/658791769988026368', 'Retweet(Kredili İşlem)', 'admin'),
(39, '27.10.2015 02:58:16', 'https://twitter.com/eykaann/status/658809724377432064', 'Retweet(Kredili İşlem)', 'eykaann'),
(40, '27.10.2015 02:58:27', 'https://twitter.com/eykaann/status/658809724377432064', 'Favori(Kredili İşlem)', 'eykaann'),
(41, '27.10.2015 02:58:40', 'https://twitter.com/eykaann/status/658809724377432064', 'Favori(Kredili İşlem)', 'eykaann'),
(42, '27.10.2015 04:21:26', 'https://twitter.com/konukulas/status/658830785991024640', 'Favori(Kredili İşlem)', 'crazybombermam'),
(43, '27.10.2015 04:22:24', 'https://twitter.com/konukulas/status/658830785991024640', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(44, '27.10.2015 04:23:10', 'https://twitter.com/konukulas/status/658830785991024640', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(45, '27.10.2015 06:17:14', 'https://twitter.com/konukulas/status/658859582018691072', 'Favori(Kredili İşlem)', 'crazybombermam'),
(46, '27.10.2015 06:17:40', 'https://twitter.com/konukulas/status/658859582018691072', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(47, '27.10.2015 06:19:35', 'https://twitter.com/konukulas/status/658860482569326592', 'Favori(Kredili İşlem)', 'crazybombermam'),
(48, '27.10.2015 06:19:55', 'https://twitter.com/konukulas/status/658860482569326592', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(49, '27.10.2015 06:21:08', 'https://twitter.com/konukulas/status/658860482569326592', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(50, '27.10.2015 14:35:33', 'https://twitter.com/eykaann/status/658985188832186368', 'Retweet(Kredili İşlem)', 'eykaann'),
(51, '27.10.2015 14:35:44', 'https://twitter.com/eykaann/status/658985188832186368', 'Favori(Kredili İşlem)', 'eykaann'),
(52, '27.10.2015 17:49:42', 'https://twitter.com/sirbrky/status/659031870785638400', 'Favori(Kredili İşlem)', 'sirbrky'),
(53, '27.10.2015 17:50:16', 'https://twitter.com/sirbrky/status/659031870785638400', 'Retweet(Kredili İşlem)', 'sirbrky'),
(54, '27.10.2015 18:18:11', 'https://twitter.com/GufranIsBack/status/658389963466264576', 'Retweet(Kredili İşlem)', 'admin'),
(55, '27.10.2015 18:23:05', 'https://twitter.com/GufranIsBack/status/658389963466264576', 'Favori(Kredili İşlem)', 'admin'),
(56, '27.10.2015 18:26:34', 'https://twitter.com/_ZaferSahin/status/659043265354858497', 'Retweet(Kredili İşlem)', 'zafer'),
(57, '27.10.2015 18:26:56', 'https://twitter.com/_ZaferSahin/status/659043265354858497', 'Favori(Kredili İşlem)', 'zafer'),
(58, '27.10.2015 18:31:49', 'https://twitter.com/ylmzcnblt/status/659038689079795712', 'Retweet(Kredili İşlem)', 'admin'),
(59, '27.10.2015 18:32:12', 'https://twitter.com/ylmzcnblt/status/659038689079795712', 'Retweet(Kredili İşlem)', 'admin'),
(60, '27.10.2015 18:35:21', 'https://twitter.com/ylmzcnblt/status/659045612718006274', 'Retweet(Kredili İşlem)', 'admin'),
(61, '27.10.2015 18:40:07', 'https://twitter.com/cakiremre17/status/659016830212808705', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(62, '27.10.2015 18:41:38', 'https://twitter.com/GufranIsBack/status/659045393272061952', 'Retweet(Kredili İşlem)', 'admin'),
(63, '27.10.2015 18:41:47', 'https://twitter.com/GufranIsBack/status/659045393272061952', 'Favori(Kredili İşlem)', 'admin'),
(64, '27.10.2015 18:41:51', 'https://twitter.com/cakiremre17/status/659016830212808705', 'Favori(Kredili İşlem)', 'cakiremre17'),
(65, '27.10.2015 18:42:17', 'https://twitter.com/cakiremre17/status/659031299081007104', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(66, '27.10.2015 18:42:35', 'https://twitter.com/cakiremre17/status/659031299081007104', 'Favori(Kredili İşlem)', 'cakiremre17'),
(67, '27.10.2015 18:46:03', 'https://twitter.com/johnkorey/status/658289249859555328 ', 'Favori(Kredili İşlem)', 'rammstein'),
(68, '27.10.2015 18:46:31', 'https://twitter.com/johnkorey/status/658289249859555328 ', 'Retweet(Kredili İşlem)', 'rammstein'),
(69, '27.10.2015 18:47:35', 'https://twitter.com/johnkorey/status/658289249859555328 ', 'Retweet(Kredili İşlem)', 'rammstein'),
(70, '27.10.2015 18:54:27', 'https://twitter.com/konukulas/status/659050046600691712', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(71, '27.10.2015 18:54:38', 'https://twitter.com/konukulas/status/659050046600691712', 'Favori(Kredili İşlem)', 'crazybombermam'),
(72, '27.10.2015 18:55:39', 'https://twitter.com/_ZaferSahin/status/659050766854963200', 'Favori(Kredili İşlem)', 'zafer'),
(73, '27.10.2015 18:55:44', 'https://twitter.com/konukulas/status/659050336691294208', 'Favori(Kredili İşlem)', 'crazybombermam'),
(74, '27.10.2015 18:55:45', 'https://twitter.com/_ZaferSahin/status/659050766854963200', 'Retweet(Kredili İşlem)', 'zafer'),
(75, '27.10.2015 18:55:55', 'https://twitter.com/konukulas/status/659050336691294208', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(76, '27.10.2015 18:57:19', 'https://twitter.com/konukulas/status/604739964153278464', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(77, '27.10.2015 18:57:34', 'https://twitter.com/konukulas/status/604739964153278464', 'Favori(Kredili İşlem)', 'crazybombermam'),
(78, '27.10.2015 19:04:06', 'https://twitter.com/johnkorey/status/658704726633091072', 'Retweet(Kredili İşlem)', 'rammstein'),
(79, '27.10.2015 19:06:07', 'https://twitter.com/johnkorey/status/658289249859555328', 'Retweet(Kredili İşlem)', 'rammstein'),
(80, '27.10.2015 19:13:29', 'https://twitter.com/johnkorey/status/657893618129248256', 'Retweet(Kredili İşlem)', 'rammstein'),
(81, '27.10.2015 19:21:42', 'https://twitter.com/misssarikartal/status/659051397355327489', 'Retweet(Kredili İşlem)', 'misssari'),
(82, '27.10.2015 19:21:54', 'https://twitter.com/misssarikartal/status/659051397355327489', 'Favori(Kredili İşlem)', 'misssari'),
(83, '27.10.2015 19:22:26', 'https://twitter.com/misssarikartal/status/658985831252795394', 'Retweet(Kredili İşlem)', 'misssari'),
(84, '27.10.2015 19:22:36', 'https://twitter.com/misssarikartal/status/658985831252795394', 'Retweet(Kredili İşlem)', 'misssari'),
(85, '27.10.2015 19:25:33', 'https://twitter.com/cakiremre17/status/656170924325150720', 'Retweet(Kredili İşlem)', 'admin'),
(86, '27.10.2015 19:27:43', 'https://twitter.com/cakiremre17/status/659054279660015616', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(87, '27.10.2015 19:28:21', 'https://twitter.com/cakiremre17/status/659054279660015616', 'Favori(Kredili İşlem)', 'cakiremre17'),
(88, '27.10.2015 19:50:38', 'https://twitter.com/cakiremre17/status/653636731703590912', 'Favori(Kredili İşlem)', 'cakiremre17'),
(89, '27.10.2015 19:50:51', 'https://twitter.com/cakiremre17/status/653636731703590912', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(90, '27.10.2015 19:51:11', 'https://twitter.com/GufranIsBack/status/659064778225274881', 'Retweet(Kredili İşlem)', 'admin'),
(91, '27.10.2015 19:52:12', 'https://twitter.com/misssarikartal/status/659061363654926336', 'Retweet(Kredili İşlem)', 'misssari'),
(92, '27.10.2015 19:52:21', 'https://twitter.com/misssarikartal/status/659061363654926336', 'Favori(Kredili İşlem)', 'misssari'),
(93, '27.10.2015 19:52:50', 'https://twitter.com/misssarikartal/status/523056227111432192', 'Favori(Kredili İşlem)', 'misssari'),
(94, '27.10.2015 19:57:31', 'https://twitter.com/MissSariKartaL/status/659061363654926336', 'Retweet(Kredili İşlem)', 'admin'),
(95, '27.10.2015 19:57:44', 'https://twitter.com/MissSariKartaL/status/659061363654926336', 'Favori(Kredili İşlem)', 'admin'),
(96, '27.10.2015 19:58:25', 'https://twitter.com/MissSariKartaL/status/659061363654926336', 'Retweet(Kredili İşlem)', 'admin'),
(97, '27.10.2015 19:58:30', 'https://twitter.com/MissSariKartaL/status/659061363654926336', 'Retweet(Kredili İşlem)', 'admin'),
(98, '27.10.2015 19:58:34', 'https://twitter.com/eykaann/status/659066530332844033', 'Retweet(Kredili İşlem)', 'eykaann'),
(99, '27.10.2015 19:59:14', 'https://twitter.com/eykaann/status/659066530332844033', 'Retweet(Kredili İşlem)', 'eykaann'),
(100, '27.10.2015 19:59:27', 'https://twitter.com/eykaann/status/659066530332844033', 'Retweet(Kredili İşlem)', 'eykaann'),
(101, '27.10.2015 19:59:36', 'https://twitter.com/eykaann/status/659066530332844033', 'Favori(Kredili İşlem)', 'eykaann'),
(102, '27.10.2015 20:03:02', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(103, '27.10.2015 20:03:30', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(104, '27.10.2015 20:04:02', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(105, '27.10.2015 20:04:12', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(106, '27.10.2015 20:04:16', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(107, '27.10.2015 20:04:20', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(108, '27.10.2015 20:04:25', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(109, '27.10.2015 20:04:31', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(110, '27.10.2015 20:04:38', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(111, '27.10.2015 20:04:43', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(112, '27.10.2015 20:04:49', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(113, '27.10.2015 20:05:02', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(114, '27.10.2015 20:07:24', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(115, '27.10.2015 20:07:32', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Favori(Kredili İşlem)', 'admin'),
(116, '27.10.2015 20:08:44', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(117, '27.10.2015 20:08:59', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(118, '27.10.2015 20:10:03', 'https://twitter.com/yahyacandede/status/659069153773551616', 'Retweet(Kredili İşlem)', 'candede'),
(119, '27.10.2015 20:10:19', 'https://twitter.com/yahyacandede/status/659069153773551616', 'Retweet(Kredili İşlem)', 'candede'),
(120, '27.10.2015 20:10:31', 'https://twitter.com/yahyacandede/status/659069153773551616', 'Favori(Kredili İşlem)', 'candede'),
(121, '27.10.2015 20:10:56', 'https://twitter.com/yahyacandede/status/659069153773551616', 'Retweet(Kredili İşlem)', 'candede'),
(122, '27.10.2015 20:13:07', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(123, '27.10.2015 20:13:10', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(124, '27.10.2015 20:13:24', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(125, '27.10.2015 20:13:29', 'https://twitter.com/ylmzcnblt/status/659067631325085696', 'Retweet(Kredili İşlem)', 'admin'),
(126, '27.10.2015 20:14:22', 'https://twitter.com/yahyacandede/status/659070606315507712', 'Retweet(Kredili İşlem)', 'candede'),
(127, '27.10.2015 20:14:26', 'https://twitter.com/yahyacandede/status/659070606315507712', 'Favori(Kredili İşlem)', 'candede'),
(128, '27.10.2015 20:17:35', 'https://twitter.com/yahyacandede/status/659070606315507712', 'Retweet(Kredili İşlem)', 'candede'),
(129, '27.10.2015 20:22:26', 'https://twitter.com/johnkorey/status/659059426859614208', 'Favori(Kredili İşlem)', 'rammstein'),
(130, '27.10.2015 20:23:02', 'https://twitter.com/johnkorey/status/659059426859614208', 'Retweet(Kredili İşlem)', 'rammstein'),
(131, '27.10.2015 20:29:27', 'https://twitter.com/cakiremre17/status/659067981239029760', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(132, '27.10.2015 20:29:52', 'https://twitter.com/cakiremre17/status/659067981239029760', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(133, '27.10.2015 20:29:57', 'https://twitter.com/konukulas/status/659073974672977920', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(134, '27.10.2015 20:30:04', 'https://twitter.com/konukulas/status/659073974672977920', 'Favori(Kredili İşlem)', 'crazybombermam'),
(135, '27.10.2015 20:30:19', 'https://twitter.com/cakiremre17/status/659067981239029760', 'Favori(Kredili İşlem)', 'cakiremre17'),
(136, '27.10.2015 20:30:26', 'https://twitter.com/konukulas/status/659073974672977920', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(137, '27.10.2015 20:30:32', 'https://twitter.com/cakiremre17/status/659067981239029760', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(138, '27.10.2015 20:30:59', 'https://twitter.com/cakiremre17/status/659067981239029760', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(139, '27.10.2015 20:31:20', 'https://twitter.com/konukulas/status/659073974672977920', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(140, '27.10.2015 20:31:34', 'https://twitter.com/konukulas/status/659073974672977920', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(141, '27.10.2015 20:31:57', 'https://twitter.com/konukulas/status/659074056541622273', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(142, '27.10.2015 20:32:31', 'https://twitter.com/konukulas/status/659074056541622273', 'Favori(Kredili İşlem)', 'crazybombermam'),
(143, '27.10.2015 20:35:43', 'https://twitter.com/konukulas/status/659074173269078016', 'Favori(Kredili İşlem)', 'crazybombermam'),
(144, '27.10.2015 20:36:06', 'https://twitter.com/konukulas/status/659074173269078016', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(145, '27.10.2015 20:36:10', 'https://twitter.com/GufranIsBack/status/659069767995793408', 'Retweet(Kredili İşlem)', 'admin'),
(146, '27.10.2015 20:36:42', 'https://twitter.com/konukulas/status/659074173269078016', 'Favori(Kredili İşlem)', 'crazybombermam'),
(147, '27.10.2015 20:36:46', 'https://twitter.com/GufranIsBack/status/659076253492858880', 'Retweet(Kredili İşlem)', 'admin'),
(148, '27.10.2015 20:37:34', 'https://twitter.com/konukulas/status/659074267968073729', 'Favori(Kredili İşlem)', 'crazybombermam'),
(149, '27.10.2015 20:39:18', 'https://twitter.com/yahyacandede/status/659076731542904832', 'Retweet(Kredili İşlem)', 'candede'),
(150, '27.10.2015 20:39:33', 'https://twitter.com/yahyacandede/status/659076731542904832', 'Favori(Kredili İşlem)', 'candede'),
(151, '27.10.2015 20:39:40', 'https://twitter.com/konukulas/status/659074362033754113', 'Favori(Kredili İşlem)', 'crazybombermam'),
(152, '27.10.2015 20:40:25', 'https://twitter.com/GufranIsBack/status/659077161299681280', 'Retweet(Kredili İşlem)', 'admin'),
(153, '27.10.2015 20:42:35', 'https://twitter.com/cakiremre17/status/658306672906129408', 'Retweet(Kredili İşlem)', 'cakiremre17'),
(154, '27.10.2015 20:42:40', 'https://twitter.com/cakiremre17/status/658306672906129408', 'Favori(Kredili İşlem)', 'cakiremre17'),
(155, '27.10.2015 20:42:54', 'https://twitter.com/cakiremre17/status/658704912033951744', 'Favori(Kredili İşlem)', 'cakiremre17'),
(156, '27.10.2015 20:43:01', 'https://twitter.com/cakiremre17/status/658693928066162688', 'Favori(Kredili İşlem)', 'cakiremre17'),
(157, '27.10.2015 20:43:15', 'https://twitter.com/GufranIsBack/status/659077777505832960', 'Favori(Kredili İşlem)', 'admin'),
(158, '27.10.2015 20:43:25', 'https://twitter.com/GufranIsBack/status/659077777505832960', 'Retweet(Kredili İşlem)', 'admin'),
(159, '27.10.2015 20:47:40', 'https://twitter.com/GufranIsBack/status/659079001458262026', 'Retweet(Kredili İşlem)', 'admin'),
(160, '27.10.2015 20:52:43', 'https://twitter.com/yahyacandede/status/659080216908800000', 'Retweet(Kredili İşlem)', 'candede'),
(161, '27.10.2015 20:52:54', 'https://twitter.com/yahyacandede/status/659080216908800000', 'Favori(Kredili İşlem)', 'candede'),
(162, '27.10.2015 21:06:23', 'https://twitter.com/yahyacandede/status/659083696432152576', 'Retweet(Kredili İşlem)', 'candede'),
(163, '27.10.2015 21:06:32', 'https://twitter.com/yahyacandede/status/659083696432152576', 'Retweet(Kredili İşlem)', 'candede'),
(164, '27.10.2015 21:06:39', 'https://twitter.com/yahyacandede/status/659083696432152576', 'Retweet(Kredili İşlem)', 'candede'),
(165, '27.10.2015 21:06:44', 'https://twitter.com/yahyacandede/status/659083696432152576', 'Retweet(Kredili İşlem)', 'candede'),
(166, '27.10.2015 21:06:52', 'https://twitter.com/yahyacandede/status/659083696432152576', 'Favori(Kredili İşlem)', 'candede'),
(167, '27.10.2015 21:06:58', 'https://twitter.com/yahyacandede/status/659083696432152576', 'Retweet(Kredili İşlem)', 'candede'),
(168, '27.10.2015 21:09:28', 'https://twitter.com/yahyacandede/status/659084307554836485', 'Favori(Kredili İşlem)', 'candede'),
(169, '27.10.2015 21:09:41', 'https://twitter.com/yahyacandede/status/659084307554836485', 'Retweet(Kredili İşlem)', 'candede'),
(170, '27.10.2015 21:28:42', 'https://twitter.com/gufrankandemir/status/655145461528043520', 'Retweet(Kredili İşlem)', 'gufran'),
(171, '27.10.2015 21:54:19', 'https://twitter.com/AhmetKursatK/status/659049222503837696', 'Favori(Kredili İşlem)', 'ahmetkursatk'),
(172, '27.10.2015 22:00:33', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Retweet(Kredili İşlem)', 'admin'),
(173, '27.10.2015 22:00:53', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Retweet(Kredili İşlem)', 'admin'),
(174, '27.10.2015 22:01:00', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Retweet(Kredili İşlem)', 'admin'),
(175, '27.10.2015 22:01:10', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Retweet(Kredili İşlem)', 'admin'),
(176, '27.10.2015 22:01:20', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Favori(Kredili İşlem)', 'admin'),
(177, '27.10.2015 22:01:29', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Retweet(Kredili İşlem)', 'admin'),
(178, '27.10.2015 22:08:27', 'https://twitter.com/GufranIsBack/status/659099330603798528', 'Retweet(Kredili İşlem)', 'admin'),
(179, '27.10.2015 22:08:39', 'https://twitter.com/GufranIsBack/status/659099330603798528', 'Retweet(Kredili İşlem)', 'admin'),
(180, '27.10.2015 22:28:37', 'https://twitter.com/misssarikartal/status/658205805573984256', 'Retweet(Kredili İşlem)', 'misssari'),
(181, '27.10.2015 22:28:44', 'https://twitter.com/misssarikartal/status/658205805573984256', 'Favori(Kredili İşlem)', 'misssari'),
(182, '27.10.2015 22:29:52', 'https://twitter.com/misssarikartal/status/654742451895169025', 'Retweet(Kredili İşlem)', 'misssari'),
(183, '27.10.2015 22:30:05', 'https://twitter.com/misssarikartal/status/654742451895169025', 'Favori(Kredili İşlem)', 'misssari'),
(184, '27.10.2015 22:34:35', 'https://twitter.com/misssarikartal/status/659105674593476609', 'Retweet(Kredili İşlem)', 'misssari'),
(185, '27.10.2015 22:34:43', 'https://twitter.com/misssarikartal/status/659105674593476609', 'Favori(Kredili İşlem)', 'misssari'),
(186, '27.10.2015 22:46:51', 'https://twitter.com/misssarikartal/status/657250570256953345', 'Retweet(Kredili İşlem)', 'misssari'),
(187, '27.10.2015 22:46:57', 'https://twitter.com/misssarikartal/status/657250570256953345', 'Retweet(Kredili İşlem)', 'misssari'),
(188, '27.10.2015 22:47:26', 'https://twitter.com/misssarikartal/status/657152623875895296', 'Retweet(Kredili İşlem)', 'misssari'),
(189, '27.10.2015 22:47:32', 'https://twitter.com/misssarikartal/status/657152623875895296', 'Favori(Kredili İşlem)', 'misssari'),
(190, '27.10.2015 22:48:27', 'https://twitter.com/misssarikartal/status/657138619451363328', 'Retweet(Kredili İşlem)', 'misssari'),
(191, '27.10.2015 22:48:38', 'https://twitter.com/misssarikartal/status/657138619451363328', 'Favori(Kredili İşlem)', 'misssari'),
(192, '27.10.2015 22:50:01', 'https://twitter.com/misssarikartal/status/658942110788374528', 'Favori(Kredili İşlem)', 'misssari'),
(193, '27.10.2015 22:50:35', 'https://twitter.com/misssarikartal/status/658873823178174464', 'Favori(Kredili İşlem)', 'misssari'),
(194, '27.10.2015 23:07:02', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Retweet(Kredili İşlem)', 'admin'),
(195, '27.10.2015 23:07:19', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Retweet(Kredili İşlem)', 'admin'),
(196, '27.10.2015 23:07:27', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Retweet(Kredili İşlem)', 'admin'),
(197, '27.10.2015 23:08:24', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Retweet(Kredili İşlem)', 'admin'),
(198, '27.10.2015 23:08:41', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Retweet(Kredili İşlem)', 'admin'),
(199, '27.10.2015 23:08:45', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Retweet(Kredili İşlem)', 'admin'),
(200, '27.10.2015 23:08:53', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Favori(Kredili İşlem)', 'admin'),
(201, '27.10.2015 23:08:53', 'https://twitter.com/GufranIsBack/status/659097323709014016', 'Retweet(Kredili İşlem)', 'admin'),
(202, '27.10.2015 23:09:39', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Retweet(Kredili İşlem)', 'admin'),
(203, '27.10.2015 23:09:46', 'https://twitter.com/ylmzcnblt/status/609732677768491010', 'Retweet(Kredili İşlem)', 'admin'),
(204, '27.10.2015 23:18:29', 'https://twitter.com/AhmetKursatK/status/659116773078409217', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(205, '27.10.2015 23:18:40', 'https://twitter.com/AhmetKursatK/status/659116773078409217', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(206, '27.10.2015 23:18:54', 'https://twitter.com/AhmetKursatK/status/659116773078409217', 'Favori(Kredili İşlem)', 'ahmetkursatk'),
(207, '27.10.2015 23:32:24', 'https://twitter.com/AnkaraninBeyi/status/658391192334409729', 'Retweet(Kredili İşlem)', 'ankaraninbeyi'),
(208, '27.10.2015 23:33:37', 'https://twitter.com/gufrankandemir/status/659120726755164160', 'Retweet(Kredili İşlem)', 'admin'),
(209, '27.10.2015 23:33:48', 'https://twitter.com/gufrankandemir/status/659120726755164160', 'Favori(Kredili İşlem)', 'admin'),
(210, '27.10.2015 23:54:14', 'https://twitter.com/gufrankandemir/status/657682540199825409', 'Favori(Kredili İşlem)', 'admin'),
(211, '27.10.2015 23:54:37', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(212, '27.10.2015 23:54:51', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(213, '27.10.2015 23:54:54', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(214, '27.10.2015 23:54:58', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(215, '27.10.2015 23:55:07', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(216, '27.10.2015 23:55:11', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(217, '27.10.2015 23:55:14', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(218, '27.10.2015 23:55:19', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(219, '27.10.2015 23:55:23', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(220, '27.10.2015 23:55:31', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(221, '27.10.2015 23:55:34', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(222, '27.10.2015 23:55:37', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(223, '27.10.2015 23:55:40', 'https://twitter.com/GufranIsBack/status/659125283442835456', 'Retweet(Kredili İşlem)', 'admin'),
(224, '27.10.2015 23:59:33', 'https://twitter.com/sananeyaaq/status/638302555647426560', 'Retweet(Kredili İşlem)', 'PATRON'),
(225, '27.10.2015 23:59:41', 'https://twitter.com/sananeyaaq/status/638302555647426560', 'Favori(Kredili İşlem)', 'PATRON'),
(226, '28.10.2015 01:04:12', 'https://twitter.com/eykaann/status/653309256410755073', 'Retweet(Kredili İşlem)', 'eykaann'),
(227, '28.10.2015 02:53:01', 'https://twitter.com/ylmzcnblt/status/659170747605254144', 'Retweet(Kredili İşlem)', 'admin'),
(228, '28.10.2015 02:53:05', 'https://twitter.com/ylmzcnblt/status/659170747605254144', 'Retweet(Kredili İşlem)', 'admin'),
(229, '28.10.2015 02:53:07', 'https://twitter.com/ylmzcnblt/status/659170747605254144', 'Retweet(Kredili İşlem)', 'admin'),
(230, '28.10.2015 02:53:29', 'https://twitter.com/ylmzcnblt/status/659170747605254144', 'Favori(Kredili İşlem)', 'admin'),
(231, '28.10.2015 02:53:36', 'https://twitter.com/ylmzcnblt/status/659170747605254144', 'Retweet(Kredili İşlem)', 'admin'),
(232, '28.10.2015 02:53:44', 'https://twitter.com/ylmzcnblt/status/659170747605254144', 'Retweet(Kredili İşlem)', 'admin'),
(233, '28.10.2015 02:53:47', 'https://twitter.com/ylmzcnblt/status/659170747605254144', 'Retweet(Kredili İşlem)', 'admin'),
(234, '28.10.2015 04:04:04', 'https://twitter.com/konukulas/status/659188512726654976', 'Favori(Kredili İşlem)', 'crazybombermam'),
(235, '28.10.2015 04:04:12', 'https://twitter.com/konukulas/status/659188512726654976', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(236, '28.10.2015 04:10:09', 'https://twitter.com/konukulas/status/659190274246184960', 'Favori(Kredili İşlem)', 'crazybombermam'),
(237, '28.10.2015 04:11:17', 'https://twitter.com/konukulas/status/659190274246184960', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(238, '28.10.2015 06:45:43', 'https://twitter.com/ylmzcnblt/status/659229415575060480', 'Retweet(Kredili İşlem)', 'admin'),
(239, '28.10.2015 06:46:10', 'https://twitter.com/ylmzcnblt/status/659229415575060480', 'Retweet(Kredili İşlem)', 'admin'),
(240, '28.10.2015 06:48:50', 'https://twitter.com/ylmzcnblt/status/659229415575060480', 'Retweet(Kredili İşlem)', 'admin'),
(241, '28.10.2015 06:54:18', 'https://twitter.com/konukulas/status/659231540883361792', 'Favori(Kredili İşlem)', 'crazybombermam'),
(242, '28.10.2015 06:54:54', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(243, '28.10.2015 07:06:38', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(244, '28.10.2015 07:06:39', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(245, '28.10.2015 07:06:41', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(246, '28.10.2015 07:06:43', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(247, '28.10.2015 07:06:44', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(248, '28.10.2015 07:06:46', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(249, '28.10.2015 07:06:47', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(250, '28.10.2015 07:06:49', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(251, '28.10.2015 07:06:50', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(252, '28.10.2015 07:06:53', 'https://twitter.com/konukulas/status/659231540883361792', 'Retweet(Kredili İşlem)', 'crazybombermam'),
(253, '28.10.2015 07:06:54', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(254, '28.10.2015 07:06:55', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(255, '28.10.2015 07:06:57', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(256, '28.10.2015 07:06:58', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(257, '28.10.2015 07:07:00', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(258, '28.10.2015 07:07:01', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(259, '28.10.2015 07:07:03', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(260, '28.10.2015 07:07:04', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(261, '28.10.2015 07:07:06', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(262, '28.10.2015 07:07:07', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(263, '28.10.2015 07:07:08', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(264, '28.10.2015 07:07:10', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(265, '28.10.2015 07:07:11', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(266, '28.10.2015 07:07:13', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(267, '28.10.2015 07:07:14', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(268, '28.10.2015 07:07:15', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(269, '28.10.2015 07:07:17', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(270, '28.10.2015 07:07:18', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(271, '28.10.2015 07:07:20', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(272, '28.10.2015 07:07:21', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(273, '28.10.2015 07:07:22', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(274, '28.10.2015 07:07:25', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(275, '28.10.2015 07:07:29', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(276, '28.10.2015 07:07:31', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(277, '28.10.2015 07:07:32', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(278, '28.10.2015 07:07:33', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(279, '28.10.2015 07:07:35', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(280, '28.10.2015 07:07:36', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(281, '28.10.2015 07:07:38', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(282, '28.10.2015 07:07:39', 'https://twitter.com/konukulas/status/659231540883361792', 'RT(Kredisiz İşlem)', 'crazybombermam'),
(283, '28.10.2015 08:37:17', 'https://twitter.com/misssarikartal/status/659257112988635136', 'Retweet(Kredili İşlem)', 'misssari'),
(284, '28.10.2015 08:37:22', 'https://twitter.com/misssarikartal/status/659257112988635136', 'Favori(Kredili İşlem)', 'misssari'),
(285, '28.10.2015 09:08:02', 'https://twitter.com/yahyacandede/status/659265150508244992', 'Retweet(Kredili İşlem)', 'Candede'),
(286, '28.10.2015 09:08:09', 'https://twitter.com/yahyacandede/status/659265150508244992', 'Favori(Kredili İşlem)', 'Candede'),
(287, '28.10.2015 09:50:39', 'https://twitter.com/yahyacandede/status/659275806527606784', 'Retweet(Kredili İşlem)', 'Candede'),
(288, '28.10.2015 09:50:45', 'https://twitter.com/yahyacandede/status/659275806527606784', 'Favori(Kredili İşlem)', 'Candede'),
(289, '28.10.2015 12:24:45', 'https://twitter.com/sirbrky/status/659313556769361921', 'Favori(Kredili İşlem)', 'sirbrky'),
(290, '28.10.2015 12:25:04', 'https://twitter.com/sirbrky/status/659313556769361921', 'Retweet(Kredili İşlem)', 'sirbrky'),
(291, '28.10.2015 12:28:57', 'https://twitter.com/misssarikartal/status/659315133324333056', 'Retweet(Kredili İşlem)', 'misssari'),
(292, '28.10.2015 12:29:04', 'https://twitter.com/misssarikartal/status/659315133324333056', 'Favori(Kredili İşlem)', 'misssari'),
(293, '28.10.2015 12:35:10', 'https://twitter.com/AnkaraninBeyi/status/658927229053882368', 'Retweet(Kredili İşlem)', 'ankaraninbeyi'),
(294, '28.10.2015 12:35:28', 'https://twitter.com/AnkaraninBeyi/status/658927229053882368', 'Retweet(Kredili İşlem)', 'ankaraninbeyi'),
(295, '28.10.2015 12:56:07', 'https://twitter.com/_ZaferSahin/status/659322374312042497', 'Favori(Kredili İşlem)', 'zafer'),
(296, '28.10.2015 12:56:23', 'https://twitter.com/_ZaferSahin/status/659322374312042497', 'Retweet(Kredili İşlem)', 'zafer'),
(297, '28.10.2015 13:05:45', 'https://twitter.com/AhmetKursatK/status/659322257781706752', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(298, '28.10.2015 13:05:57', 'https://twitter.com/AhmetKursatK/status/659322257781706752', 'Favori(Kredili İşlem)', 'ahmetkursatk'),
(299, '28.10.2015 13:06:16', 'https://twitter.com/AhmetKursatK/status/659322257781706752', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(300, '28.10.2015 13:23:23', 'https://twitter.com/AhmetKursatK/status/659327609004761088', 'Favori(Kredili İşlem)', 'ahmetkursatk'),
(301, '28.10.2015 14:06:12', 'https://twitter.com/misssarikartal/status/659339622938517508', 'Retweet(Kredili İşlem)', 'misssari'),
(302, '28.10.2015 14:06:21', 'https://twitter.com/misssarikartal/status/659339622938517508', 'Favori(Kredili İşlem)', 'misssari'),
(303, '28.10.2015 14:40:46', 'https://twitter.com/misssarikartal/status/659347474998542338', 'Retweet(Kredili İşlem)', 'misssari'),
(304, '28.10.2015 14:40:54', 'https://twitter.com/misssarikartal/status/659347474998542338', 'Favori(Kredili İşlem)', 'misssari'),
(305, '28.10.2015 15:10:59', 'https://twitter.com/eykaann/status/659356523534155776', 'Retweet(Kredili İşlem)', 'eykaann'),
(306, '28.10.2015 15:25:50', 'https://twitter.com/_ZaferSahin/status/659359816930996224', 'Retweet(Kredili İşlem)', 'zafer'),
(307, '28.10.2015 15:26:12', 'https://twitter.com/_ZaferSahin/status/659359816930996224', 'Retweet(Kredili İşlem)', 'zafer'),
(308, '28.10.2015 15:26:26', 'https://twitter.com/_ZaferSahin/status/659359816930996224', 'Favori(Kredili İşlem)', 'zafer'),
(309, '28.10.2015 15:26:36', 'https://twitter.com/_ZaferSahin/status/659359816930996224', 'Retweet(Kredili İşlem)', 'zafer'),
(310, '28.10.2015 16:33:34', 'https://twitter.com/misssarikartal/status/659377151435784192', 'Retweet(Kredili İşlem)', 'misssari'),
(311, '28.10.2015 16:33:42', 'https://twitter.com/misssarikartal/status/659377151435784192', 'Favori(Kredili İşlem)', 'misssari'),
(312, '28.10.2015 16:58:30', 'https://twitter.com/sirbrky/status/659382653460860928', 'Favori(Kredili İşlem)', 'sirbrky'),
(313, '28.10.2015 17:39:44', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Retweet(Kredili İşlem)', 'candede'),
(314, '28.10.2015 17:39:49', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Favori(Kredili İşlem)', 'candede'),
(315, '28.10.2015 17:40:10', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Retweet(Kredili İşlem)', 'candede'),
(316, '28.10.2015 17:40:16', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Retweet(Kredili İşlem)', 'candede'),
(317, '28.10.2015 17:40:22', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Retweet(Kredili İşlem)', 'candede'),
(318, '28.10.2015 17:40:29', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Retweet(Kredili İşlem)', 'candede'),
(319, '28.10.2015 17:40:36', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Retweet(Kredili İşlem)', 'candede'),
(320, '28.10.2015 17:40:53', 'https://twitter.com/yahyacandede/status/659393989490122752', 'Retweet(Kredili İşlem)', 'candede'),
(321, '28.10.2015 17:52:24', 'https://twitter.com/yahyacandede/status/659397213412573184', 'Retweet(Kredili İşlem)', 'candede'),
(322, '28.10.2015 17:52:30', 'https://twitter.com/yahyacandede/status/659397213412573184', 'Retweet(Kredili İşlem)', 'candede'),
(323, '28.10.2015 17:52:36', 'https://twitter.com/yahyacandede/status/659397213412573184', 'Favori(Kredili İşlem)', 'candede'),
(324, '28.10.2015 17:52:53', 'https://twitter.com/yahyacandede/status/659397213412573184', 'Retweet(Kredili İşlem)', 'candede'),
(325, '28.10.2015 17:53:03', 'https://twitter.com/yahyacandede/status/659397213412573184', 'Favori(Kredili İşlem)', 'candede'),
(326, '28.10.2015 17:53:17', 'https://twitter.com/yahyacandede/status/659397213412573184', 'Retweet(Kredili İşlem)', 'candede'),
(327, '28.10.2015 17:53:34', 'https://twitter.com/yahyacandede/status/659397213412573184', 'Retweet(Kredili İşlem)', 'candede'),
(328, '28.10.2015 17:54:09', 'https://twitter.com/AhmetKursatK/status/659396763598594048', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(329, '28.10.2015 17:54:18', 'https://twitter.com/AhmetKursatK/status/659396763598594048', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(330, '28.10.2015 17:54:29', 'https://twitter.com/GufranIsBack/status/659397717530165248', 'Retweet(Kredili İşlem)', 'admin'),
(331, '28.10.2015 17:54:33', 'https://twitter.com/AhmetKursatK/status/659396763598594048', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(332, '28.10.2015 17:57:28', 'https://twitter.com/AhmetKursatK/status/659396763598594048', 'Retweet(Kredili İşlem)', 'ahmetkursatk'),
(333, '28.10.2015 18:14:19', 'https://twitter.com/sirbrky/status/659401132834471937', 'Favori(Kredili İşlem)', 'sirbrky'),
(334, '28.10.2015 18:14:38', 'https://twitter.com/sirbrky/status/659401132834471937', 'Retweet(Kredili İşlem)', 'sirbrky');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tweet_id`
--

CREATE TABLE IF NOT EXISTS `tweet_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saat` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `tweet_id` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kacSaat` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `durum` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=731 ;

--
-- Tablo döküm verisi `tweet_id`
--

INSERT INTO `tweet_id` (`id`, `saat`, `tweet_id`, `username`, `kacSaat`, `durum`) VALUES
(14, '14:35', '658985398018945024', 'ylmzcnblt0', '6', 'no'),
(17, '14:35', '658985400522944512', 'edadeck2', '6', 'no'),
(33, '17:50', '659034400408096769', 'edadeck2', '6', 'no'),
(35, '17:50', '659034402027085824', 'ylmzcnblt0', '6', 'no'),
(42, '18:18', '659041415717105664', 'edadeck2', '6', 'no'),
(43, '18:18', '659041416652419072', 'ylmzcnblt0', '6', 'no'),
(65, '18:26', '659043529377890304', 'edadeck2', '6', 'no'),
(70, '18:26', '659043533702209541', 'ylmzcnblt0', '6', 'no'),
(88, '18:35', '659045734969417728', 'edadeck2', '6', 'no'),
(101, '18:35', '659045746788818944', 'ylmzcnblt0', '6', 'no'),
(107, '18:40', '659046935312138240', 'edadeck2', '6', 'no'),
(112, '18:41', '659047317744590848', 'ylmzcnblt0', '6', 'no'),
(116, '18:41', '659047321112596481', 'edadeck2', '6', 'no'),
(139, '18:54', '659050548491132929', 'ylmzcnblt0', '6', 'no'),
(144, '18:54', '659050552702205952', 'edadeck2', '6', 'no'),
(150, '18:55', '659050869397311488', 'ylmzcnblt0', '6', 'no'),
(166, '18:55', '659050882709987329', 'edadeck2', '6', 'no'),
(178, '18:55', '659050915626917889', 'edadeck2', '6', 'no'),
(183, '18:55', '659050919829643264', 'ylmzcnblt0', '6', 'no'),
(207, '18:57', '659051274055393280', 'edadeck2', '6', 'no'),
(214, '18:57', '659051280569139200', 'ylmzcnblt0', '6', 'no'),
(219, '19:04', '659052971389513728', 'edadeck2', '6', 'no'),
(227, '19:04', '659052978280767488', 'ylmzcnblt0', '6', 'no'),
(243, '19:06', '659053481412702208', 'ylmzcnblt0', '6', 'no'),
(248, '19:06', '659053486026432512', 'edadeck2', '6', 'no'),
(261, '19:13', '659055333000785920', 'ylmzcnblt0', '6', 'no'),
(274, '19:13', '659055344182808576', 'edadeck2', '6', 'no'),
(284, '19:21', '659057401631539201', 'ylmzcnblt0', '6', 'no'),
(292, '19:21', '659057408392720384', 'edadeck2', '6', 'no'),
(305, '19:22', '659057582934462464', 'edadeck2', '6', 'no'),
(318, '19:22', '659057594661777408', 'ylmzcnblt0', '6', 'no'),
(338, '19:25', '659058377826390016', 'edadeck2', '6', 'no'),
(358, '19:27', '659058925841592320', 'ylmzcnblt0', '6', 'no'),
(629, '08:37', '659257613666922496', 'kahinboss', '6', 'no'),
(630, '09:08', '659265354070433793', 'melihyascharr', '6', 'no'),
(631, '09:08', '659265354854715392', 'lncikeps', '6', 'no'),
(632, '09:08', '659265355626491904', 'RT__perisi', '6', 'no'),
(633, '09:08', '659265356415004672', 'TTOlduYaLa', '6', 'no'),
(634, '09:08', '659265357224480768', 'EnGuzelSozIer', '6', 'no'),
(635, '09:08', '659265358285664256', 'RetwetDeck', '6', 'no'),
(636, '09:08', '659265359132889088', 'MERCYBORN', '6', 'no'),
(637, '09:08', '659265359900516352', 'incicikeps', '6', 'no'),
(638, '09:50', '659276079392231424', 'melisdeck', '6', 'no'),
(639, '09:50', '659276080268840960', 'TTOlduYaLa', '6', 'no'),
(640, '09:50', '659276081183260672', '__incitanem__', '6', 'no'),
(641, '09:50', '659276081984380928', 'RetweeTurkey', '6', 'no'),
(642, '09:50', '659276082831601664', 'incicikeps', '6', 'no'),
(643, '09:50', '659276083754311680', 'gufran_rt', '6', 'no'),
(644, '12:25', '659314938985476097', 'TTOlduYaLa', '6', 'no'),
(645, '12:25', '659314939895660544', 'MERCYBORN', '6', 'no'),
(646, '12:25', '659314940751323136', 'LOCAPS_TR', '6', 'no'),
(647, '12:25', '659314941682458624', 'kahinboss', '6', 'no'),
(648, '12:25', '659314942475161600', 'mertmisinnesin', '6', 'no'),
(649, '12:25', '659314943284637697', 'lncikeps', '6', 'no'),
(650, '12:25', '659314944224141312', 'RT__perisi', '6', 'no'),
(651, '12:28', '659315918124818432', 'manyakbayan', '6', 'no'),
(652, '12:35', '659317556415758336', 'melihyascharr', '6', 'no'),
(653, '12:56', '659322819180896258', 'RT__perisi', '6', 'no'),
(654, '12:56', '659322820149813248', 'kahinboss', '6', 'no'),
(655, '12:56', '659322820934111233', 'EnGuzelSozIer', '6', 'no'),
(656, '12:56', '659322821710073856', 'bakarzyaq', '6', 'no'),
(657, '12:56', '659322822574153728', 'LOCAPS_TR', '6', 'no'),
(658, '12:56', '659322823433961473', 'OzBeyKL', '6', 'no'),
(659, '12:56', '659322824247648256', 'eykaann2', '6', 'no'),
(660, '13:05', '659325175712907265', 'melisdeck', '6', 'no'),
(661, '13:06', '659325308772945920', 'eykaann2', '6', 'no'),
(662, '13:06', '659325309985140736', 'Sebekovsli', '6', 'no'),
(663, '13:06', '659325310886875136', 'incicikeps', '6', 'no'),
(664, '14:06', '659340390231863296', 'lncikeps', '6', 'no'),
(665, '14:06', '659340391032995840', 'OmeyFayuk', '6', 'no'),
(666, '14:06', '659340391808921600', 'gufran_rt', '6', 'no'),
(667, '14:06', '659340392597442561', 'TTOlduYaLa', '6', 'no'),
(668, '14:06', '659340393415315456', 'Sebekovsli', '6', 'no'),
(669, '14:06', '659340394199699456', 'bakarzyaq', '6', 'no'),
(670, '14:06', '659340395009196032', 'melisdeck', '6', 'no'),
(671, '14:06', '659340395797704704', 'manyakbayan', '6', 'no'),
(672, '14:06', '659340398696013825', 'yilisikkedi', '6', 'no'),
(673, '14:06', '659340399467720704', 'melihyascharr', '6', 'no'),
(674, '14:06', '659340400264683521', 'mertmisinnesin', '6', 'no'),
(675, '15:10', '659356694338777088', 'incicikeps', '6', 'no'),
(676, '15:10', '659356695303442432', 'mertmisinnesin', '6', 'no'),
(677, '15:26', '659360623235571713', 'manyakbayan', '6', 'no'),
(678, '15:26', '659360623998967812', 'RetweeTurkey', '6', 'no'),
(679, '15:26', '659360624795873280', 'mertmisinnesin', '6', 'no'),
(680, '16:33', '659377475374444544', 'Sebekovsli', '6', 'no'),
(681, '16:33', '659377476267876352', 'hirsizcilgin', '6', 'no'),
(682, '16:33', '659377477027000320', 'NilayBurc', '6', 'no'),
(683, '16:33', '659377477819740161', 'melisdeck', '6', 'no'),
(684, '16:33', '659377478759247872', 'mertmisinnesin', '6', 'no'),
(685, '16:33', '659377479770075136', 'RetweeTurkey', '6', 'no'),
(686, '17:40', '659394234903056384', 'TTOlduYaLa', '6', 'no'),
(687, '17:40', '659394236144558081', 'gufran_rt', '6', 'no'),
(688, '17:40', '659394236966699009', 'eykaann2', '6', 'no'),
(689, '17:40', '659394287038263296', 'NilayBurc', '6', 'no'),
(690, '17:40', '659394287877103616', 'LOCAPS_TR', '6', 'no'),
(691, '17:40', '659394289882021889', 'melisdeck', '6', 'no'),
(692, '17:40', '659394290754392064', 'incicikeps', '6', 'no'),
(693, '17:40', '659394291639451649', 'OzBeyKL', '6', 'no'),
(694, '17:40', '659394415732105216', '__incitanem__', '6', 'no'),
(695, '17:40', '659394416642232320', 'hirsizcilgin', '6', 'no'),
(696, '17:40', '659394417401425921', 'RT__perisi', '6', 'no'),
(697, '17:52', '659397312427466756', 'aysenurakty', '6', 'no'),
(698, '17:52', '659397313350270980', 'melisdeck', '6', 'no'),
(699, '17:52', '659397314176536576', 'Sebekovsli', '6', 'no'),
(700, '17:52', '659397338759348225', 'incicikeps', '6', 'no'),
(701, '17:52', '659397339581456384', '__incitanem__', '6', 'no'),
(702, '17:52', '659397340537688064', 'RT__perisi', '6', 'no'),
(703, '17:53', '659397534385876992', 'hirsizcilgin', '6', 'no'),
(704, '17:53', '659397535140859904', 'RTBayanda', '6', 'no'),
(705, '17:53', '659397536017457152', 'NilayBurc', '6', 'no'),
(706, '17:53', '659397536789188608', 'manyakbayan', '6', 'no'),
(707, '17:53', '659397537611272192', 'EnGuzelSozIer', '6', 'no'),
(708, '17:54', '659397754947575808', 'TTOlduYaLa', '6', 'no'),
(709, '17:54', '659397755710914564', 'RTBayanda', '6', 'no'),
(710, '17:54', '659397756713332736', 'EnGuzelSozIer', '6', 'no'),
(711, '17:54', '659397793468039168', 'Sebekovsli', '6', 'no'),
(712, '17:54', '659397794323677184', 'NilayBurc', '6', 'no'),
(713, '17:54', '659397795430989824', 'melisdeck', '6', 'no'),
(714, '17:54', '659397796273999872', 'manyakbayan', '6', 'no'),
(715, '17:54', '659397797171580929', 'RT__perisi', '6', 'no'),
(716, '17:54', '659397836790964224', 'incicikeps', '6', 'no'),
(717, '17:54', '659397837671833601', 'yilisikkedi', '6', 'no'),
(718, '17:54', '659397838523256832', 'lncikeps', '6', 'no'),
(719, '17:54', '659397839315968000', 'MerveeLOL', '6', 'no'),
(720, '17:54', '659397854230925312', 'melihyascharr', '6', 'no'),
(721, '17:54', '659397855019450368', 'bakarzyaq', '6', 'no'),
(722, '17:54', '659397855912816640', 'eykaann2', '6', 'no'),
(723, '17:54', '659397856747462656', 'hirsizcilgin', '6', 'no'),
(724, '17:54', '659397857598971904', 'kahinboss', '6', 'no'),
(725, '17:54', '659397858349727744', 'gufran_rt', '6', 'no'),
(726, '17:54', '659397859654148096', 'OmeyFayuk', '6', 'no'),
(727, '17:54', '659397860681646082', 'aysenurakty', '6', 'no'),
(728, '17:54', '659397861843537920', 'yilisikkedi', '6', 'no'),
(729, '17:54', '659397863307399168', '__incitanem__', '6', 'no'),
(730, '17:54', '659397864100143105', 'RetwetDeck', '6', 'no');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeHesap`
--

CREATE TABLE IF NOT EXISTS `uyeHesap` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `screen_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `profilresmi` varchar(255) CHARACTER SET latin1 NOT NULL,
  `access_token` varchar(255) CHARACTER SET latin1 NOT NULL,
  `access_token_secret` varchar(255) NOT NULL,
  `acilistarihi` varchar(255) NOT NULL,
  `takipcisi` varchar(255) NOT NULL,
  `kazanilantakipci` varchar(255) NOT NULL,
  `giristarihi` varchar(255) NOT NULL,
  `kullanici` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `aktif` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=32 ;

--
-- Tablo döküm verisi `uyeHesap`
--

INSERT INTO `uyeHesap` (`id`, `screen_name`, `profilresmi`, `access_token`, `access_token_secret`, `acilistarihi`, `takipcisi`, `kazanilantakipci`, `giristarihi`, `kullanici`, `userid`, `aktif`) VALUES
(1, 'lncikeps', 'https://pbs.twimg.com/profile_images/612406896750800897/9Fft9IPX.jpg', '1642823376-PRXjU5Coql1Mfop0qc5AiSvMHehCB9sRRfLAi64', 'ZG90xzizV5u5bYeU4gtUlKYiHfESOpmd0IHoGfQhGg95M', '2013/08/03-16:37:13', '35417', '0', '26.10.2015 17:38:07', 'admin', '1642823376', 'Aktif'),
(2, 'gufran_rt', 'https://pbs.twimg.com/profile_images/616225407235284992/e0QG12ev.jpg', '2229965072-JtEDDpDYCwjs2h6LTY6Ss5uegKnDMumDEoh7Q8e', '4zI6yYPlWvqJfpcrQO9AGzz6oCx8x7Zh4dyuIERBDNLhA', '2013/12/04-16:00:56', '31400', '0', '26.10.2015 17:38:08', 'admin', '2229965072', 'Aktif'),
(3, 'melihyascharr', 'https://pbs.twimg.com/profile_images/543905112427876352/GY5FhtfG.jpeg', '2920500191-58ivw7n4Gjq4Lry9uWW96zsOcbYgnQHJbFlkEsp', '5io0am8dgIHQHoGO8IGjG3utVnFJlZEzol7yuKV9QJ6JV', '2014/12/14-01:05:36', '10387', '0', '26.10.2015 17:38:09', 'admin', '2920500191', 'Aktif'),
(4, 'Sebekovsli', 'https://pbs.twimg.com/profile_images/610816291704672256/TH32Vtqj.jpg', '331860637-jDBL4u7I67NCuZ3QuCeZFbmAwynjb08pTgVjfg2W', 'aSdCqrthJnoQPqdGxERyWn66liv5shek9R5yzYSPgK6xR', '2011/07/08-23:48:31', '10515', '0', '26.10.2015 17:38:10', 'admin', '331860637', 'Aktif'),
(5, 'melisdeck', 'https://pbs.twimg.com/profile_images/612289926797766658/ZxNO_k-X.jpg', '2260610640-7YyewUwaLjBvmpG73vWQPGIkKy0BKFnDvzavAAg', 'dRIEKIkaq7WgpSwnOeFPxlLbAN9uz3GgE2Uf7SoNhnO3K', '2013/12/24-21:03:26', '13966', '0', '26.10.2015 17:38:12', 'admin', '2260610640', 'Aktif'),
(6, 'ylmzcnblt0', 'https://pbs.twimg.com/profile_images/655948997337608192/O2JlRm-Z.png', '2680293979-NHCarMBQRYn3qMakPxEwyPYGNBPDPyh7ARpgAQG', 'sn4giQzILQsgsIFJwsORxoKArvwh4EDdBSmBA8FzLiDVd', '2014/07/25-22:07:47', '14493', '0', '26.10.2015 18:06:29', 'ylmzcnblt', '2680293979', 'Aktif'),
(7, '__incitanem__', 'https://pbs.twimg.com/profile_images/651479292195549184/cn7rIiEq.jpg', '205586704-lVMCRskhhY9XOtlpcpX7AvpNkEpQtgxuo4OocoyJ', 'rE6QDveA1Fy2e2RuWN3h8UAzyOzkOhcDPNpTvmaobOjqQ', '2010/10/21-08:46:07', '24746', '0', '26.10.2015 18:10:52', 'ylmzcnblt', '205586704', 'Aktif'),
(8, 'RetweeTurkey', 'https://pbs.twimg.com/profile_images/2505690626/yyyku6fjxrahks1qyvdc.jpeg', '241524138-zT2PjFC6Sh3XDY6xNsOrivqVUhNnn0Aoyp4IdEkd', 'PKVSrdFZNEUeCTT56gKJ8fK40jGMnF1rlQYSmJTstHRYP', '2011/01/22-15:30:34', '18858', '0', '26.10.2015 18:14:25', 'ylmzcnblt', '241524138', 'Aktif'),
(9, 'edadeck2', 'https://pbs.twimg.com/profile_images/612109245870247936/PdjtT3ZD.jpg', '1644957560-M5NgQF39qcZqaPonvQvCcoaDBBva40iOS3f0rsK', 'f6hAJUl5B9k5rn0SjJFzKtxyHbSSZm1rrNkXHDDZoWDFS', '2013/08/04-13:45:31', '9284', '0', '26.10.2015 18:14:54', 'ylmzcnblt', '1644957560', 'Aktif'),
(10, 'RT__perisi', 'https://pbs.twimg.com/profile_images/654767491676172288/PwqsE6b7.jpg', '550493532-031MILwiWpVSgyehHCuganviOki4nNZwstypYDu7', 'RiRqBoH5pOF6geIs7qmFPMiKJsbybYLqvl9GYIt93Wlc7', '2012/04/10-23:14:13', '9732', '0', '26.10.2015 18:47:59', 'ylmzcnblt', '550493532', 'Aktif'),
(11, 'yilisikkedi', 'https://pbs.twimg.com/profile_images/636621021550936064/vpb_h7mV.jpg', '538473075-K2cN5aD7mWiDQBQajKYuBQTiVxccadlFOdaI2zTK', 'PuSK0VVxSFdkksoDuUFU8H3ruTtSTQNWJBqVaWQWtFsUJ', '2012/03/27-21:35:28', '38589', '0', '26.10.2015 20:15:37', 'rammstein', '538473075', 'Aktif'),
(12, 'OmeyFayuk', 'https://pbs.twimg.com/profile_images/602951667882000385/_3sVndTs.jpg', '2911374471-AcZZcxddh7dSunzzm6dZpLPmBHGdAgXzU2ZG5OR', 'ZKNBsDGBXgVGLsyCb9w4mDeQ60m97nsbcaYheqyTSLIlz', '2014/12/08-21:06:21', '23615', '0', '26.10.2015 20:33:01', 'admin', '2911374471', 'Aktif'),
(13, 'eykaann2', 'https://pbs.twimg.com/profile_images/658416235617656832/GPGta9HB.jpg', '2226286099-6a2uW9FUGfQD0Vz0YWdIf0egj1dHvBS9sgXqksH', 'wv4p7vteNQ8rejyQdQ7y2xj8K5NweIkR3g2h97cCKUrcF', '2013/12/02-09:56:19', '33901', '0', '26.10.2015 21:26:27', 'eykaann', '2226286099', 'Aktif'),
(14, 'manyakbayan', 'https://pbs.twimg.com/profile_images/643872761484570625/IfIPn8Wv.jpg', '145568633-cIKHhSTeIkW26gvsh5DbvsC3ksxFSqemnRMo1JsJ', 'RIAzviCyoDeKcWNde3HrgkuxGbJD6RfWLwGc6tnKn1g1W', '2010/05/19-11:41:32', '66428', '0', '26.10.2015 21:37:07', 'crazybombermam', '145568633', 'Aktif'),
(15, 'hirsizcilgin', 'https://pbs.twimg.com/profile_images/584837290498789376/T1wpBpNh.png', '580877520-BhOeTxe8whhOe3PVJyKeF0sN4ya9sjwqDbiK8thf', 'jFoGZykXrOzrWlpGCL7VNOfCIPkJ0v7rBejdSmJClgZ6Q', '2012/05/15-14:20:15', '49091', '0', '26.10.2015 22:04:58', 'mertozkan', '580877520', 'Aktif'),
(16, 'bakarzyaq', 'https://pbs.twimg.com/profile_images/624212313571205120/sKE7eTSt.jpg', '297957048-aYiLg27Ic79cTWcWcftEsLntz2AawuYAMSdZU9YB', 'TTk3Ln2VBgB1HSwqEgny4v3Q5bYL7X0xbHIUBcqXN1HjH', '2011/05/13-15:22:21', '9493', '0', '26.10.2015 23:15:11', 'Sakaryaspor', '297957048', 'Aktif'),
(17, 'MerveeLOL', 'https://pbs.twimg.com/profile_images/603236771078479873/ko0JRwkh.jpg', '3151343818-3ggMP3pyJjiJXdSrBAuTketNeyBSP4gwkCWVDRl', 'jmckLc3SkEG6ob9hPJCAIUJ0uwertxCyY11lAvp6uD3iR', '2015/04/09-14:39:15', '26912', '0', '26.10.2015 23:42:51', 'cakiremre17', '3151343818', 'Aktif'),
(18, 'TTOlduYaLa', 'https://pbs.twimg.com/profile_images/606733875667181568/7tXyoE7-.png', '2164717513-EH1sdCpCDVqRat3nYHQH3q4dtXnR0Ia2rg4dRPU', 'GeXiJVrV2oaVXUqfrez0If6tqGk8lAlyB8G53aPuUff03', '2013/10/30-14:47:16', '19669', '0', '27.10.2015 15:20:31', 'zafer', '2164717513', 'Aktif'),
(19, 'RTBayanda', 'https://pbs.twimg.com/profile_images/606856863762808832/iNUTSZKz.jpg', '3212312661-OtiUNfIsbXeAaD3PPYH9hUKQJIhxeAj43rv4tms', 'RGafB6DlQwd8F7Nt2tPCOPJXvCgEYB10BLA0iQX7OzuCx', '2015/04/27-13:47:01', '12207', '0', '27.10.2015 15:21:53', 'zafer', '3212312661', 'Aktif'),
(20, 'RetwetDeck', 'https://pbs.twimg.com/profile_images/507938407427756032/-5rHBFnw.jpeg', '1351241527-Oc0XTRX6vPVoWEpPH2asHwN98sRnvR4IzrpWG3W', 'sHcG2Pqg07D6ta136jwG4vft4Ql0T4EVvCEVdxuiTI0dV', '2013/04/14-10:19:52', '49919', '0', '27.10.2015 15:23:46', 'zafer', '1351241527', 'Aktif'),
(21, 'kahinboss', 'https://pbs.twimg.com/profile_images/658682539658362880/I3Ds-Ggy.png', '2886738814-UdoNvDPsTfUuYq3XXaoiFxUy1hSJz8E8XPc2vcQ', 'VCOLS1ZfZo8o7NBNkW943TNNGfkDMxYZiIf1jSqlZoyab', '2014/11/21-12:22:57', '78', '0', '27.10.2015 17:31:02', 'admin', '2886738814', 'Aktif'),
(22, 'EnGuzelSozIer', 'https://pbs.twimg.com/profile_images/657103535813824512/36K31OAE.jpg', '2821350207-dXbxaRfJLVc7FxoxvX8f3Y0W3X16PCiCUJbY3lo', '4DXIOKMwxl6hAu5HeJpAtZXBvQqYYuxrtqQhG1vh7bX2F', '2014/10/10-21:25:34', '25433', '0', '27.10.2015 18:55:30', 'misssari', '2821350207', 'Aktif'),
(23, 'LOCAPS_TR', 'https://pbs.twimg.com/profile_images/653905807852085248/lMj6MTo9.jpg', '3364282143-gfwysaBY85LlNiImvNd3yTouef0xBNYHHBLKLxn', '8poEqgIogkUDqFaa71A4BIDEMhvvs1Wm5A7qE1TOyXV3a', '2015/07/07-18:41:35', '31068', '0', '27.10.2015 19:41:21', 'cakiremre17', '3364282143', 'Aktif'),
(24, 'yahyacandede', 'https://pbs.twimg.com/profile_images/659066968050372608/o5aQmAXB.jpg', '196576325-ZSNtA916EH7hn1e7YZuUYw44zzYWP377LSSXiNcz', 'lm9SoXRnohh2CrTU4hNGXTUv6ozzXUyBEUjiEJ6bUYolf', '2010/09/29-15:51:42', '41013', '0', '27.10.2015 20:09:15', 'candede', '196576325', 'Aktif'),
(25, 'incicikeps', 'https://pbs.twimg.com/profile_images/623618139574538240/tjs232PA.png', '2546319637-CaObZ6moqb8gQjedgNAkGNtosnQHbeDdqnmA0A9', 'Edn0ywFvUpONJv8hDVg4CAsJuMIFmzOFS0jXGsw0GqK6O', '2014/06/04-17:53:50', '33144', '0', '27.10.2015 21:28:58', 'ankaraninbeyi', '2546319637', 'Aktif'),
(26, 'OzBeyKL', 'https://pbs.twimg.com/profile_images/657670545773830146/Nfl2TvpL.jpg', '1287110923-bFWpNLiCPXUdqWYzsayv9kg4RPNWG4VPvY9kR8x', 'oWjoaHrxKKN6rdKru5qscPdfJM9wIFOqLF4Ahmd0OBFam', '2013/03/22-00:16:15', '192852', '0', '27.10.2015 21:52:24', 'ahmetkursatk', '1287110923', 'Aktif'),
(27, 'mertmisinnesin', 'https://pbs.twimg.com/profile_images/636790739100397568/T4hN2-cn.jpg', '2504474539-AXYFpXNSZGL9P8Lug9nZ1w8DHK3ct51MG885kYE', 'U968EoGQOTzcZtldGjFasxnGgLiVfsmtRRw2qJwTiiicK', '2014/05/18-16:18:51', '11635', '0', '27.10.2015 22:09:43', 'kimbumubarek1', '2504474539', 'Aktif'),
(28, 'NilayBurc', 'https://pbs.twimg.com/profile_images/512174138249601024/ni4uELM_.jpeg', '2535170330-TPGOBTyWmkPLnFVw9TXFvm7jsWzdZ9I2sNkWcLp', 'p1XEOt9qdFCE2kx6a79zV9uIdLyBBWdMh3r4Dohcq45nt', '2014/05/30-17:16:41', '16772', '0', '27.10.2015 22:09:51', 'misssari', '2535170330', 'Aktif'),
(29, 'MERCYBORN', 'https://pbs.twimg.com/profile_images/652845387468947456/a_3tePb_.jpg', '3912492143-JFDxs7rFhr2xbZ19Hp2FrjUTlgPrgQ8nDygEmau', '4Lqx60MWINs984GIpwIYoziFbd62BmWvwyCeOMRq7CbBx', '2015/10/10-00:40:48', '190', '0', '27.10.2015 23:47:39', 'PATRON', '3912492143', 'Aktif'),
(30, 'aysenurakty', 'https://pbs.twimg.com/profile_images/659119907976683520/n3MUOJRn.jpg', '2357884862-JHaj3vzp7l36dlMlNZiAma1aDIVwtX92baTxDOo', 'IaTFmLXxgZm7DXXpWX5IYjyNi4R5QZSNqGmTyLgrTeEFx', '2014/02/23-13:47:54', '2440', '0', '27.10.2015 23:48:16', 'PATRON', '2357884862', 'Aktif'),
(31, 'sananeamkcocuu', 'https://pbs.twimg.com/profile_images/659098624056537093/4ZQ3jq1h.jpg', '2856787169-NLtxLpJokjehKEQTj9c2QT0xojq0GGHO31sJp8e', 'WxmfYRoYRSD1I4iSF1EsSMVJCX5b1ENy9Ljvl1p9j8Cgz', '2014/11/02-15:32:04', '17539', '0', '27.10.2015 23:49:18', 'PATRON', '2856787169', 'Aktif');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyelikler`
--

CREATE TABLE IF NOT EXISTS `uyelikler` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isimsoyisim` varchar(255) CHARACTER SET latin1 NOT NULL,
  `ipadresi` varchar(255) NOT NULL,
  `yetki` varchar(255) NOT NULL,
  `songiris` varchar(255) NOT NULL,
  `kredi` varchar(255) NOT NULL,
  `toplamkredi` varchar(255) NOT NULL,
  `favoriKredi` varchar(255) NOT NULL,
  `toplamFavori` varchar(255) NOT NULL,
  `destek` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=27 ;

--
-- Tablo döküm verisi `uyelikler`
--

INSERT INTO `uyelikler` (`id`, `email`, `username`, `password`, `isimsoyisim`, `ipadresi`, `yetki`, `songiris`, `kredi`, `toplamkredi`, `favoriKredi`, `toplamFavori`, `destek`) VALUES
(1, 'admin', 'admin', '~f551k26c', 'Admin', '213.248.177.77', '1', '28.10.2015 18:27:37', '50', '50', '50', '50', '0'),
(2, 'ylmzcnblt@gmail.com', 'ylmzcnblt', 'ylmz1996', 'yilmaz canbulat', '78.184.222.182', '0', '28.10.2015 16:23:05', '2', '2', '5', '5', '0'),
(3, 'kadirmelihcan@gmail.com', 'melihcan', '123456', 'Melih Can', '212.252.164.16', '0', '26.10.2015 18:24:41', '0', '0', '0', '0', '0'),
(4, 'iletisimgufran@gmail.com', 'Gufran', 'gufran123', 'Gufran Kandemir', '92.45.140.26', '0', '27.10.2015 21:48:35', '10', '10', '10', '10', '0'),
(5, 'mert.krtlsss@hotmail.com', 'kimbumubarek1', 'kmertbaso53', 'Mert Kurtulus', '188.57.184.157', '0', '28.10.2015 15:17:48', '1', '1', '1', '1', '0'),
(6, 'syelkenci34@gmail.com', 'Hermes', 'sedats', 'Sedat', '88.233.30.82', '0', '27.10.2015 14:34:43', '0', '0', '0', '0', '0'),
(7, 'oduntwitter@gmail.com', 'asd123asd', 'asd123asd', 'Bereat', '31.223.84.95', '0', '', '0', '0', '0', '0', '0'),
(8, 'odunbu@gmail.com', 'bereatasd', 'asd123asd', 'odunbu@gmail.com', '31.223.84.95', '0', '26.10.2015 19:53:10', '0', '0', '0', '0', '0'),
(9, 'ipo_yil@hotmail.com', 'SirBrky', 'berkay98', 'berkay yildirim', '212.253.112.160', '0', '28.10.2015 16:52:15', '9', '10', '9', '10', '0'),
(10, 'silagencoglum@gmail.com', 'rammstein', 'karakter', 'Mehmet Sakarkaya', '212.252.163.190', '0', '28.10.2015 17:26:00', '4', '4', '4', '4', '0'),
(11, 'twittersepetim@gmail.com', 'eykaann', 'deck123', 'erkan', '95.15.202.197', '0', '28.10.2015 15:07:53', '4', '4', '4', '4', '0'),
(12, 'konukulas@gmail.com', 'crazybombermam', 'Kartal1903*', 'crazy bomberman', '213.74.186.109', '0', '28.10.2015 06:53:58', '10', '10', '10', '10', '0'),
(13, 'bahagokce123@gmail.com', 'Arriable', 'bahadeck11', 'Baha GOKCE', '95.10.216.35', '0', '26.10.2015 21:42:04', '0', '0', '0', '0', '0'),
(14, 'mert.wish@hotmail.com', 'mertozkan', '381462', 'mert ozkan', '94.123.227.172', '0', '28.10.2015 00:38:07', '5', '5', '5', '5', '0'),
(15, 'mertcan_54_bjk_1903@hotmail.com', 'Sakaryaspor ', 'no1kanka', 'mertcan dogan', '85.97.147.97', '0', '27.10.2015 23:37:21', '1', '1', '1', '1', '0'),
(16, 'oguzsagoo@hotmail.com', 'cakiremre17', '9876543', 'emre cakir', '85.96.77.173', '0', '28.10.2015 15:18:18', '7', '7', '7', '7', '0'),
(17, 'umutmavim@gmail.com', 'umutmavi', '258258', 'Umut Mavi', '88.252.1.230', '0', '26.10.2015 23:53:38', '0', '0', '0', '0', '0'),
(18, 'zaferasar@gmail.com', 'zafer', '123147', 'zafer sahin', '85.110.85.78', '0', '28.10.2015 15:25:42', '8', '8', '8', '8', '0'),
(19, 'cebovoski@yandex.com', 'misssarikartal', 'beşiktaş', 'misssarikartal', '188.3.150.71', '0', '', '0', '0', '0', '0', '0'),
(20, 'jameika.mal@hotmail.com', 'misssari', 'misssari', 'misssarikartal', '46.197.212.7', '0', '28.10.2015 14:05:28', '7', '7', '7', '7', '0'),
(21, 'blacktigercan1@gmail.com', 'candede', 'Ycdd20', 'can dede', '95.13.124.84', '0', '28.10.2015 17:39:31', '100', '100', '100', '100', '0'),
(22, 'abdullh.atas@gmail.com', 'ankaraninbeyi', '123456', 'abdullah atas', '95.5.87.241', '0', '28.10.2015 17:56:55', '4', '4', '4', '4', '0'),
(23, 'Demo021@gmail.com', 'Demo021', 'Demo123', 'Demo Demo', '46.197.32.205', '0', '27.10.2015 21:36:05', '0', '0', '0', '0', '0'),
(24, 'ttahmetkursat@gmail.com', 'ahmetkursatk', '637300a', 'Ahmet Kursat', '85.106.144.39', '0', '28.10.2015 16:53:06', '12', '12', '12', '12', '0'),
(25, 'bakidundar4@gmail.com', 'PATRON', 'bosver13579', 'BAKI DUNDAR', '78.180.165.199', '0', '28.10.2015 17:54:27', '2', '2', '4', '4', '0'),
(26, 'xsefa.yilmazx@gmail.com', 'sefayilmaz', 'sefasefa', 'Sefa Yilmaz', '85.102.52.225', '0', '28.10.2015 18:11:57', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetkiler`
--

CREATE TABLE IF NOT EXISTS `yetkiler` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `screen_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `retweet` varchar(255) CHARACTER SET utf8 NOT NULL,
  `favori` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Tablo döküm verisi `yetkiler`
--

INSERT INTO `yetkiler` (`id`, `screen_name`, `retweet`, `favori`) VALUES
(1, 'GufranIsBack', 'Var', 'Var'),
(2, 'ylmzcnblt', 'Var', 'Var'),
(3, 'rudeboyunuz', 'Var', 'Var'),
(4, 'sirbrky', 'Var', 'Var'),
(5, 'johnkorey', 'Var', 'Var'),
(6, 'eykaann', 'Var', 'Var'),
(7, 'konukulas', 'Var', 'Var'),
(8, 'ilkodun', 'Var', 'Var'),
(9, 'Mertcanbeyy ', 'Var', 'Var'),
(10, 'cakiremre17', 'Var', 'Var'),
(11, 'gufrankandemir', 'Var', 'Var'),
(12, 'mleugurlu', 'Var', 'Var'),
(13, '_ZaferSahin', 'Var', 'Var'),
(14, 'MissSariKartaL', 'Var', 'Var'),
(15, 'yahyacandede', 'Var', 'Var'),
(16, 'AhmetKursatK', 'Var', 'Var'),
(17, 'sananeyaaq', 'Var', 'Var'),
(18, 'mertmisinnesin', 'Var', 'Var'),
(19, 'AnkaraninBeyi', 'Var', 'Var'),
(20, 'sananeyaaq', 'Var', 'Var');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
