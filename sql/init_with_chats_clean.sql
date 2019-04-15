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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.data_rows: ~67 rows (приблизительно)
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
	(30, 4, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{}', 8),
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
	(55, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
	(56, 8, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
	(57, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
	(58, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
	(61, 8, 'test_belongsto_unit_relationship', 'relationship', 'units', 0, 1, 1, 1, 1, 1, '{"model":"App\\\\Unit","table":"units","type":"hasOne","column":"test_id","key":"id","label":"name","pivot_table":"data_rows","pivot":"0","taggable":"0"}', 7),
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
	(77, 8, 'max_mistakes', 'text', 'Max Mistakes', 1, 1, 1, 1, 1, 1, '{}', 6),
	(78, 4, 'test_id', 'text', 'Test Id', 0, 1, 1, 1, 1, 1, '{}', 13);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.data_types: ~9 rows (приблизительно)
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-04-08 16:44:21', '2019-04-08 16:44:21'),
	(4, 'units', 'units', 'Unit', 'Units', NULL, 'App\\Unit', NULL, 'App\\Http\\Controllers\\Voyager\\UnitController', NULL, 1, 1, '{"order_column":"id","order_display_column":null,"order_direction":"asc","default_search_key":"name","scope":null}', '2019-04-08 16:46:36', '2019-04-13 21:52:06'),
	(5, 'promo', 'promo', 'Promo', 'Promo', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 20:56:21', '2019-04-10 21:01:08'),
	(6, 'promos', 'promos', 'Promo', 'Promos', NULL, 'App\\Promo', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 21:02:27', '2019-04-11 16:44:49'),
	(7, 'transactions', 'transactions', 'Transaction', 'Transactions', NULL, 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-10 21:07:47', '2019-04-10 21:41:23'),
	(8, 'tests', 'tests', 'Test', 'Tests', NULL, 'App\\Test', NULL, 'App\\Http\\Controllers\\Voyager\\TestController', NULL, 1, 1, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null,"scope":null}', '2019-04-12 22:25:27', '2019-04-13 21:51:38'),
	(9, 'test_questions', 'test-questions', 'Test Question', 'Test Questions', NULL, 'App\\TestQuestion', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(10, 'test_answers', 'test-answers', 'Test Answer', 'Test Answers', NULL, 'App\\TestAnswer', NULL, NULL, NULL, 1, 0, '{"order_column":null,"order_display_column":null,"order_direction":"asc","default_search_key":null}', '2019-04-13 01:12:14', '2019-04-13 01:12:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.menu_items: ~19 rows (приблизительно)
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
	(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-04-08 16:44:21', '2019-04-10 20:58:41', 'voyager.dashboard', NULL),
	(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2019-04-08 16:44:21', '2019-04-12 22:30:00', 'voyager.media.index', NULL),
	(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-04-08 16:44:21', '2019-04-12 22:30:00', 'voyager.users.index', NULL),
	(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 5, '2019-04-08 16:44:21', '2019-04-12 22:30:00', 'voyager.roles.index', NULL),
	(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 7, '2019-04-08 16:44:21', '2019-04-12 22:30:00', NULL, NULL),
	(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.menus.index', NULL),
	(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.database.index', NULL),
	(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.compass.index', NULL),
	(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.bread.index', NULL),
	(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 8, '2019-04-08 16:44:21', '2019-04-12 22:30:00', 'voyager.settings.index', NULL),
	(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-04-08 16:44:21', '2019-04-08 16:49:02', 'voyager.hooks', NULL),
	(12, 1, 'Learning Units', '', '_self', 'voyager-trees', '#2bff35', 19, 1, '2019-04-08 16:46:36', '2019-04-12 22:30:00', 'voyager.units.index', 'null'),
	(13, 1, 'Промокоды', '', '_self', 'voyager-hotdog', '#20b3cc', 15, 1, '2019-04-10 20:56:21', '2019-04-10 21:02:44', 'voyager.promos.index', 'null'),
	(15, 1, 'Деньги', '', '_self', 'voyager-wineglass', '#24a62b', NULL, 4, '2019-04-10 20:59:01', '2019-04-12 22:30:00', NULL, ''),
	(16, 1, 'Promos', '', '_self', NULL, NULL, NULL, 9, '2019-04-10 21:02:27', '2019-04-12 22:30:00', 'voyager.promos.index', NULL),
	(17, 1, 'Транзакции', '', '_self', 'voyager-dollar', '#75db4f', 15, 2, '2019-04-10 21:07:47', '2019-04-10 21:12:13', 'voyager.transactions.index', 'null'),
	(18, 1, 'Tests', '', '_self', 'voyager-documentation', '#c14dce', 19, 2, '2019-04-12 22:25:27', '2019-04-12 22:30:00', 'voyager.tests.index', 'null'),
	(19, 1, 'Обучение', '', '_self', 'voyager-study', '#84bcfb', NULL, 2, '2019-04-12 22:29:52', '2019-04-12 22:30:57', NULL, ''),
	(20, 1, 'Test Questions', '', '_self', NULL, NULL, NULL, 10, '2019-04-13 01:11:48', '2019-04-13 01:11:48', 'voyager.test-questions.index', NULL),
	(21, 1, 'Test Answers', '', '_self', NULL, NULL, NULL, 11, '2019-04-13 01:12:15', '2019-04-13 01:12:15', 'voyager.test-answers.index', NULL);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.messages: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.permissions: ~56 rows (приблизительно)
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
	(47, 'browse_tests', 'tests', '2019-04-12 22:25:27', '2019-04-12 22:25:27'),
	(48, 'read_tests', 'tests', '2019-04-12 22:25:27', '2019-04-12 22:25:27'),
	(49, 'edit_tests', 'tests', '2019-04-12 22:25:27', '2019-04-12 22:25:27'),
	(50, 'add_tests', 'tests', '2019-04-12 22:25:27', '2019-04-12 22:25:27'),
	(51, 'delete_tests', 'tests', '2019-04-12 22:25:27', '2019-04-12 22:25:27'),
	(52, 'browse_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(53, 'read_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(54, 'edit_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(55, 'add_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(56, 'delete_test_questions', 'test_questions', '2019-04-13 01:11:48', '2019-04-13 01:11:48'),
	(57, 'browse_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(58, 'read_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(59, 'edit_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(60, 'add_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14'),
	(61, 'delete_test_answers', 'test_answers', '2019-04-13 01:12:14', '2019-04-13 01:12:14');
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

-- Дамп данных таблицы courses.permission_role: ~55 rows (приблизительно)
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
	(47, 1),
	(48, 1),
	(49, 1),
	(50, 1),
	(51, 1),
	(52, 1),
	(53, 1),
	(54, 1),
	(55, 1),
	(56, 1),
	(57, 1),
	(58, 1),
	(59, 1),
	(60, 1),
	(61, 1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

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

-- Дамп структуры для таблица courses.tests
CREATE TABLE IF NOT EXISTS `tests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `max_mistakes` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.tests: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;

-- Дамп структуры для таблица courses.test_answers
CREATE TABLE IF NOT EXISTS `test_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `test_question_id` int(11) NOT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_right` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.test_answers: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `test_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_answers` ENABLE KEYS */;

-- Дамп структуры для таблица courses.test_questions
CREATE TABLE IF NOT EXISTS `test_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.test_questions: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `test_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_questions` ENABLE KEYS */;

-- Дамп структуры для таблица courses.test_results
CREATE TABLE IF NOT EXISTS `test_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `test_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `json_answers` text COLLATE utf8mb4_unicode_ci,
  `mistakes` tinyint(4) DEFAULT NULL,
  `is_passed` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.test_results: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `test_results` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.transactions: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
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

-- Дамп структуры для таблица courses.units
CREATE TABLE IF NOT EXISTS `units` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `videos` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_type` smallint(6) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `slug` tinytext COLLATE utf8mb4_unicode_ci,
  `thumb` tinytext COLLATE utf8mb4_unicode_ci,
  `cost` int(11) DEFAULT NULL,
  `unlocked` tinyint(4) NOT NULL DEFAULT '0',
  `completed` tinyint(4) NOT NULL DEFAULT '1',
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.units: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;

-- Дамп структуры для таблица courses.unit_relations
CREATE TABLE IF NOT EXISTS `unit_relations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `order` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.unit_relations: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `unit_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `unit_relations` ENABLE KEYS */;

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
	(1, 1, 'Антон Платонов', 'Антон', 'Платонов', 'neerone', NULL, NULL, NULL, NULL, 'vkontakte', '46973575', 'f018023a2c91e6334cfb71262649b1e6a0d06e094416def542d1b0bfd033b8d9bfd2923962c3fc0da4b81', 'https://pp.userapi.com/c844724/v844724095/15f348/dKnyg8hNwj8.jpg?ava=1', 'Yagyix6SFHqAl8sqEeiHgnsaJOecdCQIYu0NSoMZxsBk57B2DHq2RKWOrMii', NULL, '2019-04-08 16:44:23', '2019-04-14 19:40:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для таблица courses.user_progress
CREATE TABLE IF NOT EXISTS `user_progress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `program_id` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы courses.user_progress: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `user_progress` DISABLE KEYS */;
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
