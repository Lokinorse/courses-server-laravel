-- --------------------------------------------------------
-- Хост:                         localhost
-- Версия сервера:               5.7.24 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица courses.courses
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.courses: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`id`, `name`, `description`, `created_at`, `updated_at`, `slug`, `thumb`, `cost`, `unlocked`) VALUES
	(8, 'Основы HTML', 'Описание основ HTML', '2019-04-17 23:27:00', '2019-04-18 03:02:56', 'osnovi-html', '1/YFYgD5cz9p.png', NULL, 1),
	(11, 'Введение', 'Давай знакомиться!', '2019-04-18 01:13:04', '2019-04-19 13:33:24', 'vvedenie', '1/JwbbLKpHjx.png', NULL, 1),
	(12, 'Основы CSS', 'Ознакомление с синтаксисом CSS, самыми основными его свойствами и назначением в верстке', '2019-04-19 13:34:41', '2019-04-19 13:34:50', 'osnovi-css', '1/f0mWRWHim2.png', NULL, 1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- Дамп структуры для таблица courses.course_lesson
CREATE TABLE IF NOT EXISTS `course_lesson` (
  `course_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `order` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.course_lesson: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `course_lesson` DISABLE KEYS */;
INSERT INTO `course_lesson` (`course_id`, `lesson_id`, `order`) VALUES
	(11, 35, NULL),
	(8, 33, 0),
	(8, 34, 1);
/*!40000 ALTER TABLE `course_lesson` ENABLE KEYS */;

-- Дамп структуры для таблица courses.data_rows
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
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.data_rows: ~101 rows (приблизительно)
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
	(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
	(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
	(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
	(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
	(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
	(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
	(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsTo","column":"role_id","key":"id","label":"display_name","pivot_table":"roles","pivot":0}', 10),
	(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{"model":"TCG\\\\Voyager\\\\Models\\\\Role","table":"roles","type":"belongsToMany","column":"id","key":"id","label":"display_name","pivot_table":"user_roles","pivot":"1","taggable":"0"}', 11),
	(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
	(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
	(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
	(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
	(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
	(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
	(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
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
	(38, 7, 'transaction_type', 'text', 'Transaction Type', 0, 1, 1, 1, 1, 1, '{}', 3),
	(39, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(40, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(41, 7, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
	(42, 7, 'value', 'text', 'Value', 0, 1, 1, 1, 1, 1, '{}', 7),
	(43, 7, 'promo_id', 'text', 'Promo Id', 0, 1, 1, 1, 1, 1, '{}', 8),
	(44, 7, 'target_id', 'text', 'Target Id', 0, 1, 1, 1, 1, 1, '{}', 9),
	(45, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
	(46, 7, 'transaction_belongsto_user_relationship', 'relationship', 'Пользователь', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 11),
	(47, 7, 'transaction_belongsto_promo_relationship', 'relationship', 'Промо', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Promo","table":"promos","type":"belongsTo","column":"promo_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 12),
	(48, 7, 'transaction_belongsto_unit_relationship', 'relationship', 'Объект', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Unit","table":"units","type":"belongsTo","column":"target_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 13),
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
	(107, 15, 'lesson_type', 'select_dropdown', 'Тип занятия', 1, 1, 1, 1, 1, 1, '{"default":"video","options":{"divider":"\\u0420\\u0430\\u0437\\u0434\\u0435\\u043b\\u0438\\u0442\\u0435\\u043b\\u044c","video":"\\u0412\\u0438\\u0434\\u0435\\u043e","test":"\\u0422\\u0435\\u0441\\u0442\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435","practices":"\\u041f\\u0440\\u0430\\u043a\\u0442\\u0438\\u043a\\u0430 \\u043a\\u043e\\u0434\\u043e\\u043c","homework":"\\u0414\\u043e\\u043c\\u0430\\u0448\\u043d\\u0435\\u0435 \\u0437\\u0430\\u0434\\u0430\\u043d\\u0438\\u0435"}}', 10),
	(108, 12, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{}', 7),
	(109, 12, 'thumb', 'media_picker', 'Превью', 0, 1, 1, 1, 1, 1, '{"max":1,"min":0,"show_folders":true,"show_toolbar":true,"allow_upload":true,"allow_move":false,"allow_delete":true,"allow_create_folder":true,"allow_rename":true,"allow-multi-select":false,"allow_crop":true,"allowed":["image"],"base_path":"\\/{uid}\\/","rename":"{random:10}"}', 8),
	(110, 11, 'thumb', 'media_picker', 'Thumb', 0, 1, 1, 1, 1, 1, '{"max":1,"min":0,"show_folders":true,"show_toolbar":true,"allow_upload":true,"allow_move":false,"allow_delete":true,"allow_create_folder":true,"allow_rename":true,"allow-multi-select":false,"allow_crop":true,"allowed":["image"],"base_path":"\\/{uid}\\/","rename":"{random:10}"}', 6),
	(111, 15, 'practice_id', 'text', 'Practice Id', 0, 1, 1, 1, 1, 1, '{}', 11),
	(112, 12, 'cost', 'number', 'Cost', 0, 1, 1, 1, 1, 1, '{}', 9),
	(113, 11, 'cost', 'text', 'Cost', 0, 1, 1, 1, 1, 1, '{}', 7),
	(114, 12, 'unlocked', 'checkbox', 'Разблокирован по умолчанию', 1, 1, 1, 1, 1, 1, '{"on":"\\u041e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","off":"\\u0417\\u0430\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439","checked":"true"}', 4),
	(115, 15, 'short_description', 'text', 'Короткое описание', 0, 1, 1, 1, 1, 1, '{}', 12),
	(116, 11, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{}', 8),
	(117, 15, 'lesson_belongstomany_course_relationship', 'relationship', 'courses', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Course","table":"courses","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"course_lesson","pivot":"1","taggable":null}', 14),
	(118, 12, 'course_belongstomany_program_relationship', 'relationship', 'programs', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Program","table":"programs","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"program_course","pivot":"1","taggable":null}', 10);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;

-- Дамп структуры для таблица courses.data_types
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.data_types: ~11 rows (приблизительно)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(4, 'units', 'units', 'Unit', 'Units', NULL, 'App\\Unit', NULL, 'App\\Http\\Controllers\\Voyager\\UnitController', NULL, 1, 1, '{"order_column":"id","order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-08 16:46:36', '2019-04-15 16:01:54'),
	(5, 'promo', 'promo', 'Promo', 'Promo', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 20:56:21', '2019-04-10 21:01:08'),
	(6, 'promos', 'promos', 'Promo', 'Promos', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 21:02:27', '2019-04-11 16:44:49'),
	(7, 'transactions', 'transactions', 'Transaction', 'Transactions', NULL, 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 21:07:47', '2019-04-10 21:41:23'),
	(9, 'test_questions', 'test-questions', 'Test Question', 'Test Questions', NULL, 'App\\TestQuestion', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(10, 'test_answers', 'test-answers', 'Test Answer', 'Test Answers', NULL, 'App\\TestAnswer', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(11, 'programs', 'programs', 'Program', 'Programs', NULL, 'App\\Program', NULL, 'App\\Http\\Controllers\\Voyager\\ProgramController', NULL, 1, 0, '{"order_column":null,"order_display_column":"id","order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 21:59:11', '2019-04-19 07:40:40'),
	(12, 'courses', 'courses', 'Course', 'Courses', NULL, 'App\\Course', NULL, 'App\\Http\\Controllers\\Voyager\\CourseController', NULL, 1, 0, '{"order_column":null,"order_display_column":"id","order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 22:01:40', '2019-04-18 02:48:36'),
	(15, 'lessons', 'lessons', 'Lesson', 'Lessons', NULL, 'App\\Lesson', NULL, 'App\\Http\\Controllers\\Voyager\\LessonController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 22:19:06', '2019-04-18 05:49:33');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Дамп структуры для таблица courses.lessons
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
  `short_description` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.lessons: ~30 rows (приблизительно)
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` (`id`, `created_at`, `updated_at`, `name`, `description`, `youtube_video_id`, `lesson_type`, `slug`, `unlocked`, `completed`, `test_id`, `practice_id`, `short_description`) VALUES
	(4, '2019-04-15 11:53:43', '2019-04-15 12:59:29', 'Курсы веб разработчика', '<p>Описание курса</p>', '[]', 'video', 'kursy-veb-razrabotchika', 0, 0, NULL, NULL, NULL),
	(5, '2019-04-15 12:33:35', '2019-04-15 17:43:36', 'Основы HTML', NULL, '[]', 'video', 'osnovy-HTML', 1, 1, NULL, NULL, NULL),
	(8, '2019-04-15 12:55:27', '2019-04-15 17:18:00', 'Настройка среды. Установка Google Chrome', '<p>Привет! Я рад, что мы с тобой начнем обучение прямо сейчас. Для начала, нужно настроить все программы, без которых пройти курс будет невозможно.</p>\r\n<p>Для прохождения марафона нам потребуются:</p>\r\n<p>&nbsp;</p>\r\n<p>1) Браузер <strong>Google Chrome</strong> последней версии</p>\r\n<p>2) <strong>Sublime Text 3</strong>, скачанный с официального сайта.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>В этом уроке я покажу, как скачать и установить Chrome. Если он у тебя установлен, смело пропускай урок!</p>', '2opL4LMmLvo', 'video', 'nastrojka-sredy-ustanovka-Google-Chrome', 1, 1, NULL, NULL, NULL),
	(9, '2019-04-15 12:55:39', '2019-04-15 16:11:26', 'Приветствие', NULL, 'L1VCXMwFLco', 'video', 'privetstvie', 1, 1, NULL, NULL, NULL),
	(10, '2019-04-15 13:00:28', '2019-04-15 13:00:44', 'Основы CSS', NULL, '[]', 'video', NULL, 0, 0, NULL, NULL, NULL),
	(11, '2019-04-15 13:01:24', '2019-04-15 17:39:48', 'Что такое сайт', '<p>Вот скрипт, который нужно вставить в Console.</p>\r\n<p>Зайди на свою страницу ВК, нажми f12.</p>\r\n<p>Скопируй этот скрипт, и вставь в раздел Console, который открывается при нажатии f12.</p>\r\n<p>Начинай от var, и не забудь про последнюю скобку!</p>\r\n<p>Нажми enter, и наведи курсор на статус Online.&nbsp;</p>\r\n<p>Нажимай, и смотри на результат!</p>\r\n<pre class="language-javascript"><code>var online = document.querySelector(".profile_online_lv")\r\nonline .onclick = function(e){\r\n    e.preventDefault();\r\n    e.stopPropagation();\r\n    var body = document.querySelector("body")\r\n    var angle = 0;\r\n    var interval = setInterval(function() {\r\n        if (angle &gt;= 360) clearInterval(interval);\r\n        body.style = "transform: rotate("+angle+"deg); background: #ebf9e8;";\r\n        angle++\r\n    }, 2)\r\n    pageName = document.querySelector(".page_name")\r\n    pageName.innerText = "Вертел я Вконтакте"\r\n}</code></pre>', 'CsCaO3bbkag', 'video', 'chto-takoe-sajt', 1, 1, NULL, NULL, NULL),
	(12, '2019-04-15 13:02:42', '2019-04-15 13:03:57', 'Подготовка', NULL, '[]', 'video', NULL, 0, 0, NULL, NULL, NULL),
	(13, '2019-04-15 13:03:02', '2019-04-15 17:42:13', 'Подготовка проекта', NULL, '7bBSCOi321c', 'video', 'podgotovka-proekta', 1, 1, NULL, NULL, NULL),
	(14, '2019-04-15 13:04:46', '2019-04-15 17:43:15', 'Что такое тег', '<p>Теги. Не обязательно их зубрить, или пытаться найти все существующие.</p>\r\n<p>Большинство верстальщиков в повседневной жизни используют не более 20-ти из, но давай об этом подробнее в видео!</p>', 'sHK6ccPn7cc', 'video', 'chto-takoe-teg', 1, 1, NULL, NULL, NULL),
	(15, '2019-04-15 13:05:45', '2019-04-15 13:42:01', 'HTML Формы', NULL, '[]', 'video', 'HTML-formy', 0, 0, NULL, NULL, NULL),
	(16, '2019-04-15 13:06:28', '2019-04-15 18:41:05', 'HTML Таблицы', NULL, '[]', 'video', 'HTML-tablicy', 1, 1, NULL, NULL, NULL),
	(17, '2019-04-15 13:09:20', '2019-04-15 17:44:09', 'HTML теги', NULL, '[]', 'video', 'HTML-tegy', 1, 1, NULL, NULL, NULL),
	(18, '2019-04-15 13:10:50', '2019-04-15 18:44:29', 'Атрибуты тега', NULL, 'L9-HZ9H7SZc', 'video', 'atributy-tega', 0, 1, NULL, NULL, NULL),
	(19, '2019-04-15 13:13:11', '2019-04-15 18:45:03', 'Структура HTML документа', '<p>? Заметь, что когда будешь писать html+tab, чтобы быстро сделать правильную структуру документа, нужно, чтобы файл был обязательно уже сохранен в формате .html, как на картинке.&nbsp;</p>\r\n<p><img src="https://varilo.ru//storage/units/April2019/тэг.JPG" alt="" /></p>\r\n<p class="_article_paragraph article_paragraph article_decoration_first article_decoration_last" style="margin-top: 24px; margin-bottom: 0px;">Иначе, фишка работать не будет!</p>\r\n<p class="_article_paragraph article_paragraph article_decoration_first article_decoration_last" style="margin-top: 24px; margin-bottom: 0px;">&nbsp;</p>\r\n<p class="_article_paragraph article_paragraph article_decoration_first article_decoration_last" style="margin-top: 24px; margin-bottom: 0px; color: rgba(0, 0, 0, 0.86); font-family: \'PT Serif\', serif; font-size: 19px;">&nbsp;</p>', 'b0ZfnzI-bxU', 'video', 'struktura-HTML-dokumenta', 0, 1, NULL, NULL, NULL),
	(20, '2019-04-15 13:14:52', '2019-04-15 18:45:20', 'Строчные и блочные элементы', '<p>Таблица со всеми тегами: <a href="https://vk.cc/9dp2Jg">посмотреть</a></p>', '2rGn2gRzGm4', 'video', 'strochnye-i-blochnye-elementy', 0, 1, NULL, NULL, NULL),
	(21, '2019-04-15 13:16:14', '2019-04-15 18:45:44', 'Списки, вложенность в HTML', '<p><strong>Список, который понадобится для прохождения занятия:</strong></p>\r\n<p>&nbsp;</p>\r\n<p>История</p>\r\n<p>&nbsp;</p>\r\n<p>Социальная роль</p>\r\n<p>&nbsp;</p>\r\n<p>Применение</p>\r\n<p>&nbsp;</p>\r\n<p>Велосипедные гонки</p>\r\n<p>&nbsp;</p>\r\n<p>Велосипеды в настоящее время</p>\r\n<p>&nbsp;</p>\r\n<p>Европа</p>\r\n<p>&nbsp;</p>\r\n<p>Азия</p>\r\n<p>&nbsp;</p>\r\n<p>Велосипедные рекорды</p>\r\n<p>&nbsp;</p>\r\n<p>Устройство велосипеда</p>\r\n<p>&nbsp;</p>\r\n<p>Колёса</p>\r\n<p>&nbsp;</p>\r\n<p>Рама</p>\r\n<p>&nbsp;</p>\r\n<p>Конструкция</p>\r\n<p>&nbsp;</p>\r\n<p>Материалы</p>\r\n<p>&nbsp;</p>\r\n<p>Вилка</p>\r\n<p>&nbsp;</p>\r\n<p>Передача</p>\r\n<p>&nbsp;</p>\r\n<p>Тормоза</p>\r\n<p>&nbsp;</p>\r\n<p>Седло</p>\r\n<p>&nbsp;</p>\r\n<p>Педали</p>\r\n<p>&nbsp;</p>\r\n<p>Другие компоненты и принадлежности</p>\r\n<p>&nbsp;</p>\r\n<p>Физика</p>\r\n<p>&nbsp;</p>\r\n<p>Энергетическая эффективность</p>\r\n<p>&nbsp;</p>\r\n<p>Разные факты</p>\r\n<p>&nbsp;</p>\r\n<p>Разновидности велосипедов</p>\r\n<p>&nbsp;</p>\r\n<p>Видео</p>\r\n<p>&nbsp;</p>\r\n<p>Техническое обслуживание</p>\r\n<p>&nbsp;</p>\r\n<p>Выбор велосипеда</p>\r\n<p>&nbsp;</p>\r\n<p>Руководство по эксплуатации</p>\r\n<p>&nbsp;</p>\r\n<p>Польза для здоровья</p>\r\n<p>&nbsp;</p>\r\n<p>См. также</p>\r\n<p>&nbsp;</p>\r\n<p>Примечания</p>\r\n<p>&nbsp;</p>\r\n<p>Ссылки</p>', 'qxQ217nGFiA', 'video', 'spiski-vlozhennost-v-HTML', 0, 1, NULL, NULL, NULL),
	(22, '2019-04-15 13:17:43', '2019-04-15 18:45:55', 'Div\'ы и span\'ы', NULL, '3twtTK9Kmic', 'video', 'divy-i-spany', 0, 1, NULL, NULL, NULL),
	(23, '2019-04-15 13:19:40', '2019-04-15 18:46:10', 'HTML таблицы, введение', NULL, 'qJjBR3BKQLc', 'video', 'HTML-tablicy-vvedenie', 0, 1, NULL, NULL, NULL),
	(24, '2019-04-15 13:20:06', '2019-04-15 18:46:21', 'HTML таблицы, упражнение', '<p>Для этого занятие тебе понадобятся материалы.</p>\r\n<p>Я подготовил папку на Яндекс Диске, из которой ты сможешь скачать все нужное:&nbsp;<a href=" https://yadi.sk/d/HFJIXNVHSQcFpA">Яндекс.Диск</a></p>\r\n<p>&nbsp;</p>\r\n<p>? Если ты решишь найти картинки самостоятельно, хочу посоветовать тебе искать <em>маленькие картинки</em> по размеру. Так как мы не проходили уменьшение размеров картинок с помощью кода, а гигантская картинка, которая выходит за границы вселенной, сильно подпортит внешний вид твоей таблицы.</p>\r\n<p>Также хочу напомнить, что для выполнения этого задания тебе нужно будет вспомнить теги, которые отвечают за ссылку, добавление картинки, и открытие ссылки в новой вкладке.</p>\r\n<p>&nbsp;</p>', 'MpZGRQ2TVCw', 'video', 'HTML-tablicy-uprazhnenie', 0, 1, NULL, NULL, NULL),
	(25, '2019-04-15 13:20:11', '2019-04-15 18:46:47', 'Решение упражнения', NULL, 'ReTXvwO6ghs', 'video', 'HTML-tablicy-reshenie-uprazhneniya', 0, 1, NULL, NULL, NULL),
	(26, '2019-04-15 13:24:24', '2019-04-15 18:48:06', 'Введение', '<p>Ну вот, ты уже через многое прошел, сейчас ты почти на финишной прямой!</p>\r\n<p>Впитывай в себя эту информацию как губка, потому что в конце будет новое задание для самостоятельного выполнения.</p>', 'bhI01gnKNuw', 'video', 'formy-vvedenie', 0, 1, NULL, NULL, NULL),
	(27, '2019-04-15 13:24:28', '2019-04-15 18:48:36', 'Инпуты', NULL, 'E3AXefQxGwk', 'video', 'inputy', 0, 1, NULL, NULL, NULL),
	(28, '2019-04-15 13:24:32', '2019-04-15 18:54:06', 'Сама форма', NULL, 'mCUvXaVezc0', 'video', 'sama-forma', 0, 1, NULL, NULL, NULL),
	(29, '2019-04-15 13:24:35', '2019-04-15 18:54:40', 'Лейблы', NULL, 'Eoq91nDQ0ks', 'video', 'lejbly', 0, 1, NULL, NULL, NULL),
	(30, '2019-04-15 13:24:38', '2019-04-15 18:55:30', 'Валидация форм', NULL, 'nYryG_pFjzE', 'video', 'validaciya-form', 0, 1, NULL, NULL, NULL),
	(31, '2019-04-15 13:24:41', '2019-04-15 18:56:15', 'Checkbox и radio кнопки', NULL, 'ffisZCvC1LE', 'video', 'checkbox-i-radio-knopki', 0, 1, NULL, NULL, NULL),
	(32, '2019-04-15 13:24:45', '2019-04-15 18:56:55', 'Select, textarea', NULL, '3DN8YQDmW6I', 'video', 'select-textarea', 0, 1, NULL, NULL, NULL),
	(33, '2019-04-15 13:24:48', '2019-04-15 18:57:35', 'Практика, упражнение', '<p>Ура, это твоя финальная работа по блоку HTML!</p>\r\n<p>Напомню, что эту работу я буду проверять.</p>', '0_mQQ-Y06rg', 'video', 'praktika-uprazhnenie', 0, 1, NULL, NULL, NULL),
	(34, '2019-04-15 13:24:52', '2019-04-15 18:58:21', 'Решение упражнения по формам', NULL, '0_mQQ-Y06rg', 'video', 'reshenie-uprazhneniya-po-formam', 0, 1, NULL, NULL, NULL),
	(35, '2019-04-15 14:10:20', '2019-04-15 17:29:41', 'Настройка среды. Установка Sublime Text 3', '<p>Вообще Sublime - программа платная, но её полный функционал пожизненно доступен даже без оплаты. Единственный минус неоплаченной версии - периодическое выскакивание окошка об оплате.</p>\r\n<p>Вот картинка того, как это будет выглядеть:</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://varilo.ru//storage/units/April2019/саблайм9.JPG" alt="" /></p>\r\n<p>&nbsp;</p>\r\n<p>Появляется оно достаточно редко, да и закрыть его, нажав на отмену, не проблема.</p>\r\n<p>? Замечу, что в процессе установки Sublime будет пункт <strong>Add to explorer context menu</strong>. Советую эту галочку поставить, тогда можно будет открывать файлы в Sublime прямо из проводника правой кнопкой мышки.</p>', 'eT9MfOsKPtA', 'video', 'nastrojka-sredy-ustanovka-Sublime-Text-3', 1, 1, NULL, NULL, NULL);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;

-- Дамп структуры для таблица courses.lessons_
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.lessons_: ~20 rows (приблизительно)
/*!40000 ALTER TABLE `lessons_` DISABLE KEYS */;
INSERT INTO `lessons_` (`id`, `created_at`, `updated_at`, `name`, `description`, `slug`, `unlocked`, `completed`, `test_id`, `youtube_video_id`, `lesson_type`, `practice_id`, `short_description`) VALUES
	(5, '2019-04-17 18:08:09', '2019-04-17 18:08:57', 'Новый Курс', NULL, 'html_s_nula', 1, 1, NULL, NULL, 'video', NULL, NULL),
	(6, '2019-04-17 18:09:55', '2019-04-17 18:09:55', 'Новый Урок', NULL, '', 0, 0, NULL, NULL, 'video', NULL, NULL),
	(7, '2019-04-17 18:09:59', '2019-04-17 18:09:59', 'Новый Урок', NULL, '', 0, 0, NULL, NULL, 'video', NULL, NULL),
	(8, '2019-04-17 18:10:01', '2019-04-17 19:16:45', 'Приветсивеи', '<p>ывпывп</p>', 'privetstvie', 1, 1, NULL, NULL, 'video', NULL, NULL),
	(10, '2019-04-17 19:12:48', '2019-04-17 19:12:48', 'Новый Разделитель', NULL, '', 0, 0, NULL, NULL, 'video', NULL, NULL),
	(11, '2019-04-17 21:52:28', '2019-04-17 21:52:50', 'Новый Программа', NULL, 'testprogram', 0, 0, NULL, NULL, 'video', NULL, NULL),
	(12, '2019-04-17 21:52:00', '2019-04-18 22:50:27', 'Еще видеозанятие', '<p>ывпып</p>', 'test course', 1, 1, NULL, NULL, 'video', NULL, NULL),
	(13, '2019-04-17 21:53:33', '2019-04-17 21:54:03', 'Новый Урок', '<p>бубубу</p>', 'bubub', 1, 1, NULL, NULL, 'video', NULL, NULL),
	(15, '2019-04-18 00:17:00', '2019-04-18 00:17:00', 'Новый урок divider', '', '', 0, 1, NULL, NULL, 'divider', NULL, NULL),
	(18, '2019-04-18 00:17:06', '2019-04-18 22:48:40', 'Новый урок practices', NULL, 'prakt', 0, 1, NULL, NULL, 'practices', NULL, NULL),
	(19, '2019-04-18 00:17:07', '2019-04-19 09:59:31', 'Новый урок homework', NULL, 'тестовый-урок', 1, 1, NULL, NULL, 'homework', NULL, NULL),
	(22, '2019-04-18 01:12:52', '2019-04-18 06:45:46', 'Урок по CSS со слагом', NULL, 'test-slug-css-urok', 1, 1, NULL, NULL, 'video', NULL, 'тестовый урок css'),
	(23, '2019-04-18 05:09:00', '2019-04-18 05:12:17', 'Разделяю по центру', NULL, 'razdel', 0, 1, NULL, NULL, 'divider', NULL, NULL),
	(24, '2019-04-18 05:10:00', '2019-04-18 05:49:43', 'Видеоурок', '<h1>Привет</h1>\r\n<p>Я <em><strong>мирный</strong></em></p>', 'videourok', 1, 1, NULL, '6dkqVj7heiA', 'video', NULL, 'Очень коротенькое описание к активному уроку типа'),
	(25, '2019-04-18 05:10:00', '2019-04-18 05:13:30', 'Тестирование №1', NULL, 'testim', 1, 1, NULL, NULL, 'test', NULL, NULL),
	(26, '2019-04-18 05:10:00', '2019-04-18 05:13:15', 'Практика', NULL, 'praktika', 1, 1, NULL, NULL, 'practices', NULL, NULL),
	(27, '2019-04-18 06:40:29', '2019-04-18 06:40:29', 'Новый урок divider', '', '', 0, 1, NULL, NULL, 'divider', NULL, NULL),
	(28, '2019-04-18 06:40:36', '2019-04-18 06:40:36', 'Новый урок video', '', '', 0, 1, NULL, NULL, 'video', NULL, NULL);
/*!40000 ALTER TABLE `lessons_` ENABLE KEYS */;

-- Дамп структуры для таблица courses.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.menus: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '2019-04-08 16:44:21', '2019-04-08 16:44:21');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Дамп структуры для таблица courses.menu_items
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
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.menu_items: ~18 rows (приблизительно)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-04-08 16:44:21', '2019-04-10 20:58:41', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2019-04-08 16:44:21', '2019-04-12 22:30:00', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2019-04-08 16:44:21', '2019-04-17 22:16:06', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 5, '2019-04-08 16:44:21', '2019-04-12 22:30:00', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 7, '2019-04-08 16:44:21', '2019-04-12 22:30:00', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 8, '2019-04-08 16:44:21', '2019-04-12 22:30:00', 'voyager.settings.index', NULL),
	(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.hooks', NULL),
	(13, 1, 'Промокоды', '', '_self', 'voyager-hotdog', '#20b3cc', 15, 1, '2019-04-10 20:56:21', '2019-04-10 21:02:44', 'voyager.promos.index', 'null'),
	(15, 1, 'Деньги', '', '_self', 'voyager-wineglass', '#24a62b', NULL, 3, '2019-04-10 20:59:01', '2019-04-17 22:16:06', NULL, ''),
	(16, 1, 'Promos', '', '_self', NULL, NULL, NULL, 9, '2019-04-10 21:02:27', '2019-04-12 22:30:00', 'voyager.promos.index', NULL),
	(17, 1, 'Транзакции', '', '_self', 'voyager-dollar', '#75db4f', 15, 2, '2019-04-10 21:07:47', '2019-04-10 21:12:13', 'voyager.transactions.index', 'null'),
	(19, 1, 'Обучение', '', '_self', 'voyager-study', '#84bcfb', NULL, 2, '2019-04-12 22:29:52', '2019-04-12 22:30:57', NULL, ''),
	(22, 1, 'Программы', '', '_self', NULL, '#000000', 19, 1, '2019-04-17 21:59:11', '2019-04-17 22:20:00', 'voyager.programs.index', 'null'),
	(23, 1, 'Курсы', '', '_self', NULL, '#000000', 19, 2, '2019-04-17 22:01:41', '2019-04-17 22:20:07', 'voyager.courses.index', 'null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Дамп структуры для таблица courses.messages
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.messages: ~31 rows (приблизительно)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`, `target_id`, `destination_type`, `parent_id`, `text`, `created_at`, `updated_at`, `user_id`, `important`, `right`, `message_type`) VALUES
	(1, 2, 'unit', 0, 'апо', '2019-04-15 15:05:41', '2019-04-15 15:05:41', 1, NULL, NULL, 'comment'),
	(2, 2, 'unit', 0, 'апрлапрл', '2019-04-15 15:05:43', '2019-04-15 15:05:43', 1, NULL, NULL, 'comment'),
	(3, 2, 'unit', 0, 'апрлвпрлврпл', '2019-04-15 15:05:46', '2019-04-15 15:05:46', 1, NULL, NULL, 'faq'),
	(4, 2, 'unit', 0, 'варлвпрл', '2019-04-15 15:05:48', '2019-04-15 15:05:48', 1, NULL, NULL, 'faq'),
	(5, 2, 'unit', 0, 'коммент 1', '2019-04-15 15:05:56', '2019-04-15 15:05:56', 1, NULL, NULL, 'comment'),
	(6, 2, 'unit', 0, 'вопрос 1', '2019-04-15 15:06:00', '2019-04-15 15:06:00', 1, NULL, NULL, 'faq'),
	(7, 2, 'unit', 0, 'нрол', '2019-04-15 15:07:07', '2019-04-15 15:07:07', 1, NULL, NULL, 'comment'),
	(8, 2, 'unit', 0, 'коммент2', '2019-04-15 15:15:00', '2019-04-15 15:15:00', 1, NULL, NULL, 'comment'),
	(9, 2, 'unit', 0, 'вопрос2', '2019-04-15 15:15:04', '2019-04-15 15:15:04', 1, NULL, NULL, 'faq'),
	(10, 2, 'unit', 0, 'коммент3', '2019-04-15 15:15:08', '2019-04-15 15:15:08', 1, NULL, NULL, 'comment'),
	(11, 2, 'unit', 0, 'вопрос3', '2019-04-15 15:15:12', '2019-04-15 15:15:12', 1, NULL, NULL, 'faq'),
	(12, 2, 'unit', 0, 'ывпыпр', '2019-04-15 15:16:50', '2019-04-15 15:16:50', 1, NULL, NULL, 'faq'),
	(13, 2, 'unit', 0, 'апрлапл', '2019-04-15 15:16:51', '2019-04-15 15:16:51', 1, NULL, NULL, 'faq'),
	(14, 2, 'unit', 10, 'rtjfgj', '2019-04-15 19:56:38', '2019-04-15 19:56:38', 1, NULL, NULL, 'comment'),
	(15, 2, 'unit', 8, 'vnk,bjl', '2019-04-15 19:57:07', '2019-04-15 19:57:07', 1, NULL, NULL, 'comment'),
	(16, 2, 'unit', 14, 'привет', '2019-04-15 19:57:30', '2019-04-15 19:57:30', 1, NULL, NULL, 'comment'),
	(17, 2, 'unit', 1, 'Апо?', '2019-04-15 19:57:48', '2019-04-15 19:57:48', 1, NULL, NULL, 'comment'),
	(18, 2, 'unit', 15, 'йоу', '2019-04-15 20:01:07', '2019-04-15 20:01:07', 1, NULL, NULL, 'comment'),
	(19, 2, 'unit', 16, 'и тебе куку', '2019-04-15 20:01:42', '2019-04-15 20:01:42', 1, NULL, NULL, 'comment'),
	(20, 2, 'unit', 12, 'йоу', '2019-04-15 20:01:48', '2019-04-15 20:01:48', 1, NULL, NULL, 'faq'),
	(21, 2, 'unit', 13, 'Куку, вот ответ на тво', '2019-04-15 20:10:19', '2019-04-15 20:10:19', 1, NULL, NULL, 'faq'),
	(22, 2, 'unit', 13, 'Вот ответ на твой вопрос', '2019-04-15 20:10:30', '2019-04-15 20:10:30', 1, NULL, NULL, 'faq'),
	(23, 2, 'unit', 19, 'В- Вложенность', '2019-04-15 20:17:29', '2019-04-15 20:17:29', 1, NULL, NULL, 'comment'),
	(24, 2, 'unit', 23, 'С- соженность', '2019-04-15 20:17:38', '2019-04-15 20:17:38', 1, NULL, NULL, 'comment'),
	(25, 2, 'unit', 24, 'ё - ёбобо', '2019-04-15 20:17:46', '2019-04-15 20:17:46', 1, NULL, NULL, 'comment'),
	(26, 2, 'unit', 11, 'sdg', '2019-04-15 20:19:42', '2019-04-15 20:19:42', 1, NULL, NULL, 'faq'),
	(27, 2, 'unit', 9, 'dfhdfh', '2019-04-15 20:24:16', '2019-04-15 20:24:16', 1, NULL, NULL, 'faq'),
	(28, 2, 'unit', 6, 'dfhdfh', '2019-04-15 20:24:34', '2019-04-15 20:24:34', 1, NULL, NULL, 'faq'),
	(29, 2, 'unit', 3, 'тест', '2019-04-15 20:25:11', '2019-04-15 20:25:11', 1, NULL, NULL, 'faq'),
	(30, 2, 'unit', 4, 'привет', '2019-04-15 20:25:37', '2019-04-15 20:25:37', 1, NULL, NULL, 'faq'),
	(31, 2, 'unit', 0, 'чмртсчм', '2019-04-15 20:27:51', '2019-04-15 20:27:51', 1, NULL, NULL, 'faq'),
	(32, 2, 'unit', 31, 'угу', '2019-04-15 20:27:56', '2019-04-15 20:27:56', 1, NULL, NULL, 'faq'),
	(33, 13, 'unit', 0, 'dfhdhj', '2019-04-17 21:54:47', '2019-04-17 21:54:47', 1, NULL, NULL, 'comment'),
	(34, 13, 'unit', 0, 'fghkfghk', '2019-04-17 21:54:50', '2019-04-17 21:54:50', 1, NULL, NULL, 'comment'),
	(35, 13, 'unit', 33, 'ответ', '2019-04-17 21:54:58', '2019-04-17 21:54:58', 1, NULL, NULL, 'comment'),
	(36, 26, 'unit', 0, 'sdg', '2019-04-18 22:10:01', '2019-04-18 22:10:01', 1, NULL, NULL, 'comment'),
	(37, 26, 'unit', 36, 'dfhdfh', '2019-04-18 22:10:05', '2019-04-18 22:10:05', 1, NULL, NULL, 'comment'),
	(38, 26, 'unit', 0, 'vbmvbm', '2019-04-18 22:10:34', '2019-04-18 22:10:34', 1, NULL, NULL, 'faq'),
	(39, 26, 'unit', 38, 'dfgjdfgj', '2019-04-18 22:10:40', '2019-04-18 22:10:40', 1, NULL, NULL, 'faq');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Дамп структуры для таблица courses.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.migrations: ~24 rows (приблизительно)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Дамп структуры для таблица courses.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.password_resets: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица courses.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.permissions: ~71 rows (приблизительно)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
	(1, 'browse_admin', NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(2, 'browse_bread', NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(3, 'browse_database', NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(4, 'browse_media', NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(5, 'browse_compass', NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(6, 'browse_menus', 'menus', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(7, 'read_menus', 'menus', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(8, 'edit_menus', 'menus', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(9, 'add_menus', 'menus', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(10, 'delete_menus', 'menus', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(11, 'browse_roles', 'roles', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(12, 'read_roles', 'roles', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(13, 'edit_roles', 'roles', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(14, 'add_roles', 'roles', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(15, 'delete_roles', 'roles', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(16, 'browse_users', 'users', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(17, 'read_users', 'users', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(18, 'edit_users', 'users', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(19, 'add_users', 'users', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(20, 'delete_users', 'users', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(21, 'browse_settings', 'settings', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(22, 'read_settings', 'settings', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(23, 'edit_settings', 'settings', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(24, 'add_settings', 'settings', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(25, 'delete_settings', 'settings', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(26, 'browse_hooks', NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(27, 'browse_units', 'units', '2019-04-08 16:46:36', '2019-04-08 16:46:36'),
	(28, 'read_units', 'units', '2019-04-08 16:46:36', '2019-04-08 16:46:36'),
	(29, 'edit_units', 'units', '2019-04-08 16:46:36', '2019-04-08 16:46:36'),
	(30, 'add_units', 'units', '2019-04-08 16:46:36', '2019-04-08 16:46:36'),
	(31, 'delete_units', 'units', '2019-04-08 16:46:36', '2019-04-08 16:46:36'),
	(32, 'browse_promo', 'promo', '2019-04-10 20:56:21', '2019-04-10 20:56:21'),
	(33, 'read_promo', 'promo', '2019-04-10 20:56:21', '2019-04-10 20:56:21'),
	(34, 'edit_promo', 'promo', '2019-04-10 20:56:21', '2019-04-10 20:56:21'),
	(35, 'add_promo', 'promo', '2019-04-10 20:56:21', '2019-04-10 20:56:21'),
	(36, 'delete_promo', 'promo', '2019-04-10 20:56:21', '2019-04-10 20:56:21'),
	(37, 'browse_promos', 'promos', '2019-04-10 21:02:27', '2019-04-10 21:02:27'),
	(38, 'read_promos', 'promos', '2019-04-10 21:02:27', '2019-04-10 21:02:27'),
	(39, 'edit_promos', 'promos', '2019-04-10 21:02:27', '2019-04-10 21:02:27'),
	(40, 'add_promos', 'promos', '2019-04-10 21:02:27', '2019-04-10 21:02:27'),
	(41, 'delete_promos', 'promos', '2019-04-10 21:02:27', '2019-04-10 21:02:27'),
	(42, 'browse_transactions', 'transactions', '2019-04-10 21:07:47', '2019-04-10 21:07:47'),
	(43, 'read_transactions', 'transactions', '2019-04-10 21:07:47', '2019-04-10 21:07:47'),
	(44, 'edit_transactions', 'transactions', '2019-04-10 21:07:47', '2019-04-10 21:07:47'),
	(45, 'add_transactions', 'transactions', '2019-04-10 21:07:47', '2019-04-10 21:07:47'),
	(46, 'delete_transactions', 'transactions', '2019-04-10 21:07:47', '2019-04-10 21:07:47'),
	(52, 'browse_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(53, 'read_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(54, 'edit_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(55, 'add_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(56, 'delete_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(57, 'browse_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(58, 'read_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(59, 'edit_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(60, 'add_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(61, 'delete_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(62, 'browse_programs', 'programs', '2019-04-17 21:59:11', '2019-04-17 21:59:11'),
	(63, 'read_programs', 'programs', '2019-04-17 21:59:11', '2019-04-17 21:59:11'),
	(64, 'edit_programs', 'programs', '2019-04-17 21:59:11', '2019-04-17 21:59:11'),
	(65, 'add_programs', 'programs', '2019-04-17 21:59:11', '2019-04-17 21:59:11'),
	(66, 'delete_programs', 'programs', '2019-04-17 21:59:11', '2019-04-17 21:59:11'),
	(67, 'browse_courses', 'courses', '2019-04-17 22:01:41', '2019-04-17 22:01:41'),
	(68, 'read_courses', 'courses', '2019-04-17 22:01:41', '2019-04-17 22:01:41'),
	(69, 'edit_courses', 'courses', '2019-04-17 22:01:41', '2019-04-17 22:01:41'),
	(70, 'add_courses', 'courses', '2019-04-17 22:01:41', '2019-04-17 22:01:41'),
	(71, 'delete_courses', 'courses', '2019-04-17 22:01:41', '2019-04-17 22:01:41'),
	(77, 'browse_lessons', 'lessons', '2019-04-17 22:19:06', '2019-04-17 22:19:06'),
	(78, 'read_lessons', 'lessons', '2019-04-17 22:19:06', '2019-04-17 22:19:06'),
	(79, 'edit_lessons', 'lessons', '2019-04-17 22:19:06', '2019-04-17 22:19:06'),
	(80, 'add_lessons', 'lessons', '2019-04-17 22:19:06', '2019-04-17 22:19:06'),
	(81, 'delete_lessons', 'lessons', '2019-04-17 22:19:06', '2019-04-17 22:19:06');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Дамп структуры для таблица courses.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.permission_role: ~70 rows (приблизительно)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
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
	(81, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Дамп структуры для таблица courses.programs
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.programs: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` (`id`, `name`, `description`, `created_at`, `updated_at`, `thumb`, `cost`, `slug`) VALUES
	(1, 'Веб-разработка от А до Я', 'Хорошая программа, мне нравится', '2019-04-17 22:43:00', '2019-04-19 07:40:53', '1/JwbbLKpHjx.png', 20000, 'web-razrabotka');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;

-- Дамп структуры для таблица courses.program_course
CREATE TABLE IF NOT EXISTS `program_course` (
  `program_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `order` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.program_course: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `program_course` DISABLE KEYS */;
INSERT INTO `program_course` (`program_id`, `course_id`, `order`) VALUES
	(1, 11, 0),
	(1, 8, 1),
	(1, 12, 2);
/*!40000 ALTER TABLE `program_course` ENABLE KEYS */;

-- Дамп структуры для таблица courses.promos
CREATE TABLE IF NOT EXISTS `promos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `actual_to` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.promos: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
INSERT INTO `promos` (`id`, `name`, `created_at`, `updated_at`, `value`, `actual_to`) VALUES
	(2, 'Начальный промокод. +20000', '2019-04-10 21:03:00', '2019-04-11 16:45:06', 20000, '2019-04-21 19:44:00');
/*!40000 ALTER TABLE `promos` ENABLE KEYS */;

-- Дамп структуры для таблица courses.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.roles: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(2, 'user', 'Normal User', '2019-04-08 16:44:21', '2019-04-08 16:44:21');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Дамп структуры для таблица courses.settings
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.settings: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Дамп структуры для таблица courses.test_answers
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.test_answers: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `test_answers` DISABLE KEYS */;
INSERT INTO `test_answers` (`id`, `type`, `name`, `question_id`, `order`, `created_at`, `updated_at`, `is_right`) VALUES
	(1, 0, 'Новый ответsfhsdfh', 1, 1, '2019-04-19 10:33:07', '2019-04-19 10:36:47', 1),
	(2, 0, 'Новый ответfgjfgj', 1, 0, '2019-04-19 10:33:13', '2019-04-19 10:36:47', NULL),
	(3, 0, 'Новый ответ на вопрос 2', 2, 0, '2019-04-19 10:34:13', '2019-04-19 10:34:23', 1);
/*!40000 ALTER TABLE `test_answers` ENABLE KEYS */;

-- Дамп структуры для таблица courses.test_questions
CREATE TABLE IF NOT EXISTS `test_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.test_questions: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `test_questions` DISABLE KEYS */;
INSERT INTO `test_questions` (`id`, `order`, `name`, `created_at`, `updated_at`, `lesson_id`) VALUES
	(1, 0, 'dfhdfhdfhdfh', '2019-04-19 10:28:58', '2019-04-19 10:32:29', 25),
	(2, 1, 'Новый вопрос', '2019-04-19 10:34:10', '2019-04-19 10:36:37', 25);
/*!40000 ALTER TABLE `test_questions` ENABLE KEYS */;

-- Дамп структуры для таблица courses.test_results
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.test_results: ~14 rows (приблизительно)
/*!40000 ALTER TABLE `test_results` DISABLE KEYS */;
INSERT INTO `test_results` (`id`, `created_at`, `updated_at`, `lesson_id`, `user_id`, `json_answers`, `mistakes`, `is_passed`) VALUES
	(1, '2019-04-19 11:01:34', '2019-04-19 11:01:34', 25, 1, '{"1":"2","2":"3"}', 1, 0),
	(2, '2019-04-19 11:01:40', '2019-04-19 11:01:40', 25, 1, '{"1":"2","2":"3"}', 1, 0),
	(3, '2019-04-19 11:01:44', '2019-04-19 11:01:44', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(4, '2019-04-19 11:02:00', '2019-04-19 11:02:00', 25, 1, '{"1":"2","2":"3"}', 1, 0),
	(5, '2019-04-19 11:02:04', '2019-04-19 11:02:04', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(6, '2019-04-19 11:05:14', '2019-04-19 11:05:14', 25, 1, '{"1":"2","2":"3"}', 1, 0),
	(7, '2019-04-19 11:05:17', '2019-04-19 11:05:17', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(8, '2019-04-19 11:05:43', '2019-04-19 11:05:43', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(9, '2019-04-19 11:06:13', '2019-04-19 11:06:13', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(10, '2019-04-19 11:07:42', '2019-04-19 11:07:42', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(11, '2019-04-19 11:08:14', '2019-04-19 11:08:14', 25, 1, '{"1":"2","2":"3"}', 1, 0),
	(12, '2019-04-19 11:08:22', '2019-04-19 11:08:22', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(13, '2019-04-19 11:10:45', '2019-04-19 11:10:45', 25, 1, '{"1":"2","2":"3"}', 1, 0),
	(14, '2019-04-19 11:10:48', '2019-04-19 11:10:48', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(15, '2019-04-19 11:12:06', '2019-04-19 11:12:06', 25, 1, '{"1":"1","2":"3"}', 0, 1),
	(16, '2019-04-19 11:14:45', '2019-04-19 11:14:45', 25, 1, '{"1":"1","2":"3"}', 0, 1);
/*!40000 ALTER TABLE `test_results` ENABLE KEYS */;

-- Дамп структуры для таблица courses.transactions
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.transactions: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`id`, `user_id`, `created_at`, `updated_at`, `description`, `value`, `promo_id`, `target_id`, `deleted_at`, `status`, `is_real`, `target_type`) VALUES
	(15, 1, '2019-04-18 04:12:25', '2019-04-18 04:12:25', 'Зачисление с промокода', 20000, 2, NULL, NULL, 1, 0, 'program'),
	(30, 1, '2019-04-19 11:10:28', '2019-04-19 11:10:28', 'Разблокировка учебного юнита', -20000, NULL, 1, NULL, 1, 1, 'program');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Дамп структуры для таблица courses.translations
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.translations: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

-- Дамп структуры для таблица courses.users
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
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.users: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `first_name`, `last_name`, `nickname`, `email`, `email_verified_at`, `password`, `api_token`, `provider`, `provider_user_id`, `provider_user_token`, `avatar`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Антон Платонов', 'Антон', 'Платонов', 'neerone', NULL, NULL, NULL, NULL, 'vkontakte', '46973575', 'b759f79c077f41b7d6a8c57fceab8232d0648c75956e7d21c932d676c87192d810a3990ed0d3decbf82eb', 'https://sun1-29.userapi.com/c844724/v844724095/15f348/dKnyg8hNwj8.jpg?ava=1', 'GLxhAACl5FTA6ZFgBcsBomAt2QNreYtVbkoIgbDhTLxI0Of3COLWLZtRepcQ', NULL, '2019-04-08 16:44:23', '2019-04-18 06:07:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для таблица courses.user_courses_progress
CREATE TABLE IF NOT EXISTS `user_courses_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.user_courses_progress: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `user_courses_progress` DISABLE KEYS */;
INSERT INTO `user_courses_progress` (`id`, `created_at`, `updated_at`, `status`, `course_id`, `user_id`) VALUES
	(3, '2019-04-19 11:10:28', '2019-04-19 11:14:50', 1, 11, 1),
	(4, '2019-04-19 11:14:50', '2019-04-19 11:14:50', 0, 8, 1);
/*!40000 ALTER TABLE `user_courses_progress` ENABLE KEYS */;

-- Дамп структуры для таблица courses.user_lessons_progress
CREATE TABLE IF NOT EXISTS `user_lessons_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.user_lessons_progress: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `user_lessons_progress` DISABLE KEYS */;
INSERT INTO `user_lessons_progress` (`id`, `lesson_id`, `created_at`, `updated_at`, `user_id`, `status`) VALUES
	(11, 24, '2019-04-19 11:10:28', '2019-04-19 11:14:00', 1, 1),
	(18, 26, '2019-04-19 11:14:00', '2019-04-19 11:14:02', 1, 1),
	(19, 25, '2019-04-19 11:14:02', '2019-04-19 11:14:45', 1, 1),
	(20, 12, '2019-04-19 11:14:45', '2019-04-19 11:14:50', 1, 1),
	(21, 19, '2019-04-19 11:14:50', '2019-04-19 11:14:50', 1, 0);
/*!40000 ALTER TABLE `user_lessons_progress` ENABLE KEYS */;

-- Дамп структуры для таблица courses.user_progress
CREATE TABLE IF NOT EXISTS `user_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` smallint(6) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.user_progress: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `user_progress` DISABLE KEYS */;
INSERT INTO `user_progress` (`id`, `lesson_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 1, 0, '2019-04-15 13:15:57', '2019-04-15 13:15:57'),
	(2, 8, 1, 0, '2019-04-17 19:15:07', '2019-04-17 19:15:07'),
	(3, 13, 1, 0, '2019-04-17 21:54:14', '2019-04-17 21:54:14');
/*!40000 ALTER TABLE `user_progress` ENABLE KEYS */;

-- Дамп структуры для таблица courses.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.user_roles: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
