-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 29 Ara 2022, 11:10:30
-- Sunucu sürümü: 10.6.11-MariaDB-0ubuntu0.22.04.1
-- PHP Sürümü: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `voya_site`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `parent_id`, `order`) VALUES
(1, 'Genel', 'genel', NULL, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `area_code` varchar(255) DEFAULT '0',
  `ip_address` varchar(255) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Adı', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'E-Posta', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Şifre', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Hatırlatıcı Jeton', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Kaydoldu', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Güncellendi', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Yetki', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Özel Roller', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Ayarlar', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(13, 2, 'name', 'text', 'Adı', 1, 1, 1, 1, 1, 1, '{}', 2),
(14, 2, 'created_at', 'timestamp', 'Üretildi', 0, 0, 0, 0, 0, 0, '{}', 3),
(15, 2, 'updated_at', 'timestamp', 'Güncellendi', 0, 0, 0, 0, 0, 0, '{}', 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Yetki', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Üretildi', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Güncellendi', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Görünen Adı', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Yetki', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 1, 'email_verified_at', 'timestamp', 'E-Posta Onaylandı', 0, 1, 1, 1, 1, 1, '{}', 6),
(23, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(24, 4, 'title', 'text', 'Başlık', 0, 1, 1, 1, 1, 1, '{}', 2),
(25, 4, 'excerpt', 'text_area', 'Kısa Açıklama', 0, 0, 1, 1, 1, 1, '{}', 4),
(26, 4, 'body', 'rich_text_box', 'Sayfa İçeriği', 0, 0, 1, 1, 1, 1, '{}', 5),
(27, 4, 'image', 'image', 'Görsel', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"600\",\"height\":\"null\"},\"quality\":\"99%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"600\"}}]}', 6),
(28, 4, 'slug', 'text', 'Sayfa Adresi', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:pages|required|min:2\",\"messages\":{\"required\":\"This :attribute field is a must.\",\"min\":\"This :attribute field minimum :min.\",\"unique\":\"This :attribute must be unique.\"}}}', 7),
(29, 4, 'meta_description', 'text_area', 'Meta Açıklama', 0, 0, 1, 1, 1, 1, '{}', 9),
(30, 4, 'seo_title', 'text', 'SEO Başlığı', 0, 0, 1, 1, 1, 1, '{}', 8),
(31, 4, 'redirect_url', 'text', 'Sayfayı Tamamen Yönlendir', 0, 0, 1, 1, 1, 1, '{}', 10),
(32, 4, 'sub_title', 'text', 'Alt Başlık', 0, 0, 1, 1, 1, 1, '{}', 3),
(33, 4, 'header_image', 'image', 'Üst Görsel', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1920\",\"height\":\"null\"},\"quality\":\"90%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"800\"}}]}', 11),
(34, 4, 'photos', 'multiple_images', 'Sayfa Galerisi', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"2400\",\"height\":\"null\"},\"quality\":\"99%\",\"upsize\":false,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\"}}]}', 12),
(35, 4, 'created_at', 'timestamp', 'Yaratıldı', 0, 0, 1, 0, 0, 0, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 15),
(36, 4, 'updated_at', 'timestamp', 'Güncellendi', 0, 1, 1, 0, 0, 0, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 16),
(37, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(38, 5, 'name', 'text', 'Website Adı', 0, 1, 1, 1, 1, 1, '{}', 2),
(39, 5, 'slug', 'text', 'Sayfa Adresi', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":false}}', 3),
(40, 5, 'seo_title', 'text', 'SEO Başlığı', 0, 1, 1, 1, 1, 1, '{}', 4),
(41, 5, 'meta_description', 'text_area', 'Meta Açıklama', 0, 0, 1, 1, 1, 1, '{}', 5),
(42, 5, 'phone', 'text', 'Telefon Numarası 1', 0, 1, 1, 1, 1, 1, '{}', 6),
(43, 5, 'phone2', 'text', 'Telefon Numarası 2', 0, 0, 1, 1, 1, 1, '{}', 7),
(44, 5, 'email', 'text', 'E-Posta Adresi 1', 0, 1, 1, 1, 1, 1, '{}', 8),
(45, 5, 'email2', 'text', 'E-Posta Adresi 2', 0, 0, 1, 1, 1, 1, '{}', 9),
(46, 5, 'customize', 'code_editor', 'Özelleştir (İleri Düzey)', 0, 0, 1, 1, 1, 1, '{}', 10),
(47, 5, 'social_facebook', 'text', 'Sosyal Medya Adresi Facebook', 0, 0, 1, 1, 1, 1, '{}', 11),
(48, 5, 'social_instagram', 'text', 'Sosyal Medya Adresi Instagram', 0, 0, 1, 1, 1, 1, '{}', 12),
(49, 5, 'social_twitter', 'text', 'Sosyal Medya Adresi Twitter', 0, 0, 1, 1, 1, 1, '{}', 13),
(50, 5, 'social_youtube', 'text', 'Sosyal Medya Adresi Youtube', 0, 0, 1, 1, 1, 1, '{}', 14),
(51, 5, 'social_whatsapp', 'text', 'Sosyal Medya Adresi Whatsapp', 0, 0, 1, 1, 1, 1, '{}', 15),
(52, 5, 'social_linkedin', 'text', 'Sosyal Medya Adresi Linkedin', 0, 0, 1, 1, 1, 1, '{}', 16),
(53, 5, 'social_vk', 'text', 'Sosyal Medya Adresi Vk', 0, 0, 1, 1, 1, 1, '{}', 17),
(54, 5, 'social_tiktok', 'text', 'Sosyal Medya Adresi Tiktok', 0, 0, 1, 1, 1, 1, '{}', 18),
(55, 5, 'map_url', 'text_area', 'Harita Adresi', 0, 0, 1, 1, 1, 1, '{}', 19),
(56, 5, 'contact_mails', 'code_editor', 'İletişim Formu E-Postaları (Alt alta yazın)', 0, 0, 1, 1, 1, 1, '{}', 20),
(57, 5, 'hr_mails', 'code_editor', 'İK Formu E-Postaları (Alt Alta Yazın)', 0, 0, 1, 1, 1, 1, '{}', 21),
(59, 4, 'order', 'text', 'Sıralama', 0, 1, 1, 1, 1, 1, '{\"default\":0}', 14),
(60, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(61, 6, 'title', 'text', 'Başlık', 0, 1, 1, 1, 1, 1, '{}', 2),
(62, 6, 'sub_title', 'text', 'Alt Başlık', 0, 1, 1, 1, 1, 1, '{}', 3),
(63, 6, 'excerpt', 'text_area', 'Kısa Açıklama (varsa)', 0, 1, 1, 1, 1, 1, '{}', 4),
(64, 6, 'image', 'image', 'Görsel', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1920\",\"height\":\"null\"},\"quality\":\"90%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"800\"}}]}', 5),
(65, 6, 'page_url', 'text', 'Sayfa URL (Site Adresi Hariç)', 0, 0, 1, 1, 1, 1, '{}', 6),
(66, 6, 'order', 'number', 'Order', 0, 1, 1, 1, 1, 1, '{\"default\":0}', 7),
(67, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 7, 'name', 'text', 'İsim Soyisim', 0, 1, 1, 1, 1, 1, '{}', 2),
(69, 7, 'email', 'text', 'E-Posta Adresi', 0, 1, 1, 1, 1, 1, '{}', 3),
(70, 7, 'phone', 'text', 'Telefon Numarası', 0, 1, 1, 1, 1, 1, '{}', 4),
(71, 7, 'message', 'rich_text_box', 'Mesaj', 0, 0, 1, 1, 1, 1, '{}', 5),
(72, 7, 'area_code', 'text', 'Alan Kodu (+XX)', 0, 1, 1, 1, 1, 1, '{}', 6),
(73, 7, 'ip_address', 'text', 'IP Adresi', 0, 0, 1, 1, 1, 1, '{}', 7),
(74, 7, 'created_at', 'timestamp', 'Eklendi', 0, 1, 1, 0, 0, 1, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 8),
(75, 7, 'updated_at', 'timestamp', 'Güncellendi', 0, 0, 1, 0, 0, 0, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 9),
(76, 7, 'deleted_at', 'timestamp', 'Silindi', 0, 0, 1, 0, 0, 1, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 10),
(77, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(78, 8, 'email', 'text', 'E-Posta', 1, 1, 1, 1, 1, 1, '{}', 2),
(79, 8, 'created_at', 'timestamp', 'Eklendi', 0, 1, 1, 0, 0, 1, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 3),
(80, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 9, 'slug', 'text', 'Sayfa Adresi', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"}}', 3),
(83, 9, 'parent_id', 'select_dropdown', 'Üst Kategori', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"title\"}}', 4),
(84, 9, 'order', 'number', 'Sıralama', 0, 1, 1, 1, 1, 1, '{\"default\":0}', 5),
(85, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(86, 10, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, '{}', 2),
(87, 10, 'slug', 'text', 'Sayfa Adresi', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 3),
(88, 10, 'excerpt', 'text_area', 'Kısa Açıklama', 0, 0, 1, 1, 1, 1, '{}', 4),
(89, 10, 'body', 'rich_text_box', 'İçerik', 0, 0, 1, 1, 1, 1, '{}', 5),
(90, 10, 'seo_title', 'text', 'SEO Başlığı', 0, 0, 1, 1, 1, 1, '{}', 6),
(91, 10, 'meta_description', 'text_area', 'Meta Açıklama', 0, 0, 1, 1, 1, 1, '{}', 7),
(92, 10, 'author_id', 'number', 'Yazar', 0, 0, 0, 0, 0, 0, '{}', 8),
(93, 10, 'status', 'text', 'Durum', 0, 0, 0, 0, 0, 0, '{\"default\":\"1\",\"options\":{\"0\":\"draft\",\"1\":\"published\",\"2\":\"pending\"}}', 9),
(94, 10, 'image', 'image', 'Görsel', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"300\"}}]}', 10),
(95, 10, 'post_category_id', 'text', 'Kategori', 0, 1, 1, 1, 1, 1, '{}', 11),
(96, 10, 'created_at', 'timestamp', 'Eklendi', 0, 1, 1, 1, 0, 1, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 12),
(97, 10, 'updated_at', 'timestamp', 'Güncellendi', 0, 0, 1, 0, 0, 0, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 13),
(98, 10, 'deleted_at', 'timestamp', 'Silindi', 0, 0, 1, 0, 0, 1, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 14),
(99, 10, 'post_belongsto_category_relationship', 'relationship', 'Kategori', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"post_category_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(101, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(103, 11, 'slug', 'text', 'Sayfa Adresi', 0, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:tags,slug\"}}', 3),
(104, 9, 'title', 'text', 'Başlık', 1, 1, 1, 1, 1, 1, '{}', 2),
(105, 11, 'title', 'text', 'Başlık', 0, 1, 1, 1, 1, 1, '{}', 2),
(106, 10, 'post_belongstomany_tag_relationship', 'relationship', 'Etiketler', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"posts_tags\",\"pivot\":\"1\",\"taggable\":\"0\"}', 16),
(107, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(108, 12, 'title', 'text', 'Başlık', 0, 1, 1, 1, 1, 1, '{}', 2),
(109, 12, 'sub_title', 'text', 'Alt Başlık', 0, 1, 1, 1, 1, 1, '{}', 3),
(110, 12, 'excerpt', 'text_area', 'Kısa Açıklama', 0, 1, 1, 1, 1, 1, '{}', 4),
(111, 12, 'body', 'rich_text_box', 'Uzun İçerik (varsa)', 0, 0, 1, 1, 1, 1, '{}', 5),
(112, 12, 'image', 'image', 'Görsel 1 (varsa)', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"2000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":false,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"300\"}}]}', 6),
(113, 12, 'image2', 'image', 'Görsel 2 (varsa)', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"2000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":false,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"300\"}}]}', 7),
(114, 12, 'image3', 'image', 'Görsel 3 (varsa)', 0, 0, 1, 1, 1, 1, '{\"resize\":{\"width\":\"2000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":false,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"300\"}}]}', 8),
(115, 12, 'link1_text', 'text', 'Bağlantı 1 Yazısı (varsa)', 0, 1, 1, 1, 1, 1, '{}', 9),
(116, 12, 'link1_url', 'text', 'Bağlantı 1 URL (varsa)', 0, 0, 1, 1, 1, 1, '{}', 10),
(117, 12, 'link2_text', 'text', 'Bağlantı 2 Yazısı (varsa)', 0, 0, 1, 1, 1, 1, '{}', 11),
(118, 12, 'link2_url', 'text', 'Bağlantı 2 URL (varsa)', 0, 0, 1, 1, 1, 1, '{}', 12),
(119, 12, 'created_at', 'timestamp', 'Üretildi', 0, 0, 1, 0, 0, 1, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 13),
(120, 12, 'updated_at', 'timestamp', 'Güncellendi', 0, 1, 1, 0, 0, 0, '{\"format\":\"%d-%m-%Y %H:%M:%S\"}', 14);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Kullanıcı', 'Kullanıcılar', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-04-27 17:10:57', '2022-12-19 02:33:42'),
(2, 'menus', 'menus', 'Menü', 'Menüler', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-04-27 17:10:57', '2022-04-27 18:21:05'),
(3, 'roles', 'roles', 'Yetki', 'Yetkiler', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-04-27 17:10:57', '2022-04-27 18:19:15'),
(4, 'pages', 'pages', 'Sayfa', 'Sayfalar', 'voyager-file-text', 'App\\Models\\Page', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":\"title\",\"scope\":null}', '2022-05-18 13:28:58', '2022-12-16 22:55:00'),
(5, 'websites', 'websites', 'Website Ayarı', 'Website Ayarları', 'voyager-world', 'App\\Models\\Website', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"name\"}', '2022-12-16 12:16:07', '2022-12-16 12:16:07'),
(6, 'slides', 'slides', 'Manşet', 'Manşetler', 'voyager-photos', 'App\\Models\\Slide', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":\"title\"}', '2022-12-18 20:17:24', '2022-12-18 20:17:24'),
(7, 'contacts', 'contacts', 'İletişim Formu', 'İletişim Formları', 'voyager-mail', 'App\\Models\\Contact', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"name\",\"scope\":null}', '2022-12-19 01:46:32', '2022-12-19 05:24:17'),
(8, 'newsletters', 'newsletters', 'Bülten E-Postası', 'Bülten E-Postaları', 'voyager-mail', 'App\\Models\\Newsletter', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"email\"}', '2022-12-19 05:24:07', '2022-12-19 05:24:07'),
(9, 'categories', 'categories', 'Kategorisi', 'Kategorileri', 'voyager-categories', 'App\\Models\\Category', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 1, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-12-19 17:02:21', '2022-12-21 12:03:33'),
(10, 'posts', 'posts', 'İçerik', 'İçerikler', 'voyager-news', 'App\\Models\\Post', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"title\",\"scope\":null}', '2022-12-19 17:09:49', '2022-12-27 11:07:44'),
(11, 'tags', 'tags', 'Etiket', 'Etiketler', 'voyager-tag', 'App\\Models\\Tag', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-12-19 17:14:26', '2022-12-21 12:03:16'),
(12, 'parts', 'parts', 'Parça', 'Parçalar', 'voyager-pizza', 'App\\Models\\Part', NULL, 'App\\Http\\Controllers\\Admin\\Defaults\\BrowseController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}', '2022-12-27 12:54:05', '2022-12-27 23:51:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-04-27 17:10:57', '2022-04-27 17:10:57');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Giriş', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2022-04-27 17:10:57', '2022-04-27 18:11:53', 'voyager.dashboard', 'null'),
(2, 1, 'Medya Yönetimi', '', '_self', 'voyager-images', '#000000', NULL, 10, '2022-04-27 17:10:57', '2022-12-27 23:37:52', 'voyager.media.index', 'null'),
(3, 1, 'Kullanıcı Listesi', '', '_self', 'voyager-person', '#000000', 11, 1, '2022-04-27 17:10:57', '2022-04-27 18:14:35', 'voyager.users.index', 'null'),
(4, 1, 'Yetkiler', '', '_self', 'voyager-lock', '#000000', 11, 2, '2022-04-27 17:10:57', '2022-04-27 18:14:40', 'voyager.roles.index', 'null'),
(5, 1, 'Araçlar', '', '_self', 'voyager-tools', '#000000', NULL, 12, '2022-04-27 17:10:57', '2022-12-27 23:37:52', NULL, ''),
(6, 1, 'Menü Oluşturucu', '', '_self', 'voyager-list', '#000000', 5, 1, '2022-04-27 17:10:57', '2022-04-27 18:14:32', 'voyager.menus.index', 'null'),
(7, 1, 'Veritabanı', '', '_self', 'voyager-data', '#000000', 5, 2, '2022-04-27 17:10:57', '2022-04-27 18:14:32', 'voyager.database.index', 'null'),
(8, 1, 'Dökümantasyon', '', '_self', 'voyager-compass', '#000000', 5, 3, '2022-04-27 17:10:57', '2022-04-27 18:14:32', 'voyager.compass.index', 'null'),
(9, 1, 'Panel Üreteci', '', '_self', 'voyager-bread', '#000000', 5, 4, '2022-04-27 17:10:57', '2022-04-27 18:14:32', 'voyager.bread.index', 'null'),
(10, 1, 'Ayarlar', '', '_self', 'voyager-settings', '#000000', NULL, 13, '2022-04-27 17:10:57', '2022-12-27 23:37:52', 'voyager.settings.index', 'null'),
(11, 1, 'Kullanıcılar', '', '_self', 'voyager-person', '#000000', NULL, 9, '2022-04-27 18:14:29', '2022-12-27 23:37:52', NULL, ''),
(12, 1, 'Sayfalar', '', '_self', 'voyager-file-text', '#000000', NULL, 4, '2022-05-18 13:28:58', '2022-12-19 17:58:21', 'voyager.pages.index', 'null'),
(13, 1, 'Website Ayarları', '', '_self', 'voyager-world', '#000000', NULL, 3, '2022-12-16 12:16:07', '2022-12-19 17:58:21', 'voyager.websites.edit', '{\"id\":1}'),
(14, 1, 'Manşetler', '', '_self', 'voyager-photos', '#000000', NULL, 5, '2022-12-18 20:17:24', '2022-12-19 17:58:21', 'voyager.slides.index', 'null'),
(15, 1, 'İletişim Formları', '', '_self', 'voyager-mail', '#000000', NULL, 8, '2022-12-19 01:46:32', '2022-12-27 23:37:52', 'voyager.contacts.index', 'null'),
(16, 1, 'Bülten E-Postaları', '', '_self', 'voyager-mail', '#000000', NULL, 11, '2022-12-19 05:24:07', '2022-12-27 23:37:52', 'voyager.newsletters.index', 'null'),
(17, 1, 'Kategoriler', '', '_self', 'voyager-categories', '#000000', 20, 2, '2022-12-19 17:02:21', '2022-12-19 17:58:34', 'voyager.categories.index', 'null'),
(18, 1, 'İçerikler', '', '_self', 'voyager-news', '#000000', 20, 1, '2022-12-19 17:09:50', '2022-12-19 17:58:28', 'voyager.posts.index', 'null'),
(19, 1, 'Etiketler', '', '_self', 'voyager-tag', '#000000', 20, 3, '2022-12-19 17:14:26', '2022-12-19 17:58:34', 'voyager.tags.index', 'null'),
(20, 1, 'İçerik Listesi', '', '_self', 'voyager-treasure', '#000000', NULL, 2, '2022-12-19 17:58:15', '2022-12-19 17:58:21', NULL, ''),
(22, 1, 'Parçalar', '', '_self', 'voyager-pizza', '#000000', NULL, 6, '2022-12-27 23:37:17', '2022-12-27 23:37:52', 'voyager.parts.index', 'null');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `redirect_url` text DEFAULT NULL,
  `sub_title` text DEFAULT NULL,
  `header_image` varchar(255) DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `pages`
--

INSERT INTO `pages` (`id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `seo_title`, `redirect_url`, `sub_title`, `header_image`, `photos`, `created_at`, `updated_at`, `order`) VALUES
(1, 'Hakkımızda', 'Monstruosi honesta emancipaverat appellat Democritus una transferre reformidans curis celeritas extremum abducat causam detractio insipientiam legimus uberiora provocarem sequamur Medeam liber! Animo ornatum scientiam brevi emancipaverat utens ponendam versatur gratia. ', '<p>Inhumanus perferendis sinat atomi sapientium dicta adduci facio, Vivere vester multam novi ne faciunt audita vigiliae dissentiet multa dicere poena splendide officia eveniet. Beatam vias recta nobis errore suscepi iniurias An maiestatis primorum privatione, Ei poterit expectamus equidem Atilii disputata potione efficeretur praetermissum ita eoque futurove et Terentianus attulit.</p>\n<p>Brute mentitum convincere voluptati Epicurus illius contentiones deteriora maiora ponunt physici geometriaque. Satis Iam consuevit illo deterritum fere scribere dici e ignaviamque emolumenti declarant ait peccant tradidisse.</p>\n<p>Meminerit dominos sequimur perdiscere Quamquam chorusque dissensio transferam delectet inliberali prima iracundiae sumus scriptum maiores!</p>', 'pages/December2022/KzxDvSVEiFjaIBkq2iF4.jpg', 'hakkimizda', '', '', '', 'Biz Kimiz?', 'pages/December2022/nYFHMhUzwDDEWiZzQXiA.jpg', NULL, '2022-12-16 21:30:16', '2022-12-17 02:16:25', 1),
(3, 'İletişim', 'Invidus tradit exitum facillime error periculis praesentium vera legere expetendis huic praetermittenda familias liberae facillimis nisi difficilius paranda nemo, Maerores pecuniae pulchraeque Ad facio docendi non quid medium concessum Quid videre acute pariant detrimenti munere eiusdem expressas: ', '<p>Explicatam publicam appetendi patientiamque expleantur consumere dominos pertinacia officii malint dolor defendit inflammat cupiditatum modo omittendis negent utramque sapientium tranquillitatem is, Convincere semel correcta ferant is usu curis liberavisse intelleges De potest cur sollicitudines illa feramus!</p>\n<p>Impetu intellegitur materia plus iuberet adhibuit Pacuvii pericula secundum probet interdictum exultat dissentiet quidam imagines Attico iuste licet naturalem; Referenda officia cogitavisse credo cogitemus eventurum propriae fingitur expetitur quondam rogatiuncula. Earum posuit reperire officii domus Confirmat Torquatum invidi odioque quaeri fastidium tenere Triarium? Negant explicari tot dictas oderis Graeci Triari optabilem utroque maximo potius inhumanus debitis extremo viderer.</p>\n<p>Assentior moderatius libenter vis turpis maior supplicii illi disputata animum loco mediocris divitias possit labores accusata parabilis etiam videretur officiis. L captet ferre scriptorem conducunt monstruosi id necessitatibus amarissimam inculta adiuvet angusti laborat modum ullam privatio Metrodorus ficta minuti deorsus. Meo affecti summum satisfacit sapientes contemnere victi quin vindicet quidam sentiunt offendimur laudatur quando facio iudicabit depravata flagitem: Persequeris credo meo quantumcumque distrahi quidque meque morbi intellegentium nacti nacti Invitat odio fatemur dicam.</p>\n<p>Doceat Latinis vos Aristoteli fruuntur labefactant Ex ea permanentes. Maledici pericula nec legat legere scientiam intuemur libidinum factis maximo Utinam omnesque virtutem ornateque contrariis opera Quae; An turpius succumbere fruenda venustate ipsis disciplina Cyrenaicos turpis privatio faciam labore Nisi transferre Quae!</p>\n<p>Turma pertinaces effugiendorum patiatur eam pecuniae capti Torquatis conferebamus accusata. Inveniri quantus depulsa iudicia ceterorum intercapedo sensibus morborum gubernatoris infinito mollis complexiones nemore inopem Quamquam eveniet qui. Video sentiunt necesse utramque conetur oratoribus arbitratu specie civibus intemperantes intellegere placebit Nihil quietem fastidium stulti dicat dedocere iuste Chrysippe indicaverunt. Illa poena fortasse e disciplinis fatendum scriptorem Brute praesens statim errata libidinem intellegaturque vivi censes.</p>', 'pages/December2022/I7XICSz6IlCjW9rMoKbw.jpg', 'iletisim', '', '', '', 'BİZE ULAŞIN', 'pages/December2022/jo95cs11jGAir2S6CPHa.jpg', NULL, '2022-12-16 22:52:08', '2022-12-17 02:16:25', 2),
(4, 'Gizlilik Politikası', 'Cupiditates melius opera fortibus parentes delectet litterae dedocere existimare personae impensa semel praeclare nomini quanta provocatus semel semper stare dubitemus doloris; Maximi nullas reprimique omnia Silano facta Aristippus An morte infinitum indignius studium errorem Qui C honeste sedulitatem quantumcumque mediocrium individua. ', '<p>Commemorandis faciendum artifex praesentibus factis probarem otiosum porrecta placet fecerit id nec novi homine! Fuisse modo ita eadem neque tum Chremes saepe delectu coercendi geometrica imperiis quandam inanium corpus delectat divitias corpore, Gubernatoris declinare malit leguntur facillime diceretur multitudinem mihi reprehendunt nihil nihil filium fatemur fit naturam.<br>Epicureum paene penitus praeterea evolutio certe lucifugi expeteretur quot dicitis Torquate animus cepisse optio beate. Sensum affert finibus refert dominorum Tantalo telos sponte voluit accusata, Pellat succumbere dubitemus pugnantibus litterae ancillae causam animi nominant vim Democrito tenetur loco afferre nemini?</p>\n<p>Collaudata dixi Albuci eos elegantis multi detracta patria malivoli. Cogitavisse queo dixit mei varias molestum tu sequatur per electis vera nobis tua certe melius inscientia robustus attulit honestatis efficiantur? Primorum foris perpetuis efficere bonas adversa locis inpendente aliquando parabilis loqueretur admirer. Intellegam poenis publicam habeo admirer quis virtutem mors profecto maximo gloriae altera scribere nostrum conducunt.</p>\n<p>Diceretur num sequamur impedit Stoici terminatas longinquitate temeritate Eademque omnis malivoli afferat nos liberae oratio utriusque honesto. Iustitiam expetendis rebus quoniam sinat inermis desiderent refugiendi ludus inferiorem. Transferam tandem nemore probaretur quem constituit philosophorum amarissimam ferrentur opinemur gravioribus pluribus meminerunt dignissimos elegans equidem De terrore. Exultat potiendi vidisse has eximiae Aristoteli neglexerit verbi mollitia tua parum quis suspicio requirere voluptatum!</p>\n<p>Mortem causa corporisque labitur doceat facile maiestatis itaque liberavisse beatus animos Latinas magnus. Fabulis quantumcumque conducunt libro videtur eripuit potuimus expectant praebeat praetulerit varias admissum obcaecati Democritus quam vivamus confidam Deinde. Adiungimus erudito inhumanus miraretur aliquo locum displicet; Faciant efficeretur retinent conversam adiuvet admodum inflammat possunt situm effici arbitratu cives legendus tu nostri.</p>\n<p>Mei tradunt Triarium valetudinis Epicureum aptissimum constringendos ornateque doceat sero ducem declinationem probaretur amatoriis pondere primisque Siculis; Imperio placebit parentes nutu lectorem dolendum video mundi elegans delicatissimi is ei; Liberae putamus ullus poena expeteretur gerendarum fugiamus quieti multa finiri Torquatus Democriti permulta, Epularum ipsa Graecis potest inveneris Macedonum oratio distinguantur fugiat lectorem partes animum vituperatum publicam Torquate. Patrioque optari negant ingenia beatus sapiente perfruique civibus ita ii naturae dixit scribentur cruciantur aliquam.</p>\n<p>Maior patrius possum paranda credere plerique patrius attingere equidem ecce expetendum nutu lucifugi hominem est verissimum manu vivendo, Emolumenti firmitatem homines studia decore efficere nudus solent improbis, Ferantur satis declinatio virtutem scribentur multa terminari circumcisaque desistunt maximis. Frequenter defuit plusque adquiescere dissentias locus ignaviamque timeam maximeque tribuat sumus dicunt debeo leniter expetitur optinere illas velit istam audivi postremo? Assecutus eamque quicquam percurri meminerit inflammat iucunda operam interpretum maximi accusantibus vita saluto stare Democriti.</p>\n<p>Hortensio quaeri propriae requietis poena Qui nostrum postremo potione audire iactare liber intellegere maestitiam ignavi intus; Praeterea vocet gratissimo minorem dolere inpendente praeter pericula quantus Eadem mediocris contemnentes illo leniter tanta sinat minime, Faciam seiunctum iucunditate transferam perturbari Latina conversam amaret delectet laetetur putant utraque referatur humili potiendi imperio scilicet reliquarum permulta maximam. Animumque ducimus diligenter fore mala statuat artis fortitudinis significet iudico torquem Democritus Romanum laboribus Chrysippe.</p>', NULL, 'gizlilik-politikasi', '', '', '', 'Güvendesiniz', NULL, NULL, '2022-12-18 16:59:50', '2022-12-18 16:59:50', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `parts`
--

CREATE TABLE `parts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `image2` text DEFAULT NULL,
  `image3` text DEFAULT NULL,
  `link1_text` text DEFAULT NULL,
  `link1_url` text DEFAULT NULL,
  `link2_text` text DEFAULT NULL,
  `link2_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `parts`
--

INSERT INTO `parts` (`id`, `title`, `sub_title`, `excerpt`, `body`, `image`, `image2`, `image3`, `link1_text`, `link1_url`, `link2_text`, `link2_url`, `created_at`, `updated_at`) VALUES
(1, 'Anasayfa Deneme Giriş Yazısı Lorem Ipsum', '', 'Fusce a quam. Pellentesque libero tortor, tincidunt et, tincidunt eget, semper nec, quam. Etiam imperdiet imperdiet orci. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo.', '', 'parts/December2022/PWX0y59wZRg5zSjcQ7QX.jpg', NULL, NULL, 'Bizi Yakından Tanıyın', '#', 'Bize Ulaşın', '#', '2022-12-27 12:59:25', '2022-12-27 23:57:11'),
(2, 'Son İçerikler', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum quisquam eum porro a pariatur veniam.', '', NULL, NULL, NULL, 'Tüm İçerikler', '#', '', '', '2022-12-27 13:00:40', '2022-12-27 13:00:40'),
(3, 'Mutlu Müşteriler', '', '', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Id quam sapiente molestiae numquam quas, voluptates omnis nulla ea odio quia similique corrupti magnam.</p>\n<p><strong>Anna Smith - </strong><em>Product manager</em></p>', 'parts/December2022/J2c6zKO3eLwD9MHmqy9v.jpg', NULL, NULL, '', '', '', '', '2022-12-27 13:10:33', '2022-12-27 23:57:01');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(2, 'browse_bread', NULL, '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(3, 'browse_database', NULL, '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(4, 'browse_media', NULL, '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(5, 'browse_compass', NULL, '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(6, 'browse_menus', 'menus', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(7, 'read_menus', 'menus', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(8, 'edit_menus', 'menus', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(9, 'add_menus', 'menus', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(10, 'delete_menus', 'menus', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(11, 'browse_roles', 'roles', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(12, 'read_roles', 'roles', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(13, 'edit_roles', 'roles', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(14, 'add_roles', 'roles', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(15, 'delete_roles', 'roles', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(16, 'browse_users', 'users', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(17, 'read_users', 'users', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(18, 'edit_users', 'users', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(19, 'add_users', 'users', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(20, 'delete_users', 'users', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(21, 'browse_settings', 'settings', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(22, 'read_settings', 'settings', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(23, 'edit_settings', 'settings', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(24, 'add_settings', 'settings', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(25, 'delete_settings', 'settings', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(26, 'browse_pages', 'pages', '2022-05-18 13:28:58', '2022-05-18 13:28:58'),
(27, 'read_pages', 'pages', '2022-05-18 13:28:58', '2022-05-18 13:28:58'),
(28, 'edit_pages', 'pages', '2022-05-18 13:28:58', '2022-05-18 13:28:58'),
(29, 'add_pages', 'pages', '2022-05-18 13:28:58', '2022-05-18 13:28:58'),
(30, 'delete_pages', 'pages', '2022-05-18 13:28:58', '2022-05-18 13:28:58'),
(31, 'browse_websites', 'websites', '2022-12-16 12:16:07', '2022-12-16 12:16:07'),
(32, 'read_websites', 'websites', '2022-12-16 12:16:07', '2022-12-16 12:16:07'),
(33, 'edit_websites', 'websites', '2022-12-16 12:16:07', '2022-12-16 12:16:07'),
(34, 'add_websites', 'websites', '2022-12-16 12:16:07', '2022-12-16 12:16:07'),
(35, 'delete_websites', 'websites', '2022-12-16 12:16:07', '2022-12-16 12:16:07'),
(36, 'browse_slides', 'slides', '2022-12-18 20:17:24', '2022-12-18 20:17:24'),
(37, 'read_slides', 'slides', '2022-12-18 20:17:24', '2022-12-18 20:17:24'),
(38, 'edit_slides', 'slides', '2022-12-18 20:17:24', '2022-12-18 20:17:24'),
(39, 'add_slides', 'slides', '2022-12-18 20:17:24', '2022-12-18 20:17:24'),
(40, 'delete_slides', 'slides', '2022-12-18 20:17:24', '2022-12-18 20:17:24'),
(41, 'browse_contacts', 'contacts', '2022-12-19 01:46:32', '2022-12-19 01:46:32'),
(42, 'read_contacts', 'contacts', '2022-12-19 01:46:32', '2022-12-19 01:46:32'),
(43, 'edit_contacts', 'contacts', '2022-12-19 01:46:32', '2022-12-19 01:46:32'),
(44, 'add_contacts', 'contacts', '2022-12-19 01:46:32', '2022-12-19 01:46:32'),
(45, 'delete_contacts', 'contacts', '2022-12-19 01:46:32', '2022-12-19 01:46:32'),
(46, 'browse_newsletters', 'newsletters', '2022-12-19 05:24:07', '2022-12-19 05:24:07'),
(47, 'read_newsletters', 'newsletters', '2022-12-19 05:24:07', '2022-12-19 05:24:07'),
(48, 'edit_newsletters', 'newsletters', '2022-12-19 05:24:07', '2022-12-19 05:24:07'),
(49, 'add_newsletters', 'newsletters', '2022-12-19 05:24:07', '2022-12-19 05:24:07'),
(50, 'delete_newsletters', 'newsletters', '2022-12-19 05:24:07', '2022-12-19 05:24:07'),
(51, 'browse_categories', 'categories', '2022-12-19 17:02:21', '2022-12-19 17:02:21'),
(52, 'read_categories', 'categories', '2022-12-19 17:02:21', '2022-12-19 17:02:21'),
(53, 'edit_categories', 'categories', '2022-12-19 17:02:21', '2022-12-19 17:02:21'),
(54, 'add_categories', 'categories', '2022-12-19 17:02:21', '2022-12-19 17:02:21'),
(55, 'delete_categories', 'categories', '2022-12-19 17:02:21', '2022-12-19 17:02:21'),
(56, 'browse_posts', 'posts', '2022-12-19 17:09:50', '2022-12-19 17:09:50'),
(57, 'read_posts', 'posts', '2022-12-19 17:09:50', '2022-12-19 17:09:50'),
(58, 'edit_posts', 'posts', '2022-12-19 17:09:50', '2022-12-19 17:09:50'),
(59, 'add_posts', 'posts', '2022-12-19 17:09:50', '2022-12-19 17:09:50'),
(60, 'delete_posts', 'posts', '2022-12-19 17:09:50', '2022-12-19 17:09:50'),
(61, 'browse_tags', 'tags', '2022-12-19 17:14:26', '2022-12-19 17:14:26'),
(62, 'read_tags', 'tags', '2022-12-19 17:14:26', '2022-12-19 17:14:26'),
(63, 'edit_tags', 'tags', '2022-12-19 17:14:26', '2022-12-19 17:14:26'),
(64, 'add_tags', 'tags', '2022-12-19 17:14:26', '2022-12-19 17:14:26'),
(65, 'delete_tags', 'tags', '2022-12-19 17:14:26', '2022-12-19 17:14:26'),
(66, 'browse_parts', 'parts', '2022-12-27 12:54:05', '2022-12-27 12:54:05'),
(67, 'read_parts', 'parts', '2022-12-27 12:54:05', '2022-12-27 12:54:05'),
(68, 'edit_parts', 'parts', '2022-12-27 12:54:05', '2022-12-27 12:54:05'),
(69, 'add_parts', 'parts', '2022-12-27 12:54:05', '2022-12-27 12:54:05'),
(70, 'delete_parts', 'parts', '2022-12-27 12:54:05', '2022-12-27 12:54:05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(4, 3),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 3),
(22, 1),
(22, 3),
(23, 1),
(23, 3),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(35, 1),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(40, 3),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(43, 1),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(60, 3),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(66, 3),
(67, 1),
(67, 3),
(68, 1),
(68, 3),
(69, 1),
(70, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `image` text DEFAULT NULL,
  `post_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `excerpt`, `body`, `seo_title`, `meta_description`, `author_id`, `status`, `image`, `post_category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Phasellus blandit leo ut odio', 'phasellus-blandit-leo-ut-odio', 'Fusce ac felis sit amet ligula pharetra condimentum. Duis vel nibh at velit scelerisque suscipit. Nam pretium turpis et arcu', '<p>Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Curabitur a felis in nunc fringilla tristique. In hac habitasse platea dictumst. Pellentesque auctor neque nec urna.</p>\n<p>Curabitur a felis in nunc fringilla tristique. Nulla sit amet est. Aliquam lobortis. Vivamus laoreet.</p>\n<p>Cras dapibus. Curabitur nisi. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Phasellus tempus.</p>', '', '', NULL, 1, 'posts/December2022/JXIi9kglDOXImWnB6qpj.jpg', 1, '2022-12-27 11:15:08', '2022-12-27 11:15:08', NULL),
(3, 'Vestibulum suscipit nulla quis orci', 'vestibulum-suscipit-nulla-quis-orci', 'Vestibulum suscipit nulla quis orci. Pellentesque ut neque. Vivamus elementum semper nisi. Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi', '<p>Fusce ac felis sit amet ligula pharetra condimentum. Cras sagittis. Sed cursus turpis vitae tortor. Nullam tincidunt adipiscing enim. Nunc nec neque.</p>\n<p>Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus. Quisque id odio. Fusce commodo aliquam arcu. Aenean ut eros et nisl sagittis vestibulum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede.</p>\n<p>Etiam imperdiet imperdiet orci. Praesent egestas tristique nibh. Curabitur at lacus ac velit ornare lobortis. Maecenas nec odio et ante tincidunt tempus. Aenean imperdiet.</p>\n<p>Fusce fermentum. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Curabitur at lacus ac velit ornare lobortis. Maecenas malesuada. Ut varius tincidunt libero.</p>', '', '', NULL, 1, 'posts/December2022/VEV5vMVQsxbofQwTjpzA.jpg', 1, '2022-12-27 11:16:18', '2022-12-27 11:16:18', NULL),
(4, 'Türkçe başlık habitant morbi tristiquev', 'turkce-baslik-habitant-morbi-tristiquev', 'Quisque id mi. Nullam vel sem. Aenean ut eros et nisl sagittis vestibulum. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus. Vivamus in erat ut urna cursus vestibulum.', '<p>In ac felis quis tortor malesuada pretium. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Praesent congue erat at massa. Nam pretium turpis et arcu. Sed in libero ut nibh placerat accumsan.</p>\n<p>Etiam iaculis nunc ac metus. In ut quam vitae odio lacinia tincidunt. Etiam rhoncus. Nunc interdum lacus sit amet orci. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus.</p>\n<p>Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Cras id dui. Phasellus a est. Fusce ac felis sit amet ligula pharetra condimentum. Curabitur a felis in nunc fringilla tristique.</p>\n<p>Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. In hac habitasse platea dictumst. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Ut non enim eleifend felis pretium feugiat. Phasellus nec sem in justo pellentesque facilisis.</p>', '', '', NULL, 1, 'posts/December2022/huRdMqDSG2ueSDO0AZwk.jpg', 1, '2022-12-27 11:17:00', '2022-12-27 11:19:37', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts_tags`
--

CREATE TABLE `posts_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `posts_tags`
--

INSERT INTO `posts_tags` (`id`, `post_id`, `tag_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 1),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(2, 'user', 'Normal User', '2022-04-27 17:10:57', '2022-04-27 17:10:57'),
(3, 'publisher', 'Publisher', '2022-12-29 11:05:46', '2022-12-29 11:05:46');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Base System', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Base', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `page_url` text DEFAULT NULL,
  `order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `slides`
--

INSERT INTO `slides` (`id`, `title`, `sub_title`, `excerpt`, `image`, `page_url`, `order`) VALUES
(1, 'Demo Manşet Başlığı', 'Demo Amaçlı Görsel Alt Başlığı', 'Buraya yönetim panelinden bu manşet hakkında kısa bir yazı yazılabilir', 'slides/December2022/diVDAmASqY9UcHm38b2C.jpg', 'page/hakkimizda', 0),
(2, 'Test Başlığı', 'Test Amaçlı Görsel Alt Başlığı', 'Buraya yönetim panelinden bu manşet hakkında kısa bir yazı yazılabilir', 'slides/December2022/8tkDRfVt91pM1yVjjPyd.jpg', '', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `tags`
--

INSERT INTO `tags` (`id`, `title`, `slug`) VALUES
(1, 'Akademik', 'akademik'),
(2, 'Fikir', 'fikir');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'menu_items', 'title', 1, 'en', 'Dashboard', '2022-04-27 18:11:53', '2022-04-27 18:11:53'),
(2, 'menu_items', 'title', 3, 'en', 'User List', '2022-04-27 18:12:08', '2022-12-19 17:26:43'),
(3, 'menu_items', 'title', 4, 'en', 'Roles', '2022-04-27 18:12:16', '2022-04-27 18:12:16'),
(4, 'menu_items', 'title', 2, 'en', 'Media Management', '2022-04-27 18:12:27', '2022-12-19 17:27:11'),
(5, 'menu_items', 'title', 5, 'en', 'Tools', '2022-04-27 18:12:38', '2022-04-27 18:12:38'),
(6, 'menu_items', 'title', 6, 'en', 'Menu Builder', '2022-04-27 18:12:46', '2022-04-27 18:12:46'),
(7, 'menu_items', 'title', 7, 'en', 'Database', '2022-04-27 18:12:52', '2022-04-27 18:12:52'),
(8, 'menu_items', 'title', 8, 'en', 'Compass', '2022-04-27 18:13:04', '2022-04-27 18:13:04'),
(9, 'menu_items', 'title', 9, 'en', 'Panel Generator', '2022-04-27 18:13:39', '2022-12-19 17:28:31'),
(10, 'menu_items', 'title', 11, 'en', 'Users', '2022-04-27 18:14:29', '2022-04-27 18:14:29'),
(11, 'menu_items', 'title', 10, 'en', 'Settings', '2022-04-27 18:14:49', '2022-04-27 18:14:49'),
(12, 'data_rows', 'display_name', 16, 'en', 'ID', '2022-04-27 18:19:15', '2022-04-27 18:19:15'),
(13, 'data_rows', 'display_name', 17, 'en', 'Name', '2022-04-27 18:19:15', '2022-04-27 18:19:15'),
(14, 'data_rows', 'display_name', 20, 'en', 'Display Name', '2022-04-27 18:19:15', '2022-04-27 18:19:15'),
(15, 'data_rows', 'display_name', 18, 'en', 'Created At', '2022-04-27 18:19:15', '2022-04-27 18:19:15'),
(16, 'data_rows', 'display_name', 19, 'en', 'Updated At', '2022-04-27 18:19:15', '2022-04-27 18:19:15'),
(17, 'data_types', 'display_name_singular', 3, 'en', 'Role', '2022-04-27 18:19:15', '2022-04-27 18:19:15'),
(18, 'data_types', 'display_name_plural', 3, 'en', 'Roles', '2022-04-27 18:19:15', '2022-04-27 18:19:15'),
(19, 'data_rows', 'display_name', 1, 'en', 'ID', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(20, 'data_rows', 'display_name', 21, 'en', 'Role', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(21, 'data_rows', 'display_name', 2, 'en', 'Name', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(22, 'data_rows', 'display_name', 3, 'en', 'Email', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(23, 'data_rows', 'display_name', 8, 'en', 'Avatar', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(24, 'data_rows', 'display_name', 4, 'en', 'Password', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(25, 'data_rows', 'display_name', 5, 'en', 'Remember Token', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(26, 'data_rows', 'display_name', 11, 'en', 'Settings', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(27, 'data_rows', 'display_name', 6, 'en', 'Created At', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(28, 'data_rows', 'display_name', 7, 'en', 'Updated At', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(29, 'data_rows', 'display_name', 9, 'en', 'Role', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(30, 'data_rows', 'display_name', 10, 'en', 'Special Roles', '2022-04-27 18:20:36', '2022-12-19 02:33:31'),
(31, 'data_types', 'display_name_singular', 1, 'en', 'User', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(32, 'data_types', 'display_name_plural', 1, 'en', 'Users', '2022-04-27 18:20:36', '2022-04-27 18:20:36'),
(33, 'data_rows', 'display_name', 12, 'en', 'ID', '2022-04-27 18:21:05', '2022-04-27 18:21:05'),
(34, 'data_rows', 'display_name', 13, 'en', 'Name', '2022-04-27 18:21:05', '2022-04-27 18:21:05'),
(35, 'data_rows', 'display_name', 14, 'en', 'Created At', '2022-04-27 18:21:05', '2022-04-27 18:21:05'),
(36, 'data_rows', 'display_name', 15, 'en', 'Updated At', '2022-04-27 18:21:05', '2022-04-27 18:21:05'),
(37, 'data_types', 'display_name_singular', 2, 'en', 'Menu', '2022-04-27 18:21:05', '2022-04-27 18:21:05'),
(38, 'data_types', 'display_name_plural', 2, 'en', 'Menus', '2022-04-27 18:21:05', '2022-04-27 18:21:05'),
(39, 'data_rows', 'display_name', 23, 'en', 'Id', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(40, 'data_rows', 'display_name', 24, 'en', 'Başlık', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(41, 'data_rows', 'display_name', 25, 'en', 'Kısa Açıklama', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(42, 'data_rows', 'display_name', 26, 'en', 'Sayfa İçeriği', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(43, 'data_rows', 'display_name', 27, 'en', 'Görsel', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(44, 'data_rows', 'display_name', 28, 'en', 'Sayfa Adresi', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(45, 'data_rows', 'display_name', 29, 'en', 'Meta Açıklama', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(46, 'data_rows', 'display_name', 30, 'en', 'SEO Başlığı', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(47, 'data_rows', 'display_name', 31, 'en', 'Sayfayı Tamamen Yönlendir', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(48, 'data_rows', 'display_name', 32, 'en', 'Alt Başlık', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(49, 'data_rows', 'display_name', 33, 'en', 'Üst Görsel', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(50, 'data_rows', 'display_name', 34, 'en', 'Sayfa Galerisi', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(51, 'data_rows', 'display_name', 35, 'en', 'Yaratıldı', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(52, 'data_rows', 'display_name', 36, 'en', 'Güncellendi', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(53, 'data_types', 'display_name_singular', 4, 'en', 'Page', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(54, 'data_types', 'display_name_plural', 4, 'en', 'Pages', '2022-05-18 13:29:12', '2022-05-18 13:29:12'),
(55, 'menu_items', 'title', 12, 'en', 'Pages', '2022-05-18 13:29:25', '2022-05-18 13:29:25'),
(56, 'menu_items', 'title', 13, 'en', 'Website Settings', '2022-12-16 12:20:33', '2022-12-19 17:24:28'),
(57, 'websites', 'name', 1, 'en', 'DEMO', '2022-12-16 15:04:43', '2022-12-19 17:50:48'),
(58, 'websites', 'slug', 1, 'en', 'demo', '2022-12-16 15:04:43', '2022-12-19 17:50:48'),
(59, 'websites', 'seo_title', 1, 'en', 'SEO TITLE IS IMPORTANT FOR SEO', '2022-12-16 15:04:43', '2022-12-16 15:04:43'),
(60, 'websites', 'meta_description', 1, 'en', 'META DESCRIPTION IS IMPORTANT FOR SEO', '2022-12-16 15:04:43', '2022-12-16 15:04:43'),
(61, 'data_rows', 'display_name', 58, 'en', 'Sayfa Tanım Anahtarı (Benzersiz anahtar)', '2022-12-16 20:51:45', '2022-12-16 20:51:45'),
(62, 'data_rows', 'display_name', 59, 'en', 'Sıralama', '2022-12-16 21:13:56', '2022-12-16 21:13:56'),
(63, 'pages', 'title', 1, 'en', 'About Us', '2022-12-16 21:54:27', '2022-12-16 21:54:27'),
(64, 'pages', 'sub_title', 1, 'en', 'Who Are We?', '2022-12-16 21:54:27', '2022-12-16 21:54:27'),
(65, 'pages', 'excerpt', 1, 'en', 'Monstruosi honesta emancipaverat appellat Democritus una transferre reformidans curis celeritas extremum abducat causam detractio insipientiam legimus uberiora provocarem sequamur Medeam liber! Animo ornatum scientiam brevi emancipaverat utens ponendam versatur gratia. ', '2022-12-16 21:54:27', '2022-12-16 21:54:27'),
(66, 'pages', 'body', 1, 'en', '<p>Inhumanus perferendis sinat atomi sapientium dicta adduci facio, Vivere vester multam novi ne faciunt audita vigiliae dissentiet multa dicere poena splendide officia eveniet. Beatam vias recta nobis errore suscepi iniurias An maiestatis primorum privatione, Ei poterit expectamus equidem Atilii disputata potione efficeretur praetermissum ita eoque futurove et Terentianus attulit.</p>\n<p>Brute mentitum convincere voluptati Epicurus illius contentiones deteriora maiora ponunt physici geometriaque. Satis Iam consuevit illo deterritum fere scribere dici e ignaviamque emolumenti declarant ait peccant tradidisse.</p>\n<p>Meminerit dominos sequimur perdiscere Quamquam chorusque dissensio transferam delectet inliberali prima iracundiae sumus scriptum maiores!</p>', '2022-12-16 21:54:27', '2022-12-16 21:54:27'),
(67, 'pages', 'slug', 1, 'en', 'about-us', '2022-12-16 21:54:27', '2022-12-16 21:54:27'),
(68, 'pages', 'title', 3, 'en', 'Contact', '2022-12-16 22:52:33', '2022-12-19 17:52:25'),
(69, 'pages', 'sub_title', 3, 'en', 'Contact Us', '2022-12-16 22:52:33', '2022-12-19 17:52:25'),
(70, 'pages', 'excerpt', 3, 'en', 'Invidus tradit exitum facillime error periculis praesentium vera legere expetendis huic praetermittenda familias liberae facillimis nisi difficilius paranda nemo, Maerores pecuniae pulchraeque Ad facio docendi non quid medium concessum Quid videre acute pariant detrimenti munere eiusdem expressas: ', '2022-12-16 22:52:33', '2022-12-16 22:52:33'),
(71, 'pages', 'body', 3, 'en', '<p>Explicatam publicam appetendi patientiamque expleantur consumere dominos pertinacia officii malint dolor defendit inflammat cupiditatum modo omittendis negent utramque sapientium tranquillitatem is, Convincere semel correcta ferant is usu curis liberavisse intelleges De potest cur sollicitudines illa feramus!</p>\n<p>Impetu intellegitur materia plus iuberet adhibuit Pacuvii pericula secundum probet interdictum exultat dissentiet quidam imagines Attico iuste licet naturalem; Referenda officia cogitavisse credo cogitemus eventurum propriae fingitur expetitur quondam rogatiuncula. Earum posuit reperire officii domus Confirmat Torquatum invidi odioque quaeri fastidium tenere Triarium? Negant explicari tot dictas oderis Graeci Triari optabilem utroque maximo potius inhumanus debitis extremo viderer.</p>\n<p>Assentior moderatius libenter vis turpis maior supplicii illi disputata animum loco mediocris divitias possit labores accusata parabilis etiam videretur officiis. L captet ferre scriptorem conducunt monstruosi id necessitatibus amarissimam inculta adiuvet angusti laborat modum ullam privatio Metrodorus ficta minuti deorsus. Meo affecti summum satisfacit sapientes contemnere victi quin vindicet quidam sentiunt offendimur laudatur quando facio iudicabit depravata flagitem: Persequeris credo meo quantumcumque distrahi quidque meque morbi intellegentium nacti nacti Invitat odio fatemur dicam.</p>\n<p>Doceat Latinis vos Aristoteli fruuntur labefactant Ex ea permanentes. Maledici pericula nec legat legere scientiam intuemur libidinum factis maximo Utinam omnesque virtutem ornateque contrariis opera Quae; An turpius succumbere fruenda venustate ipsis disciplina Cyrenaicos turpis privatio faciam labore Nisi transferre Quae!</p>\n<p>Turma pertinaces effugiendorum patiatur eam pecuniae capti Torquatis conferebamus accusata. Inveniri quantus depulsa iudicia ceterorum intercapedo sensibus morborum gubernatoris infinito mollis complexiones nemore inopem Quamquam eveniet qui. Video sentiunt necesse utramque conetur oratoribus arbitratu specie civibus intemperantes intellegere placebit Nihil quietem fastidium stulti dicat dedocere iuste Chrysippe indicaverunt. Illa poena fortasse e disciplinis fatendum scriptorem Brute praesens statim errata libidinem intellegaturque vivi censes.</p>', '2022-12-16 22:52:33', '2022-12-16 22:52:33'),
(72, 'pages', 'slug', 3, 'en', 'contact', '2022-12-16 22:52:33', '2022-12-19 17:52:25'),
(73, 'pages', 'title', 4, 'en', 'Privacy Policy', '2022-12-18 16:59:50', '2022-12-18 16:59:50'),
(74, 'pages', 'title', 4, 'ar', 'سياسة الخصوصية', '2022-12-18 16:59:50', '2022-12-18 16:59:50'),
(75, 'pages', 'slug', 4, 'en', 'privacy-policy', '2022-12-18 16:59:50', '2022-12-18 16:59:50'),
(76, 'pages', 'slug', 4, 'ar', 'syash-alkhswsyh', '2022-12-18 16:59:50', '2022-12-18 16:59:50'),
(77, 'pages', 'title', 3, 'ar', 'اتصل', '2022-12-18 19:58:36', '2022-12-18 19:58:36'),
(78, 'pages', 'sub_title', 3, 'ar', 'اتصل بنا', '2022-12-18 19:58:36', '2022-12-18 19:58:36'),
(79, 'pages', 'excerpt', 3, 'ar', 'Invidus tradit exitum facillime error periculis praesentium vera legere expetendis huic praetermittenda familias liberae facillimis nisi difficilius paranda nemo, Maerores pecuniae pulchraeque Ad facio docendi non quid medium concessum Quid videre acute pariant detrimenti munere eiusdem expressas: ', '2022-12-18 19:58:36', '2022-12-18 19:58:36'),
(80, 'pages', 'body', 3, 'ar', '<p>Explicatam publicam appetendi patientiamque expleantur consumere dominos pertinacia officii malint dolor defendit inflammat cupiditatum modo omittendis negent utramque sapientium tranquillitatem is, Convincere semel correcta ferant is usu curis liberavisse intelleges De potest cur sollicitudines illa feramus!</p>\n<p>Impetu intellegitur materia plus iuberet adhibuit Pacuvii pericula secundum probet interdictum exultat dissentiet quidam imagines Attico iuste licet naturalem; Referenda officia cogitavisse credo cogitemus eventurum propriae fingitur expetitur quondam rogatiuncula. Earum posuit reperire officii domus Confirmat Torquatum invidi odioque quaeri fastidium tenere Triarium? Negant explicari tot dictas oderis Graeci Triari optabilem utroque maximo potius inhumanus debitis extremo viderer.</p>\n<p>Assentior moderatius libenter vis turpis maior supplicii illi disputata animum loco mediocris divitias possit labores accusata parabilis etiam videretur officiis. L captet ferre scriptorem conducunt monstruosi id necessitatibus amarissimam inculta adiuvet angusti laborat modum ullam privatio Metrodorus ficta minuti deorsus. Meo affecti summum satisfacit sapientes contemnere victi quin vindicet quidam sentiunt offendimur laudatur quando facio iudicabit depravata flagitem: Persequeris credo meo quantumcumque distrahi quidque meque morbi intellegentium nacti nacti Invitat odio fatemur dicam.</p>\n<p>Doceat Latinis vos Aristoteli fruuntur labefactant Ex ea permanentes. Maledici pericula nec legat legere scientiam intuemur libidinum factis maximo Utinam omnesque virtutem ornateque contrariis opera Quae; An turpius succumbere fruenda venustate ipsis disciplina Cyrenaicos turpis privatio faciam labore Nisi transferre Quae!</p>\n<p>Turma pertinaces effugiendorum patiatur eam pecuniae capti Torquatis conferebamus accusata. Inveniri quantus depulsa iudicia ceterorum intercapedo sensibus morborum gubernatoris infinito mollis complexiones nemore inopem Quamquam eveniet qui. Video sentiunt necesse utramque conetur oratoribus arbitratu specie civibus intemperantes intellegere placebit Nihil quietem fastidium stulti dicat dedocere iuste Chrysippe indicaverunt. Illa poena fortasse e disciplinis fatendum scriptorem Brute praesens statim errata libidinem intellegaturque vivi censes.</p>', '2022-12-18 19:58:36', '2022-12-18 19:58:36'),
(81, 'pages', 'slug', 3, 'ar', 'atsl', '2022-12-18 19:58:36', '2022-12-18 19:58:36'),
(82, 'pages', 'title', 1, 'ar', 'معلومات عنا', '2022-12-18 19:59:16', '2022-12-18 19:59:16'),
(83, 'pages', 'sub_title', 1, 'ar', 'من نحن؟', '2022-12-18 19:59:16', '2022-12-18 19:59:16'),
(84, 'pages', 'excerpt', 1, 'ar', 'Monstruosi honesta emancipaverat appellat Democritus una transferre reformidans curis celeritas extremum abducat causam detractio insipientiam legimus uberiora provocarem sequamur Medeam liber! Animo ornatum scientiam brevi emancipaverat utens ponendam versatur gratia. ', '2022-12-18 19:59:16', '2022-12-18 19:59:16'),
(85, 'pages', 'body', 1, 'ar', '<p>Inhumanus perferendis sinat atomi sapientium dicta adduci facio, Vivere vester multam novi ne faciunt audita vigiliae dissentiet multa dicere poena splendide officia eveniet. Beatam vias recta nobis errore suscepi iniurias An maiestatis primorum privatione, Ei poterit expectamus equidem Atilii disputata potione efficeretur praetermissum ita eoque futurove et Terentianus attulit.</p>\n<p>Brute mentitum convincere voluptati Epicurus illius contentiones deteriora maiora ponunt physici geometriaque. Satis Iam consuevit illo deterritum fere scribere dici e ignaviamque emolumenti declarant ait peccant tradidisse.</p>\n<p>Meminerit dominos sequimur perdiscere Quamquam chorusque dissensio transferam delectet inliberali prima iracundiae sumus scriptum maiores!</p>', '2022-12-18 19:59:16', '2022-12-18 19:59:16'),
(86, 'pages', 'slug', 1, 'ar', 'malwmat-ana', '2022-12-18 19:59:16', '2022-12-18 19:59:16'),
(87, 'slides', 'title', 1, 'en', 'Headline Header for Demo', '2022-12-18 20:22:14', '2022-12-19 17:54:50'),
(88, 'slides', 'title', 1, 'ar', 'رأس الكفة لغرض العرض', '2022-12-18 20:22:14', '2022-12-18 20:22:14'),
(89, 'slides', 'sub_title', 1, 'en', 'Image Subtitle for Demo Purpose', '2022-12-18 20:22:14', '2022-12-18 20:22:14'),
(90, 'slides', 'sub_title', 1, 'ar', 'العنوان الفرعي للصورة لغرض العرض التوضيحي', '2022-12-18 20:22:14', '2022-12-18 20:22:14'),
(91, 'slides', 'excerpt', 1, 'en', 'A short article about this headline can be written here from the administration panel.', '2022-12-18 20:22:14', '2022-12-18 20:22:14'),
(92, 'slides', 'excerpt', 1, 'ar', 'يمكن كتابة مقال قصير حول هذا العنوان هنا من لوحة الإدارة.', '2022-12-18 20:22:14', '2022-12-18 20:22:14'),
(93, 'slides', 'page_url', 1, 'en', 'page/about-us', '2022-12-18 20:22:14', '2022-12-18 20:22:14'),
(94, 'slides', 'page_url', 1, 'ar', 'page/malwmat-ana', '2022-12-18 20:22:14', '2022-12-18 20:22:14'),
(95, 'slides', 'title', 2, 'en', 'Test Header', '2022-12-18 20:25:21', '2022-12-18 20:25:21'),
(96, 'slides', 'title', 2, 'ar', 'رأس الاختبار', '2022-12-18 20:25:21', '2022-12-18 20:25:21'),
(97, 'slides', 'sub_title', 2, 'en', 'Slider Subtitle for Test Purposes', '2022-12-18 20:25:21', '2022-12-18 20:25:21'),
(98, 'slides', 'sub_title', 2, 'ar', 'العنوان الفرعي لشريط التمرير لأغراض الاختبار', '2022-12-18 20:25:21', '2022-12-18 20:25:21'),
(99, 'slides', 'excerpt', 2, 'en', 'A short article about this headline can be written here from the administration panel.', '2022-12-18 20:25:21', '2022-12-18 20:25:21'),
(100, 'slides', 'excerpt', 2, 'ar', 'يمكن كتابة مقال قصير حول هذا العنوان هنا من لوحة الإدارة.', '2022-12-18 20:25:21', '2022-12-18 20:25:21'),
(101, 'data_rows', 'display_name', 1, 'ar', 'ID', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(102, 'data_rows', 'display_name', 21, 'ar', 'Yetki', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(103, 'data_rows', 'display_name', 2, 'ar', 'Adı', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(104, 'data_rows', 'display_name', 3, 'ar', 'E-Posta', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(105, 'data_rows', 'display_name', 8, 'ar', 'Avatar', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(106, 'data_rows', 'display_name', 22, 'en', 'E-Posta Onaylandı', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(107, 'data_rows', 'display_name', 22, 'ar', 'E-Posta Onaylandı', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(108, 'data_rows', 'display_name', 4, 'ar', 'Şifre', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(109, 'data_rows', 'display_name', 5, 'ar', 'Hatırlatıcı Jeton', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(110, 'data_rows', 'display_name', 11, 'ar', 'Ayarlar', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(111, 'data_rows', 'display_name', 6, 'ar', 'Kaydoldu', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(112, 'data_rows', 'display_name', 7, 'ar', 'Güncellendi', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(113, 'data_rows', 'display_name', 9, 'ar', 'Yetki', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(114, 'data_rows', 'display_name', 10, 'ar', 'Special Roles', '2022-12-19 02:33:13', '2022-12-19 02:33:42'),
(115, 'data_types', 'display_name_singular', 1, 'ar', 'Kullanıcı', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(116, 'data_types', 'display_name_plural', 1, 'ar', 'Kullanıcılar', '2022-12-19 02:33:13', '2022-12-19 02:33:13'),
(117, 'websites', 'name', 1, 'ar', 'DEMO', '2022-12-19 02:39:15', '2022-12-19 17:50:48'),
(118, 'websites', 'slug', 1, 'ar', 'demo', '2022-12-19 02:39:15', '2022-12-19 17:50:48'),
(119, 'websites', 'seo_title', 1, 'ar', 'SEO TITLE IS IMPORTANT FOR SEO', '2022-12-19 02:39:15', '2022-12-19 02:39:15'),
(120, 'websites', 'meta_description', 1, 'ar', 'META DESCRIPTION IS IMPORTANT FOR SEO', '2022-12-19 02:39:15', '2022-12-19 02:39:15'),
(121, 'data_rows', 'display_name', 67, 'en', 'Id', '2022-12-19 05:24:17', '2022-12-19 05:24:17'),
(122, 'data_rows', 'display_name', 67, 'ar', 'Id', '2022-12-19 05:24:17', '2022-12-19 05:24:17'),
(123, 'data_rows', 'display_name', 68, 'en', 'İsim Soyisim', '2022-12-19 05:24:17', '2022-12-19 05:24:17'),
(124, 'data_rows', 'display_name', 68, 'ar', 'İsim Soyisim', '2022-12-19 05:24:17', '2022-12-19 05:24:17'),
(125, 'data_rows', 'display_name', 69, 'en', 'E-Posta Adresi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(126, 'data_rows', 'display_name', 69, 'ar', 'E-Posta Adresi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(127, 'data_rows', 'display_name', 70, 'en', 'Telefon Numarası', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(128, 'data_rows', 'display_name', 70, 'ar', 'Telefon Numarası', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(129, 'data_rows', 'display_name', 71, 'en', 'Mesaj', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(130, 'data_rows', 'display_name', 71, 'ar', 'Mesaj', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(131, 'data_rows', 'display_name', 72, 'en', 'Alan Kodu (+XX)', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(132, 'data_rows', 'display_name', 72, 'ar', 'Alan Kodu (+XX)', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(133, 'data_rows', 'display_name', 73, 'en', 'IP Adresi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(134, 'data_rows', 'display_name', 73, 'ar', 'IP Adresi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(135, 'data_rows', 'display_name', 74, 'en', 'Eklendi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(136, 'data_rows', 'display_name', 74, 'ar', 'Eklendi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(137, 'data_rows', 'display_name', 75, 'en', 'Güncellendi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(138, 'data_rows', 'display_name', 75, 'ar', 'Güncellendi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(139, 'data_rows', 'display_name', 76, 'en', 'Silindi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(140, 'data_rows', 'display_name', 76, 'ar', 'Silindi', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(141, 'data_types', 'display_name_singular', 7, 'en', 'İletişim Formu', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(142, 'data_types', 'display_name_singular', 7, 'ar', 'İletişim Formu', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(143, 'data_types', 'display_name_plural', 7, 'en', 'İletişim Formları', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(144, 'data_types', 'display_name_plural', 7, 'ar', 'İletişim Formları', '2022-12-19 05:24:18', '2022-12-19 05:24:18'),
(145, 'data_rows', 'display_name', 85, 'en', 'Id', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(146, 'data_rows', 'display_name', 85, 'ar', 'Id', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(147, 'data_rows', 'display_name', 86, 'en', 'Başlık', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(148, 'data_rows', 'display_name', 86, 'ar', 'Başlık', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(149, 'data_rows', 'display_name', 87, 'en', 'Sayfa Adresi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(150, 'data_rows', 'display_name', 87, 'ar', 'Sayfa Adresi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(151, 'data_rows', 'display_name', 88, 'en', 'Kısa Açıklama', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(152, 'data_rows', 'display_name', 88, 'ar', 'Kısa Açıklama', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(153, 'data_rows', 'display_name', 89, 'en', 'İçerik', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(154, 'data_rows', 'display_name', 89, 'ar', 'İçerik', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(155, 'data_rows', 'display_name', 90, 'en', 'SEO Başlığı', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(156, 'data_rows', 'display_name', 90, 'ar', 'SEO Başlığı', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(157, 'data_rows', 'display_name', 91, 'en', 'Meta Açıklama', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(158, 'data_rows', 'display_name', 91, 'ar', 'Meta Açıklama', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(159, 'data_rows', 'display_name', 92, 'en', 'Yazar', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(160, 'data_rows', 'display_name', 92, 'ar', 'Yazar', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(161, 'data_rows', 'display_name', 93, 'en', 'Durum', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(162, 'data_rows', 'display_name', 93, 'ar', 'Durum', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(163, 'data_rows', 'display_name', 94, 'en', 'Görsel', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(164, 'data_rows', 'display_name', 94, 'ar', 'Görsel', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(165, 'data_rows', 'display_name', 95, 'en', 'Kategori', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(166, 'data_rows', 'display_name', 95, 'ar', 'Kategori', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(167, 'data_rows', 'display_name', 96, 'en', 'Eklendi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(168, 'data_rows', 'display_name', 96, 'ar', 'Eklendi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(169, 'data_rows', 'display_name', 97, 'en', 'Güncellendi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(170, 'data_rows', 'display_name', 97, 'ar', 'Güncellendi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(171, 'data_rows', 'display_name', 98, 'en', 'Silindi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(172, 'data_rows', 'display_name', 98, 'ar', 'Silindi', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(173, 'data_rows', 'display_name', 99, 'en', 'categories', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(174, 'data_rows', 'display_name', 99, 'ar', 'categories', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(175, 'data_rows', 'display_name', 100, 'en', 'tags', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(176, 'data_rows', 'display_name', 100, 'ar', 'tags', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(177, 'data_types', 'display_name_singular', 10, 'en', 'İçerik', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(178, 'data_types', 'display_name_singular', 10, 'ar', 'İçerik', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(179, 'data_types', 'display_name_plural', 10, 'en', 'İçerikler', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(180, 'data_types', 'display_name_plural', 10, 'ar', 'İçerikler', '2022-12-19 17:12:27', '2022-12-19 17:12:27'),
(181, 'data_rows', 'display_name', 80, 'en', 'Id', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(182, 'data_rows', 'display_name', 80, 'ar', 'Id', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(183, 'data_rows', 'display_name', 81, 'en', 'Kategori Adı', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(184, 'data_rows', 'display_name', 81, 'ar', 'Kategori Adı', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(185, 'data_rows', 'display_name', 82, 'en', 'Sayfa Adresi', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(186, 'data_rows', 'display_name', 82, 'ar', 'Sayfa Adresi', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(187, 'data_rows', 'display_name', 83, 'en', 'Üst Kategori', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(188, 'data_rows', 'display_name', 83, 'ar', 'Üst Kategori', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(189, 'data_rows', 'display_name', 84, 'en', 'Sıralama', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(190, 'data_rows', 'display_name', 84, 'ar', 'Sıralama', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(191, 'data_types', 'display_name_singular', 9, 'en', 'Blog Kategorisi', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(192, 'data_types', 'display_name_singular', 9, 'ar', 'Blog Kategorisi', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(193, 'data_types', 'display_name_plural', 9, 'en', 'Blog Kategorileri', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(194, 'data_types', 'display_name_plural', 9, 'ar', 'Blog Kategorileri', '2022-12-19 17:15:28', '2022-12-19 17:15:28'),
(195, 'menu_items', 'title', 17, 'en', 'Categories', '2022-12-19 17:23:26', '2022-12-19 17:30:02'),
(196, 'menu_items', 'title', 17, 'ar', 'التصنيفات', '2022-12-19 17:23:26', '2022-12-19 17:30:02'),
(197, 'menu_items', 'title', 13, 'ar', 'إعدادات موقع الويب', '2022-12-19 17:24:28', '2022-12-19 17:24:28'),
(198, 'menu_items', 'title', 12, 'ar', 'الصفحات', '2022-12-19 17:24:39', '2022-12-19 17:24:39'),
(199, 'menu_items', 'title', 14, 'en', 'Sliders', '2022-12-19 17:25:32', '2022-12-19 17:25:32'),
(200, 'menu_items', 'title', 14, 'ar', 'المتزلجون', '2022-12-19 17:25:32', '2022-12-19 17:25:32'),
(201, 'menu_items', 'title', 15, 'en', 'Contact Forms', '2022-12-19 17:26:04', '2022-12-19 17:26:04'),
(202, 'menu_items', 'title', 15, 'ar', 'نماذج الاتصال', '2022-12-19 17:26:05', '2022-12-19 17:26:05'),
(203, 'menu_items', 'title', 11, 'ar', 'المستخدمون', '2022-12-19 17:26:18', '2022-12-19 17:26:18'),
(204, 'menu_items', 'title', 3, 'ar', 'قائمة المستخدمين', '2022-12-19 17:26:43', '2022-12-19 17:26:43'),
(205, 'menu_items', 'title', 4, 'ar', 'الأدوار', '2022-12-19 17:26:56', '2022-12-19 17:26:56'),
(206, 'menu_items', 'title', 2, 'ar', 'إدارة وسائل الإعلام', '2022-12-19 17:27:11', '2022-12-19 17:27:11'),
(207, 'menu_items', 'title', 5, 'ar', 'أدوات', '2022-12-19 17:27:21', '2022-12-19 17:27:21'),
(208, 'menu_items', 'title', 6, 'ar', 'منشئ القائمة', '2022-12-19 17:27:39', '2022-12-19 17:27:39'),
(209, 'menu_items', 'title', 7, 'ar', 'قاعدة البيانات', '2022-12-19 17:27:54', '2022-12-19 17:27:54'),
(210, 'menu_items', 'title', 8, 'ar', 'بوصلة', '2022-12-19 17:28:05', '2022-12-19 17:28:05'),
(211, 'menu_items', 'title', 9, 'ar', 'مولد لوحة', '2022-12-19 17:28:31', '2022-12-19 17:28:31'),
(212, 'menu_items', 'title', 10, 'ar', 'إعدادات', '2022-12-19 17:28:44', '2022-12-19 17:28:44'),
(213, 'menu_items', 'title', 16, 'en', 'E-Mail List', '2022-12-19 17:29:43', '2022-12-19 17:29:43'),
(214, 'menu_items', 'title', 16, 'ar', 'قائمة البريد الالكتروني', '2022-12-19 17:29:43', '2022-12-19 17:29:43'),
(215, 'menu_items', 'title', 18, 'en', 'Contents', '2022-12-19 17:30:16', '2022-12-19 17:30:16'),
(216, 'menu_items', 'title', 18, 'ar', 'محتويات', '2022-12-19 17:30:16', '2022-12-19 17:30:16'),
(217, 'menu_items', 'title', 19, 'en', 'Tags', '2022-12-19 17:30:31', '2022-12-19 17:30:31'),
(218, 'menu_items', 'title', 19, 'ar', 'العلامات', '2022-12-19 17:30:31', '2022-12-19 17:30:31'),
(219, 'websites', 'name', 1, 'de', 'DEMO', '2022-12-19 17:50:48', '2022-12-19 17:50:48'),
(220, 'websites', 'slug', 1, 'de', 'demo', '2022-12-19 17:50:48', '2022-12-19 17:50:48'),
(221, 'websites', 'seo_title', 1, 'de', 'SEO TITLE IS IMPORTANT FOR SEO', '2022-12-19 17:50:48', '2022-12-19 17:50:48'),
(222, 'websites', 'meta_description', 1, 'de', 'META DESCRIPTION IS IMPORTANT FOR SEO', '2022-12-19 17:50:48', '2022-12-19 17:50:48'),
(223, 'pages', 'title', 3, 'de', 'Kontakt', '2022-12-19 17:51:23', '2022-12-19 17:52:25'),
(224, 'pages', 'sub_title', 3, 'de', 'KONTAKTIERE UNS', '2022-12-19 17:51:23', '2022-12-19 17:52:25'),
(225, 'pages', 'excerpt', 3, 'de', 'Invidus tradit exitum facillime error periculis praesentium vera legere expetendis huic praetermittenda familias liberae facillimis nisi difficilius paranda nemo, Maerores pecuniae pulchraeque Ad facio docendi non quid medium concessum Quid videre acute pariant detrimenti munere eiusdem expressas: ', '2022-12-19 17:51:23', '2022-12-19 17:51:23'),
(226, 'pages', 'body', 3, 'de', '<p>Explicatam publicam appetendi patientiamque expleantur consumere dominos pertinacia officii malint dolor defendit inflammat cupiditatum modo omittendis negent utramque sapientium tranquillitatem is, Convincere semel correcta ferant is usu curis liberavisse intelleges De potest cur sollicitudines illa feramus!</p>\n<p>Impetu intellegitur materia plus iuberet adhibuit Pacuvii pericula secundum probet interdictum exultat dissentiet quidam imagines Attico iuste licet naturalem; Referenda officia cogitavisse credo cogitemus eventurum propriae fingitur expetitur quondam rogatiuncula. Earum posuit reperire officii domus Confirmat Torquatum invidi odioque quaeri fastidium tenere Triarium? Negant explicari tot dictas oderis Graeci Triari optabilem utroque maximo potius inhumanus debitis extremo viderer.</p>\n<p>Assentior moderatius libenter vis turpis maior supplicii illi disputata animum loco mediocris divitias possit labores accusata parabilis etiam videretur officiis. L captet ferre scriptorem conducunt monstruosi id necessitatibus amarissimam inculta adiuvet angusti laborat modum ullam privatio Metrodorus ficta minuti deorsus. Meo affecti summum satisfacit sapientes contemnere victi quin vindicet quidam sentiunt offendimur laudatur quando facio iudicabit depravata flagitem: Persequeris credo meo quantumcumque distrahi quidque meque morbi intellegentium nacti nacti Invitat odio fatemur dicam.</p>\n<p>Doceat Latinis vos Aristoteli fruuntur labefactant Ex ea permanentes. Maledici pericula nec legat legere scientiam intuemur libidinum factis maximo Utinam omnesque virtutem ornateque contrariis opera Quae; An turpius succumbere fruenda venustate ipsis disciplina Cyrenaicos turpis privatio faciam labore Nisi transferre Quae!</p>\n<p>Turma pertinaces effugiendorum patiatur eam pecuniae capti Torquatis conferebamus accusata. Inveniri quantus depulsa iudicia ceterorum intercapedo sensibus morborum gubernatoris infinito mollis complexiones nemore inopem Quamquam eveniet qui. Video sentiunt necesse utramque conetur oratoribus arbitratu specie civibus intemperantes intellegere placebit Nihil quietem fastidium stulti dicat dedocere iuste Chrysippe indicaverunt. Illa poena fortasse e disciplinis fatendum scriptorem Brute praesens statim errata libidinem intellegaturque vivi censes.</p>', '2022-12-19 17:51:23', '2022-12-19 17:51:23'),
(227, 'pages', 'slug', 3, 'de', 'kontakt', '2022-12-19 17:51:23', '2022-12-19 17:52:25'),
(228, 'pages', 'title', 1, 'de', 'Über uns', '2022-12-19 17:51:49', '2022-12-19 17:51:49'),
(229, 'pages', 'sub_title', 1, 'de', 'Wer sind wir?', '2022-12-19 17:51:49', '2022-12-19 17:51:49'),
(230, 'pages', 'excerpt', 1, 'de', 'Monstruosi honesta emancipaverat appellat Democritus una transferre reformidans curis celeritas extremum abducat causam detractio insipientiam legimus uberiora provocarem sequamur Medeam liber! Animo ornatum scientiam brevi emancipaverat utens ponendam versatur gratia. ', '2022-12-19 17:51:49', '2022-12-19 17:51:49'),
(231, 'pages', 'body', 1, 'de', '<p>Inhumanus perferendis sinat atomi sapientium dicta adduci facio, Vivere vester multam novi ne faciunt audita vigiliae dissentiet multa dicere poena splendide officia eveniet. Beatam vias recta nobis errore suscepi iniurias An maiestatis primorum privatione, Ei poterit expectamus equidem Atilii disputata potione efficeretur praetermissum ita eoque futurove et Terentianus attulit.</p>\n<p>Brute mentitum convincere voluptati Epicurus illius contentiones deteriora maiora ponunt physici geometriaque. Satis Iam consuevit illo deterritum fere scribere dici e ignaviamque emolumenti declarant ait peccant tradidisse.</p>\n<p>Meminerit dominos sequimur perdiscere Quamquam chorusque dissensio transferam delectet inliberali prima iracundiae sumus scriptum maiores!</p>', '2022-12-19 17:51:49', '2022-12-19 17:51:49'),
(232, 'pages', 'slug', 1, 'de', 'uber-uns', '2022-12-19 17:51:49', '2022-12-19 17:51:49'),
(233, 'pages', 'title', 4, 'de', 'Datenschutz-Bestimmungen', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(234, 'pages', 'sub_title', 4, 'en', 'You Are in Safe', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(235, 'pages', 'sub_title', 4, 'ar', 'أنت في أمان', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(236, 'pages', 'sub_title', 4, 'de', 'Sie sind in Sicherheit', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(237, 'pages', 'excerpt', 4, 'en', 'Cupiditates melius opera fortibus parentes delectet litterae dedocere existimare personae impensa semel praeclare nomini quanta provocatus semel semper stare dubitemus doloris; Maximi nullas reprimique omnia Silano facta Aristippus An morte infinitum indignius studium errorem Qui C honeste sedulitatem quantumcumque mediocrium individua. ', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(238, 'pages', 'excerpt', 4, 'ar', 'Cupiditates melius opera fortibus parentes delectet litterae dedocere existimare personae impensa semel praeclare nomini quanta provocatus semel semper stare dubitemus doloris; Maximi nullas reprimique omnia Silano facta Aristippus An morte infinitum indignius studium errorem Qui C honeste sedulitatem quantumcumque mediocrium individua. ', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(239, 'pages', 'excerpt', 4, 'de', 'Cupiditates melius opera fortibus parentes delectet litterae dedocere existimare personae impensa semel praeclare nomini quanta provocatus semel semper stare dubitemus doloris; Maximi nullas reprimique omnia Silano facta Aristippus An morte infinitum indignius studium errorem Qui C honeste sedulitatem quantumcumque mediocrium individua. ', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(240, 'pages', 'body', 4, 'en', '<p>Commemorandis faciendum artifex praesentibus factis probarem otiosum porrecta placet fecerit id nec novi homine! Fuisse modo ita eadem neque tum Chremes saepe delectu coercendi geometrica imperiis quandam inanium corpus delectat divitias corpore, Gubernatoris declinare malit leguntur facillime diceretur multitudinem mihi reprehendunt nihil nihil filium fatemur fit naturam.<br>Epicureum paene penitus praeterea evolutio certe lucifugi expeteretur quot dicitis Torquate animus cepisse optio beate. Sensum affert finibus refert dominorum Tantalo telos sponte voluit accusata, Pellat succumbere dubitemus pugnantibus litterae ancillae causam animi nominant vim Democrito tenetur loco afferre nemini?</p>\n<p>Collaudata dixi Albuci eos elegantis multi detracta patria malivoli. Cogitavisse queo dixit mei varias molestum tu sequatur per electis vera nobis tua certe melius inscientia robustus attulit honestatis efficiantur? Primorum foris perpetuis efficere bonas adversa locis inpendente aliquando parabilis loqueretur admirer. Intellegam poenis publicam habeo admirer quis virtutem mors profecto maximo gloriae altera scribere nostrum conducunt.</p>\n<p>Diceretur num sequamur impedit Stoici terminatas longinquitate temeritate Eademque omnis malivoli afferat nos liberae oratio utriusque honesto. Iustitiam expetendis rebus quoniam sinat inermis desiderent refugiendi ludus inferiorem. Transferam tandem nemore probaretur quem constituit philosophorum amarissimam ferrentur opinemur gravioribus pluribus meminerunt dignissimos elegans equidem De terrore. Exultat potiendi vidisse has eximiae Aristoteli neglexerit verbi mollitia tua parum quis suspicio requirere voluptatum!</p>\n<p>Mortem causa corporisque labitur doceat facile maiestatis itaque liberavisse beatus animos Latinas magnus. Fabulis quantumcumque conducunt libro videtur eripuit potuimus expectant praebeat praetulerit varias admissum obcaecati Democritus quam vivamus confidam Deinde. Adiungimus erudito inhumanus miraretur aliquo locum displicet; Faciant efficeretur retinent conversam adiuvet admodum inflammat possunt situm effici arbitratu cives legendus tu nostri.</p>\n<p>Mei tradunt Triarium valetudinis Epicureum aptissimum constringendos ornateque doceat sero ducem declinationem probaretur amatoriis pondere primisque Siculis; Imperio placebit parentes nutu lectorem dolendum video mundi elegans delicatissimi is ei; Liberae putamus ullus poena expeteretur gerendarum fugiamus quieti multa finiri Torquatus Democriti permulta, Epularum ipsa Graecis potest inveneris Macedonum oratio distinguantur fugiat lectorem partes animum vituperatum publicam Torquate. Patrioque optari negant ingenia beatus sapiente perfruique civibus ita ii naturae dixit scribentur cruciantur aliquam.</p>\n<p>Maior patrius possum paranda credere plerique patrius attingere equidem ecce expetendum nutu lucifugi hominem est verissimum manu vivendo, Emolumenti firmitatem homines studia decore efficere nudus solent improbis, Ferantur satis declinatio virtutem scribentur multa terminari circumcisaque desistunt maximis. Frequenter defuit plusque adquiescere dissentias locus ignaviamque timeam maximeque tribuat sumus dicunt debeo leniter expetitur optinere illas velit istam audivi postremo? Assecutus eamque quicquam percurri meminerit inflammat iucunda operam interpretum maximi accusantibus vita saluto stare Democriti.</p>\n<p>Hortensio quaeri propriae requietis poena Qui nostrum postremo potione audire iactare liber intellegere maestitiam ignavi intus; Praeterea vocet gratissimo minorem dolere inpendente praeter pericula quantus Eadem mediocris contemnentes illo leniter tanta sinat minime, Faciam seiunctum iucunditate transferam perturbari Latina conversam amaret delectet laetetur putant utraque referatur humili potiendi imperio scilicet reliquarum permulta maximam. Animumque ducimus diligenter fore mala statuat artis fortitudinis significet iudico torquem Democritus Romanum laboribus Chrysippe.</p>', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(241, 'pages', 'body', 4, 'ar', '<p>Commemorandis faciendum artifex praesentibus factis probarem otiosum porrecta placet fecerit id nec novi homine! Fuisse modo ita eadem neque tum Chremes saepe delectu coercendi geometrica imperiis quandam inanium corpus delectat divitias corpore, Gubernatoris declinare malit leguntur facillime diceretur multitudinem mihi reprehendunt nihil nihil filium fatemur fit naturam.<br>Epicureum paene penitus praeterea evolutio certe lucifugi expeteretur quot dicitis Torquate animus cepisse optio beate. Sensum affert finibus refert dominorum Tantalo telos sponte voluit accusata, Pellat succumbere dubitemus pugnantibus litterae ancillae causam animi nominant vim Democrito tenetur loco afferre nemini?</p>\n<p>Collaudata dixi Albuci eos elegantis multi detracta patria malivoli. Cogitavisse queo dixit mei varias molestum tu sequatur per electis vera nobis tua certe melius inscientia robustus attulit honestatis efficiantur? Primorum foris perpetuis efficere bonas adversa locis inpendente aliquando parabilis loqueretur admirer. Intellegam poenis publicam habeo admirer quis virtutem mors profecto maximo gloriae altera scribere nostrum conducunt.</p>\n<p>Diceretur num sequamur impedit Stoici terminatas longinquitate temeritate Eademque omnis malivoli afferat nos liberae oratio utriusque honesto. Iustitiam expetendis rebus quoniam sinat inermis desiderent refugiendi ludus inferiorem. Transferam tandem nemore probaretur quem constituit philosophorum amarissimam ferrentur opinemur gravioribus pluribus meminerunt dignissimos elegans equidem De terrore. Exultat potiendi vidisse has eximiae Aristoteli neglexerit verbi mollitia tua parum quis suspicio requirere voluptatum!</p>\n<p>Mortem causa corporisque labitur doceat facile maiestatis itaque liberavisse beatus animos Latinas magnus. Fabulis quantumcumque conducunt libro videtur eripuit potuimus expectant praebeat praetulerit varias admissum obcaecati Democritus quam vivamus confidam Deinde. Adiungimus erudito inhumanus miraretur aliquo locum displicet; Faciant efficeretur retinent conversam adiuvet admodum inflammat possunt situm effici arbitratu cives legendus tu nostri.</p>\n<p>Mei tradunt Triarium valetudinis Epicureum aptissimum constringendos ornateque doceat sero ducem declinationem probaretur amatoriis pondere primisque Siculis; Imperio placebit parentes nutu lectorem dolendum video mundi elegans delicatissimi is ei; Liberae putamus ullus poena expeteretur gerendarum fugiamus quieti multa finiri Torquatus Democriti permulta, Epularum ipsa Graecis potest inveneris Macedonum oratio distinguantur fugiat lectorem partes animum vituperatum publicam Torquate. Patrioque optari negant ingenia beatus sapiente perfruique civibus ita ii naturae dixit scribentur cruciantur aliquam.</p>\n<p>Maior patrius possum paranda credere plerique patrius attingere equidem ecce expetendum nutu lucifugi hominem est verissimum manu vivendo, Emolumenti firmitatem homines studia decore efficere nudus solent improbis, Ferantur satis declinatio virtutem scribentur multa terminari circumcisaque desistunt maximis. Frequenter defuit plusque adquiescere dissentias locus ignaviamque timeam maximeque tribuat sumus dicunt debeo leniter expetitur optinere illas velit istam audivi postremo? Assecutus eamque quicquam percurri meminerit inflammat iucunda operam interpretum maximi accusantibus vita saluto stare Democriti.</p>\n<p>Hortensio quaeri propriae requietis poena Qui nostrum postremo potione audire iactare liber intellegere maestitiam ignavi intus; Praeterea vocet gratissimo minorem dolere inpendente praeter pericula quantus Eadem mediocris contemnentes illo leniter tanta sinat minime, Faciam seiunctum iucunditate transferam perturbari Latina conversam amaret delectet laetetur putant utraque referatur humili potiendi imperio scilicet reliquarum permulta maximam. Animumque ducimus diligenter fore mala statuat artis fortitudinis significet iudico torquem Democritus Romanum laboribus Chrysippe.</p>', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(242, 'pages', 'body', 4, 'de', '<p>Commemorandis faciendum artifex praesentibus factis probarem otiosum porrecta placet fecerit id nec novi homine! Fuisse modo ita eadem neque tum Chremes saepe delectu coercendi geometrica imperiis quandam inanium corpus delectat divitias corpore, Gubernatoris declinare malit leguntur facillime diceretur multitudinem mihi reprehendunt nihil nihil filium fatemur fit naturam.<br>Epicureum paene penitus praeterea evolutio certe lucifugi expeteretur quot dicitis Torquate animus cepisse optio beate. Sensum affert finibus refert dominorum Tantalo telos sponte voluit accusata, Pellat succumbere dubitemus pugnantibus litterae ancillae causam animi nominant vim Democrito tenetur loco afferre nemini?</p>\n<p>Collaudata dixi Albuci eos elegantis multi detracta patria malivoli. Cogitavisse queo dixit mei varias molestum tu sequatur per electis vera nobis tua certe melius inscientia robustus attulit honestatis efficiantur? Primorum foris perpetuis efficere bonas adversa locis inpendente aliquando parabilis loqueretur admirer. Intellegam poenis publicam habeo admirer quis virtutem mors profecto maximo gloriae altera scribere nostrum conducunt.</p>\n<p>Diceretur num sequamur impedit Stoici terminatas longinquitate temeritate Eademque omnis malivoli afferat nos liberae oratio utriusque honesto. Iustitiam expetendis rebus quoniam sinat inermis desiderent refugiendi ludus inferiorem. Transferam tandem nemore probaretur quem constituit philosophorum amarissimam ferrentur opinemur gravioribus pluribus meminerunt dignissimos elegans equidem De terrore. Exultat potiendi vidisse has eximiae Aristoteli neglexerit verbi mollitia tua parum quis suspicio requirere voluptatum!</p>\n<p>Mortem causa corporisque labitur doceat facile maiestatis itaque liberavisse beatus animos Latinas magnus. Fabulis quantumcumque conducunt libro videtur eripuit potuimus expectant praebeat praetulerit varias admissum obcaecati Democritus quam vivamus confidam Deinde. Adiungimus erudito inhumanus miraretur aliquo locum displicet; Faciant efficeretur retinent conversam adiuvet admodum inflammat possunt situm effici arbitratu cives legendus tu nostri.</p>\n<p>Mei tradunt Triarium valetudinis Epicureum aptissimum constringendos ornateque doceat sero ducem declinationem probaretur amatoriis pondere primisque Siculis; Imperio placebit parentes nutu lectorem dolendum video mundi elegans delicatissimi is ei; Liberae putamus ullus poena expeteretur gerendarum fugiamus quieti multa finiri Torquatus Democriti permulta, Epularum ipsa Graecis potest inveneris Macedonum oratio distinguantur fugiat lectorem partes animum vituperatum publicam Torquate. Patrioque optari negant ingenia beatus sapiente perfruique civibus ita ii naturae dixit scribentur cruciantur aliquam.</p>\n<p>Maior patrius possum paranda credere plerique patrius attingere equidem ecce expetendum nutu lucifugi hominem est verissimum manu vivendo, Emolumenti firmitatem homines studia decore efficere nudus solent improbis, Ferantur satis declinatio virtutem scribentur multa terminari circumcisaque desistunt maximis. Frequenter defuit plusque adquiescere dissentias locus ignaviamque timeam maximeque tribuat sumus dicunt debeo leniter expetitur optinere illas velit istam audivi postremo? Assecutus eamque quicquam percurri meminerit inflammat iucunda operam interpretum maximi accusantibus vita saluto stare Democriti.</p>\n<p>Hortensio quaeri propriae requietis poena Qui nostrum postremo potione audire iactare liber intellegere maestitiam ignavi intus; Praeterea vocet gratissimo minorem dolere inpendente praeter pericula quantus Eadem mediocris contemnentes illo leniter tanta sinat minime, Faciam seiunctum iucunditate transferam perturbari Latina conversam amaret delectet laetetur putant utraque referatur humili potiendi imperio scilicet reliquarum permulta maximam. Animumque ducimus diligenter fore mala statuat artis fortitudinis significet iudico torquem Democritus Romanum laboribus Chrysippe.</p>', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(243, 'pages', 'slug', 4, 'de', 'datenschutz-bestimmungen', '2022-12-19 17:53:14', '2022-12-19 17:53:14'),
(244, 'slides', 'title', 2, 'de', 'Kopfzeile testen', '2022-12-19 17:53:59', '2022-12-19 17:53:59'),
(245, 'slides', 'sub_title', 2, 'de', 'Slider-Untertitel für Testzwecke', '2022-12-19 17:53:59', '2022-12-19 17:53:59'),
(246, 'slides', 'excerpt', 2, 'de', 'Ein kurzer Artikel über diese Überschrift kann hier im Administrationsbereich geschrieben werden.', '2022-12-19 17:53:59', '2022-12-19 17:53:59'),
(247, 'slides', 'title', 1, 'de', 'Headline Header für Demo', '2022-12-19 17:54:50', '2022-12-19 17:54:50'),
(248, 'slides', 'sub_title', 1, 'de', 'Bilduntertitel für Demozwecke', '2022-12-19 17:54:50', '2022-12-19 17:54:50'),
(249, 'slides', 'excerpt', 1, 'de', 'Ein kurzer Artikel über diese Überschrift kann hier im Administrationsbereich geschrieben werden.', '2022-12-19 17:54:50', '2022-12-19 17:54:50'),
(250, 'slides', 'page_url', 1, 'de', 'page/uber-uns', '2022-12-19 17:54:50', '2022-12-19 17:55:21'),
(251, 'menu_items', 'title', 20, 'en', 'Content List', '2022-12-19 17:58:15', '2022-12-19 17:58:15'),
(252, 'menu_items', 'title', 20, 'ar', 'قائمة المحتويات', '2022-12-19 17:58:15', '2022-12-19 17:58:15'),
(253, 'menu_items', 'title', 20, 'de', 'Inhaltsangabe', '2022-12-19 17:58:15', '2022-12-19 17:58:15'),
(254, 'tags', 'name', 1, 'en', 'Academic', '2022-12-19 18:06:58', '2022-12-19 18:06:58');
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(255, 'tags', 'name', 1, 'ar', 'أكاديمي', '2022-12-19 18:06:58', '2022-12-19 18:06:58'),
(256, 'tags', 'name', 1, 'de', 'Akademisch', '2022-12-19 18:06:58', '2022-12-19 18:06:58'),
(257, 'tags', 'slug', 1, 'en', 'academic', '2022-12-19 18:06:58', '2022-12-19 18:06:58'),
(258, 'tags', 'slug', 1, 'ar', 'akadymy', '2022-12-19 18:06:58', '2022-12-19 18:06:58'),
(259, 'tags', 'slug', 1, 'de', 'akademisch', '2022-12-19 18:06:58', '2022-12-19 18:06:58'),
(260, 'tags', 'name', 2, 'en', 'Idea', '2022-12-19 18:09:38', '2022-12-19 18:09:38'),
(261, 'tags', 'name', 2, 'ar', 'فكرة', '2022-12-19 18:09:38', '2022-12-19 18:09:38'),
(262, 'tags', 'name', 2, 'de', 'Idee', '2022-12-19 18:09:38', '2022-12-19 18:09:38'),
(263, 'tags', 'slug', 2, 'en', 'idea', '2022-12-19 18:09:38', '2022-12-19 18:09:38'),
(264, 'tags', 'slug', 2, 'ar', 'fkrh', '2022-12-19 18:09:38', '2022-12-19 18:09:38'),
(265, 'tags', 'slug', 2, 'de', 'idee', '2022-12-19 18:09:38', '2022-12-19 18:09:38'),
(266, 'categories', 'name', 1, 'en', 'General', '2022-12-19 18:11:48', '2022-12-19 18:11:48'),
(267, 'categories', 'name', 1, 'ar', 'عام', '2022-12-19 18:11:48', '2022-12-19 18:11:48'),
(268, 'categories', 'name', 1, 'de', 'Allgemein', '2022-12-19 18:11:48', '2022-12-19 18:11:48'),
(269, 'categories', 'slug', 1, 'en', 'general', '2022-12-19 18:11:48', '2022-12-19 18:11:48'),
(270, 'categories', 'slug', 1, 'ar', 'aam', '2022-12-19 18:11:48', '2022-12-19 18:11:48'),
(271, 'categories', 'slug', 1, 'de', 'allgemein', '2022-12-19 18:11:48', '2022-12-19 18:11:48'),
(272, 'data_rows', 'display_name', 80, 'de', 'Id', '2022-12-21 12:02:26', '2022-12-21 12:02:26'),
(273, 'data_rows', 'display_name', 82, 'de', 'Sayfa Adresi', '2022-12-21 12:02:26', '2022-12-21 12:02:26'),
(274, 'data_rows', 'display_name', 83, 'de', 'Üst Kategori', '2022-12-21 12:02:26', '2022-12-21 12:02:26'),
(275, 'data_rows', 'display_name', 84, 'de', 'Sıralama', '2022-12-21 12:02:26', '2022-12-21 12:02:26'),
(276, 'data_types', 'display_name_singular', 9, 'de', 'Kategorisi', '2022-12-21 12:02:26', '2022-12-21 12:02:26'),
(277, 'data_types', 'display_name_plural', 9, 'de', 'Kategorileri', '2022-12-21 12:02:26', '2022-12-21 12:02:26'),
(278, 'data_rows', 'display_name', 101, 'en', 'Id', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(279, 'data_rows', 'display_name', 101, 'ar', 'Id', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(280, 'data_rows', 'display_name', 101, 'de', 'Id', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(281, 'data_rows', 'display_name', 103, 'en', 'Sayfa Adresi', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(282, 'data_rows', 'display_name', 103, 'ar', 'Sayfa Adresi', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(283, 'data_rows', 'display_name', 103, 'de', 'Sayfa Adresi', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(284, 'data_types', 'display_name_singular', 11, 'en', 'Etiket', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(285, 'data_types', 'display_name_singular', 11, 'ar', 'Etiket', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(286, 'data_types', 'display_name_singular', 11, 'de', 'Etiket', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(287, 'data_types', 'display_name_plural', 11, 'en', 'Etiketler', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(288, 'data_types', 'display_name_plural', 11, 'ar', 'Etiketler', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(289, 'data_types', 'display_name_plural', 11, 'de', 'Etiketler', '2022-12-21 12:02:57', '2022-12-21 12:02:57'),
(290, 'data_rows', 'display_name', 105, 'en', 'Başlık', '2022-12-21 12:03:16', '2022-12-21 12:03:16'),
(291, 'data_rows', 'display_name', 105, 'ar', 'Başlık', '2022-12-21 12:03:16', '2022-12-21 12:03:16'),
(292, 'data_rows', 'display_name', 105, 'de', 'Başlık', '2022-12-21 12:03:16', '2022-12-21 12:03:16'),
(293, 'data_rows', 'display_name', 104, 'en', 'Başlık', '2022-12-21 12:03:33', '2022-12-21 12:03:33'),
(294, 'data_rows', 'display_name', 104, 'ar', 'Başlık', '2022-12-21 12:03:33', '2022-12-21 12:03:33'),
(295, 'data_rows', 'display_name', 104, 'de', 'Başlık', '2022-12-21 12:03:33', '2022-12-21 12:03:33'),
(296, 'data_rows', 'display_name', 85, 'de', 'Id', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(297, 'data_rows', 'display_name', 86, 'de', 'Başlık', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(298, 'data_rows', 'display_name', 87, 'de', 'Sayfa Adresi', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(299, 'data_rows', 'display_name', 88, 'de', 'Kısa Açıklama', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(300, 'data_rows', 'display_name', 89, 'de', 'İçerik', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(301, 'data_rows', 'display_name', 90, 'de', 'SEO Başlığı', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(302, 'data_rows', 'display_name', 91, 'de', 'Meta Açıklama', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(303, 'data_rows', 'display_name', 92, 'de', 'Yazar', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(304, 'data_rows', 'display_name', 93, 'de', 'Durum', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(305, 'data_rows', 'display_name', 94, 'de', 'Görsel', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(306, 'data_rows', 'display_name', 95, 'de', 'Kategori', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(307, 'data_rows', 'display_name', 96, 'de', 'Eklendi', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(308, 'data_rows', 'display_name', 97, 'de', 'Güncellendi', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(309, 'data_rows', 'display_name', 98, 'de', 'Silindi', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(310, 'data_rows', 'display_name', 99, 'de', 'Kategori', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(311, 'data_types', 'display_name_singular', 10, 'de', 'İçerik', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(312, 'data_types', 'display_name_plural', 10, 'de', 'İçerikler', '2022-12-21 12:10:25', '2022-12-21 12:10:25'),
(313, 'data_rows', 'display_name', 106, 'en', 'tags', '2022-12-21 12:18:18', '2022-12-21 12:18:18'),
(314, 'data_rows', 'display_name', 106, 'ar', 'tags', '2022-12-21 12:18:18', '2022-12-21 12:18:18'),
(315, 'data_rows', 'display_name', 106, 'de', 'tags', '2022-12-21 12:18:18', '2022-12-21 12:18:18'),
(316, 'posts', 'title', 4, 'en', 'Pellentesque habitant morbi tristiquev', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(317, 'posts', 'title', 4, 'ar', 'هناك حقيقة مثبتة منذ زمن ', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(318, 'posts', 'title', 4, 'de', 'Deustch demo habitant morbi tristiquev', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(319, 'posts', 'slug', 4, 'en', 'pellentesque-habitant-morbi-tristiquev', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(320, 'posts', 'slug', 4, 'ar', 'hnak-hqyqh-mthbth-mnth-zmn', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(321, 'posts', 'slug', 4, 'de', 'deustch-demo-habitant-morbi-tristiquev', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(322, 'posts', 'excerpt', 4, 'en', 'Quisque id mi. Nullam vel sem. Aenean ut eros et nisl sagittis vestibulum. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus. Vivamus in erat ut urna cursus vestibulum.', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(323, 'posts', 'excerpt', 4, 'ar', 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(324, 'posts', 'excerpt', 4, 'de', 'Quisque id mi. Nullam vel sem. Aenean ut eros et nisl sagittis vestibulum. Phasellus volutpat, metus eget egestas mollis, lacus lacus blandit dui, id egestas quam mauris ut lacus. Vivamus in erat ut urna cursus vestibulum.', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(325, 'posts', 'body', 4, 'en', '<p>In ac felis quis tortor malesuada pretium. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Praesent congue erat at massa. Nam pretium turpis et arcu. Sed in libero ut nibh placerat accumsan.</p>\n<p>Etiam iaculis nunc ac metus. In ut quam vitae odio lacinia tincidunt. Etiam rhoncus. Nunc interdum lacus sit amet orci. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus.</p>\n<p>Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Cras id dui. Phasellus a est. Fusce ac felis sit amet ligula pharetra condimentum. Curabitur a felis in nunc fringilla tristique.</p>\n<p>Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. In hac habitasse platea dictumst. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Ut non enim eleifend felis pretium feugiat. Phasellus nec sem in justo pellentesque facilisis.</p>', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(326, 'posts', 'body', 4, 'ar', '<p>ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر</p>\n<p>من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على</p>\n<p>الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو&nbsp;</p>', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(327, 'posts', 'body', 4, 'de', '<p>In ac felis quis tortor malesuada pretium. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Praesent congue erat at massa. Nam pretium turpis et arcu. Sed in libero ut nibh placerat accumsan.</p>\n<p>Etiam iaculis nunc ac metus. In ut quam vitae odio lacinia tincidunt. Etiam rhoncus. Nunc interdum lacus sit amet orci. Praesent metus tellus, elementum eu, semper a, adipiscing nec, purus.</p>\n<p>Quisque libero metus, condimentum nec, tempor a, commodo mollis, magna. Cras id dui. Phasellus a est. Fusce ac felis sit amet ligula pharetra condimentum. Curabitur a felis in nunc fringilla tristique.</p>\n<p>Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. In hac habitasse platea dictumst. Mauris turpis nunc, blandit et, volutpat molestie, porta ut, ligula. Ut non enim eleifend felis pretium feugiat. Phasellus nec sem in justo pellentesque facilisis.</p>', '2022-12-27 11:19:37', '2022-12-27 11:19:37'),
(328, 'parts', 'title', 1, 'en', 'Homepage Demo Lorem Ipsum Dolor', '2022-12-27 12:59:25', '2022-12-27 12:59:25'),
(329, 'parts', 'title', 1, 'ar', 'ليتصور طريقه وضع النصوص بالتصاميم سواء كانت', '2022-12-27 12:59:25', '2022-12-27 12:59:25'),
(330, 'parts', 'title', 1, 'de', 'Deutscher Testtitel für Homepage', '2022-12-27 12:59:25', '2022-12-27 12:59:25'),
(331, 'parts', 'excerpt', 1, 'ar', 'وعند موافقه العميل المبدئيه على التصميم يتم ازالة هذا النص من التصميم ويتم وضع النصوص النهائية المطلوبة للتصميم ويقول البعض ان وضع النصوص التجريبية بالتصميم قد تشغل المشاهد عن وضع الكثير من الملاحظات او الانتقادات للتصميم الاساسي', '2022-12-27 12:59:25', '2022-12-27 12:59:25'),
(332, 'parts', 'title', 2, 'en', 'Latest Posts', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(333, 'parts', 'title', 2, 'ar', 'آخر المشاركات', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(334, 'parts', 'title', 2, 'de', 'Neueste Beiträge', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(335, 'parts', 'excerpt', 2, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum quisquam eum porro a pariatur veniam.', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(336, 'parts', 'excerpt', 2, 'ar', 'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود \nأنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أريد أكسير سيتاشن يللأمكو', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(337, 'parts', 'excerpt', 2, 'de', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum quisquam eum porro a pariatur veniam.', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(338, 'parts', 'link1_text', 2, 'en', 'All Posts', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(339, 'parts', 'link1_text', 2, 'ar', 'جميع المشاركات', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(340, 'parts', 'link1_text', 2, 'de', 'Tüm İçerikler', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(341, 'parts', 'link1_url', 2, 'en', '#', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(342, 'parts', 'link1_url', 2, 'ar', '#', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(343, 'parts', 'link1_url', 2, 'de', '#', '2022-12-27 13:03:17', '2022-12-27 13:03:17'),
(344, 'parts', 'title', 3, 'en', 'Happy Customers', '2022-12-27 13:10:33', '2022-12-27 13:10:33'),
(345, 'parts', 'title', 3, 'ar', 'الزبائن سعداء', '2022-12-27 13:10:33', '2022-12-27 13:10:33'),
(346, 'parts', 'title', 3, 'de', 'Zufriedene Kunden', '2022-12-27 13:10:33', '2022-12-27 13:10:33'),
(347, 'menu_items', 'title', 22, 'en', 'Parts', '2022-12-27 23:37:17', '2022-12-27 23:37:17'),
(348, 'menu_items', 'title', 22, 'ar', 'القطع', '2022-12-27 23:37:45', '2022-12-27 23:37:45'),
(349, 'menu_items', 'title', 22, 'de', 'Teile', '2022-12-27 23:37:45', '2022-12-27 23:37:45'),
(350, 'data_rows', 'display_name', 107, 'en', 'Id', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(351, 'data_rows', 'display_name', 107, 'ar', 'Id', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(352, 'data_rows', 'display_name', 107, 'de', 'Id', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(353, 'data_rows', 'display_name', 108, 'en', 'Başlık', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(354, 'data_rows', 'display_name', 108, 'ar', 'Başlık', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(355, 'data_rows', 'display_name', 108, 'de', 'Başlık', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(356, 'data_rows', 'display_name', 109, 'en', 'Alt Başlık', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(357, 'data_rows', 'display_name', 109, 'ar', 'Alt Başlık', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(358, 'data_rows', 'display_name', 109, 'de', 'Alt Başlık', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(359, 'data_rows', 'display_name', 110, 'en', 'Kısa Açıklama', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(360, 'data_rows', 'display_name', 110, 'ar', 'Kısa Açıklama', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(361, 'data_rows', 'display_name', 110, 'de', 'Kısa Açıklama', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(362, 'data_rows', 'display_name', 111, 'en', 'Uzun İçerik (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(363, 'data_rows', 'display_name', 111, 'ar', 'Uzun İçerik (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(364, 'data_rows', 'display_name', 111, 'de', 'Uzun İçerik (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(365, 'data_rows', 'display_name', 112, 'en', 'Görsel 1 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(366, 'data_rows', 'display_name', 112, 'ar', 'Görsel 1 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(367, 'data_rows', 'display_name', 112, 'de', 'Görsel 1 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(368, 'data_rows', 'display_name', 113, 'en', 'Görsel 2 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(369, 'data_rows', 'display_name', 113, 'ar', 'Görsel 2 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(370, 'data_rows', 'display_name', 113, 'de', 'Görsel 2 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(371, 'data_rows', 'display_name', 114, 'en', 'Görsel 3 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(372, 'data_rows', 'display_name', 114, 'ar', 'Görsel 3 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(373, 'data_rows', 'display_name', 114, 'de', 'Görsel 3 (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(374, 'data_rows', 'display_name', 115, 'en', 'Bağlantı 1 Yazısı (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(375, 'data_rows', 'display_name', 115, 'ar', 'Bağlantı 1 Yazısı (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(376, 'data_rows', 'display_name', 115, 'de', 'Bağlantı 1 Yazısı (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(377, 'data_rows', 'display_name', 116, 'en', 'Bağlantı 1 URL (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(378, 'data_rows', 'display_name', 116, 'ar', 'Bağlantı 1 URL (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(379, 'data_rows', 'display_name', 116, 'de', 'Bağlantı 1 URL (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(380, 'data_rows', 'display_name', 117, 'en', 'Bağlantı 2 Yazısı (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(381, 'data_rows', 'display_name', 117, 'ar', 'Bağlantı 2 Yazısı (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(382, 'data_rows', 'display_name', 117, 'de', 'Bağlantı 2 Yazısı (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(383, 'data_rows', 'display_name', 118, 'en', 'Bağlantı 2 URL (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(384, 'data_rows', 'display_name', 118, 'ar', 'Bağlantı 2 URL (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(385, 'data_rows', 'display_name', 118, 'de', 'Bağlantı 2 URL (varsa)', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(386, 'data_rows', 'display_name', 119, 'en', 'Üretildi', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(387, 'data_rows', 'display_name', 119, 'ar', 'Üretildi', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(388, 'data_rows', 'display_name', 119, 'de', 'Üretildi', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(389, 'data_rows', 'display_name', 120, 'en', 'Güncellendi', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(390, 'data_rows', 'display_name', 120, 'ar', 'Güncellendi', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(391, 'data_rows', 'display_name', 120, 'de', 'Güncellendi', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(392, 'data_types', 'display_name_singular', 12, 'en', 'Parça', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(393, 'data_types', 'display_name_singular', 12, 'ar', 'Parça', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(394, 'data_types', 'display_name_singular', 12, 'de', 'Parça', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(395, 'data_types', 'display_name_plural', 12, 'en', 'Parçalar', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(396, 'data_types', 'display_name_plural', 12, 'ar', 'Parçalar', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(397, 'data_types', 'display_name_plural', 12, 'de', 'Parçalar', '2022-12-27 23:50:57', '2022-12-27 23:50:57'),
(398, 'parts', 'body', 3, 'en', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Id quam sapiente molestiae numquam quas, voluptates omnis nulla ea odio quia similique corrupti magnam.</p>\n<p><strong>Anna Smith - </strong><em>Product manager</em></p>', '2022-12-27 23:57:01', '2022-12-27 23:57:01'),
(399, 'parts', 'body', 3, 'ar', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Id quam sapiente molestiae numquam quas, voluptates omnis nulla ea odio quia similique corrupti magnam.</p>\n<p><strong>Anna Smith - </strong><em>Product manager</em></p>', '2022-12-27 23:57:01', '2022-12-27 23:57:01'),
(400, 'parts', 'body', 3, 'de', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Id quam sapiente molestiae numquam quas, voluptates omnis nulla ea odio quia similique corrupti magnam.</p>\n<p><strong>Anna Smith - </strong><em>Product manager</em></p>', '2022-12-27 23:57:01', '2022-12-27 23:57:01'),
(401, 'parts', 'excerpt', 1, 'en', 'Fusce a quam. Pellentesque libero tortor, tincidunt et, tincidunt eget, semper nec, quam. Etiam imperdiet imperdiet orci. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo.', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(402, 'parts', 'excerpt', 1, 'de', 'Fusce a quam. Pellentesque libero tortor, tincidunt et, tincidunt eget, semper nec, quam. Etiam imperdiet imperdiet orci. Cras risus ipsum, faucibus ut, ullamcorper id, varius ac, leo.', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(403, 'parts', 'link1_text', 1, 'en', 'Bizi Yakından Tanıyın', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(404, 'parts', 'link1_text', 1, 'ar', 'Bizi Yakından Tanıyın', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(405, 'parts', 'link1_text', 1, 'de', 'Bizi Yakından Tanıyın', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(406, 'parts', 'link1_url', 1, 'en', '#', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(407, 'parts', 'link1_url', 1, 'ar', '#', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(408, 'parts', 'link1_url', 1, 'de', '#', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(409, 'parts', 'link2_text', 1, 'en', 'Bize Ulaşın', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(410, 'parts', 'link2_text', 1, 'ar', 'Bize Ulaşın', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(411, 'parts', 'link2_text', 1, 'de', 'Bize Ulaşın', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(412, 'parts', 'link2_url', 1, 'en', '#', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(413, 'parts', 'link2_url', 1, 'ar', '#', '2022-12-27 23:57:11', '2022-12-27 23:57:11'),
(414, 'parts', 'link2_url', 1, 'de', '#', '2022-12-27 23:57:11', '2022-12-27 23:57:11');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@xfdev.com', 'users/December2022/aYynLCiP5qXcgCuYJ0rm.png', NULL, '$2y$10$PPb0MYC4GQH9vwRPF.jmT.1aXUKRCYZj4j0/6.ic4bhL5xeuHnur6', 'Z9P9ZKhHOO5J83QKTFfC3QHFM0EpgjGf7ztgbYEV4U9NdczabPgPCHHTVByZ', '{\"locale\":\"tr\"}', '2022-04-27 17:11:15', '2022-12-29 11:08:00'),
(2, 3, 'publisher', 'publisher@xfdev.com', 'users/December2022/oVf5O5RsVhS1MVW7zegD.jpg', NULL, '$2y$10$WyU3J.o1U9zsIYWcYPPaduSZpUyCWoryE/lEoYWxgl/HiX839qsQG', NULL, '{\"locale\":\"tr\"}', '2022-12-29 11:07:47', '2022-12-29 11:07:47');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `visits`
--

CREATE TABLE `visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `visitable_id` int(11) DEFAULT NULL,
  `visitable_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `websites`
--

CREATE TABLE `websites` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `customize` text DEFAULT NULL,
  `social_facebook` text DEFAULT NULL,
  `social_instagram` text DEFAULT NULL,
  `social_twitter` text DEFAULT NULL,
  `social_youtube` text DEFAULT NULL,
  `social_whatsapp` text DEFAULT NULL,
  `social_linkedin` text DEFAULT NULL,
  `social_vk` text DEFAULT NULL,
  `social_tiktok` text DEFAULT NULL,
  `map_url` text DEFAULT NULL,
  `contact_mails` text DEFAULT NULL,
  `hr_mails` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `websites`
--

INSERT INTO `websites` (`id`, `name`, `slug`, `seo_title`, `meta_description`, `phone`, `phone2`, `email`, `email2`, `customize`, `social_facebook`, `social_instagram`, `social_twitter`, `social_youtube`, `social_whatsapp`, `social_linkedin`, `social_vk`, `social_tiktok`, `map_url`, `contact_mails`, `hr_mails`) VALUES
(1, 'DEMO', 'demo', 'SEO TITLE IS IMPORTANT FOR SEO', 'META DESCRIPTION IS IMPORTANT FOR SEO', '905554443322', NULL, 'info@datasins.com', NULL, NULL, 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.twtitter.com', 'https://www.youtube.com', 'https://wa.me/', 'https://www.linkedin.com/', 'https://www.vk.com/', 'https://www.tiktok.com/', NULL, 'ugurakcil@gmail.com', NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_order_index` (`order`);

--
-- Tablo için indeksler `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Tablo için indeksler `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Tablo için indeksler `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Tablo için indeksler `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Tablo için indeksler `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_tags_post_id_index` (`post_id`),
  ADD KEY `posts_tags_tag_id_index` (`tag_id`);

--
-- Tablo için indeksler `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Tablo için indeksler `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Tablo için indeksler `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Tablo için indeksler `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_ip_index` (`ip`),
  ADD KEY `visits_visitable_id_index` (`visitable_id`),
  ADD KEY `visits_visitable_type_index` (`visitable_type`);

--
-- Tablo için indeksler `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- Tablo için AUTO_INCREMENT değeri `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `posts_tags`
--
ALTER TABLE `posts_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `websites`
--
ALTER TABLE `websites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Tablo kısıtlamaları `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
