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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.data_rows: ~113 rows (приблизительно)
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
	(39, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
	(40, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
	(41, 7, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
	(42, 7, 'value', 'text', 'Value', 0, 1, 1, 1, 1, 1, '{}', 7),
	(43, 7, 'promo_id', 'text', 'Promo Id', 0, 1, 1, 1, 1, 1, '{}', 8),
	(44, 7, 'target_id', 'text', 'Target Id', 0, 1, 1, 1, 1, 1, '{}', 9),
	(45, 7, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 10),
	(46, 7, 'transaction_belongsto_user_relationship', 'relationship', 'Пользователь', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\User","table":"users","type":"belongsTo","column":"user_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 11),
	(47, 7, 'transaction_belongsto_promo_relationship', 'relationship', 'Промо', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Promo","table":"promos","type":"belongsTo","column":"promo_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 12),
	(48, 7, 'transaction_belongsto_unit_relationship', 'relationship', 'План', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Plan","table":"plans","type":"belongsTo","column":"target_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 13),
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
	(118, 12, 'course_belongstomany_program_relationship', 'relationship', 'programs', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Program","table":"programs","type":"belongsToMany","column":"id","key":"id","label":"name","pivot_table":"program_course","pivot":"1","taggable":null}', 10),
	(119, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(120, 16, 'target_id', 'text', 'Target Id', 1, 1, 1, 1, 1, 1, '{}', 2),
	(121, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
	(122, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(123, 16, 'target_type', 'text', 'Target Type', 1, 1, 1, 1, 1, 1, '{}', 5),
	(124, 16, 'cost', 'number', 'Cost', 0, 1, 1, 1, 1, 1, '{}', 6),
	(125, 16, 'description', 'rich_text_box', 'Description', 0, 1, 1, 1, 1, 1, '{}', 7),
	(126, 16, 'recommended', 'checkbox', 'Recommended', 0, 1, 1, 1, 1, 1, '{}', 8),
	(127, 16, 'discount', 'number', 'Discount', 1, 1, 1, 1, 1, 1, '{}', 9),
	(128, 16, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 10),
	(129, 16, 'conversion_tag', 'text', 'Conversion Tag', 0, 1, 1, 1, 1, 1, '{}', 11),
	(130, 7, 'is_real', 'text', 'Is Real', 0, 1, 1, 1, 1, 1, '{}', 11),
	(131, 7, 'target_type', 'text', 'Target Type', 0, 1, 1, 1, 1, 1, '{}', 12);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.data_types: ~13 rows (приблизительно)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(4, 'units', 'units', 'Unit', 'Units', NULL, 'App\\Unit', NULL, 'App\\Http\\Controllers\\Voyager\\UnitController', NULL, 1, 1, '{"order_column":"id","order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-08 16:46:36', '2019-04-15 16:01:54'),
	(5, 'promo', 'promo', 'Promo', 'Promo', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 20:56:21', '2019-04-10 21:01:08'),
	(6, 'promos', 'promos', 'Promo', 'Promos', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 21:02:27', '2019-04-11 16:44:49'),
	(7, 'transactions', 'transactions', 'Transaction', 'Transactions', NULL, 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 21:07:47', '2019-04-23 16:47:17'),
	(9, 'test_questions', 'test-questions', 'Test Question', 'Test Questions', NULL, 'App\\TestQuestion', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(10, 'test_answers', 'test-answers', 'Test Answer', 'Test Answers', NULL, 'App\\TestAnswer', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(11, 'programs', 'programs', 'Program', 'Programs', NULL, 'App\\Program', NULL, 'App\\Http\\Controllers\\Voyager\\ProgramController', NULL, 1, 0, '{"order_column":null,"order_display_column":"id","order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 21:59:11', '2019-04-19 07:40:40'),
	(12, 'courses', 'courses', 'Course', 'Courses', NULL, 'App\\Course', NULL, 'App\\Http\\Controllers\\Voyager\\CourseController', NULL, 1, 0, '{"order_column":null,"order_display_column":"id","order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 22:01:40', '2019-04-18 02:48:36'),
	(15, 'lessons', 'lessons', 'Lesson', 'Lessons', NULL, 'App\\Lesson', NULL, 'App\\Http\\Controllers\\Voyager\\LessonController', NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-17 22:19:06', '2019-04-18 05:49:33'),
	(16, 'plans', 'plans', 'Plan', 'Plans', NULL, 'App\\Plan', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-23 14:48:16', '2019-04-23 16:21:10');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;

-- Дамп структуры для таблица courses.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.menus: ~1 rows (приблизительно)
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

-- Дамп данных таблицы courses.menu_items: ~19 rows (приблизительно)
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
	(17, 1, 'Транзакции', '', '_self', 'voyager-dollar', '#75db4f', 15, 2, '2019-04-10 21:07:47', '2019-04-10 21:12:13', 'voyager.transactions.index', 'null'),
	(19, 1, 'Обучение', '', '_self', 'voyager-study', '#84bcfb', NULL, 2, '2019-04-12 22:29:52', '2019-04-12 22:30:57', NULL, ''),
	(22, 1, 'Программы', '', '_self', NULL, '#000000', 19, 1, '2019-04-17 21:59:11', '2019-04-17 22:20:00', 'voyager.programs.index', 'null'),
	(23, 1, 'Курсы', '', '_self', NULL, '#000000', 19, 2, '2019-04-17 22:01:41', '2019-04-17 22:20:07', 'voyager.courses.index', 'null'),
	(24, 1, 'Plans', '', '_self', NULL, NULL, 15, 3, '2019-04-23 14:48:16', '2019-04-23 15:06:38', 'voyager.plans.index', NULL),
	(25, 1, 'Уроки', 'admin/lessons', '_self', NULL, '#000000', 19, 3, '2019-04-23 15:07:19', '2019-04-23 15:09:37', NULL, '');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

-- Дамп структуры для таблица courses.plans
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'program',
  `cost` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `recommended` tinyint(4) DEFAULT NULL,
  `discount` tinyint(3) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conversion_tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.plans: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` (`id`, `target_id`, `created_at`, `updated_at`, `target_type`, `cost`, `description`, `recommended`, `discount`, `name`, `conversion_tag`) VALUES
	(1, 1, '2019-04-23 15:03:00', '2019-04-23 16:21:18', 'program', 845, '<ul style="font-family: \'Exo 2\', sans-serif; padding: 0px 26px; margin: 0px 0px 34px; box-sizing: border-box; display: flex; list-style: none; flex-direction: column; color: #000000; font-size: medium;">\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все лекции из курса</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все видео из курса</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Домашние задания</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Интерактивные тесты</li>\r\n</ul>', 0, 0, 'Я сам', 'tarif-ya-sam'),
	(2, 1, '2019-04-23 15:04:00', '2019-04-23 16:21:41', 'program', 5100, '<ul style="font-family: \'Exo 2\', sans-serif; padding: 0px 26px; margin: 0px 0px 34px; box-sizing: border-box; display: flex; list-style: none; flex-direction: column; color: #000000; font-size: medium;">\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все лекции из курса</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все видео из курса</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Домашние задания</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Проверка домашних заданий</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Интерактивные тесты</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Консультации (8 часов)</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Сертификат об окончании</li>\r\n</ul>', 1, 53, 'Комфортный', 'tarif-komfortniy'),
	(3, 1, '2019-04-23 15:04:00', '2019-04-23 16:22:05', 'program', 25000, '<ul style="font-family: \'Exo 2\', sans-serif; padding: 0px 26px; margin: 0px 0px 34px; box-sizing: border-box; display: flex; list-style: none; flex-direction: column; color: #000000; font-size: medium;">\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все лекции из курса</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Все видео из курса</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Домашние задания</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Проверка домашних заданий</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Интерактивные тесты</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;"><span class="pinky" style="padding: 0px; margin: 0px; box-sizing: border-box; color: #e6346e;">Безлимитные </span>консультации</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Премиальные вебинары</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Доступ к премиум-группе</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;"><span class="pinky" style="padding: 0px; margin: 0px; box-sizing: border-box; color: #e6346e;">Личное </span>наставничество и решение любых вопросов</li>\r\n<li style="padding: 8px 0px; margin: 0px; box-sizing: border-box; line-height: 1; font-size: 15px;">Сертификат об окончании</li>\r\n</ul>', 1, 50, 'Премиум', 'tarif-premium');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
