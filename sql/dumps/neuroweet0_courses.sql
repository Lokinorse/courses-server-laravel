-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Хост: 10.0.0.164:3308
-- Время создания: Апр 23 2019 г., 23:31
-- Версия сервера: 10.1.37-MariaDB
-- Версия PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `neuroweet0_courses`
--

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` text COLLATE utf8mb4_unicode_ci,
  `cost` smallint(6) DEFAULT NULL,
  `unlocked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `created_at`, `updated_at`, `slug`, `thumb`, `cost`, `unlocked`) VALUES
(8, 'Основы HTML', 'Курс, без которого освоить профессию JavaScript-разработчика невозможно!', '2019-04-17 20:27:00', '2019-04-19 15:52:30', 'osnovi-html', '1/YFYgD5cz9p.png', NULL, 1),
(11, 'Введение', 'Давай знакомиться!', '2019-04-17 22:13:04', '2019-04-20 21:51:07', 'vvedenie', '1/qGJTxY6Tt7.jpg', NULL, 1),
(12, 'Основы CSS', 'Ознакомление с синтаксисом CSS, самыми основными его свойствами и назначением в верстке', '2019-04-19 10:34:41', '2019-04-19 10:34:50', 'osnovi-css', '1/f0mWRWHim2.png', NULL, 1),
(13, 'Bootstrap', 'Курс, без которого освоить профессию JavaScript-разработчика невозможно!', '2019-04-20 16:24:25', '2019-04-20 21:40:31', 'bootstrap', '1/y5c2EPT6gQ.png', NULL, 1),
(14, 'JavaScript', 'Курс, без которого освоить профессию JavaScript-разработчика невозможно!', '2019-04-20 17:02:08', '2019-04-20 21:40:58', 'javascript', '1/eixxKzEJur.png', NULL, 1),
(15, 'Node JS', 'Курс, без которого освоить профессию JavaScript-разработчика невозможно!', '2019-04-21 08:30:55', '2019-04-21 12:15:53', 'node-js', '2/PScwlRZVzZ.png', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `course_lesson`
--

CREATE TABLE IF NOT EXISTS `course_lesson` (
  `course_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `order` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `course_lesson`
--

INSERT INTO `course_lesson` (`course_id`, `lesson_id`, `order`) VALUES
(11, 9, 0),
(11, 8, 1),
(11, 35, 2),
(11, 11, 3),
(11, 44, 4),
(8, 13, 0),
(8, 14, 1),
(8, 45, 2),
(8, 18, 3),
(8, 46, 4),
(8, 19, 5),
(8, 47, 6),
(8, 20, 7),
(8, 48, 8),
(8, 21, 9),
(8, 22, 10),
(8, 49, 11),
(8, 38, 12),
(8, 23, 13),
(8, 50, 14),
(8, 24, 15),
(8, 25, 16),
(8, 39, 17),
(8, 26, 18),
(8, 27, 19),
(8, 52, 20),
(8, 28, 21),
(8, 53, 22),
(8, 29, 23),
(8, 54, 24),
(8, 30, 25),
(8, 55, 26),
(8, 31, 27),
(8, 56, 28),
(8, 32, 29),
(8, 57, 30),
(8, 33, 31),
(8, 34, 32),
(13, 72, 0),
(13, 73, 1),
(13, 74, 2),
(13, 75, 3),
(13, 76, 4),
(13, 77, 5),
(13, 78, 6),
(13, 79, 7),
(13, 80, 8),
(13, 81, 9),
(13, 82, 10),
(13, 83, 11),
(13, 84, 12),
(13, 85, 13),
(13, 86, 14),
(13, 87, 15),
(13, 88, 16),
(13, 89, 17),
(13, 90, 18),
(13, 91, 19),
(13, 92, 20),
(13, 93, 21),
(13, 94, 22),
(13, 95, 23),
(13, 96, 24),
(13, 97, 25),
(13, 98, 26),
(13, 99, 27),
(13, 100, 28),
(13, 101, 29),
(13, 102, 30),
(13, 103, 31),
(14, 104, 0),
(14, 105, 1),
(14, 106, 2),
(14, 107, 3),
(14, 108, 4),
(14, 109, 5),
(14, 110, 6),
(14, 111, 7),
(14, 112, 8),
(14, 113, 9),
(14, 114, 10),
(14, 115, 11),
(14, 116, 12),
(14, 117, 13),
(14, 118, 14),
(14, 119, 15),
(14, 120, 16),
(14, 121, 17),
(14, 122, 18),
(14, 123, 19),
(14, 124, 20),
(14, 125, 21),
(14, 126, 22),
(14, 127, 23),
(14, 128, 24),
(14, 129, 25),
(14, 130, 26),
(14, 131, 27),
(14, 132, 28),
(14, 133, 29),
(14, 134, 30),
(14, 135, 31),
(14, 136, 32),
(14, 137, 33),
(14, 138, 34),
(14, 139, 35),
(14, 140, 36),
(14, 141, 37),
(14, 142, 38),
(14, 143, 39),
(14, 144, 40),
(14, 145, 41),
(14, 146, 42),
(14, 147, 43),
(14, 148, 44),
(14, 149, 45),
(14, 150, 46),
(14, 151, 47),
(14, 152, 48),
(14, 153, 49),
(14, 154, 50),
(14, 155, 51),
(14, 156, 52),
(14, 157, 53),
(14, 158, 54),
(14, 159, 55),
(14, 160, 56),
(14, 161, 57),
(14, 162, 58),
(14, 163, 59),
(14, 164, 60),
(14, 165, 61),
(14, 166, 62),
(14, 167, 63),
(14, 168, 64),
(14, 169, 65),
(14, 170, 66),
(14, 171, 67),
(15, 172, NULL),
(12, 40, 0),
(12, 41, 1),
(12, 42, 2),
(12, 43, 3),
(12, 58, 4),
(12, 60, 5),
(12, 61, 6),
(12, 62, 7),
(12, 63, 8),
(12, 64, 9),
(12, 65, 10),
(12, 66, 11),
(12, 71, 12),
(12, 67, 13),
(12, 68, 14),
(12, 69, 15),
(12, 70, 16);

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=148 ;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 0, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":"0","taggable":"0"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 3),
(23, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(24, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 1),
(26, 4, 'videos', 'media_picker', 'Videos', 0, 1, 1, 1, 1, 1, '{"max":10,"min":0,"show_folders":true,"show_toolbar":true,"allow_upload":true,"allow_move":false,"allow_delete":true,"allow_create_folder":true,"allow_rename":true,"allow-multi-select":false,"allow_crop":true,"allowed":["video"],"base_path":"\\/{uid}\\/","rename":"{random:10}"}', 2),
(27, 4, 'unit_type', 'text', 'Unit Type', 1, 0, 0, 0, 1, 0, '{}', 7),
(28, 4, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 8),
(30, 4, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{"validation":{"rule":"required|min:5"}}', 8),
(31, 4, 'thumb', 'media_picker', 'Thumb', 0, 1, 1, 1, 1, 1, '{"max":1,"min":0,"show_folders":true,"show_toolbar":true,"allow_upload":true,"allow_move":false,"allow_delete":true,"allow_create_folder":true,"allow_rename":true,"allow-multi-select":false,"allow_crop":true,"allowed":["image"],"base_path":"\\/{uid}\\/","rename":"{random:10}"}', 9),
(32, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(33, 6, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(34, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(35, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(36, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(37, 7, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(39, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(40, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(41, 7, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
(42, 7, 'value', 'text', 'Value', 0, 1, 1, 1, 1, 1, '{}', 7),
(43, 7, 'promo_id', 'text', 'Promo Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(44, 7, 'target_id', 'text', 'Target Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(45, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
(49, 7, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, '{"on":"\\u041f\\u0440\\u043e\\u0432\\u0435\\u0434\\u0435\\u043d\\u043e","off":"\\u041d\\u0435 \\u043f\\u0440\\u043e\\u0432\\u0435\\u0434\\u0435\\u043d\\u043e","checked":"false"}', 11),
(50, 4, 'cost', 'text', 'Cost', 0, 1, 1, 1, 1, 1, '{}', 10),
(51, 6, 'value', 'text', 'Value', 0, 1, 1, 1, 1, 1, '{}', 5),
(52, 6, 'actual_to', 'timestamp', 'Actual To', 0, 1, 1, 1, 1, 1, '{}', 6),
(53, 4, 'unlocked', 'checkbox', 'Тип доступа', 1, 1, 1, 1, 1, 1, '{"on":"\\u041e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","off":"\\u0417\\u0430\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","checked":"true"}', 11),
(54, 4, 'completed', 'checkbox', 'Стадия разработки', 1, 1, 1, 1, 1, 1, '{"on":"\\u0414\\u043e\\u0434\\u0435\\u043b\\u0430\\u043d","off":"\\u0412 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u0435","checked":"true"}', 12),
(62, 4, 'unit_belongsto_test_relationship', 'relationship', 'tests', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Test","table":"tests","type":"belongsTo","column":"test_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 13),
(64, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 9, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{}', 2),
(66, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(67, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(68, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(69, 9, 'test_id', 'text', 'Test Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(70, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 10, 'type', 'text', 'Type', 1, 1, 1, 1, 1, 1, '{}', 2),
(72, 10, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(73, 10, 'test_question_id', 'text', 'Test Question Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(74, 10, 'order', 'text', 'Order', 0, 1, 1, 1, 1, 1, '{}', 5),
(75, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(76, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(78, 4, 'test_id', 'text', 'Test Id', 0, 1, 1, 1, 1, 1, '{}', 13),
(80, 4, 'youtube_video_id', 'text', 'Youtube Video Id', 0, 1, 1, 1, 1, 1, '{}', 14),
(81, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 11, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(83, 11, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(84, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(85, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(86, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(87, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(88, 12, 'description', 'text', 'Description', 1, 1, 1, 1, 1, 1, '{}', 3),
(89, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(90, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(97, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 5),
(98, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 6),
(99, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(100, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 1),
(101, 15, 'description', 'rich_text_box', 'Задание к уроку', 0, 1, 1, 1, 1, 1, '{}', 13),
(102, 15, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{"validation":{"rule":"required|min:5"}}', 2),
(103, 15, 'unlocked', 'checkbox', 'Unlocked', 1, 1, 1, 1, 1, 1, '{"on":"\\u041e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","off":"\\u0417\\u0430\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","checked":"true"}', 3),
(104, 15, 'completed', 'checkbox', 'Completed', 1, 1, 1, 1, 1, 1, '{"on":"\\u0414\\u043e\\u0434\\u0435\\u043b\\u0430\\u043d","off":"\\u0412 \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441\\u0435","checked":"true"}', 4),
(105, 15, 'test_id', 'text', 'Test Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(106, 15, 'youtube_video_id', 'text', 'ID Ютуба', 0, 1, 1, 1, 1, 1, '{}', 9),
(107, 15, 'lesson_type', 'select_dropdown', 'Тип занятия', 0, 1, 1, 1, 1, 1, '{"default":"video","options":{"divider":"\\u0420\\u0430\\u0437\\u0434\\u0435\\u043b\\u0438\\u0442\\u0435\\u043b\\u044c","video":"\\u0412\\u0438\\u0434\\u0435\\u043e","test":"\\u0422\\u0435\\u0441\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435","practices":"\\u041f\\u0440\\u0430\\u043a\\u0442\\u0438\\u043a\\u0430 \\u043a\\u043e\\u0434\\u043e\\u043c","homework":"\\u0414\\u043e\\u043c\\u0430\\u0448\\u043d\\u0435\\u0435 \\u0437\\u0430\\u0434\\u0430\\u043d\\u0438\\u0435"}}', 10),
(108, 12, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{}', 7),
(109, 12, 'thumb', 'media_picker', 'Превью', 0, 1, 1, 1, 1, 1, '{"max":1,"min":0,"show_folders":true,"show_toolbar":true,"allow_upload":true,"allow_move":false,"allow_delete":true,"allow_create_folder":true,"allow_rename":true,"allow-multi-select":false,"allow_crop":true,"allowed":["image"],"base_path":"\\/{uid}\\/","rename":"{random:10}"}', 8),
(110, 11, 'thumb', 'media_picker', 'Thumb', 0, 1, 1, 1, 1, 1, '{"max":1,"min":0,"show_folders":true,"show_toolbar":true,"allow_upload":true,"allow_move":false,"allow_delete":true,"allow_create_folder":true,"allow_rename":true,"allow-multi-select":false,"allow_crop":true,"allowed":["image"],"base_path":"\\/{uid}\\/","rename":"{random:10}"}', 6),
(111, 15, 'practice_id', 'text', 'Practice Id', 0, 1, 1, 1, 1, 1, '{}', 11),
(112, 12, 'cost', 'number', 'Cost', 0, 1, 1, 1, 1, 1, '{}', 9),
(113, 11, 'cost', 'text', 'Cost', 0, 1, 1, 1, 1, 1, '{}', 7),
(114, 12, 'unlocked', 'checkbox', 'Разблокирован по умолчанию', 1, 1, 1, 1, 1, 1, '{"on":"\\u041e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","off":"\\u0417\\u0430\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","checked":"true"}', 4),
(115, 15, 'short_description', 'text', 'Короткое описание', 0, 1, 1, 1, 1, 1, '{}', 12),
(116, 11, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{}', 8),
(117, 15, 'lesson_belongstomany_course_relationship', 'relationship', 'courses', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Course","table":"courses","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"course_lesson","pivot":"1","taggable":"0"}', 14),
(118, 12, 'course_belongstomany_program_relationship', 'relationship', 'programs', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Program","table":"programs","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"program_course","pivot":"1","taggable":null}', 10),
(119, 7, 'is_real', 'text', 'Is Real', 0, 1, 1, 1, 1, 1, '{}', 11),
(120, 7, 'target_type', 'text', 'Target Type', 0, 1, 1, 1, 1, 1, '{}', 12),
(121, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(122, 16, 'target_id', 'text', 'Target Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(123, 16, 'destination_type', 'text', 'Destination Type', 1, 1, 1, 1, 1, 1, '{}', 3),
(124, 16, 'parent_id', 'text', 'Parent Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(125, 16, 'text', 'text', 'Text', 1, 1, 1, 1, 1, 1, '{}', 5),
(126, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(127, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(128, 16, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 8),
(129, 16, 'important', 'text', 'Important', 0, 1, 1, 1, 1, 1, '{}', 9),
(130, 16, 'right', 'text', 'Right', 0, 1, 1, 1, 1, 1, '{}', 10),
(131, 16, 'message_type', 'text', 'Message Type', 1, 1, 1, 1, 1, 1, '{}', 11),
(132, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(133, 17, 'lesson_id', 'text', 'Lesson Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(134, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(135, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(136, 17, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(137, 17, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 6),
(138, 17, 'user_lessons_progress_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"course_lesson","pivot":"0","taggable":"0"}', 7),
(139, 17, 'user_lessons_progress_belongsto_lesson_relationship', 'relationship', 'lessons', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Lesson","table":"lessons","type":"belongsTo","column":"lesson_id","key":"id","label":"name","pivot_table":"course_lesson","pivot":"0","taggable":"0"}', 8),
(140, 1, 'first_name', 'text', 'First Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(141, 1, 'last_name', 'text', 'Last Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(142, 1, 'nickname', 'text', 'Nickname', 1, 1, 1, 1, 1, 1, '{}', 6),
(143, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 8),
(144, 1, 'api_token', 'text', 'Api Token', 0, 1, 1, 1, 1, 1, '{}', 10),
(145, 1, 'provider', 'text', 'Provider', 0, 1, 1, 1, 1, 1, '{}', 11),
(146, 1, 'provider_user_id', 'text', 'Provider User Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(147, 1, 'provider_user_token', 'text', 'Provider User Token', 0, 1, 1, 1, 1, 1, '{}', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"desc","default_search_key":null,"scope":null}', '2019-04-08 13:44:21', '2019-04-21 18:35:46'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(4, 'units', 'units', 'Unit', 'Units', NULL, 'App\\Unit', NULL, 'App\\Http\\Controllers\\Voyager\\UnitController', NULL, 1, 1, '{"order_column":"id","order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-08 13:46:36', '2019-04-15 13:01:54'),
(5, 'promo', 'promo', 'Promo', 'Promo', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 17:56:21', '2019-04-10 18:01:08'),
(6, 'promos', 'promos', 'Promo', 'Promos', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 18:02:27', '2019-04-11 13:44:49'),
(7, 'transactions', 'transactions', 'Transaction', 'Transactions', NULL, 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 18:07:47', '2019-04-21 13:40:36'),
(9, 'test_questions', 'test-questions', 'Test Question', 'Test Questions', NULL, 'App\\TestQuestion', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-12 22:11:48', '2019-04-12 22:11:48'),
(10, 'test_answers', 'test-answers', 'Test Answer', 'Test Answers', NULL, 'App\\TestAnswer', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-12 22:12:14', '2019-04-12 22:12:14'),
(11, 'programs', 'programs', 'Program', 'Programs', NULL, 'App\\Program', NULL, 'App\\Http\\Controllers\\Voyager\\ProgramController', NULL, 1, 0, '{"order_column":null,"order_display_column":"id","order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 18:59:11', '2019-04-19 04:40:40'),
(12, 'courses', 'courses', 'Course', 'Courses', NULL, 'App\\Course', NULL, 'App\\Http\\Controllers\\Voyager\\CourseController', NULL, 1, 0, '{"order_column":null,"order_display_column":"id","order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 19:01:40', '2019-04-17 23:48:36'),
(15, 'lessons', 'lessons', 'Lesson', 'Lessons', NULL, 'App\\Lesson', NULL, 'App\\Http\\Controllers\\Voyager\\LessonController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 19:19:06', '2019-04-19 14:16:55'),
(16, 'messages', 'messages', 'Message', 'Messages', NULL, 'App\\Message', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-21 17:43:36', '2019-04-21 17:43:36'),
(17, 'user_lessons_progress', 'user-lessons-progress', 'User Lessons Progress', 'User Lessons Progresses', NULL, 'App\\UserLessonsProgress', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-21 17:46:00', '2019-04-21 17:50:46');

-- --------------------------------------------------------

--
-- Структура таблицы `lessons`
--

CREATE TABLE IF NOT EXISTS `lessons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `youtube_video_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_type` longtext COLLATE utf8mb4_unicode_ci,
  `slug` tinytext COLLATE utf8mb4_unicode_ci,
  `unlocked` tinyint(4) NOT NULL DEFAULT '0',
  `completed` tinyint(4) NOT NULL DEFAULT '1',
  `test_id` int(11) DEFAULT NULL,
  `practice_id` int(11) DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=173 ;

--
-- Дамп данных таблицы `lessons`
--

INSERT INTO `lessons` (`id`, `created_at`, `updated_at`, `name`, `description`, `youtube_video_id`, `lesson_type`, `slug`, `unlocked`, `completed`, `test_id`, `practice_id`, `short_description`) VALUES
(8, '2019-04-15 09:55:27', '2019-04-19 15:24:39', 'Настройка среды. Установка Google Chrome', '<p>Привет! Я рад, что мы с тобой начнем обучение прямо сейчас. Для начала, нужно настроить все программы, без которых пройти курс будет невозможно.</p>\r\n<p>Для прохождения марафона нам потребуются:</p>\r\n<p>&nbsp;</p>\r\n<p>1) Браузер <strong>Google Chrome</strong> последней версии</p>\r\n<p>2) <strong>Sublime Text 3</strong>, скачанный с официального сайта.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>В этом уроке я покажу, как скачать и установить Chrome. Если он у тебя установлен, смело пропускай урок!</p>', '2opL4LMmLvo', 'video', 'nastrojka-sredy-ustanovka-Google-Chrome', 1, 1, NULL, NULL, 'Пошаговая установка Google Chrome'),
(9, '2019-04-15 09:55:39', '2019-04-21 12:07:49', 'Чтоб ты был в теме', '<p><a href="https://vk.com/@varilo_webdeveloper-skolko-zarabatyvaet-veb-razrabotchik">Ссылка на мою статью в группе:</a></p>\r\n<p><a href="https://vk.com/@varilo_webdeveloper-skolko-zarabatyvaet-veb-razrabotchik">https://vk.com/@varilo_webdeveloper-skolko-zarabatyvaet-veb-razrabotchik</a></p>\r\n<p>&nbsp;</p>\r\n<p><a href="https://vc.ru/flood/32337-zarplaty-it-specialistov-na-konec-2017-goda">https://vc.ru/flood/32337-zarplaty-it-specialistov-na-konec-2017-goda</a><br /><br /></p>\r\n<h2>Зарплата Javscript-разработчиков</h2>\r\n<p><strong>в среднем от 60 до 200 тысяч по России</strong><br /><br /><img style="max-width: 100%;" src="https://varilo.ru//storage/lessons/April2019/зп JS специалистов.PNG" alt="" /></p>\r\n<h2>Сколько платят компании</h2>\r\n<p><img style="max-width: 100%;" src="https://varilo.ru//storage/lessons/April2019/skolko-platyat-kompanii.jpg" alt="" /></p>\r\n<p>&nbsp;</p>', 'JbCcylOTgNE', 'video', 'privetstvie', 1, 1, NULL, NULL, 'Приветственное введение в Javscript'),
(11, '2019-04-15 10:01:24', '2019-04-19 15:09:10', 'Что такое сайт', '<p>Вот скрипт, который нужно вставить в Console.</p>\r\n<p>Зайди на свою страницу ВК, нажми f12.</p>\r\n<p>Скопируй этот скрипт, и вставь в раздел Console, который открывается при нажатии f12.</p>\r\n<p>Начинай от var, и не забудь про последнюю скобку!</p>\r\n<p>Нажми enter, и наведи курсор на статус Online.&nbsp;</p>\r\n<p>Нажимай, и смотри на результат!</p>\r\n<pre class="language-javascript"><code>var online = document.querySelector(".profile_online_lv")\r\nonline .onclick = function(e){\r\n    e.preventDefault();\r\n    e.stopPropagation();\r\n    var body = document.querySelector("body")\r\n    var angle = 0;\r\n    var interval = setInterval(function() {\r\n        if (angle &gt;= 360) clearInterval(interval);\r\n        body.style = "transform: rotate("+angle+"deg); background: #ebf9e8;";\r\n        angle++\r\n    }, 2)\r\n    pageName = document.querySelector(".page_name")\r\n    pageName.innerText = "Вертел я Вконтакте"\r\n}</code></pre>', 'CsCaO3bbkag', 'video', 'chto-takoe-sajt', 1, 1, NULL, NULL, 'Как устроен сайт + бонусное задание'),
(13, '2019-04-15 10:03:02', '2019-04-19 15:24:54', 'Подготовка проекта', NULL, '7bBSCOi321c', 'video', 'podgotovka-proekta', 1, 1, NULL, NULL, 'Как правильно подготовить новый проект к работе'),
(14, '2019-04-15 10:04:46', '2019-04-19 15:12:59', 'Что такое тег', '<p>Теги. Не обязательно их зубрить, или пытаться найти все существующие.</p>\r\n<p>Большинство верстальщиков в повседневной жизни используют не более 20-ти из, но давай об этом подробнее в видео!</p>', 'sHK6ccPn7cc', 'video', 'chto-takoe-teg', 1, 1, NULL, NULL, 'Знакомство с основными HTML тегами'),
(18, '2019-04-15 10:10:50', '2019-04-19 15:43:02', 'Атрибуты тега', NULL, 'L9-HZ9H7SZc', 'video', 'atributy-tega', 0, 1, NULL, NULL, 'Href, target, img...'),
(19, '2019-04-15 10:13:11', '2019-04-19 15:37:25', 'Структура HTML документа', '<p>Заметь, что когда будешь писать html+tab, чтобы быстро сделать правильную структуру документа, нужно, чтобы файл был обязательно уже сохранен в формате .html, как на картинке.&nbsp;</p>\r\n<p><img src="https://varilo.ru//storage/units/April2019/тэг.JPG" alt="" /></p>\r\n<p class="_article_paragraph article_paragraph article_decoration_first article_decoration_last" style="margin-top: 24px; margin-bottom: 0px;">Иначе, фишка работать не будет!</p>\r\n<p class="_article_paragraph article_paragraph article_decoration_first article_decoration_last" style="margin-top: 24px; margin-bottom: 0px;">&nbsp;</p>\r\n<p class="_article_paragraph article_paragraph article_decoration_first article_decoration_last" style="margin-top: 24px; margin-bottom: 0px; color: rgba(0, 0, 0, 0.86); font-family: ''PT Serif'', serif; font-size: 19px;">&nbsp;</p>', 'b0ZfnzI-bxU', 'video', 'struktura-HTML-dokumenta', 0, 1, NULL, NULL, 'Как не встать на свои же грабли, и сделать все правильно'),
(20, '2019-04-15 10:14:52', '2019-04-19 15:38:15', 'Строчные и блочные элементы', '<p>Таблица со всеми тегами: <a href="https://vk.cc/9dp2Jg">посмотреть</a></p>', '2rGn2gRzGm4', 'video', 'strochnye-i-blochnye-elementy', 0, 1, NULL, NULL, 'Что значат строчные и блочные элементы'),
(21, '2019-04-15 10:16:14', '2019-04-19 15:39:16', 'Списки, вложенность в HTML', '<p><strong>Список, который понадобится для прохождения занятия:</strong></p>\r\n<p>&nbsp;</p>\r\n<p>История</p>\r\n<p>&nbsp;</p>\r\n<p>Социальная роль</p>\r\n<p>&nbsp;</p>\r\n<p>Применение</p>\r\n<p>&nbsp;</p>\r\n<p>Велосипедные гонки</p>\r\n<p>&nbsp;</p>\r\n<p>Велосипеды в настоящее время</p>\r\n<p>&nbsp;</p>\r\n<p>Европа</p>\r\n<p>&nbsp;</p>\r\n<p>Азия</p>\r\n<p>&nbsp;</p>\r\n<p>Велосипедные рекорды</p>\r\n<p>&nbsp;</p>\r\n<p>Устройство велосипеда</p>\r\n<p>&nbsp;</p>\r\n<p>Колёса</p>\r\n<p>&nbsp;</p>\r\n<p>Рама</p>\r\n<p>&nbsp;</p>\r\n<p>Конструкция</p>\r\n<p>&nbsp;</p>\r\n<p>Материалы</p>\r\n<p>&nbsp;</p>\r\n<p>Вилка</p>\r\n<p>&nbsp;</p>\r\n<p>Передача</p>\r\n<p>&nbsp;</p>\r\n<p>Тормоза</p>\r\n<p>&nbsp;</p>\r\n<p>Седло</p>\r\n<p>&nbsp;</p>\r\n<p>Педали</p>\r\n<p>&nbsp;</p>\r\n<p>Другие компоненты и принадлежности</p>\r\n<p>&nbsp;</p>\r\n<p>Физика</p>\r\n<p>&nbsp;</p>\r\n<p>Энергетическая эффективность</p>\r\n<p>&nbsp;</p>\r\n<p>Разные факты</p>\r\n<p>&nbsp;</p>\r\n<p>Разновидности велосипедов</p>\r\n<p>&nbsp;</p>\r\n<p>Видео</p>\r\n<p>&nbsp;</p>\r\n<p>Техническое обслуживание</p>\r\n<p>&nbsp;</p>\r\n<p>Выбор велосипеда</p>\r\n<p>&nbsp;</p>\r\n<p>Руководство по эксплуатации</p>\r\n<p>&nbsp;</p>\r\n<p>Польза для здоровья</p>\r\n<p>&nbsp;</p>\r\n<p>См. также</p>\r\n<p>&nbsp;</p>\r\n<p>Примечания</p>\r\n<p>&nbsp;</p>\r\n<p>Ссылки</p>', 'qxQ217nGFiA', 'video', 'spiski-vlozhennost-v-HTML', 0, 1, NULL, NULL, 'Делаем список на практике'),
(22, '2019-04-15 10:17:43', '2019-04-19 15:39:58', 'Div''ы и span''ы', NULL, '3twtTK9Kmic', 'video', 'divy-i-spany', 0, 1, NULL, NULL, 'Что за странные слова?'),
(23, '2019-04-15 10:19:40', '2019-04-19 15:28:47', 'HTML таблицы, введение', NULL, 'qJjBR3BKQLc', 'video', 'HTML-tablicy-vvedenie', 0, 1, NULL, NULL, 'Знакомимся с тегами для HTML таблицы'),
(24, '2019-04-15 10:20:06', '2019-04-19 15:55:52', 'HTML таблицы, упражнение', '<p>Для этого занятие тебе понадобятся материалы.</p>\r\n<p>Я подготовил папку на Яндекс Диске, из которой ты сможешь скачать все нужное:&nbsp;<a href=" https://yadi.sk/d/HFJIXNVHSQcFpA">Яндекс.Диск</a></p>\r\n<p>&nbsp;</p>\r\n<p>Если ты решишь найти картинки самостоятельно, хочу посоветовать тебе искать <em>маленькие картинки</em> по размеру. Так как мы не проходили уменьшение размеров картинок с помощью кода, а гигантская картинка, которая выходит за границы вселенной, сильно подпортит внешний вид твоей таблицы.</p>\r\n<p>Также хочу напомнить, что для выполнения этого задания тебе нужно будет вспомнить теги, которые отвечают за ссылку, добавление картинки, и открытие ссылки в новой вкладке.</p>\r\n<p>&nbsp;</p>', 'MpZGRQ2TVCw', 'video', 'HTML-tablicy-uprazhnenie', 0, 1, NULL, NULL, 'Ты самостоятельно делаешь свою HTML таблицу!'),
(25, '2019-04-15 10:20:11', '2019-04-19 15:53:57', 'Решение упражнения по талицам', NULL, 'ReTXvwO6ghs', 'video', 'HTML-tablicy-reshenie-uprazhneniya', 0, 1, NULL, NULL, 'Разбираем с тобой задание по HTML формам, если ты не справился с ним самостоятельно'),
(26, '2019-04-15 10:24:24', '2019-04-19 15:23:30', 'Введение в формы', '<p>Ну вот, ты уже через многое прошел, сейчас ты почти на финишной прямой!</p>\r\n<p>Впитывай в себя эту информацию как губка, потому что в конце будет новое задание для самостоятельного выполнения.</p>', 'bhI01gnKNuw', 'video', 'formy-vvedenie', 0, 1, NULL, NULL, 'Расскажу об HTML формах, покажу, какие теги будем в них использовать'),
(27, '2019-04-15 10:24:28', '2019-04-19 15:45:01', 'Инпуты', NULL, 'E3AXefQxGwk', 'video', 'inputy', 0, 1, NULL, NULL, 'Что такое input в HTML форме'),
(28, '2019-04-15 10:24:32', '2019-04-19 15:45:44', 'Сама форма', NULL, 'mCUvXaVezc0', 'video', 'sama-forma', 0, 1, NULL, NULL, 'Немного про саму HTML форму'),
(29, '2019-04-15 10:24:35', '2019-04-19 15:47:00', 'Лейблы', NULL, 'Eoq91nDQ0ks', 'video', 'lejbly', 0, 1, NULL, NULL, 'Продолжаем работать  с Гуглером'),
(30, '2019-04-15 10:24:38', '2019-04-19 15:47:51', 'Валидация форм', NULL, 'nYryG_pFjzE', 'video', 'validaciya-form', 0, 1, NULL, NULL, 'Как сделать, чтобы пароль можно было вводить не менее 6-ти символов'),
(31, '2019-04-15 10:24:41', '2019-04-19 15:48:33', 'Checkbox и radio кнопки', NULL, 'ffisZCvC1LE', 'video', 'checkbox-i-radio-knopki', 0, 1, NULL, NULL, 'Зачекбоксим нашу форму'),
(32, '2019-04-15 10:24:45', '2019-04-19 15:49:29', 'Select, textarea', NULL, '3DN8YQDmW6I', 'video', 'select-textarea', 0, 1, NULL, NULL, 'Добавляем селекты и поле для текста'),
(33, '2019-04-15 10:24:48', '2019-04-19 15:50:50', 'Практика, упражнение', '<p>Ура, это твоя финальная работа по блоку HTML!</p>\r\n<p>Напомню, что эту работу я буду проверять.</p>', '0_mQQ-Y06rg', 'video', 'praktika-uprazhnenie', 0, 1, NULL, NULL, 'Сделай свою большую форму с блекджеком и...'),
(34, '2019-04-15 10:24:52', '2019-04-19 15:51:22', 'Решение упражнения по формам', NULL, '0_mQQ-Y06rg', 'video', 'reshenie-uprazhneniya-po-formam', 0, 1, NULL, NULL, 'Разбор упражнения с формой'),
(35, '2019-04-15 11:10:20', '2019-04-19 15:15:13', 'Настройка среды. Установка Sublime Text 3', '<p>Вообще Sublime - программа платная, но её полный функционал пожизненно доступен даже без оплаты. Единственный минус неоплаченной версии - периодическое выскакивание окошка об оплате.</p>\r\n<p>Вот картинка того, как это будет выглядеть:</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://varilo.ru//storage/units/April2019/саблайм9.JPG" alt="" /></p>\r\n<p>&nbsp;</p>\r\n<p>Появляется оно достаточно редко, да и закрыть его, нажав на отмену, не проблема.</p>\r\n<p>? Замечу, что в процессе установки Sublime будет пункт <strong>Add to explorer context menu</strong>. Советую эту галочку поставить, тогда можно будет открывать файлы в Sublime прямо из проводника правой кнопкой мышки.</p>', 'eT9MfOsKPtA', 'video', 'nastrojka-sredy-ustanovka-Sublime-Text-3', 1, 1, NULL, NULL, 'Пошаговая установка Sublime Text 3.'),
(38, '2019-04-19 15:31:08', '2019-04-19 15:31:24', 'HTML таблицы', NULL, NULL, 'divider', 'HTML-tablicy', 1, 1, NULL, NULL, 'Учимся делать HTML таблицы на практике'),
(39, '2019-04-19 15:34:15', '2019-04-19 15:34:15', 'HTML формы', NULL, NULL, 'divider', 'HTML-formy', 1, 1, NULL, NULL, NULL),
(40, '2019-04-19 16:08:48', '2019-04-19 16:08:48', 'Введение в CSS', NULL, 'o9ZhN0mdqvI', 'video', 'vvedenie-v-css', 1, 1, NULL, NULL, 'Знакомимся с CSS!'),
(41, '2019-04-19 17:14:10', '2019-04-21 08:43:00', 'Куда писать CSS', NULL, '5A-P4nxZISQ', 'video', 'kuda-pisat-css', 0, 1, NULL, NULL, 'Объясняю, как стили записывать НЕ НАДО, и как это делать правильно'),
(42, '2019-04-19 17:17:03', '2019-04-21 08:43:28', 'Цвета в CSS', NULL, 'EnUMwEgDrBw', 'video', 'cveta-v-css', 0, 1, NULL, NULL, 'Как писать цвета в CSS, в каком формате, и где их брать'),
(43, '2019-04-19 17:20:48', '2019-04-21 08:49:27', 'Задний фон и границы', NULL, '20RK_OQ4QUE', 'video', 'zadnij-fon-i-granicy', 0, 1, NULL, NULL, 'Разбираемся, как задать цвет границам, обводке, и поставить задний фон'),
(44, '2019-04-19 17:24:12', '2019-04-19 17:24:12', 'Тест по итогам введения', NULL, NULL, 'test', 'test-po-itogam-vvedeniya', 0, 1, NULL, NULL, NULL),
(45, '2019-04-19 17:44:49', '2019-04-19 17:44:49', 'Тест по уроку "Что такое тег"', NULL, NULL, 'test', 'test-po-uroku-chto-takoe-teg', 0, 1, NULL, NULL, NULL),
(46, '2019-04-19 17:53:08', '2019-04-19 17:53:08', 'Тест по уроку "Атрибуты тега"', NULL, NULL, 'test', 'test-po-uroku-atributy-tega', 0, 1, NULL, NULL, NULL),
(47, '2019-04-19 17:59:02', '2019-04-19 17:59:02', 'Тест по уроку "Структура HTML документа"', NULL, NULL, 'test', 'test-po-uroku-struktura-html-dokumenta', 0, 1, NULL, NULL, NULL),
(48, '2019-04-19 18:01:04', '2019-04-19 18:01:04', 'Тест по уроку "Строчные и блочные элементы"', NULL, NULL, 'test', 'test-po-uroku-strochnye-i-blochnye-ehlementy', 0, 1, NULL, NULL, NULL),
(49, '2019-04-19 18:04:21', '2019-04-19 18:04:21', 'Тест по уроку "Div и span"', NULL, NULL, 'test', 'test-po-uroku-div-i-span', 0, 1, NULL, NULL, NULL),
(50, '2019-04-19 18:08:29', '2019-04-19 18:08:29', 'Тест по уроку "HTML таблицы, введение"', NULL, NULL, 'test', 'test-po-uroku-html-tablicy-vvedenie', 0, 1, NULL, NULL, NULL),
(52, '2019-04-19 19:42:04', '2019-04-19 19:42:04', 'Тест по уроку "Инпуты"', NULL, NULL, 'test', 'test-po-uroku-inputy', 0, 1, NULL, NULL, NULL),
(53, '2019-04-19 19:56:06', '2019-04-19 19:56:06', 'Тест по уроку "Сама форма"', NULL, NULL, 'test', 'test-po-uroku-sama-forma', 0, 1, NULL, NULL, NULL),
(54, '2019-04-19 20:09:14', '2019-04-19 20:09:14', 'Тест к уроку "Лейблы"', NULL, NULL, 'test', 'test-k-uroku-lejbly', 0, 1, NULL, NULL, NULL),
(55, '2019-04-19 20:31:33', '2019-04-19 20:31:33', 'Тест к уроку "Валидация форм"', NULL, NULL, 'test', 'test-k-uroku-validaciya-form', 0, 1, NULL, NULL, NULL),
(56, '2019-04-19 20:38:36', '2019-04-19 20:38:36', 'Тест к уроку "Checkbox и radio кнопки"', NULL, NULL, 'test', 'test-k-uroku-checkbox-i-radio-knopki', 0, 1, NULL, NULL, NULL),
(57, '2019-04-19 21:01:51', '2019-04-19 21:01:51', 'Тест к уроку "Select, textarea"', NULL, NULL, 'test', 'test-k-uroku-select-textarea', 0, 1, NULL, NULL, NULL),
(58, '2019-04-20 16:06:26', '2019-04-20 16:06:26', 'Твой первый stylesheet', NULL, NULL, 'video', 'tvoj-pervyj-stylesheet', 0, 0, NULL, NULL, NULL),
(60, '2019-04-20 16:09:24', '2019-04-20 16:09:24', 'Введение в консоль разработчика для CSS', NULL, NULL, 'video', 'vvedenie-v-konsol-razrabotchika-dlya-css', 0, 0, NULL, NULL, NULL),
(61, '2019-04-20 16:10:10', '2019-04-20 16:10:10', 'Высокоуровневые селекторы', NULL, NULL, 'video', 'vysokourovnevye-selektory', 0, 0, NULL, NULL, NULL),
(62, '2019-04-20 16:10:50', '2019-04-20 16:10:50', 'Практическое упражнение по селекторам', NULL, NULL, 'video', 'prakticheskoe-uprazhnenie-po-selektoram', 0, 0, NULL, NULL, NULL),
(63, '2019-04-20 16:12:20', '2019-04-20 16:12:20', 'Решение упражнения по селекторам', NULL, NULL, 'video', 'reshenie-uprazhneniya-po-selektoram', 0, 0, NULL, NULL, NULL),
(64, '2019-04-20 16:13:07', '2019-04-20 16:13:07', 'Продвинутый CSS', NULL, NULL, 'divider', 'prodvinutyj-css', 0, 0, NULL, NULL, NULL),
(65, '2019-04-20 16:14:36', '2019-04-20 16:14:36', 'Немного о целях уроков. Текст и шрифты в CSS', NULL, NULL, 'video', 'nemnogo-o-celyah-urokov-tekst-i-shrifty-v-css', 0, 0, NULL, NULL, NULL),
(66, '2019-04-20 16:18:41', '2019-04-20 16:18:41', 'ЕЩЕ БОЛЬШЕ о текстах  шрифтах', NULL, NULL, 'video', 'eshche-bolshe-o-tekstah-shriftah', 0, 0, NULL, NULL, NULL),
(67, '2019-04-20 16:19:33', '2019-04-20 16:19:33', 'Концепция боксов, введение', NULL, NULL, 'video', 'koncepciya-boksov-vvedenie', 0, 0, NULL, NULL, NULL),
(68, '2019-04-20 16:20:27', '2019-04-20 16:20:27', 'Делаем крестики и нолики', NULL, NULL, 'video', 'delaem-krestiki-i-noliki', 0, 0, NULL, NULL, NULL),
(69, '2019-04-20 16:21:21', '2019-04-20 16:21:21', 'Крестики и нолики, решение задачи', NULL, NULL, 'video', 'krestiki-i-noliki-reshenie-zadachi', 0, 0, NULL, NULL, NULL),
(70, '2019-04-20 16:22:41', '2019-04-20 16:22:41', 'Практика! CSS блог с нуля', NULL, NULL, 'video', 'praktika-css-blog-s-nulya', 0, 0, NULL, NULL, NULL),
(71, '2019-04-20 16:28:57', '2019-04-20 16:28:57', 'Используем Google Fonts по полной', NULL, NULL, 'video', 'ispolzuem-google-fonts-po-polnoj', 0, 0, NULL, NULL, NULL),
(72, '2019-04-20 16:30:37', '2019-04-20 16:30:37', 'Что такое Bootstrap', NULL, NULL, 'video', 'chto-takoe-bootstrap', 0, 0, NULL, NULL, NULL),
(73, '2019-04-20 16:31:16', '2019-04-20 16:31:16', 'Подключаем Bootstrap в проект', NULL, NULL, 'video', 'podklyuchaem-bootstrap-v-proekt', 0, 0, NULL, NULL, NULL),
(74, '2019-04-20 16:31:46', '2019-04-20 16:31:46', 'Формы и материалы', NULL, NULL, 'video', 'formy-i-materialy', 0, 0, NULL, NULL, NULL),
(75, '2019-04-20 16:32:21', '2019-04-20 16:32:21', 'Навигационные элементы', NULL, NULL, 'video', 'navigacionnye-ehlementy', 0, 0, NULL, NULL, NULL),
(76, '2019-04-20 16:33:06', '2019-04-20 16:33:06', 'Система сетки, часть 1', NULL, NULL, 'video', 'sistema-setki-chast-1', 0, 0, NULL, NULL, NULL),
(77, '2019-04-20 16:33:41', '2019-04-20 16:33:41', 'Система сетки, часть 2', NULL, NULL, 'video', 'sistema-setki-chast-2', 0, 0, NULL, NULL, NULL),
(78, '2019-04-20 16:34:23', '2019-04-20 16:34:23', 'Введение в Font-awesome', NULL, NULL, 'video', 'vvedenie-v-font-awesome', 0, 0, NULL, NULL, NULL),
(79, '2019-04-20 16:35:14', '2019-04-20 16:35:14', 'Bootstrap галерея, часть 1', NULL, NULL, 'video', 'bootstrap-galereya-chast-1', 0, 0, NULL, NULL, NULL),
(80, '2019-04-20 16:35:51', '2019-04-20 16:35:51', 'Bootstrap галерея, часть 2', NULL, NULL, 'video', 'bootstrap-galereya-chast-2', 0, 0, NULL, NULL, NULL),
(81, '2019-04-20 16:36:47', '2019-04-20 16:36:47', 'Делаем Landing page! Часть 1', NULL, NULL, 'video', 'delaem-landing-page-chast-1', 0, 0, NULL, NULL, NULL),
(82, '2019-04-20 16:37:24', '2019-04-20 16:37:24', 'Делаем Landing page! Часть 2', NULL, NULL, 'video', 'delaem-landing-page-chast-2', 0, 0, NULL, NULL, NULL),
(83, '2019-04-20 16:38:14', '2019-04-20 16:38:14', 'Верстаем на Bootstrap под мобильные устройства', NULL, NULL, 'video', 'verstaem-na-bootstrap-pod-mobilnye-ustrojstva', 0, 0, NULL, NULL, NULL),
(84, '2019-04-20 16:39:05', '2019-04-20 16:39:05', 'Bootstrap 4', NULL, NULL, 'divider', 'bootstrap-4', 0, 0, NULL, NULL, NULL),
(85, '2019-04-20 16:39:46', '2019-04-20 16:39:46', 'История Bootstrap 4', NULL, NULL, 'video', 'istoriya-bootstrap-4', 0, 0, NULL, NULL, NULL),
(86, '2019-04-20 16:40:26', '2019-04-20 16:40:26', 'Документация Bootstrap 4', NULL, NULL, 'video', 'dokumentaciya-bootstrap-4', 0, 0, NULL, NULL, NULL),
(87, '2019-04-20 16:40:59', '2019-04-20 16:40:59', 'Разница Bootstrap 3 и Bootstrap 4', NULL, NULL, 'video', 'raznica-bootstrap-3-i-bootstrap-4', 0, 0, NULL, NULL, NULL),
(88, '2019-04-20 16:42:04', '2019-04-20 16:42:04', 'Код', NULL, NULL, 'video', 'kod-bootstrap4', 1, 1, NULL, NULL, NULL),
(89, '2019-04-20 16:42:32', '2019-04-20 16:42:32', 'Начинаем работать с Bootstrap 4', NULL, NULL, 'video', 'nachinaem-rabotat-s-bootstrap-4', 0, 0, NULL, NULL, NULL),
(90, '2019-04-20 16:43:39', '2019-04-20 16:43:39', 'Бэкграунд', NULL, NULL, 'video', 'behkgraund', 0, 0, NULL, NULL, NULL),
(91, '2019-04-20 16:44:16', '2019-04-20 16:44:16', 'Шрифты', NULL, NULL, 'video', 'shrifty', 0, 0, NULL, NULL, NULL),
(92, '2019-04-20 16:44:58', '2019-04-20 16:44:58', 'Фишки для спейсинга', NULL, NULL, 'video', 'fishki-dlya-spejsinga', 0, 0, NULL, NULL, NULL),
(93, '2019-04-20 16:45:37', '2019-04-20 16:45:37', 'Стили для мобильной верстки', NULL, NULL, 'video', 'stili-dlya-mobilnoj-verstki', 0, 0, NULL, NULL, NULL),
(94, '2019-04-20 16:46:19', '2019-04-20 16:46:19', 'Bootstrap 4: Навигация', NULL, NULL, 'video', 'bootstrap-4-navigaciya', 0, 0, NULL, NULL, NULL),
(95, '2019-04-20 16:46:51', '2019-04-20 16:46:51', 'Утилита для отображения', NULL, NULL, 'video', 'utilita-dlya-otobrazheniya', 0, 0, NULL, NULL, NULL),
(96, '2019-04-20 16:54:33', '2019-04-20 16:54:33', 'Bootstrap 4: Флексбоксы и разметка', NULL, NULL, 'divider', 'bootstrap-4-fleksboksy-i-razmetka', 0, 1, NULL, NULL, NULL),
(97, '2019-04-20 16:55:07', '2019-04-20 16:55:07', 'Флексбоксы и разметка часть 1', NULL, NULL, 'video', 'fleksboksy-i-razmetka-chast-1', 0, 0, NULL, NULL, NULL),
(98, '2019-04-20 16:55:49', '2019-04-20 16:55:49', 'Навигация и флексбоксы', NULL, NULL, 'video', 'navigaciya-i-fleksboksy', 0, 0, NULL, NULL, NULL),
(99, '2019-04-20 16:56:21', '2019-04-20 16:56:21', 'Сетка', NULL, NULL, 'video', 'setka', 0, 0, NULL, NULL, NULL),
(100, '2019-04-20 16:57:04', '2019-04-20 16:57:04', 'Проект по шаблонам, часть 1', NULL, NULL, 'video', 'proekt-po-shablonam-chast-1', 0, 0, NULL, NULL, NULL),
(101, '2019-04-20 16:57:35', '2019-04-20 16:57:35', 'Проект по шаблонам, часть 2', NULL, NULL, 'video', 'proekt-po-shablonam-chast-2', 0, 0, NULL, NULL, NULL),
(102, '2019-04-20 16:58:08', '2019-04-20 16:58:08', 'Сетка + флексбоксы', NULL, NULL, 'video', 'setka-fleksboksy', 0, 0, NULL, NULL, NULL),
(103, '2019-04-20 16:59:22', '2019-04-20 16:59:22', 'Делаем большой секретный проект!', NULL, NULL, 'video', 'delaem-bolshoj-sekretnyj-proekt', 0, 0, NULL, NULL, NULL),
(104, '2019-04-20 17:03:15', '2019-04-20 17:03:15', 'Введение в JavaScript', NULL, NULL, 'video', 'vvedenie-v-javascript', 0, 0, NULL, NULL, NULL),
(105, '2019-04-20 17:03:57', '2019-04-20 17:03:57', 'Консоль JavaScript', NULL, NULL, 'video', 'konsol-javascript', 0, 0, NULL, NULL, NULL),
(106, '2019-04-20 17:04:35', '2019-04-20 17:04:35', 'Примитивы', NULL, NULL, 'video', 'primitivy', 0, 0, NULL, NULL, NULL),
(107, '2019-04-20 17:06:00', '2019-04-20 17:06:00', 'Примитивы, решение упражнения', NULL, NULL, 'video', 'primitivy-reshenie-uprazhneniya', 0, 0, NULL, NULL, NULL),
(108, '2019-04-20 17:06:39', '2019-04-20 17:06:39', 'Переменные', NULL, NULL, 'video', 'peremennye', 0, 0, NULL, NULL, NULL),
(109, '2019-04-20 17:07:12', '2019-04-20 17:07:12', 'Null и Undefined', NULL, NULL, 'video', 'null-i-undefined', 0, 0, NULL, NULL, NULL),
(110, '2019-04-20 17:07:50', '2019-04-20 17:07:50', 'Полезные встроенные методы', NULL, NULL, 'video', 'poleznye-vstroennye-metody', 0, 0, NULL, NULL, NULL),
(111, '2019-04-20 17:10:41', '2019-04-20 17:10:41', 'Пишем Javascript в отдельном файле', NULL, NULL, 'video', 'pishem-javascript-v-otdelnom-fajle', 0, 0, NULL, NULL, NULL),
(112, '2019-04-20 17:11:32', '2019-04-20 17:11:32', 'Упражнение по JS', NULL, NULL, 'video', 'uprazhnenie-po-js', 0, 0, NULL, NULL, NULL),
(113, '2019-04-20 17:12:23', '2019-04-20 17:12:23', 'Упражнение: калькулятор возраста', NULL, NULL, 'video', 'uprazhnenie-kalkulyator-vozrasta', 0, 0, NULL, NULL, NULL),
(114, '2019-04-20 17:17:07', '2019-04-20 17:17:07', 'Основы Javascript: Контроль потока', NULL, NULL, 'divider', 'osnovy-javascript-kontrol-potoka', 0, 1, NULL, NULL, NULL),
(115, '2019-04-20 17:17:41', '2019-04-20 17:17:41', 'Логика бинарных переменных', NULL, NULL, 'video', 'logika-binarnyh-peremennyh', 0, 0, NULL, NULL, NULL),
(116, '2019-04-20 17:18:16', '2019-04-20 17:18:16', 'Логические операции', NULL, NULL, 'video', 'logicheskie-operacii', 0, 0, NULL, NULL, NULL),
(117, '2019-04-20 17:19:11', '2019-04-20 17:19:11', 'Условия - упражнение!', NULL, NULL, 'video', 'usloviya-uprazhnenie', 0, 0, NULL, NULL, NULL),
(118, '2019-04-20 17:19:59', '2019-04-20 17:19:59', 'Игра: Угадай!', NULL, NULL, 'video', 'igra-ugadaj', 0, 0, NULL, NULL, NULL),
(119, '2019-04-20 17:20:34', '2019-04-20 17:20:34', 'Введение в циклы', NULL, NULL, 'video', 'vvedenie-v-cikly', 0, 0, NULL, NULL, NULL),
(120, '2019-04-20 17:21:15', '2019-04-20 17:21:15', 'Цикл “While”: упражнение', NULL, NULL, 'video', 'cikl-while-uprazhnenie', 0, 0, NULL, NULL, NULL),
(121, '2019-04-20 17:21:51', '2019-04-20 17:21:51', 'Цикл “While”: проблемы', NULL, NULL, 'video', 'cikl-while-problemy', 0, 0, NULL, NULL, NULL),
(122, '2019-04-20 17:22:29', '2019-04-20 17:22:29', 'Раздражающая математика', NULL, NULL, 'video', 'razdrazhayushchaya-matematika', 0, 0, NULL, NULL, NULL),
(123, '2019-04-20 17:31:54', '2019-04-20 17:31:54', 'Введение в цикл “for”', NULL, NULL, 'video', 'vvedenie-v-cikl-for', 0, 0, NULL, NULL, NULL),
(124, '2019-04-20 17:32:52', '2019-04-20 17:32:52', 'Цикл “for”: быстрое упражнение', NULL, NULL, 'video', 'cikl-for-bystroe-uprazhnenie', 0, 0, NULL, NULL, NULL),
(125, '2019-04-20 17:38:19', '2019-04-20 17:38:19', 'JavaScript основы: Функции', NULL, NULL, 'divider', 'javascript-osnovy-funkcii', 0, 1, NULL, NULL, NULL),
(126, '2019-04-20 17:39:21', '2019-04-20 17:39:21', 'Введение в функции', NULL, NULL, 'video', 'vvedenie-v-funkcii', 0, 0, NULL, NULL, NULL),
(127, '2019-04-20 17:39:57', '2019-04-20 17:39:57', 'Аргументы', NULL, NULL, 'video', 'argumenty', 0, 0, NULL, NULL, NULL),
(128, '2019-04-20 17:40:36', '2019-04-20 17:40:36', 'Декларирование функции против функции-выражения', NULL, NULL, 'video', 'deklarirovanie-funkcii-protiv-funkcii-vyrazheniya', 0, 0, NULL, NULL, NULL),
(129, '2019-04-20 17:41:14', '2019-04-20 17:41:14', 'Ключевое слово “return”', NULL, NULL, 'video', 'klyuchevoe-slovo-return', 0, 0, NULL, NULL, NULL),
(130, '2019-04-20 17:41:49', '2019-04-20 17:41:49', 'Функции: проблемы', NULL, NULL, 'video', 'funkcii-problemy', 0, 0, NULL, NULL, NULL),
(131, '2019-04-20 17:42:32', '2019-04-20 17:42:32', 'Scope функций: проблема', NULL, NULL, 'video', 'scope-funkcij-problema', 0, 0, NULL, NULL, NULL),
(132, '2019-04-20 17:43:10', '2019-04-20 17:43:10', 'Функции высшего порядка', NULL, NULL, 'video', 'funkcii-vysshego-poryadka', 0, 0, NULL, NULL, NULL),
(133, '2019-04-20 17:48:31', '2019-04-20 17:48:40', 'Основы Javascript: Массивы', NULL, NULL, 'divider', 'osnovy-javascript-massivy', 0, 0, NULL, NULL, NULL),
(134, '2019-04-20 17:49:24', '2019-04-20 17:49:24', 'Введение в массивы', NULL, NULL, 'video', 'vvedenie-v-massivy', 0, 0, NULL, NULL, NULL),
(135, '2019-04-20 17:50:01', '2019-04-20 17:50:01', 'Методы массивов', NULL, NULL, 'video', 'metody-massivov', 0, 0, NULL, NULL, NULL),
(136, '2019-04-20 17:50:45', '2019-04-20 17:50:45', 'Итерация массива', NULL, NULL, 'video', 'iteraciya-massiva', 0, 0, NULL, NULL, NULL),
(137, '2019-04-20 17:51:27', '2019-04-20 17:51:27', 'Челлендж: быстрая итерация массива', NULL, NULL, 'video', 'chellendzh-bystraya-iteraciya-massiva', 0, 0, NULL, NULL, NULL),
(138, '2019-04-20 17:52:04', '2019-04-20 17:52:04', 'Массивы: проблемы', NULL, NULL, 'video', 'massivy-problemy', 0, 0, NULL, NULL, NULL),
(139, '2019-04-20 17:52:35', '2019-04-20 17:52:35', 'Массивы: решение проблем', NULL, NULL, 'video', 'massivy-reshenie-problem', 0, 0, NULL, NULL, NULL),
(140, '2019-04-20 17:53:54', '2019-04-20 17:54:02', 'Основы Javascript: объекты', NULL, NULL, 'divider', 'osnovy-javascript-obekty', 0, 0, NULL, NULL, NULL),
(141, '2019-04-21 07:47:39', '2019-04-21 07:47:39', 'Введение в объекты', NULL, NULL, 'video', 'vvedenie-v-obekty', 0, 0, NULL, NULL, NULL),
(142, '2019-04-21 07:48:47', '2019-04-21 07:48:47', 'Сравнение объектов и массивов', NULL, NULL, 'video', 'sravnenie-obektov-i-massivov', 0, 0, NULL, NULL, NULL),
(143, '2019-04-21 07:49:29', '2019-04-21 07:49:29', 'Вложенные объекты и массивы', NULL, NULL, 'video', 'vlozhennye-obekty-i-massivy', 0, 0, NULL, NULL, NULL),
(144, '2019-04-21 07:50:17', '2019-04-21 07:50:17', 'Упражнение: сделай базу данных к фильмам', NULL, NULL, 'video', 'uprazhnenie-sdelaj-bazu-dannyh-k-filmam', 0, 0, NULL, NULL, NULL),
(145, '2019-04-21 07:51:01', '2019-04-21 07:51:01', 'Добавление своих методов к объектам', NULL, NULL, 'video', 'dobavlenie-svoih-metodov-k-obektam', 0, 0, NULL, NULL, NULL),
(146, '2019-04-21 07:52:15', '2019-04-21 07:52:15', 'Ключевое слово “this”', NULL, NULL, 'video', 'klyuchevoe-slovo-this', 0, 0, NULL, NULL, NULL),
(147, '2019-04-21 07:54:31', '2019-04-21 07:54:31', 'Управление DOM элементами', NULL, NULL, 'divider', 'upravlenie-dom-ehlementami', 0, 1, NULL, NULL, NULL),
(148, '2019-04-21 07:55:03', '2019-04-21 07:55:03', 'Введение в DOM', NULL, NULL, 'video', 'vvedenie-v-dom', 0, 0, NULL, NULL, NULL),
(149, '2019-04-21 07:55:49', '2019-04-21 07:55:49', 'Определяем DOM', NULL, NULL, 'video', 'opredelyaem-dom', 0, 0, NULL, NULL, NULL),
(150, '2019-04-21 07:56:25', '2019-04-21 07:56:25', 'Селекторы и манипуляции', NULL, NULL, 'video', 'selektory-i-manipulyacii', 0, 0, NULL, NULL, NULL),
(151, '2019-04-21 07:57:02', '2019-04-21 07:57:02', 'Главные способы выборок', NULL, NULL, 'video', 'glavnye-sposoby-vyborok', 0, 0, NULL, NULL, NULL),
(152, '2019-04-21 07:57:40', '2019-04-21 07:57:40', 'Упражнение: выборки', NULL, NULL, 'video', 'uprazhnenie-vyborki', 0, 0, NULL, NULL, NULL),
(153, '2019-04-21 07:58:15', '2019-04-21 07:58:15', 'Управление стилями', NULL, NULL, 'video', 'upravlenie-stilyami', 0, 0, NULL, NULL, NULL),
(154, '2019-04-21 07:58:52', '2019-04-21 07:58:52', 'Управление текстом и контентом', NULL, NULL, 'video', 'upravlenie-tekstom-i-kontentom', 0, 0, NULL, NULL, NULL),
(155, '2019-04-21 07:59:27', '2019-04-21 07:59:27', 'Управление атрибутами', NULL, NULL, 'video', 'upravlenie-atributami', 0, 0, NULL, NULL, NULL),
(156, '2019-04-21 08:00:02', '2019-04-21 08:00:02', 'Играемся с кодом Google', NULL, NULL, 'video', 'igraemsya-s-kodom-google', 0, 0, NULL, NULL, NULL),
(157, '2019-04-21 08:03:23', '2019-04-21 08:03:23', 'Продвинутое управление DOM элементами', NULL, NULL, 'divider', 'prodvinutoe-upravlenie-dom-ehlementami', 0, 1, NULL, NULL, NULL),
(158, '2019-04-21 08:04:02', '2019-04-21 08:04:02', 'Введение в события', NULL, NULL, 'video', 'vvedenie-v-sobytiya', 0, 0, NULL, NULL, NULL),
(159, '2019-04-21 08:04:39', '2019-04-21 08:04:39', 'Упражнение: переключалка цветов', NULL, NULL, 'video', 'uprazhnenie-pereklyuchalka-cvetov', 0, 0, NULL, NULL, NULL),
(160, '2019-04-21 08:05:35', '2019-04-21 08:05:35', 'Делаешь: Таблица рекордов, часть 1', NULL, NULL, 'video', 'delaesh-tablica-rekordov-chast-1', 0, 0, NULL, NULL, NULL),
(161, '2019-04-21 08:06:08', '2019-04-21 08:06:08', 'Делаешь: Таблица рекордов, часть 2', NULL, NULL, 'video', 'delaesh-tablica-rekordov-chast-2', 0, 0, NULL, NULL, NULL),
(162, '2019-04-21 08:06:46', '2019-04-21 08:06:46', 'Иные типы событий: Список дел', NULL, NULL, 'video', 'inye-tipy-sobytij-spisok-del', 0, 0, NULL, NULL, NULL),
(163, '2019-04-21 08:12:14', '2019-04-21 08:12:14', 'Введение в jQuery', NULL, NULL, 'divider', 'vvedenie-v-jquery', 0, 1, NULL, NULL, NULL),
(164, '2019-04-21 08:16:17', '2019-04-21 08:16:17', 'Что такое jQuery?', NULL, NULL, 'video', 'chto-takoe-jquery', 0, 0, NULL, NULL, NULL),
(165, '2019-04-21 08:16:52', '2019-04-21 08:16:52', 'Почему jQuery?', NULL, NULL, 'video', 'pochemu-jquery', 0, 0, NULL, NULL, NULL),
(166, '2019-04-21 08:17:30', '2019-04-21 08:17:30', 'Подключаем jQuery', NULL, NULL, 'video', 'podklyuchaem-jquery', 0, 0, NULL, NULL, NULL),
(167, '2019-04-21 08:18:04', '2019-04-21 08:18:04', 'Селекторы в jQuery', NULL, NULL, 'video', 'selektory-v-jquery', 0, 0, NULL, NULL, NULL),
(168, '2019-04-21 08:18:36', '2019-04-21 08:18:36', 'Упражнение по селекторам', NULL, NULL, 'video', 'uprazhnenie-po-selektoram', 0, 0, NULL, NULL, NULL),
(169, '2019-04-21 08:19:10', '2019-04-21 08:19:10', 'Текст и HTML', NULL, NULL, 'video', 'tekst-i-html', 0, 0, NULL, NULL, NULL),
(170, '2019-04-21 08:19:46', '2019-04-21 08:19:46', 'Attr и Val', NULL, NULL, 'video', 'attr-i-val', 0, 0, NULL, NULL, NULL),
(171, '2019-04-21 08:20:20', '2019-04-21 08:20:20', 'Управление классами', NULL, NULL, 'video', 'upravlenie-klassami', 0, 0, NULL, NULL, NULL),
(172, '2019-04-21 08:34:40', '2019-04-21 08:34:40', 'Очень много интересных курсов  заданий по Node JS!', NULL, NULL, 'video', 'ochen-mnogo-interesnyh-kursov-zadanij-po-node-js', 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `lessons_`
--

CREATE TABLE IF NOT EXISTS `lessons_` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `slug` tinytext COLLATE utf8mb4_unicode_ci,
  `unlocked` tinyint(4) NOT NULL DEFAULT '0',
  `completed` tinyint(4) NOT NULL DEFAULT '1',
  `test_id` int(11) DEFAULT NULL,
  `youtube_video_id` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'video',
  `practice_id` int(11) DEFAULT NULL,
  `short_description` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `lessons_`
--

INSERT INTO `lessons_` (`id`, `created_at`, `updated_at`, `name`, `description`, `slug`, `unlocked`, `completed`, `test_id`, `youtube_video_id`, `lesson_type`, `practice_id`, `short_description`) VALUES
(5, '2019-04-17 15:08:09', '2019-04-17 15:08:57', 'Новый Курс', NULL, 'html_s_nula', 1, 1, NULL, NULL, 'video', NULL, NULL),
(6, '2019-04-17 15:09:55', '2019-04-17 15:09:55', 'Новый Урок', NULL, '', 0, 0, NULL, NULL, 'video', NULL, NULL),
(7, '2019-04-17 15:09:59', '2019-04-17 15:09:59', 'Новый Урок', NULL, '', 0, 0, NULL, NULL, 'video', NULL, NULL),
(8, '2019-04-17 15:10:01', '2019-04-17 16:16:45', 'Приветсивеи', '<p>ывпывп</p>', 'privetstvie', 1, 1, NULL, NULL, 'video', NULL, NULL),
(10, '2019-04-17 16:12:48', '2019-04-17 16:12:48', 'Новый Разделитель', NULL, '', 0, 0, NULL, NULL, 'video', NULL, NULL),
(11, '2019-04-17 18:52:28', '2019-04-17 18:52:50', 'Новый Программа', NULL, 'testprogram', 0, 0, NULL, NULL, 'video', NULL, NULL),
(12, '2019-04-17 18:52:00', '2019-04-18 19:50:27', 'Еще видеозанятие', '<p>ывпып</p>', 'test course', 1, 1, NULL, NULL, 'video', NULL, NULL),
(13, '2019-04-17 18:53:33', '2019-04-17 18:54:03', 'Новый Урок', '<p>бубубу</p>', 'bubub', 1, 1, NULL, NULL, 'video', NULL, NULL),
(15, '2019-04-17 21:17:00', '2019-04-17 21:17:00', 'Новый урок divider', '', '', 0, 1, NULL, NULL, 'divider', NULL, NULL),
(18, '2019-04-17 21:17:06', '2019-04-18 19:48:40', 'Новый урок practices', NULL, 'prakt', 0, 1, NULL, NULL, 'practices', NULL, NULL),
(19, '2019-04-17 21:17:07', '2019-04-19 06:59:31', 'Новый урок homework', NULL, 'тестовый-урок', 1, 1, NULL, NULL, 'homework', NULL, NULL),
(22, '2019-04-17 22:12:52', '2019-04-18 03:45:46', 'Урок по CSS со слагом', NULL, 'test-slug-css-urok', 1, 1, NULL, NULL, 'video', NULL, 'тестовый урок css'),
(23, '2019-04-18 02:09:00', '2019-04-18 02:12:17', 'Разделяю по центру', NULL, 'razdel', 0, 1, NULL, NULL, 'divider', NULL, NULL),
(24, '2019-04-18 02:10:00', '2019-04-18 02:49:43', 'Видеоурок', '<h1>Привет</h1>\r\n<p>Я <em><strong>мирный</strong></em></p>', 'videourok', 1, 1, NULL, '6dkqVj7heiA', 'video', NULL, 'Очень коротенькое описание к активному уроку типа'),
(25, '2019-04-18 02:10:00', '2019-04-18 02:13:30', 'Тестирование №1', NULL, 'testim', 1, 1, NULL, NULL, 'test', NULL, NULL),
(26, '2019-04-18 02:10:00', '2019-04-18 02:13:15', 'Практика', NULL, 'praktika', 1, 1, NULL, NULL, 'practices', NULL, NULL),
(27, '2019-04-18 03:40:29', '2019-04-18 03:40:29', 'Новый урок divider', '', '', 0, 1, NULL, NULL, 'divider', NULL, NULL),
(28, '2019-04-18 03:40:36', '2019-04-18 03:40:36', 'Новый урок video', '', '', 0, 1, NULL, NULL, 'video', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-04-08 13:44:21', '2019-04-08 13:44:21');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-04-08 13:44:21', '2019-04-10 17:58:41', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2019-04-08 13:44:21', '2019-04-12 19:30:00', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2019-04-08 13:44:21', '2019-04-17 19:16:06', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 5, '2019-04-08 13:44:21', '2019-04-12 19:30:00', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 7, '2019-04-08 13:44:21', '2019-04-12 19:30:00', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-04-08 13:44:21', '2019-04-08 13:49:02', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-04-08 13:44:21', '2019-04-08 13:49:02', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-04-08 13:44:21', '2019-04-08 13:49:02', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-08 13:44:21', '2019-04-08 13:49:02', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 8, '2019-04-08 13:44:21', '2019-04-12 19:30:00', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-04-08 13:44:21', '2019-04-08 13:49:02', 'voyager.hooks', NULL),
(13, 1, 'Промокоды', '', '_self', 'voyager-hotdog', '#20b3cc', 15, 1, '2019-04-10 17:56:21', '2019-04-10 18:02:44', 'voyager.promos.index', 'null'),
(15, 1, 'Деньги', '', '_self', 'voyager-wineglass', '#24a62b', NULL, 3, '2019-04-10 17:59:01', '2019-04-17 19:16:06', NULL, ''),
(16, 1, 'Promos', '', '_self', NULL, NULL, NULL, 9, '2019-04-10 18:02:27', '2019-04-12 19:30:00', 'voyager.promos.index', NULL),
(17, 1, 'Транзакции', '', '_self', 'voyager-dollar', '#75db4f', 15, 2, '2019-04-10 18:07:47', '2019-04-10 18:12:13', 'voyager.transactions.index', 'null'),
(19, 1, 'Обучение', '', '_self', 'voyager-study', '#84bcfb', NULL, 2, '2019-04-12 19:29:52', '2019-04-12 19:30:57', NULL, ''),
(22, 1, 'Программы', '', '_self', NULL, '#000000', 19, 1, '2019-04-17 18:59:11', '2019-04-17 19:20:00', 'voyager.programs.index', 'null'),
(23, 1, 'Курсы', '', '_self', NULL, '#000000', 19, 2, '2019-04-17 19:01:41', '2019-04-17 19:20:07', 'voyager.courses.index', 'null'),
(26, 1, 'Уроки', '', '_self', NULL, '#000000', 19, 3, '2019-04-19 14:17:38', '2019-04-19 14:18:00', 'voyager.lessons.index', NULL),
(27, 1, 'Messages', '', '_self', NULL, NULL, NULL, 10, '2019-04-21 17:43:38', '2019-04-21 17:43:38', 'voyager.messages.index', NULL),
(28, 1, 'User Lessons Progresses', '', '_self', NULL, NULL, NULL, 11, '2019-04-21 17:46:01', '2019-04-21 17:46:01', 'voyager.user-lessons-progress.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `destination_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `important` tinyint(4) DEFAULT NULL,
  `right` tinyint(4) DEFAULT NULL,
  `message_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `target_id`, `destination_type`, `parent_id`, `text`, `created_at`, `updated_at`, `user_id`, `important`, `right`, `message_type`) VALUES
(1, 11, 'unit', 0, 'Ну что, получилось повертеть вконтакт?', '2019-04-20 22:12:28', '2019-04-20 22:12:28', 1, NULL, NULL, 'comment'),
(2, 11, 'unit', 0, 'Вертел я Вконтакте!', '2019-04-21 12:45:34', '2019-04-21 12:45:34', 3, NULL, NULL, 'comment');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `migrations`
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
(23, '2019_04_08_161536_create_units_table', 1),
(24, '2019_04_08_161558_create_unit_relations_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=92 ;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(2, 'browse_bread', NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(3, 'browse_database', NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(4, 'browse_media', NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(5, 'browse_compass', NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(6, 'browse_menus', 'menus', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(7, 'read_menus', 'menus', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(8, 'edit_menus', 'menus', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(9, 'add_menus', 'menus', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(10, 'delete_menus', 'menus', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(11, 'browse_roles', 'roles', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(12, 'read_roles', 'roles', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(13, 'edit_roles', 'roles', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(14, 'add_roles', 'roles', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(15, 'delete_roles', 'roles', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(16, 'browse_users', 'users', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(17, 'read_users', 'users', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(18, 'edit_users', 'users', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(19, 'add_users', 'users', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(20, 'delete_users', 'users', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(21, 'browse_settings', 'settings', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(22, 'read_settings', 'settings', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(23, 'edit_settings', 'settings', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(24, 'add_settings', 'settings', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(25, 'delete_settings', 'settings', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(26, 'browse_hooks', NULL, '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(27, 'browse_units', 'units', '2019-04-08 13:46:36', '2019-04-08 13:46:36'),
(28, 'read_units', 'units', '2019-04-08 13:46:36', '2019-04-08 13:46:36'),
(29, 'edit_units', 'units', '2019-04-08 13:46:36', '2019-04-08 13:46:36'),
(30, 'add_units', 'units', '2019-04-08 13:46:36', '2019-04-08 13:46:36'),
(31, 'delete_units', 'units', '2019-04-08 13:46:36', '2019-04-08 13:46:36'),
(32, 'browse_promo', 'promo', '2019-04-10 17:56:21', '2019-04-10 17:56:21'),
(33, 'read_promo', 'promo', '2019-04-10 17:56:21', '2019-04-10 17:56:21'),
(34, 'edit_promo', 'promo', '2019-04-10 17:56:21', '2019-04-10 17:56:21'),
(35, 'add_promo', 'promo', '2019-04-10 17:56:21', '2019-04-10 17:56:21'),
(36, 'delete_promo', 'promo', '2019-04-10 17:56:21', '2019-04-10 17:56:21'),
(37, 'browse_promos', 'promos', '2019-04-10 18:02:27', '2019-04-10 18:02:27'),
(38, 'read_promos', 'promos', '2019-04-10 18:02:27', '2019-04-10 18:02:27'),
(39, 'edit_promos', 'promos', '2019-04-10 18:02:27', '2019-04-10 18:02:27'),
(40, 'add_promos', 'promos', '2019-04-10 18:02:27', '2019-04-10 18:02:27'),
(41, 'delete_promos', 'promos', '2019-04-10 18:02:27', '2019-04-10 18:02:27'),
(42, 'browse_transactions', 'transactions', '2019-04-10 18:07:47', '2019-04-10 18:07:47'),
(43, 'read_transactions', 'transactions', '2019-04-10 18:07:47', '2019-04-10 18:07:47'),
(44, 'edit_transactions', 'transactions', '2019-04-10 18:07:47', '2019-04-10 18:07:47'),
(45, 'add_transactions', 'transactions', '2019-04-10 18:07:47', '2019-04-10 18:07:47'),
(46, 'delete_transactions', 'transactions', '2019-04-10 18:07:47', '2019-04-10 18:07:47'),
(52, 'browse_test_questions', 'test_questions', '2019-04-12 22:11:48', '2019-04-12 22:11:48'),
(53, 'read_test_questions', 'test_questions', '2019-04-12 22:11:48', '2019-04-12 22:11:48'),
(54, 'edit_test_questions', 'test_questions', '2019-04-12 22:11:48', '2019-04-12 22:11:48'),
(55, 'add_test_questions', 'test_questions', '2019-04-12 22:11:48', '2019-04-12 22:11:48'),
(56, 'delete_test_questions', 'test_questions', '2019-04-12 22:11:48', '2019-04-12 22:11:48'),
(57, 'browse_test_answers', 'test_answers', '2019-04-12 22:12:14', '2019-04-12 22:12:14'),
(58, 'read_test_answers', 'test_answers', '2019-04-12 22:12:14', '2019-04-12 22:12:14'),
(59, 'edit_test_answers', 'test_answers', '2019-04-12 22:12:14', '2019-04-12 22:12:14'),
(60, 'add_test_answers', 'test_answers', '2019-04-12 22:12:14', '2019-04-12 22:12:14'),
(61, 'delete_test_answers', 'test_answers', '2019-04-12 22:12:14', '2019-04-12 22:12:14'),
(62, 'browse_programs', 'programs', '2019-04-17 18:59:11', '2019-04-17 18:59:11'),
(63, 'read_programs', 'programs', '2019-04-17 18:59:11', '2019-04-17 18:59:11'),
(64, 'edit_programs', 'programs', '2019-04-17 18:59:11', '2019-04-17 18:59:11'),
(65, 'add_programs', 'programs', '2019-04-17 18:59:11', '2019-04-17 18:59:11'),
(66, 'delete_programs', 'programs', '2019-04-17 18:59:11', '2019-04-17 18:59:11'),
(67, 'browse_courses', 'courses', '2019-04-17 19:01:41', '2019-04-17 19:01:41'),
(68, 'read_courses', 'courses', '2019-04-17 19:01:41', '2019-04-17 19:01:41'),
(69, 'edit_courses', 'courses', '2019-04-17 19:01:41', '2019-04-17 19:01:41'),
(70, 'add_courses', 'courses', '2019-04-17 19:01:41', '2019-04-17 19:01:41'),
(71, 'delete_courses', 'courses', '2019-04-17 19:01:41', '2019-04-17 19:01:41'),
(77, 'browse_lessons', 'lessons', '2019-04-17 19:19:06', '2019-04-17 19:19:06'),
(78, 'read_lessons', 'lessons', '2019-04-17 19:19:06', '2019-04-17 19:19:06'),
(79, 'edit_lessons', 'lessons', '2019-04-17 19:19:06', '2019-04-17 19:19:06'),
(80, 'add_lessons', 'lessons', '2019-04-17 19:19:06', '2019-04-17 19:19:06'),
(81, 'delete_lessons', 'lessons', '2019-04-17 19:19:06', '2019-04-17 19:19:06'),
(82, 'browse_messages', 'messages', '2019-04-21 17:43:38', '2019-04-21 17:43:38'),
(83, 'read_messages', 'messages', '2019-04-21 17:43:38', '2019-04-21 17:43:38'),
(84, 'edit_messages', 'messages', '2019-04-21 17:43:38', '2019-04-21 17:43:38'),
(85, 'add_messages', 'messages', '2019-04-21 17:43:38', '2019-04-21 17:43:38'),
(86, 'delete_messages', 'messages', '2019-04-21 17:43:38', '2019-04-21 17:43:38'),
(87, 'browse_user_lessons_progress', 'user_lessons_progress', '2019-04-21 17:46:01', '2019-04-21 17:46:01'),
(88, 'read_user_lessons_progress', 'user_lessons_progress', '2019-04-21 17:46:01', '2019-04-21 17:46:01'),
(89, 'edit_user_lessons_progress', 'user_lessons_progress', '2019-04-21 17:46:01', '2019-04-21 17:46:01'),
(90, 'add_user_lessons_progress', 'user_lessons_progress', '2019-04-21 17:46:01', '2019-04-21 17:46:01'),
(91, 'delete_user_lessons_progress', 'user_lessons_progress', '2019-04-21 17:46:01', '2019-04-21 17:46:01');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
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
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `programs`
--

CREATE TABLE IF NOT EXISTS `programs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb` text COLLATE utf8mb4_unicode_ci,
  `cost` smallint(6) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `programs`
--

INSERT INTO `programs` (`id`, `name`, `description`, `created_at`, `updated_at`, `thumb`, `cost`, `slug`) VALUES
(1, 'JS разработчик', 'В программе ты поймешь, какую роль имеет Javascript в современном веб. Научишься верстать сайты, познав HTML и CSS. Окунешься в мир серверного программирования и поймешь, как создавать собственные сервисы и платформы, используя только Javascript', '2019-04-17 19:43:00', '2019-04-20 21:51:29', '1/qGJTxY6Tt7.jpg', 20000, 'js-razrabotchik');

-- --------------------------------------------------------

--
-- Структура таблицы `program_course`
--

CREATE TABLE IF NOT EXISTS `program_course` (
  `program_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `order` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `program_course`
--

INSERT INTO `program_course` (`program_id`, `course_id`, `order`) VALUES
(1, 11, 0),
(1, 8, 1),
(1, 12, 2),
(1, 13, 3),
(1, 14, 4),
(1, 15, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `promos`
--

CREATE TABLE IF NOT EXISTS `promos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `actual_to` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `promos`
--

INSERT INTO `promos` (`id`, `name`, `created_at`, `updated_at`, `value`, `actual_to`) VALUES
(2, 'Начальный промокод. +20000', '2019-04-10 18:03:00', '2019-04-11 13:45:06', 20000, '2019-04-21 16:44:00');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-04-08 13:44:21', '2019-04-08 13:44:21'),
(2, 'user', 'Normal User', '2019-04-08 13:44:21', '2019-04-08 13:44:21');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `test_answers`
--

CREATE TABLE IF NOT EXISTS `test_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_right` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=97 ;

--
-- Дамп данных таблицы `test_answers`
--

INSERT INTO `test_answers` (`id`, `type`, `name`, `question_id`, `order`, `created_at`, `updated_at`, `is_right`) VALUES
(1, 0, 'Новый ответsfhsdfh', 1, 1, '2019-04-19 07:33:07', '2019-04-19 07:36:47', 1),
(2, 0, 'Новый ответfgjfgj', 1, 0, '2019-04-19 07:33:13', '2019-04-19 07:36:47', NULL),
(3, 0, 'Новый ответ на вопрос 2', 2, 0, '2019-04-19 07:34:13', '2019-04-19 07:34:23', 1),
(4, 0, 'f8', 3, 0, '2019-04-19 17:31:02', '2019-04-19 17:32:27', NULL),
(5, 0, 'f12', 3, 1, '2019-04-19 17:31:11', '2019-04-19 17:33:45', 1),
(6, 0, 'f5', 3, 2, '2019-04-19 17:31:43', '2019-04-19 17:32:27', NULL),
(7, 0, 'за разметку на сайте', 6, 0, '2019-04-19 17:33:26', '2019-04-19 17:36:49', 1),
(8, 0, 'за серверную часть', 6, 1, '2019-04-19 17:33:28', '2019-04-19 17:36:57', NULL),
(10, 0, 'отвечает за визуальную часть сайта', 7, 1, '2019-04-19 17:33:35', '2019-04-19 17:40:25', 1),
(11, 0, 'реагирует на события', 7, 0, '2019-04-19 17:33:36', '2019-04-19 17:40:52', NULL),
(12, 0, 'программирует действия пользователя', 8, 1, '2019-04-19 17:38:50', '2019-04-19 17:40:04', 1),
(13, 0, 'меняет тему на сайте', 8, 0, '2019-04-19 17:38:52', '2019-04-19 17:39:59', NULL),
(14, 0, 'h1', 9, 2, '2019-04-19 17:46:00', '2019-04-19 17:47:40', 1),
(15, 0, 'ul', 9, 0, '2019-04-19 17:46:02', '2019-04-19 17:47:33', NULL),
(16, 0, 'p', 9, 1, '2019-04-19 17:46:03', '2019-04-19 17:47:23', NULL),
(17, 0, 'чтобы текст был жирным', 10, 0, '2019-04-19 17:48:08', '2019-04-19 17:48:35', NULL),
(18, 0, 'для обозначения параграфа', 10, 1, '2019-04-19 17:48:09', '2019-04-21 18:04:11', 1),
(19, 0, 'чтобы вставлять ссылку', 10, 2, '2019-04-19 17:48:10', '2019-04-19 17:48:48', NULL),
(20, 0, 'ul', 11, 0, '2019-04-19 17:49:58', '2019-04-19 17:50:12', 1),
(21, 0, 'ol', 11, 1, '2019-04-19 17:50:00', '2019-04-19 17:50:25', NULL),
(22, 0, 'b', 11, 2, '2019-04-19 17:50:01', '2019-04-19 17:50:25', NULL),
(23, 0, 'ol', 12, 0, '2019-04-19 17:51:21', '2019-04-19 17:51:42', NULL),
(24, 0, 'li', 12, 1, '2019-04-19 17:51:22', '2019-04-19 17:51:38', 1),
(25, 0, 'i', 12, 2, '2019-04-19 17:51:22', '2019-04-19 17:51:49', NULL),
(26, 0, 'a', 13, 1, '2019-04-19 17:53:27', '2019-04-19 17:54:23', 1),
(27, 0, 'p', 13, 0, '2019-04-19 17:53:28', '2019-04-19 17:54:31', NULL),
(28, 0, 'img', 13, 2, '2019-04-19 17:53:29', '2019-04-19 17:54:23', NULL),
(31, 0, 'нет', 14, 0, '2019-04-19 17:55:13', '2019-04-19 17:55:29', NULL),
(32, 0, 'да', 14, 1, '2019-04-19 17:55:39', '2019-04-19 17:55:48', 1),
(33, 0, 'да', 15, 0, '2019-04-19 17:56:14', '2019-04-19 17:56:28', 1),
(34, 0, 'нет', 15, 1, '2019-04-19 17:56:15', '2019-04-19 17:56:35', NULL),
(35, 0, 'b', 16, 0, '2019-04-19 17:57:12', '2019-04-19 17:57:30', NULL),
(36, 0, 'src', 16, 1, '2019-04-19 17:57:13', '2019-04-19 17:57:27', 1),
(37, 0, 'target', 16, 2, '2019-04-19 17:57:14', '2019-04-19 17:57:38', NULL),
(38, 0, 'del', 17, 0, '2019-04-19 17:59:28', '2019-04-19 18:00:02', NULL),
(39, 0, 'написать “html”+tab', 17, 2, '2019-04-19 17:59:28', '2019-04-19 17:59:48', 1),
(40, 0, 'ctrl+c', 17, 1, '2019-04-19 17:59:29', '2019-04-19 17:59:57', NULL),
(41, 0, 'h1', 18, 0, '2019-04-19 18:01:27', '2019-04-19 18:01:48', NULL),
(42, 0, 'i', 18, 1, '2019-04-19 18:01:28', '2019-04-19 18:01:42', 1),
(43, 0, 'ol', 18, 2, '2019-04-19 18:01:28', '2019-04-19 18:01:54', NULL),
(44, 0, 'i', 19, 0, '2019-04-19 18:02:20', '2019-04-19 18:02:31', NULL),
(45, 0, 'a', 19, 1, '2019-04-19 18:02:21', '2019-04-19 18:02:44', NULL),
(46, 0, 'p', 19, 2, '2019-04-19 18:02:21', '2019-04-19 18:02:44', 1),
(47, 0, 'строчный тег, который группирует несколько элементов, или придает контенту внутри него стиль', 20, 0, '2019-04-19 18:04:41', '2019-04-19 18:05:14', NULL),
(48, 0, 'блочный тег, который группирует несколько элементов, или придает контенту внутри него стиль', 20, 1, '2019-04-19 18:04:42', '2019-04-19 18:05:00', 1),
(49, 0, 'ссылочный тег', 20, 2, '2019-04-19 18:04:42', '2019-04-19 18:05:23', NULL),
(50, 0, 'блочный элемент, который нужен, чтобы выделить определенный кусок текста', 21, 0, '2019-04-19 18:05:41', '2019-04-19 18:06:10', NULL),
(51, 0, 'тег заголовка', 21, 1, '2019-04-19 18:05:42', '2019-04-19 18:06:17', NULL),
(52, 0, 'строчный элемент, который нужен, чтобы выделить определенный кусок текста', 21, 2, '2019-04-19 18:05:42', '2019-04-19 18:05:57', 1),
(53, 0, 'table=>tr=>td', 22, 0, '2019-04-19 18:08:50', '2019-04-19 18:09:01', 1),
(54, 0, 'table=>tr=>p', 22, 1, '2019-04-19 18:08:51', '2019-04-19 18:09:16', NULL),
(55, 0, 'table=>p=>h1', 22, 2, '2019-04-19 18:08:51', '2019-04-19 18:09:16', NULL),
(56, 0, 'для невидящих людей и поисковиков', 23, 1, '2019-04-19 18:09:41', '2019-04-19 18:09:57', 1),
(57, 0, 'для соц сетей', 23, 0, '2019-04-19 18:09:42', '2019-04-19 18:10:04', NULL),
(58, 0, 'для переноса на новую строку параграфа', 23, 2, '2019-04-19 18:09:43', '2019-04-19 18:10:13', NULL),
(59, 0, 'Ввод логина и пароля Вконтакте', 24, 0, '2019-04-19 19:36:50', '2019-04-19 19:37:05', 1),
(60, 0, 'Аватарка Вконтакте', 24, 1, '2019-04-19 19:36:50', '2019-04-19 19:37:21', NULL),
(61, 0, 'для создания таблицы', 25, 0, '2019-04-19 19:42:35', '2019-04-19 19:42:59', NULL),
(62, 0, 'для создания цвета текста', 25, 1, '2019-04-19 19:42:35', '2019-04-19 19:43:06', NULL),
(63, 0, 'для создания текстовых полей, различных кнопок, переключателей и флажков', 25, 2, '2019-04-19 19:42:36', '2019-04-19 19:42:51', 1),
(64, 0, 'самозакрывающийся тег', 26, 0, '2019-04-19 19:43:29', '2019-04-19 19:43:35', 1),
(65, 0, 'несамозакрывающийся тег', 26, 1, '2019-04-19 19:43:29', '2019-04-19 19:43:45', NULL),
(66, 0, 'это самозакрывающийся тег', 27, 0, '2019-04-19 19:44:13', '2019-04-19 19:44:30', NULL),
(67, 0, 'основной атрибут тега input', 27, 1, '2019-04-19 19:44:14', '2019-04-19 19:44:21', 1),
(68, 0, 'основной атрибут тега table', 27, 2, '2019-04-19 19:44:15', '2019-04-19 19:44:37', NULL),
(69, 0, 'чтобы в форме отображалось то, что человек должен вписать', 28, 1, '2019-04-19 19:49:13', '2019-04-19 19:52:07', 1),
(70, 0, 'чтобы загружать файл в форму', 28, 0, '2019-04-19 19:49:13', '2019-04-19 19:51:02', NULL),
(71, 0, 'отправляет данные прямо внутри ссылки', 29, 1, '2019-04-19 19:56:26', '2019-04-19 19:57:06', 1),
(72, 0, 'отправляет данные на сервер', 29, 0, '2019-04-19 19:56:26', '2019-04-19 19:57:06', NULL),
(73, 0, 'назначает ссылку, куда форма будет отправлять данные', 30, 1, '2019-04-19 19:57:58', '2019-04-19 20:06:54', 1),
(74, 0, 'сохраняет пароль', 30, 0, '2019-04-19 19:57:58', '2019-04-19 20:06:54', NULL),
(76, 0, 'выделяет нужную часть формы', 31, 2, '2019-04-19 20:09:57', '2019-04-19 20:11:10', 1),
(77, 0, 'открывает файл', 31, 1, '2019-04-19 20:09:58', '2019-04-19 20:11:10', NULL),
(78, 0, 'делает текст жирным', 31, 0, '2019-04-19 20:10:52', '2019-04-19 20:11:09', NULL),
(79, 0, 'name', 32, 0, '2019-04-19 20:13:39', '2019-04-19 20:14:17', NULL),
(80, 0, 'id', 32, 1, '2019-04-19 20:13:39', '2019-04-19 20:14:25', 1),
(81, 0, 'placeholder', 32, 2, '2019-04-19 20:13:40', '2019-04-19 20:25:23', NULL),
(82, 0, 'required', 33, 1, '2019-04-19 20:32:15', '2019-04-19 20:32:27', 1),
(83, 0, 'id', 33, 0, '2019-04-19 20:32:15', '2019-04-19 20:33:01', NULL),
(84, 0, 'title', 33, 2, '2019-04-19 20:32:16', '2019-04-19 20:33:09', NULL),
(85, 0, 'type', 34, 0, '2019-04-19 20:53:03', '2019-04-19 20:54:43', NULL),
(86, 0, 'accept', 34, 1, '2019-04-19 20:53:04', '2019-04-19 20:54:45', NULL),
(87, 0, 'checked', 34, 2, '2019-04-19 20:53:05', '2019-04-19 20:54:45', 1),
(88, 0, 'Определяет дополнительную информацию об элементе', 35, 0, '2019-04-19 20:56:00', '2019-04-19 20:56:44', NULL),
(89, 0, 'Определяет значение элемента формы, которое будет отправлено на сервер или получено с помощью клиентских скриптов', 35, 1, '2019-04-19 20:56:02', '2019-04-19 20:56:47', 1),
(91, 0, 'да', 36, 0, '2019-04-19 20:58:24', '2019-04-19 20:58:51', NULL),
(92, 0, 'нет', 36, 1, '2019-04-19 20:58:24', '2019-04-19 20:58:47', 1),
(93, 0, 'form=>select=>option', 37, 1, '2019-04-19 21:02:19', '2019-04-19 21:03:48', 1),
(94, 0, 'form=>ul=>li', 37, 0, '2019-04-19 21:02:19', '2019-04-19 21:03:48', NULL),
(95, 0, 'rows и cols', 38, 0, '2019-04-19 21:22:36', '2019-04-19 21:26:21', NULL),
(96, 0, 'name и id', 38, 1, '2019-04-19 21:22:38', '2019-04-19 21:26:28', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `test_questions`
--

CREATE TABLE IF NOT EXISTS `test_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=39 ;

--
-- Дамп данных таблицы `test_questions`
--

INSERT INTO `test_questions` (`id`, `order`, `name`, `created_at`, `updated_at`, `lesson_id`) VALUES
(1, 0, 'dfhdfhdfhdfh', '2019-04-19 07:28:58', '2019-04-19 07:32:29', 25),
(2, 1, 'Новый вопрос', '2019-04-19 07:34:10', '2019-04-19 07:36:37', 25),
(3, 0, 'Как открыть консоль разработчика в Google Chrome?', '2019-04-19 17:24:23', '2019-04-19 17:24:38', 44),
(6, 1, 'За что отвечает HTML?', '2019-04-19 17:29:44', '2019-04-19 17:33:24', 44),
(7, 2, 'Зачем нужен CSS?', '2019-04-19 17:30:15', '2019-04-19 17:33:24', 44),
(8, 3, 'А JavaScript зачем?', '2019-04-19 17:30:35', '2019-04-19 17:33:24', 44),
(9, 0, 'Какой из них тег заголовка?', '2019-04-19 17:45:05', '2019-04-19 17:45:58', 45),
(10, 1, 'Для чего нужен тег p?', '2019-04-19 17:47:45', '2019-04-19 17:48:26', 45),
(11, 2, 'Найди тег непронумерованного списка (unordered list)', '2019-04-19 17:49:39', '2019-04-19 17:50:40', 45),
(12, 3, 'Какой тег означает элемент списка?', '2019-04-19 17:50:57', '2019-04-21 18:03:48', 45),
(13, 0, 'Какой тег перенаправляет на ссылку?', '2019-04-19 17:53:14', '2019-04-19 17:53:24', 46),
(14, 1, 'Можно ли открывать ссылку в новой кладке с помощью атрибута target?', '2019-04-19 17:54:55', '2019-04-19 17:55:48', 46),
(15, 2, 'Тег img самозакрывающийся или нет?', '2019-04-19 17:56:01', '2019-04-19 17:56:22', 46),
(16, 3, 'Какой атрибут нужен для отображения картинки (для тега img)?', '2019-04-19 17:56:51', '2019-04-19 17:57:11', 46),
(17, 0, 'Как автоматически написать в Sublime правильную структуру html документа?', '2019-04-19 17:59:08', '2019-04-19 17:59:21', 47),
(18, 0, 'Какой тег из ниже представленных строчный?', '2019-04-19 18:01:11', '2019-04-19 18:01:22', 48),
(19, 1, 'Какой тег из ниже представленных блочный?', '2019-04-19 18:02:01', '2019-04-19 18:02:44', 48),
(20, 0, 'Что такое div?', '2019-04-19 18:04:28', '2019-04-19 18:04:40', 49),
(21, 1, 'Что такое span?', '2019-04-19 18:05:26', '2019-04-19 18:05:57', 49),
(22, 0, 'Какая структура построения таблицы правильная?', '2019-04-19 18:08:36', '2019-04-19 18:08:48', 50),
(23, 1, 'Для чего нужны теги thead, tbody и tfoot?', '2019-04-19 18:09:25', '2019-04-19 18:09:40', 50),
(24, 0, 'Что из этого является HTML формой?', '2019-04-19 19:36:29', '2019-04-19 19:36:49', 51),
(25, 0, 'Тег input нужен', '2019-04-19 19:42:11', '2019-04-19 19:42:32', 52),
(26, 1, 'Input это', '2019-04-19 19:43:14', '2019-04-19 19:43:45', 52),
(27, 2, 'Type это', '2019-04-19 19:43:51', '2019-04-19 19:44:05', 52),
(28, 3, 'Зачем нужен placeholder?', '2019-04-19 19:48:50', '2019-04-19 19:49:10', 52),
(29, 0, 'Метод GET', '2019-04-19 19:56:12', '2019-04-19 19:56:23', 53),
(30, 1, 'Атрибут action', '2019-04-19 19:57:45', '2019-04-19 19:58:49', 53),
(31, 0, 'Что делает тег label?', '2019-04-19 20:09:21', '2019-04-19 20:09:52', 54),
(32, 1, 'Чтобы работал атрибут for, нужно указать', '2019-04-19 20:12:45', '2019-04-19 20:14:25', 54),
(33, 0, 'Какой атрибут нужен, чтобы форма требовала заполнить поле?', '2019-04-19 20:31:39', '2019-04-19 20:32:09', 55),
(34, 0, 'Какой атрибут делает ответ формы выбранным по умолчанию?', '2019-04-19 20:38:42', '2019-04-19 20:54:55', 56),
(35, 1, 'Атрибут value', '2019-04-19 20:55:48', '2019-04-19 20:56:47', 56),
(36, 2, 'Можно ли поставить два атрибута checked в одной форме?', '2019-04-19 20:57:49', '2019-04-19 20:58:22', 56),
(37, 0, 'Какой последовательностью тегов сделать выпадающий список?', '2019-04-19 21:01:57', '2019-04-19 21:02:17', 57),
(38, 1, 'Какие атрибуты задают длину и высоту textarea?', '2019-04-19 21:21:41', '2019-04-19 21:26:28', 57);

-- --------------------------------------------------------

--
-- Структура таблицы `test_results`
--

CREATE TABLE IF NOT EXISTS `test_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `json_answers` text COLLATE utf8mb4_unicode_ci,
  `mistakes` tinyint(4) DEFAULT NULL,
  `is_passed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `test_results`
--

INSERT INTO `test_results` (`id`, `created_at`, `updated_at`, `lesson_id`, `user_id`, `json_answers`, `mistakes`, `is_passed`) VALUES
(1, '2019-04-19 08:01:34', '2019-04-19 08:01:34', 25, 1, '{"1":"2","2":"3"}', 1, 0),
(2, '2019-04-19 08:01:40', '2019-04-19 08:01:40', 25, 1, '{"1":"2","2":"3"}', 1, 0),
(3, '2019-04-19 08:01:44', '2019-04-19 08:01:44', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(4, '2019-04-19 08:02:00', '2019-04-19 08:02:00', 25, 1, '{"1":"2","2":"3"}', 1, 0),
(5, '2019-04-19 08:02:04', '2019-04-19 08:02:04', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(6, '2019-04-19 08:05:14', '2019-04-19 08:05:14', 25, 1, '{"1":"2","2":"3"}', 1, 0),
(7, '2019-04-19 08:05:17', '2019-04-19 08:05:17', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(8, '2019-04-19 08:05:43', '2019-04-19 08:05:43', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(9, '2019-04-19 08:06:13', '2019-04-19 08:06:13', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(10, '2019-04-19 08:07:42', '2019-04-19 08:07:42', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(11, '2019-04-19 08:08:14', '2019-04-19 08:08:14', 25, 1, '{"1":"2","2":"3"}', 1, 0),
(12, '2019-04-19 08:08:22', '2019-04-19 08:08:22', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(13, '2019-04-19 08:10:45', '2019-04-19 08:10:45', 25, 1, '{"1":"2","2":"3"}', 1, 0),
(14, '2019-04-19 08:10:48', '2019-04-19 08:10:48', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(15, '2019-04-19 08:12:06', '2019-04-19 08:12:06', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(16, '2019-04-19 08:14:45', '2019-04-19 08:14:45', 25, 1, '{"1":"1","2":"3"}', 0, 1),
(17, '2019-04-21 12:46:45', '2019-04-21 12:46:45', 44, 3, '{"3":"5","6":"7","7":"10","8":"12"}', 0, 1),
(18, '2019-04-21 13:05:06', '2019-04-21 13:05:06', 45, 3, '{"9":"14","10":"18","11":"20","12":"24"}', 0, 1),
(19, '2019-04-21 13:07:06', '2019-04-21 13:07:06', 46, 3, '{"13":"26","14":"32","15":"34","16":"36"}', 1, 0),
(20, '2019-04-21 13:08:03', '2019-04-21 13:08:03', 46, 3, '{"13":"26","14":"32","15":"34","16":"37"}', 2, 0),
(21, '2019-04-21 13:47:35', '2019-04-21 13:47:35', 44, 11, '{"3":"5","6":"7","7":"10","8":"12"}', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_ci,
  `value` int(11) DEFAULT NULL,
  `promo_id` smallint(6) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `is_real` tinyint(4) DEFAULT '0',
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'program',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=48 ;

--
-- Дамп данных таблицы `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `created_at`, `updated_at`, `description`, `value`, `promo_id`, `target_id`, `deleted_at`, `status`, `is_real`, `target_type`) VALUES
(33, 2, '2019-04-19 15:02:13', '2019-04-19 15:02:13', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(34, 2, '2019-04-19 15:02:18', '2019-04-19 15:02:18', 'Разблокировка учебного юнита', -20000, NULL, 1, NULL, 1, 1, 'program'),
(35, 1, '2019-04-20 21:33:39', '2019-04-20 21:33:39', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(36, 3, '2019-04-21 12:31:35', '2019-04-21 12:31:35', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(37, 3, '2019-04-21 12:32:19', '2019-04-21 12:32:19', 'Разблокировка учебного юнита', -20000, NULL, 1, NULL, 1, 1, 'program'),
(38, 4, '2019-04-21 12:43:58', '2019-04-21 12:43:58', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(39, 4, '2019-04-21 12:44:08', '2019-04-21 12:44:08', 'Разблокировка учебного юнита', -20000, NULL, 1, NULL, 1, 1, 'program'),
(40, 5, '2019-04-21 12:46:37', '2019-04-21 12:46:37', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(41, 6, '2019-04-21 12:49:14', '2019-04-21 12:49:14', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(42, 6, '2019-04-21 12:49:38', '2019-04-21 12:49:38', 'Разблокировка учебного юнита', -20000, NULL, 1, NULL, 1, 1, 'program'),
(43, 8, '2019-04-21 12:55:19', '2019-04-21 12:55:19', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(44, 10, '2019-04-21 13:05:33', '2019-04-21 13:05:33', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(45, 10, '2019-04-21 13:06:04', '2019-04-21 13:06:04', 'Разблокировка учебного юнита', -20000, NULL, 1, NULL, 1, 1, 'program'),
(46, 11, '2019-04-21 13:45:29', '2019-04-21 13:45:29', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
(47, 11, '2019-04-21 13:45:41', '2019-04-21 13:45:41', 'Разблокировка учебного юнита', -20000, NULL, 1, NULL, 1, 1, 'program');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'vkontakte',
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_user_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `first_name`, `last_name`, `nickname`, `email`, `email_verified_at`, `password`, `api_token`, `provider`, `provider_user_id`, `provider_user_token`, `avatar`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Антон Платонов', 'Антон', 'Платонов', 'neerone', NULL, NULL, NULL, NULL, 'vkontakte', '46973575', 'a76e6f7c54ed2d0248b2ce97fb7fdb3ba011eaa4763cbd83da49cdd0da71cbb40105d7af238c8355c5ed5', 'https://pp.userapi.com/c844724/v844724095/15f348/dKnyg8hNwj8.jpg?ava=1', 'KFIALnjnVoPHPpwgXYg1wRYSaU64UYrJMqsrzHaUhZtbwsjM9SrAPAj506RR', NULL, '2019-04-08 13:44:23', '2019-04-21 12:50:41'),
(2, 1, 'Милана Федотова', 'Милана', 'Федотова', 'moonna_mjm', NULL, NULL, NULL, NULL, 'vkontakte', '321319571', '3a1a14a0fe415fee9d5e5126b022aa1fe5cc44dad23c1293ab5ec3724539633941e193d06ddca147e287d', 'https://pp.userapi.com/c846016/v846016448/1e8fc5/blPr-55nhis.jpg?ava=1', '2d3SVA10VqInZHTnk07MoVbbka4ueCVQGC3WjiUsixZQoV6gCFxbqYRmZ55Z', '{"locale":"en"}', '2019-04-19 14:18:23', '2019-04-21 16:35:07'),
(3, 1, 'Никита Деникин', 'Никита', 'Деникин', 'id500826796', NULL, NULL, NULL, NULL, 'vkontakte', '500826796', 'a29a97b656d00068c16351da637a91204eb828cc090457f6170557769aa94192c980e53b158328b220362', 'https://pp.userapi.com/c846416/v846416055/ba1ff/rEp_sQscjgw.jpg?ava=1', 'RLEIMcvxQ4Xyqp18ov6GbkMuxICY23J3jcOC0Xv3kf8RsidQeshaMpkFLSIK', '{"locale":"en"}', '2019-04-21 12:12:30', '2019-04-21 12:54:31'),
(4, 2, 'Лёха Волк', 'Лёха', 'Волк', 'id347430156', NULL, NULL, NULL, NULL, 'vkontakte', '347430156', 'dd59cc99182ad1199f8826074d1f0260d3649ce070d29b0dc97c1dcc780b3dec46889f4f3e88bafccc878', 'https://sun1-14.userapi.com/c852136/v852136181/f4e3e/n-Rde-RalYI.jpg?ava=1', 'rgck1fRUPDMjWZKxXZsmn9gBpzRuIQSizAMe0W9sdPahs0i7zbyaHyzZMUpE', NULL, '2019-04-21 12:43:23', '2019-04-21 12:43:23'),
(5, 2, 'Канчоро Курманбеков', 'Канчоро', 'Курманбеков', 'id332175317', NULL, NULL, NULL, NULL, 'vkontakte', '332175317', 'a699cba63ba7344afd01d506b451b0761b0764cd4e34911f39f99bd22f398141980f21c876c106851d24b', 'https://pp.userapi.com/c846021/v846021057/7fdd2/7l04ucLI5b8.jpg?ava=1', 'Fc2eMkmJH63NEjemoKuxn9ZXM2zttuwI5Ir4XGzeWUhGj3rHw48Jgu7tctjb', NULL, '2019-04-21 12:45:20', '2019-04-21 12:45:20'),
(6, 2, 'Владимир Давыдов', 'Владимир', 'Давыдов', 'vladimirdavydov92', NULL, NULL, NULL, NULL, 'vkontakte', '34679761', '2c3784e48ba3cd1d6870392e44232d9eb458c54c1a385abc7903943c342ef3b7ab339cfe281155ab324c9', 'https://pp.userapi.com/c846121/v846121364/178054/5BFY8YcVdsI.jpg?ava=1', 'HMcMdFnJL5O73HwNmHXk5iWkKY69RZbC7zcSTiKvR88dEkBYPL9fCM6Qaou8', NULL, '2019-04-21 12:45:49', '2019-04-21 12:45:49'),
(7, 2, 'Aleksandr Kornushin', 'Aleksandr', 'Kornushin', 'chshr', NULL, NULL, NULL, NULL, 'vkontakte', '175453849', '1b8c634704075ec403991d6fbfbf1115035fb323dc79d597c54023b59a0d2247c6635fd94cfdbd5f2ff14', 'https://sun1-86.userapi.com/c850732/v850732246/847de/EwaUjJ_7aEQ.jpg?ava=1', 'FDNj9FjYeVzqxS2ecT9HvEyL3VzOqCdkwNxedZwiykSLfoetGvVt1yCdTO0f', NULL, '2019-04-21 12:47:24', '2019-04-21 12:47:24'),
(8, 2, 'Александр Волков', 'Александр', 'Волков', 'id380167090', NULL, NULL, NULL, NULL, 'vkontakte', '380167090', '5671631b3d92cc189100e749af5da83b4eb0894f891de136c78e0847e96344c060e28dd37d18f62158f0b', 'https://pp.userapi.com/c850128/v850128599/a6817/QyaynvS5u2U.jpg?ava=1', 'WYHNaDiLhCuQ8Oec47VIfGRNnyVSFv0w4UOJRWQvJ31u9EDBLE1tEbXAVW3b', NULL, '2019-04-21 12:54:20', '2019-04-21 12:54:20'),
(9, 2, 'Максим Паль', 'Максим', 'Паль', 'bkgdojbx', NULL, NULL, NULL, NULL, 'vkontakte', '91434129', 'da5422a0dc819bc934afc39791d0a2773e1f592f2e655dd0fddc35dd6a0cf802cfc1009449ffb9099c7a5', 'https://pp.userapi.com/c837523/v837523129/5138/MQrmxTjCOlA.jpg?ava=1', 'ZHVtbMAK4znEaxcLBTVQyxOnBYEICke1KgkV19JG2CG2OJUQM6dOWwUfzDhI', NULL, '2019-04-21 12:55:18', '2019-04-21 12:55:18'),
(10, 2, 'Борис Брежнев', 'Борис', 'Брежнев', 'bloshkarev99', NULL, NULL, NULL, NULL, 'vkontakte', '211489557', 'f9085944adefe37c2cc5efca8b4f3bcc5eaafc68bdff5c9ca031c81e9e9e6210c3822b1c834e93bd323a0', 'https://pp.userapi.com/c849132/v849132248/120b7c/g00g1QtmG0U.jpg?ava=1', 'vpwaWd4AZemGnZRInAINw5tt3QRSmFw4S8NDejsau6BHoFarZEWttnew5gJW', NULL, '2019-04-21 13:03:54', '2019-04-21 13:03:54'),
(11, 2, 'Данила Платонов', 'Данила', 'Платонов', 'dvplat', NULL, NULL, NULL, NULL, 'vkontakte', '17714538', '14431b3da158de242b30a873069d3c7e4cc4db9a20450cfe483f3eb3f12f2723106f6b17d01ac30e1869f', 'https://pp.userapi.com/c837421/v837421538/3e7b6/mmIx2nk--vo.jpg?ava=1', 'ZLphZBcGsHkvYbtsWGU07D7ZQY23Hw6MN6LPYT1JzPpIW6udbxYOrteSjep0', '{"locale":"en"}', '2019-04-21 13:36:39', '2019-04-21 17:44:58');

-- --------------------------------------------------------

--
-- Структура таблицы `user_courses_progress`
--

CREATE TABLE IF NOT EXISTS `user_courses_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `user_courses_progress`
--

INSERT INTO `user_courses_progress` (`id`, `created_at`, `updated_at`, `status`, `course_id`, `user_id`) VALUES
(6, '2019-04-19 15:02:18', '2019-04-19 15:02:18', 0, 11, 2),
(7, '2019-04-21 12:32:19', '2019-04-21 12:46:46', 1, 11, 3),
(8, '2019-04-21 12:44:08', '2019-04-21 12:44:08', 0, 11, 4),
(9, '2019-04-21 12:46:46', '2019-04-21 12:46:46', 0, 8, 3),
(10, '2019-04-21 12:49:38', '2019-04-21 12:49:38', 0, 11, 6),
(11, '2019-04-21 13:06:04', '2019-04-21 13:06:04', 0, 11, 10),
(12, '2019-04-21 13:45:41', '2019-04-21 13:47:36', 1, 11, 11),
(13, '2019-04-21 13:47:36', '2019-04-21 13:47:36', 0, 8, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `user_lessons_progress`
--

CREATE TABLE IF NOT EXISTS `user_lessons_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=46 ;

--
-- Дамп данных таблицы `user_lessons_progress`
--

INSERT INTO `user_lessons_progress` (`id`, `lesson_id`, `created_at`, `updated_at`, `user_id`, `status`) VALUES
(23, 35, '2019-04-19 15:02:18', '2019-04-19 17:32:55', 2, 1),
(24, 11, '2019-04-19 17:32:55', '2019-04-19 17:33:00', 2, 1),
(25, 44, '2019-04-19 17:33:00', '2019-04-19 17:33:00', 2, 0),
(26, 9, '2019-04-21 12:32:20', '2019-04-21 12:32:42', 3, 1),
(27, 8, '2019-04-21 12:32:42', '2019-04-21 12:33:24', 3, 1),
(28, 35, '2019-04-21 12:33:24', '2019-04-21 12:33:37', 3, 1),
(29, 11, '2019-04-21 12:33:37', '2019-04-21 12:43:31', 3, 1),
(30, 44, '2019-04-21 12:43:31', '2019-04-21 12:46:46', 3, 1),
(31, 9, '2019-04-21 12:44:08', '2019-04-21 12:44:35', 4, 1),
(32, 8, '2019-04-21 12:44:35', '2019-04-21 12:44:35', 4, 0),
(33, 13, '2019-04-21 12:46:46', '2019-04-21 12:49:35', 3, 1),
(34, 14, '2019-04-21 12:49:35', '2019-04-21 13:04:36', 3, 1),
(35, 9, '2019-04-21 12:49:38', '2019-04-21 12:49:38', 6, 0),
(36, 45, '2019-04-21 13:04:36', '2019-04-21 13:05:06', 3, 1),
(37, 18, '2019-04-21 13:05:06', '2019-04-21 13:06:07', 3, 1),
(38, 9, '2019-04-21 13:06:04', '2019-04-21 13:06:04', 10, 0),
(39, 46, '2019-04-21 13:06:07', '2019-04-21 13:06:07', 3, 0),
(40, 9, '2019-04-21 13:45:42', '2019-04-21 13:46:42', 11, 1),
(41, 8, '2019-04-21 13:46:42', '2019-04-21 13:46:49', 11, 1),
(42, 35, '2019-04-21 13:46:49', '2019-04-21 13:46:56', 11, 1),
(43, 11, '2019-04-21 13:46:56', '2019-04-21 13:47:05', 11, 1),
(44, 44, '2019-04-21 13:47:05', '2019-04-21 13:47:36', 11, 1),
(45, 13, '2019-04-21 13:47:36', '2019-04-21 13:47:36', 11, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_progress`
--

CREATE TABLE IF NOT EXISTS `user_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` smallint(6) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `user_progress`
--

INSERT INTO `user_progress` (`id`, `lesson_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, '2019-04-15 10:15:57', '2019-04-15 10:15:57'),
(2, 8, 1, 0, '2019-04-17 16:15:07', '2019-04-17 16:15:07'),
(3, 13, 1, 0, '2019-04-17 18:54:14', '2019-04-17 18:54:14');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
