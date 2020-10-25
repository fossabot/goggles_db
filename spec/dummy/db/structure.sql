
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `achievement_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `part_order` mediumint(9) DEFAULT 0,
  `achievement_value` varchar(10) DEFAULT NULL,
  `is_bracket_open` tinyint(1) DEFAULT 0,
  `is_or_operator` tinyint(1) DEFAULT 0,
  `is_not_operator` tinyint(1) DEFAULT 0,
  `is_bracket_closed` tinyint(1) DEFAULT 0,
  `achievement_id` int(11) DEFAULT NULL,
  `achievement_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_achievement_rows_achievement` (`achievement_id`),
  KEY `idx_achievement_rows_achievement_type` (`achievement_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `achievement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_achievement_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_achievements_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT '',
  `encrypted_password` varchar(255) DEFAULT '',
  `sign_in_count` int(11) DEFAULT 0,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT 0,
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `lock_version` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admins_on_name` (`name`),
  UNIQUE KEY `index_admins_on_email` (`email`),
  UNIQUE KEY `index_admins_on_unlock_token` (`unlock_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `app_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` int(11) DEFAULT NULL,
  `controller_name` varchar(255) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `is_a_post` tinyint(1) DEFAULT 0,
  `confirmation_text` varchar(255) DEFAULT NULL,
  `a_string` varchar(255) DEFAULT NULL,
  `a_bool` tinyint(1) DEFAULT NULL,
  `a_integer` int(11) DEFAULT NULL,
  `a_date` datetime DEFAULT NULL,
  `a_decimal` decimal(10,2) DEFAULT NULL,
  `a_decimal_2` decimal(10,2) DEFAULT NULL,
  `a_decimal_3` decimal(10,2) DEFAULT NULL,
  `a_decimal_4` decimal(10,2) DEFAULT NULL,
  `range_x` bigint(20) DEFAULT NULL,
  `range_y` bigint(20) DEFAULT NULL,
  `a_name` varchar(255) DEFAULT NULL,
  `a_filename` varchar(255) DEFAULT NULL,
  `tooltip_text` varchar(255) DEFAULT NULL,
  `view_height` int(11) DEFAULT 0,
  `code_type_1` bigint(20) DEFAULT NULL,
  `code_type_2` bigint(20) DEFAULT NULL,
  `code_type_3` bigint(20) DEFAULT NULL,
  `code_type_4` bigint(20) DEFAULT NULL,
  `free_text_1` text DEFAULT NULL,
  `free_text_2` text DEFAULT NULL,
  `free_text_3` text DEFAULT NULL,
  `free_text_4` text DEFAULT NULL,
  `free_bool_1` tinyint(1) DEFAULT NULL,
  `free_bool_2` tinyint(1) DEFAULT NULL,
  `free_bool_3` tinyint(1) DEFAULT NULL,
  `free_bool_4` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_app_parameters_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `area_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `region_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_area_types_on_region_type_id` (`region_type_id`),
  KEY `index_area_types_on_code` (`code`),
  KEY `index_area_types_region_code` (`region_type_id`,`code`),
  CONSTRAINT `fk_rails_5b0a04454f` FOREIGN KEY (`region_type_id`) REFERENCES `region_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `arm_aux_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arm_aux_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_arm_aux_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `title` varchar(80) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `is_sticky` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_articles_on_title` (`title`),
  KEY `idx_articles_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `badge_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badge_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_manual` tinyint(1) DEFAULT NULL,
  `badge_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_badge_payments_on_badge_id` (`badge_id`),
  KEY `index_badge_payments_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `number` varchar(40) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `category_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `entry_time_type_id` int(11) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  `final_rank` int(11) DEFAULT NULL,
  `is_out_of_goggle_cup` tinyint(1) DEFAULT 0,
  `has_to_pay_fees` tinyint(1) NOT NULL DEFAULT 0,
  `has_to_pay_badge` tinyint(1) NOT NULL DEFAULT 0,
  `has_to_pay_relays` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_badges_on_number` (`number`),
  KEY `fk_badges_seasons` (`season_id`),
  KEY `fk_badges_swimmers` (`swimmer_id`),
  KEY `fk_badges_teams` (`team_id`),
  KEY `fk_badges_category_types` (`category_type_id`),
  KEY `fk_badges_entry_time_types` (`entry_time_type_id`),
  KEY `fk_badges_team_affiliations` (`team_affiliation_id`),
  KEY `idx_badges_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126577 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `base_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_movements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `is_arm_aux_allowed` tinyint(1) DEFAULT 0,
  `is_kick_aux_allowed` tinyint(1) DEFAULT 0,
  `is_body_aux_allowed` tinyint(1) DEFAULT 0,
  `is_breath_aux_allowed` tinyint(1) DEFAULT 0,
  `movement_type_id` int(11) DEFAULT NULL,
  `stroke_type_id` int(11) DEFAULT NULL,
  `movement_scope_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_base_movements_on_code` (`code`),
  KEY `fk_base_movements_movement_types` (`movement_type_id`),
  KEY `fk_base_movements_stroke_types` (`stroke_type_id`),
  KEY `fk_base_movements_movement_scope_types` (`movement_scope_type_id`),
  KEY `idx_base_movements_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `body_aux_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body_aux_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_body_aux_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `breath_aux_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `breath_aux_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_breath_aux_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `category_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(7) DEFAULT NULL,
  `federation_code` varchar(2) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `short_name` varchar(50) DEFAULT NULL,
  `group_name` varchar(50) DEFAULT NULL,
  `age_begin` mediumint(9) DEFAULT NULL,
  `age_end` mediumint(9) DEFAULT NULL,
  `is_a_relay` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `is_undivided` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `season_and_code` (`season_id`,`is_a_relay`,`code`),
  KEY `federation_code` (`federation_code`,`is_a_relay`)
) ENGINE=InnoDB AUTO_INCREMENT=1328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `area_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_on_name` (`name`),
  KEY `index_cities_on_zip` (`zip`),
  KEY `idx_cities_user` (`user_id`),
  KEY `index_cities_on_area_type_id` (`area_type_id`),
  CONSTRAINT `fk_rails_df91d5b481` FOREIGN KEY (`area_type_id`) REFERENCES `area_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `coach_level_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach_level_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `level` mediumint(9) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_coach_level_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `entry_text` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `swimming_pool_review_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_swimming_pool_reviews` (`swimming_pool_review_id`),
  KEY `fk_comments_comments` (`comment_id`),
  KEY `idx_comments_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `computed_season_rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computed_season_rankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rank` int(11) DEFAULT 0,
  `total_points` decimal(10,2) DEFAULT 0.00,
  `team_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rank_x_season` (`season_id`,`rank`),
  KEY `teams_x_season` (`season_id`,`team_id`),
  KEY `fk_computed_season_rankings_teams` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `number` varchar(40) DEFAULT NULL,
  `data_import_swimmer_id` int(11) DEFAULT NULL,
  `data_import_team_id` int(11) DEFAULT NULL,
  `data_import_season_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `category_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entry_time_type_id` int(11) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_import_badges_on_number` (`number`),
  KEY `idx_di_badges_di_session` (`data_import_session_id`),
  KEY `idx_di_badges_di_swimmer` (`data_import_swimmer_id`),
  KEY `idx_di_badges_di_team` (`data_import_team_id`),
  KEY `idx_di_badges_di_season` (`data_import_season_id`),
  KEY `idx_di_badges_swimmer` (`swimmer_id`),
  KEY `idx_di_badges_team` (`team_id`),
  KEY `idx_di_badges_season` (`season_id`),
  KEY `idx_di_badges_category_type` (`category_type_id`),
  KEY `idx_di_badges_user` (`user_id`),
  KEY `idx_di_badges_entry_time_type` (`entry_time_type_id`),
  KEY `idx_di_badges_team_affiliation` (`team_affiliation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_import_cities_on_name` (`name`),
  KEY `index_data_import_cities_on_zip` (`zip`),
  KEY `idx_di_cities_di_session` (`data_import_session_id`),
  KEY `idx_di_cities_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meeting_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meeting_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `athlete_name` varchar(100) DEFAULT NULL,
  `team_name` varchar(60) DEFAULT NULL,
  `athlete_badge_number` varchar(40) DEFAULT NULL,
  `team_badge_number` varchar(40) DEFAULT NULL,
  `year_of_birth` int(11) DEFAULT 1900,
  `minutes` mediumint(9) DEFAULT NULL,
  `seconds` smallint(6) DEFAULT NULL,
  `hundreds` smallint(6) DEFAULT NULL,
  `is_no_time` tinyint(1) DEFAULT 0,
  `start_list_number` int(11) DEFAULT NULL,
  `lane_number` smallint(6) DEFAULT NULL,
  `heat_number` int(11) DEFAULT NULL,
  `heat_arrival_order` smallint(6) DEFAULT NULL,
  `data_import_meeting_program_id` int(11) DEFAULT NULL,
  `data_import_swimmer_id` int(11) DEFAULT NULL,
  `data_import_team_id` int(11) DEFAULT NULL,
  `data_import_badge_id` int(11) DEFAULT NULL,
  `meeting_program_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `entry_time_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_di_meeting_entries_di_session` (`data_import_session_id`),
  KEY `idx_di_meeting_entries_di_meeting_program` (`data_import_meeting_program_id`),
  KEY `idx_di_meeting_entries_di_swimmer` (`data_import_swimmer_id`),
  KEY `idx_di_meeting_entries_di_team` (`data_import_team_id`),
  KEY `idx_di_meeting_entries_di_badge` (`data_import_badge_id`),
  KEY `idx_di_meeting_entries_meeting_program` (`meeting_program_id`),
  KEY `idx_di_meeting_entries_swimmer` (`swimmer_id`),
  KEY `idx_di_meeting_entries_team` (`team_id`),
  KEY `idx_di_meeting_entries_team_affiliation` (`team_affiliation_id`),
  KEY `idx_di_meeting_entries_badge` (`badge_id`),
  KEY `idx_di_meeting_entries_entry_time_type` (`entry_time_type_id`),
  KEY `idx_di_meeting_entries_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meeting_individual_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meeting_individual_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `athlete_name` varchar(100) DEFAULT NULL,
  `team_name` varchar(60) DEFAULT NULL,
  `athlete_badge_number` varchar(40) DEFAULT NULL,
  `team_badge_number` varchar(40) DEFAULT NULL,
  `year_of_birth` int(11) DEFAULT 1900,
  `rank` int(11) DEFAULT 0,
  `is_play_off` tinyint(1) DEFAULT 0,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `is_disqualified` tinyint(1) DEFAULT 0,
  `standard_points` decimal(10,2) DEFAULT 0.00,
  `meeting_individual_points` decimal(10,2) DEFAULT 0.00,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `data_import_meeting_program_id` int(11) DEFAULT NULL,
  `meeting_program_id` int(11) DEFAULT NULL,
  `data_import_swimmer_id` int(11) DEFAULT NULL,
  `data_import_team_id` int(11) DEFAULT NULL,
  `data_import_badge_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `disqualification_code_type_id` int(11) DEFAULT NULL,
  `goggle_cup_points` decimal(10,2) DEFAULT 0.00,
  `reaction_time` decimal(5,2) DEFAULT 0.00,
  `team_points` decimal(10,2) DEFAULT 0.00,
  `team_affiliation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_di_mir_di_session` (`data_import_session_id`),
  KEY `idx_di_mir_di_meeting_program` (`data_import_meeting_program_id`),
  KEY `idx_di_mir_meeting_program` (`meeting_program_id`),
  KEY `idx_di_mir_di_swimmer` (`data_import_swimmer_id`),
  KEY `idx_di_mir_di_team` (`data_import_team_id`),
  KEY `idx_di_mir_di_badge` (`data_import_badge_id`),
  KEY `idx_di_mir_swimmer` (`swimmer_id`),
  KEY `idx_di_mir_team` (`team_id`),
  KEY `idx_di_mir_badge` (`badge_id`),
  KEY `idx_di_mir_user` (`user_id`),
  KEY `idx_di_mir_disqualification_code_type` (`disqualification_code_type_id`),
  KEY `idx_di_mir_team_affiliation` (`team_affiliation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meeting_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meeting_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `event_order` mediumint(9) DEFAULT 0,
  `begin_time` time DEFAULT NULL,
  `data_import_meeting_session_id` int(11) DEFAULT NULL,
  `meeting_session_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `category_type_id` int(11) DEFAULT NULL,
  `gender_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `heat_type_id` int(11) DEFAULT NULL,
  `time_standard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_event_type` (`meeting_session_id`,`event_type_id`),
  KEY `meeting_category_type` (`meeting_session_id`,`category_type_id`),
  KEY `meeting_gender_type` (`meeting_session_id`,`gender_type_id`),
  KEY `meeting_order` (`meeting_session_id`,`event_order`),
  KEY `idx_di_meeting_programs_di_session` (`data_import_session_id`),
  KEY `idx_di_meeting_programs_di_meeting_session` (`data_import_meeting_session_id`),
  KEY `idx_di_meeting_programs_user` (`user_id`),
  KEY `idx_di_meeting_programs_heat_type` (`heat_type_id`),
  KEY `idx_di_meeting_programs_time_standard` (`time_standard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meeting_relay_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meeting_relay_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT 0,
  `is_play_off` tinyint(1) DEFAULT 0,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `is_disqualified` tinyint(1) DEFAULT 0,
  `standard_points` decimal(10,2) DEFAULT 0.00,
  `meeting_points` decimal(10,2) DEFAULT 0.00,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `data_import_team_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_import_meeting_program_id` int(11) DEFAULT NULL,
  `meeting_program_id` int(11) DEFAULT NULL,
  `disqualification_code_type_id` int(11) DEFAULT NULL,
  `relay_header` varchar(60) DEFAULT '',
  `reaction_time` decimal(5,2) DEFAULT 0.00,
  `entry_minutes` mediumint(9) DEFAULT NULL,
  `entry_seconds` smallint(6) DEFAULT NULL,
  `entry_hundreds` smallint(6) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  `entry_time_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_di_mrr_di_session` (`data_import_session_id`),
  KEY `idx_di_mrr_di_team` (`data_import_team_id`),
  KEY `idx_di_mrr_team` (`team_id`),
  KEY `idx_di_mrr_user` (`user_id`),
  KEY `idx_di_mrr_di_meeting_program` (`data_import_meeting_program_id`),
  KEY `idx_di_mrr_meeting_program` (`meeting_program_id`),
  KEY `idx_di_mrr_disqualification_code_type` (`disqualification_code_type_id`),
  KEY `idx_di_mrr_team_affiliation` (`team_affiliation_id`),
  KEY `idx_di_mrr_entry_time_type` (`entry_time_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meeting_relay_swimmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meeting_relay_swimmers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` mediumint(9) DEFAULT 0,
  `import_text` varchar(255) NOT NULL,
  `reaction_time` decimal(5,2) DEFAULT NULL,
  `minutes` mediumint(9) DEFAULT NULL,
  `seconds` smallint(6) DEFAULT NULL,
  `hundreds` smallint(6) DEFAULT NULL,
  `relay_order` mediumint(9) DEFAULT 0,
  `data_import_swimmer_id` int(11) DEFAULT NULL,
  `data_import_team_id` int(11) DEFAULT NULL,
  `data_import_badge_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `stroke_type_id` int(11) DEFAULT NULL,
  `meeting_relay_result_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_import_meeting_relay_result_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_di_meeting_relay_swimmers_di_session` (`data_import_session_id`),
  KEY `idx_di_meeting_relay_swimmers_di_swimmer` (`data_import_swimmer_id`),
  KEY `idx_di_meeting_relay_swimmers_di_team` (`data_import_team_id`),
  KEY `idx_di_meeting_relay_swimmers_di_badge` (`data_import_badge_id`),
  KEY `idx_di_meeting_relay_swimmers_swimmer` (`swimmer_id`),
  KEY `idx_di_meeting_relay_swimmers_badge` (`badge_id`),
  KEY `idx_di_meeting_relay_swimmers_stroke_type` (`stroke_type_id`),
  KEY `idx_di_meeting_relay_swimmers_meeting_relay_result` (`meeting_relay_result_id`),
  KEY `idx_di_meeting_relay_swimmers_user` (`user_id`),
  KEY `idx_di_meeting_relay_swimmers_di_meeting_relay_result` (`data_import_meeting_relay_result_id`),
  KEY `idx_di_meeting_relay_swimmers_team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meeting_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meeting_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `session_order` smallint(6) DEFAULT 0,
  `scheduled_date` date DEFAULT NULL,
  `warm_up_time` time DEFAULT NULL,
  `begin_time` time DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `data_import_meeting_id` int(11) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `swimming_pool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `day_part_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_import_meeting_sessions_on_scheduled_date` (`scheduled_date`),
  KEY `idx_di_meeting_sessions_di_session` (`data_import_session_id`),
  KEY `idx_di_meeting_sessions_di_meeting` (`data_import_meeting_id`),
  KEY `idx_di_meeting_sessions_meeting` (`meeting_id`),
  KEY `idx_di_meeting_sessions_swimming_pool` (`swimming_pool_id`),
  KEY `idx_di_meeting_sessions_user` (`user_id`),
  KEY `idx_di_meeting_sessions_day_part_type` (`day_part_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meeting_team_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meeting_team_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `sum_individual_points` decimal(10,2) DEFAULT 0.00,
  `sum_relay_points` decimal(10,2) DEFAULT 0.00,
  `data_import_team_id` int(11) DEFAULT NULL,
  `data_import_meeting_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `sum_team_points` decimal(10,2) DEFAULT 0.00,
  `meeting_individual_points` decimal(10,2) DEFAULT 0.00,
  `meeting_relay_points` decimal(10,2) DEFAULT 0.00,
  `meeting_team_points` decimal(10,2) DEFAULT 0.00,
  `season_individual_points` decimal(10,2) DEFAULT 0.00,
  `season_relay_points` decimal(10,2) DEFAULT 0.00,
  `season_team_points` decimal(10,2) DEFAULT 0.00,
  `season_id` int(11) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_di_meeting_team_scores_di_session` (`data_import_session_id`),
  KEY `idx_di_meeting_team_scores_di_team` (`data_import_team_id`),
  KEY `idx_di_meeting_team_scores_di_meeting` (`data_import_meeting_id`),
  KEY `idx_di_meeting_team_scores_team` (`team_id`),
  KEY `idx_di_meeting_team_scores_meeting` (`meeting_id`),
  KEY `idx_di_meeting_team_scores_user` (`user_id`),
  KEY `idx_di_meeting_team_scores_season` (`season_id`),
  KEY `idx_di_meeting_team_scores_team_affiliation` (`team_affiliation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `entry_deadline` date DEFAULT NULL,
  `has_warm_up_pool` tinyint(1) DEFAULT 0,
  `is_under_25_admitted` tinyint(1) DEFAULT 0,
  `reference_phone` varchar(40) DEFAULT NULL,
  `reference_e_mail` varchar(50) DEFAULT NULL,
  `reference_name` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `tag` varchar(20) DEFAULT NULL,
  `has_invitation` tinyint(1) DEFAULT 0,
  `has_start_list` tinyint(1) DEFAULT 0,
  `are_results_acquired` tinyint(1) DEFAULT 0,
  `max_individual_events` tinyint(4) DEFAULT 2,
  `configuration_file` varchar(50) DEFAULT NULL,
  `edition` mediumint(9) DEFAULT 0,
  `data_import_season_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `header_date` date DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `header_year` varchar(9) DEFAULT NULL,
  `max_individual_events_per_session` smallint(6) DEFAULT 2,
  `is_out_of_season` tinyint(1) DEFAULT 0,
  `edition_type_id` int(11) DEFAULT NULL,
  `timing_type_id` int(11) DEFAULT NULL,
  `individual_score_computation_type_id` int(11) DEFAULT NULL,
  `relay_score_computation_type_id` int(11) DEFAULT NULL,
  `team_score_computation_type_id` int(11) DEFAULT NULL,
  `meeting_score_computation_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_import_meetings_on_entry_deadline` (`entry_deadline`),
  KEY `idx_di_meetings_header_date` (`header_date`),
  KEY `idx_di_meetings_code` (`code`,`edition`),
  KEY `idx_di_meetings_di_session` (`data_import_session_id`),
  KEY `idx_di_meetings_di_season` (`data_import_season_id`),
  KEY `idx_di_meetings_season` (`season_id`),
  KEY `idx_di_meetings_user` (`user_id`),
  KEY `idx_di_meetings_edition_type` (`edition_type_id`),
  KEY `idx_di_meetings_timing_type` (`timing_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_passages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_passages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` mediumint(9) DEFAULT 0,
  `import_text` varchar(255) NOT NULL,
  `reaction_time` decimal(5,2) DEFAULT NULL,
  `minutes` mediumint(9) DEFAULT NULL,
  `seconds` smallint(6) DEFAULT NULL,
  `hundreds` smallint(6) DEFAULT NULL,
  `stroke_cycles` mediumint(9) DEFAULT NULL,
  `not_swam_part_seconds` smallint(6) DEFAULT NULL,
  `not_swam_part_hundreds` smallint(6) DEFAULT NULL,
  `not_swam_kick_number` smallint(6) DEFAULT NULL,
  `breath_number` mediumint(9) DEFAULT NULL,
  `position` mediumint(9) DEFAULT NULL,
  `minutes_from_start` mediumint(9) DEFAULT NULL,
  `seconds_from_start` smallint(6) DEFAULT NULL,
  `hundreds_from_start` smallint(6) DEFAULT NULL,
  `is_native_from_start` tinyint(1) DEFAULT 0,
  `passage_type_id` int(11) DEFAULT NULL,
  `data_import_meeting_program_id` int(11) DEFAULT NULL,
  `data_import_meeting_individual_result_id` int(11) DEFAULT NULL,
  `data_import_meeting_entry_id` int(11) DEFAULT NULL,
  `data_import_swimmer_id` int(11) DEFAULT NULL,
  `data_import_team_id` int(11) DEFAULT NULL,
  `meeting_program_id` int(11) DEFAULT NULL,
  `meeting_individual_result_id` int(11) DEFAULT NULL,
  `meeting_entry_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_di_passages_di_session` (`data_import_session_id`),
  KEY `idx_di_passages_di_meeting_program` (`data_import_meeting_program_id`),
  KEY `idx_di_passages_meeting_program` (`meeting_program_id`),
  KEY `idx_di_passages_passage_type` (`passage_type_id`),
  KEY `idx_di_passages_di_meeting_individual_result` (`data_import_meeting_individual_result_id`),
  KEY `idx_di_passages_di_meeting_entry` (`data_import_meeting_entry_id`),
  KEY `idx_di_passages_di_swimmer` (`data_import_swimmer_id`),
  KEY `idx_di_passages_di_team` (`data_import_team_id`),
  KEY `idx_di_passages_meeting_individual_result` (`meeting_individual_result_id`),
  KEY `idx_di_passages_meeting_entry` (`meeting_entry_id`),
  KEY `idx_di_passages_swimmer` (`swimmer_id`),
  KEY `idx_di_passages_team` (`team_id`),
  KEY `idx_di_passages_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `season_type_id` int(11) DEFAULT NULL,
  `header_year` varchar(9) DEFAULT NULL,
  `edition` mediumint(9) DEFAULT 0,
  `edition_type_id` int(11) DEFAULT NULL,
  `timing_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_import_seasons_on_begin_date` (`begin_date`),
  KEY `idx_di_seasons_di_session` (`data_import_session_id`),
  KEY `idx_di_seasons_season_type` (`season_type_id`),
  KEY `idx_di_seasons_edition_type` (`edition_type_id`),
  KEY `idx_di_seasons_timing_type` (`timing_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `source_data` mediumtext DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `total_data_rows` int(11) DEFAULT NULL,
  `file_format` varchar(255) DEFAULT NULL,
  `phase_1_log` mediumtext DEFAULT NULL,
  `phase_2_log` text DEFAULT NULL,
  `phase_3_log` mediumtext DEFAULT NULL,
  `data_import_season_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sql_diff` text DEFAULT NULL,
  `log_verbosity` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `idx_di_sessions_di_season` (`data_import_season_id`),
  KEY `idx_di_sessions_season` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_swimmer_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_swimmer_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `complete_name` varchar(100) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_swimmer_id_complete_name` (`swimmer_id`,`complete_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1655 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_swimmer_analysis_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_swimmer_analysis_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `analysis_log_text` mediumtext DEFAULT NULL,
  `sql_text` mediumtext DEFAULT NULL,
  `searched_swimmer_name` varchar(100) DEFAULT NULL,
  `chosen_swimmer_id` int(11) DEFAULT NULL,
  `match_name` varchar(60) DEFAULT NULL,
  `match_score` decimal(10,4) DEFAULT 0.0000,
  `best_match_name` varchar(60) DEFAULT NULL,
  `best_match_score` decimal(10,4) DEFAULT 0.0000,
  `desired_year_of_birth` int(11) DEFAULT 1900,
  `desired_gender_type_id` bigint(20) DEFAULT NULL,
  `max_year_of_birth` int(11) DEFAULT NULL,
  `category_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_di_session_swimmer_name` (`data_import_session_id`,`searched_swimmer_name`,`desired_year_of_birth`,`desired_gender_type_id`),
  KEY `idx_di_swimmer_gender_type` (`desired_gender_type_id`),
  KEY `idx_di_swimmer_analysis_results_category_type` (`category_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_swimmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_swimmers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `year_of_birth` int(11) DEFAULT 1900,
  `gender_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `complete_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `full_name` (`last_name`,`first_name`),
  KEY `index_data_import_swimmers_on_complete_name` (`complete_name`),
  KEY `idx_di_swimmers_di_session` (`data_import_session_id`),
  KEY `idx_di_swimmers_gender_type` (`gender_type_id`),
  KEY `idx_di_swimmers_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_team_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_team_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_team_id_name` (`team_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1449 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_team_analysis_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_team_analysis_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `analysis_log_text` mediumtext DEFAULT NULL,
  `sql_text` text DEFAULT NULL,
  `searched_team_name` varchar(60) DEFAULT NULL,
  `desired_season_id` int(11) DEFAULT NULL,
  `chosen_team_id` int(11) DEFAULT NULL,
  `team_match_name` varchar(60) DEFAULT NULL,
  `team_match_score` decimal(10,4) DEFAULT 0.0000,
  `best_match_name` varchar(60) DEFAULT NULL,
  `best_match_score` decimal(10,4) DEFAULT 0.0000,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_di_session_name_and_season` (`data_import_session_id`,`searched_team_name`,`desired_season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `data_import_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_import_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `data_import_session_id` int(11) DEFAULT NULL,
  `conflicting_id` bigint(20) DEFAULT 0,
  `import_text` varchar(255) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `badge_number` varchar(40) DEFAULT NULL,
  `data_import_city_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_data_import_teams_on_name` (`name`),
  KEY `city_id` (`city_id`),
  KEY `data_import_city_id` (`data_import_city_id`),
  KEY `idx_di_teams_di_session` (`data_import_session_id`),
  KEY `idx_di_teams_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `day_part_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_part_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_day_part_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `day_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `week_order` mediumint(9) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_day_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT 0,
  `attempts` int(11) DEFAULT 0,
  `handler` text DEFAULT NULL,
  `last_error` text DEFAULT NULL,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4867 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `disqualification_code_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disqualification_code_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `is_a_relay` tinyint(1) DEFAULT 0,
  `stroke_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`is_a_relay`,`code`),
  KEY `index_disqualification_code_types_on_is_a_relay` (`is_a_relay`),
  KEY `idx_disqualification_code_types_stroke_type` (`stroke_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `edition_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edition_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_edition_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `entry_time_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry_time_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_entry_time_types_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(10) DEFAULT NULL,
  `length_in_meters` bigint(20) DEFAULT NULL,
  `is_a_relay` tinyint(1) DEFAULT 0,
  `stroke_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `style_order` smallint(6) DEFAULT 0,
  `is_mixed_gender` tinyint(1) DEFAULT 0,
  `partecipants` smallint(6) DEFAULT 4,
  `phases` smallint(6) DEFAULT 4,
  `phase_length_in_meters` mediumint(9) DEFAULT 50,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`is_a_relay`,`code`),
  KEY `index_event_types_on_is_a_relay` (`is_a_relay`),
  KEY `fk_event_types_stroke_types` (`stroke_type_id`),
  KEY `index_event_types_on_style_order` (`style_order`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `events_by_pool_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events_by_pool_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `pool_type_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_events_by_pool_types_pool_types` (`pool_type_id`),
  KEY `fk_events_by_pool_types_event_types` (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `execution_note_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_note_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_execution_note_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exercise_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `part_order` mediumint(9) DEFAULT 0,
  `percentage` mediumint(9) DEFAULT 0,
  `start_and_rest` int(11) DEFAULT 0,
  `pause` int(11) DEFAULT 0,
  `exercise_id` int(11) DEFAULT NULL,
  `base_movement_id` int(11) DEFAULT NULL,
  `training_mode_type_id` int(11) DEFAULT NULL,
  `execution_note_type_id` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_exercise_rows_part_order` (`exercise_id`,`part_order`),
  KEY `fk_exercise_rows_base_movements` (`base_movement_id`),
  KEY `fk_exercise_rows_training_mode_types` (`training_mode_type_id`),
  KEY `fk_exercise_rows_execution_note_types` (`execution_note_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `training_step_type_codes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_exercises_on_code` (`code`),
  KEY `idx_exercises_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `federation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(4) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_federation_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `fin_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fin_calendars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `calendar_date` varchar(255) DEFAULT NULL,
  `calendar_name` varchar(255) DEFAULT NULL,
  `calendar_place` varchar(255) DEFAULT NULL,
  `fin_manifest_code` varchar(255) DEFAULT NULL,
  `fin_startlist_code` varchar(255) DEFAULT NULL,
  `fin_results_code` varchar(255) DEFAULT NULL,
  `goggles_meeting_code` varchar(255) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `calendar_year` varchar(4) DEFAULT NULL,
  `calendar_month` varchar(20) DEFAULT NULL,
  `results_link` varchar(255) DEFAULT NULL,
  `startlist_link` varchar(255) DEFAULT NULL,
  `manifest_link` varchar(255) DEFAULT NULL,
  `manifest` text DEFAULT NULL,
  `name_import_text` text DEFAULT NULL,
  `organization_import_text` text DEFAULT NULL,
  `place_import_text` text DEFAULT NULL,
  `dates_import_text` text DEFAULT NULL,
  `program_import_text` text DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `do_not_update` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_fin_calendars_on_season_id` (`season_id`),
  KEY `index_fin_calendars_on_user_id` (`user_id`),
  KEY `index_fin_calendars_on_goggles_meeting_code` (`goggles_meeting_code`),
  KEY `index_fin_calendars_on_meeting_id` (`meeting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=829 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friendable_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `blocker_id` int(11) DEFAULT NULL,
  `pending` tinyint(1) DEFAULT 1,
  `shares_passages` tinyint(1) DEFAULT 0,
  `shares_trainings` tinyint(1) DEFAULT 0,
  `shares_calendars` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_friendships_on_friendable_id_and_friend_id` (`friendable_id`,`friend_id`)
) ENGINE=InnoDB AUTO_INCREMENT=634 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `gender_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_gender_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `goggle_cup_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goggle_cup_definitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `goggle_cup_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_goggle_cup_definitions_goggle_cups` (`goggle_cup_id`),
  KEY `fk_goggle_cup_definitions_seasons` (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `goggle_cup_standards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goggle_cup_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `event_type_id` int(11) DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reaction_time` decimal(5,2) DEFAULT 0.00,
  `goggle_cup_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_goggle_cup_standards_goggle_cup_swimmer_pool_event` (`goggle_cup_id`,`swimmer_id`,`pool_type_id`,`event_type_id`),
  KEY `fk_goggle_cup_standards_goggle_cups` (`goggle_cup_id`),
  KEY `fk_goggle_cup_standards_event_types` (`event_type_id`),
  KEY `fk_goggle_cup_standards_pool_types` (`pool_type_id`),
  KEY `fk_goggle_cup_standards_swimmers` (`swimmer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14535 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `goggle_cups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goggle_cups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `description` varchar(60) DEFAULT NULL,
  `season_year` int(11) DEFAULT 2010,
  `max_points` int(11) DEFAULT 1000,
  `team_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `max_performance` smallint(6) DEFAULT 5,
  `is_limited_to_season_types_defined` tinyint(1) NOT NULL DEFAULT 0,
  `end_date` date DEFAULT NULL,
  `age_for_negative_modifier` int(11) DEFAULT 20,
  `negative_modifier` decimal(10,2) DEFAULT -10.00,
  `age_for_positive_modifier` int(11) DEFAULT 60,
  `positive_modifier` decimal(10,2) DEFAULT 5.00,
  `has_to_create_standards` tinyint(1) DEFAULT 1,
  `has_to_update_standards` tinyint(1) DEFAULT 0,
  `pre_calculation_sql` text DEFAULT NULL,
  `post_calculation_sql` text DEFAULT NULL,
  `is_team_limited` tinyint(1) DEFAULT 1,
  `career_step` int(11) DEFAULT 100,
  `career_bonus` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `idx_season_year` (`season_year`),
  KEY `fk_goggle_cups_teams` (`team_id`),
  KEY `idx_goggle_cups_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `hair_dryer_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hair_dryer_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_hair_dryer_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `heat_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heat_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_default_value` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_heat_types_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `individual_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `individual_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `category_type_id` int(11) DEFAULT NULL,
  `gender_type_id` int(11) DEFAULT NULL,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `is_team_record` tinyint(1) DEFAULT 0,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `federation_type_id` int(11) DEFAULT NULL,
  `meeting_individual_result_id` int(11) DEFAULT NULL,
  `record_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_individual_records_record_types` (`record_type_id`),
  KEY `idx_individual_records_pool_type` (`pool_type_id`),
  KEY `idx_individual_records_event_type` (`event_type_id`),
  KEY `idx_individual_records_category_type` (`category_type_id`),
  KEY `idx_individual_records_gender_type` (`gender_type_id`),
  KEY `idx_individual_records_swimmer` (`swimmer_id`),
  KEY `idx_individual_records_team` (`team_id`),
  KEY `idx_individual_records_season` (`season_id`),
  KEY `idx_individual_records_federation_type` (`federation_type_id`),
  KEY `idx_individual_records_meeting_individual_result` (`meeting_individual_result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=266693 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `kick_aux_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kick_aux_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_kick_aux_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `locker_cabinet_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locker_cabinet_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_locker_cabinet_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `medal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medal_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rank` int(11) DEFAULT 0,
  `weigth` int(11) DEFAULT 0,
  `image_uri` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_medal_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_list_number` int(11) DEFAULT NULL,
  `lane_number` smallint(6) DEFAULT NULL,
  `heat_number` int(11) DEFAULT NULL,
  `heat_arrival_order` smallint(6) DEFAULT NULL,
  `meeting_program_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `entry_time_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `minutes` mediumint(9) DEFAULT NULL,
  `seconds` smallint(6) DEFAULT NULL,
  `hundreds` smallint(6) DEFAULT NULL,
  `is_no_time` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_meeting_entries_meeting_program` (`meeting_program_id`),
  KEY `idx_meeting_entries_swimmer` (`swimmer_id`),
  KEY `idx_meeting_entries_team` (`team_id`),
  KEY `idx_meeting_entries_team_affiliation` (`team_affiliation_id`),
  KEY `idx_meeting_entries_badge` (`badge_id`),
  KEY `idx_meeting_entries_entry_time_type` (`entry_time_type_id`),
  KEY `idx_meeting_entries_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12742 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_event_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_event_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `meeting_event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `suggested_minutes` mediumint(9) DEFAULT NULL,
  `suggested_seconds` smallint(6) DEFAULT NULL,
  `suggested_hundreds` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_doing_this` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `index_meeting_event_reservations_on_meeting_id` (`meeting_id`),
  KEY `index_meeting_event_reservations_on_team_id` (`team_id`),
  KEY `index_meeting_event_reservations_on_swimmer_id` (`swimmer_id`),
  KEY `index_meeting_event_reservations_on_badge_id` (`badge_id`),
  KEY `index_meeting_event_reservations_on_meeting_event_id` (`meeting_event_id`),
  KEY `index_meeting_event_reservations_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_0af8d54bdb` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`),
  CONSTRAINT `fk_rails_322431943b` FOREIGN KEY (`swimmer_id`) REFERENCES `swimmers` (`id`),
  CONSTRAINT `fk_rails_6cc7a28bdd` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`),
  CONSTRAINT `fk_rails_c051a7f1bb` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_e8541cd824` FOREIGN KEY (`meeting_event_id`) REFERENCES `meeting_events` (`id`),
  CONSTRAINT `fk_rails_f9b61694b4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19530 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `event_order` mediumint(9) DEFAULT 0,
  `begin_time` time DEFAULT NULL,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `is_autofilled` tinyint(1) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `meeting_session_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `heat_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `has_separate_gender_start_list` tinyint(1) DEFAULT 1,
  `has_separate_category_start_list` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_meeting_events_meeting_sessions` (`meeting_session_id`),
  KEY `fk_meeting_events_event_types` (`event_type_id`),
  KEY `fk_meeting_events_heat_types` (`heat_type_id`),
  KEY `idx_meeting_events_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20098 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_individual_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_individual_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `is_play_off` tinyint(1) DEFAULT 0,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `is_disqualified` tinyint(1) DEFAULT 0,
  `standard_points` decimal(10,2) DEFAULT 0.00,
  `meeting_individual_points` decimal(10,2) DEFAULT 0.00,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `meeting_program_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `disqualification_code_type_id` int(11) DEFAULT NULL,
  `goggle_cup_points` decimal(10,2) DEFAULT 0.00,
  `reaction_time` decimal(5,2) DEFAULT 0.00,
  `team_points` decimal(10,2) DEFAULT 0.00,
  `team_affiliation_id` int(11) DEFAULT NULL,
  `is_personal_best` tinyint(1) NOT NULL DEFAULT 0,
  `is_season_type_best` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_meeting_individual_results_meeting_programs` (`meeting_program_id`),
  KEY `fk_meeting_individual_results_swimmers` (`swimmer_id`),
  KEY `fk_meeting_individual_results_teams` (`team_id`),
  KEY `fk_meeting_individual_results_badges` (`badge_id`),
  KEY `fk_meeting_individual_results_team_affiliations` (`team_affiliation_id`),
  KEY `idx_mir_user` (`user_id`),
  KEY `idx_mir_disqualification_code_type` (`disqualification_code_type_id`),
  KEY `idx_meeting_individual_results_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=843876 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `event_order` mediumint(9) DEFAULT 0,
  `category_type_id` int(11) DEFAULT NULL,
  `gender_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_autofilled` tinyint(1) DEFAULT 0,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `begin_time` time DEFAULT NULL,
  `meeting_event_id` int(11) DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `time_standard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_category_type` (`category_type_id`),
  KEY `meeting_gender_type` (`gender_type_id`),
  KEY `meeting_order` (`event_order`),
  KEY `fk_meeting_programs_meeting_events` (`meeting_event_id`),
  KEY `fk_meeting_programs_pool_types` (`pool_type_id`),
  KEY `fk_meeting_programs_time_standards` (`time_standard_id`),
  KEY `idx_meeting_programs_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_relay_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_relay_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `meeting_event_id` int(11) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `is_doing_this` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meeting_relay_reservations_on_meeting_id` (`meeting_id`),
  KEY `index_meeting_relay_reservations_on_user_id` (`user_id`),
  KEY `index_meeting_relay_reservations_on_team_id` (`team_id`),
  KEY `index_meeting_relay_reservations_on_swimmer_id` (`swimmer_id`),
  KEY `index_meeting_relay_reservations_on_badge_id` (`badge_id`),
  KEY `index_meeting_relay_reservations_on_meeting_event_id` (`meeting_event_id`),
  CONSTRAINT `fk_rails_04ccf0080e` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_rails_2d3860ae23` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`),
  CONSTRAINT `fk_rails_46cb5618de` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_a15976fb75` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`),
  CONSTRAINT `fk_rails_adf945379a` FOREIGN KEY (`swimmer_id`) REFERENCES `swimmers` (`id`),
  CONSTRAINT `fk_rails_bd2a0aa40d` FOREIGN KEY (`meeting_event_id`) REFERENCES `meeting_events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2618 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_relay_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_relay_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rank` int(11) DEFAULT 0,
  `is_play_off` tinyint(1) DEFAULT 0,
  `is_out_of_race` tinyint(1) DEFAULT 0,
  `is_disqualified` tinyint(1) DEFAULT 0,
  `standard_points` decimal(10,2) DEFAULT 0.00,
  `meeting_points` decimal(10,2) DEFAULT 0.00,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `meeting_program_id` int(11) DEFAULT NULL,
  `disqualification_code_type_id` int(11) DEFAULT NULL,
  `relay_header` varchar(60) DEFAULT '',
  `reaction_time` decimal(5,2) DEFAULT 0.00,
  `entry_minutes` mediumint(9) DEFAULT NULL,
  `entry_seconds` smallint(6) DEFAULT NULL,
  `entry_hundreds` smallint(6) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  `entry_time_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_meeting_relay_results_teams` (`team_id`),
  KEY `results_x_relay` (`meeting_program_id`,`rank`),
  KEY `fk_meeting_relay_results_team_affiliations` (`team_affiliation_id`),
  KEY `fk_meeting_relay_results_entry_time_types` (`entry_time_type_id`),
  KEY `idx_mrr_user` (`user_id`),
  KEY `idx_mrr_disqualification_code_type` (`disqualification_code_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_relay_swimmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_relay_swimmers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `relay_order` mediumint(9) DEFAULT 0,
  `swimmer_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `stroke_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reaction_time` decimal(5,2) DEFAULT 0.00,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `meeting_relay_result_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_meeting_relay_swimmers_swimmers` (`swimmer_id`),
  KEY `fk_meeting_relay_swimmers_badges` (`badge_id`),
  KEY `fk_meeting_relay_swimmers_stroke_types` (`stroke_type_id`),
  KEY `relay_order` (`relay_order`),
  KEY `fk_meeting_relay_swimmers_meeting_relay_results` (`meeting_relay_result_id`),
  KEY `idx_meeting_relay_swimmers_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2330 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `is_not_coming` tinyint(1) DEFAULT NULL,
  `has_confirmed` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meeting_reservations_on_meeting_id` (`meeting_id`),
  KEY `index_meeting_reservations_on_user_id` (`user_id`),
  KEY `index_meeting_reservations_on_team_id` (`team_id`),
  KEY `index_meeting_reservations_on_swimmer_id` (`swimmer_id`),
  KEY `index_meeting_reservations_on_badge_id` (`badge_id`),
  CONSTRAINT `fk_rails_3ad1c5f3de` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_rails_4082a84a07` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_449dc9078e` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`),
  CONSTRAINT `fk_rails_54be3a08b1` FOREIGN KEY (`swimmer_id`) REFERENCES `swimmers` (`id`),
  CONSTRAINT `fk_rails_bc62b0fc13` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `session_order` smallint(6) DEFAULT 0,
  `scheduled_date` date DEFAULT NULL,
  `warm_up_time` time DEFAULT NULL,
  `begin_time` time DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `swimming_pool_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_autofilled` tinyint(1) DEFAULT 0,
  `day_part_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meeting_sessions_on_scheduled_date` (`scheduled_date`),
  KEY `fk_meeting_sessions_meetings` (`meeting_id`),
  KEY `fk_meeting_sessions_swimming_pools` (`swimming_pool_id`),
  KEY `fk_meeting_sessions_day_part_types` (`day_part_type_id`),
  KEY `idx_meeting_sessions_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3309 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meeting_team_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_team_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `sum_individual_points` decimal(10,2) DEFAULT 0.00,
  `sum_relay_points` decimal(10,2) DEFAULT 0.00,
  `team_id` int(11) DEFAULT NULL,
  `meeting_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rank` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `sum_team_points` decimal(10,2) DEFAULT 0.00,
  `meeting_individual_points` decimal(10,2) DEFAULT 0.00,
  `meeting_relay_points` decimal(10,2) DEFAULT 0.00,
  `meeting_team_points` decimal(10,2) DEFAULT 0.00,
  `season_individual_points` decimal(10,2) DEFAULT 0.00,
  `season_relay_points` decimal(10,2) DEFAULT 0.00,
  `season_team_points` decimal(10,2) DEFAULT 0.00,
  `season_id` int(11) DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_x_meeting` (`meeting_id`,`team_id`),
  KEY `fk_meeting_team_scores_teams` (`team_id`),
  KEY `fk_meeting_team_scores_seasons` (`season_id`),
  KEY `fk_meeting_team_scores_team_affiliations` (`team_affiliation_id`),
  KEY `idx_meeting_team_scores_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `description` varchar(100) DEFAULT NULL,
  `entry_deadline` date DEFAULT NULL,
  `has_warm_up_pool` tinyint(1) DEFAULT 0,
  `is_under_25_admitted` tinyint(1) DEFAULT 0,
  `reference_phone` varchar(40) DEFAULT NULL,
  `reference_e_mail` varchar(50) DEFAULT NULL,
  `reference_name` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `has_invitation` tinyint(1) DEFAULT 0,
  `has_start_list` tinyint(1) DEFAULT 0,
  `are_results_acquired` tinyint(1) DEFAULT 0,
  `max_individual_events` tinyint(4) DEFAULT 2,
  `configuration_file` varchar(255) DEFAULT NULL,
  `edition` mediumint(9) DEFAULT 0,
  `season_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_autofilled` tinyint(1) DEFAULT 0,
  `header_date` date DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `header_year` varchar(9) DEFAULT NULL,
  `max_individual_events_per_session` smallint(6) DEFAULT 2,
  `is_out_of_season` tinyint(1) DEFAULT 0,
  `edition_type_id` int(11) DEFAULT NULL,
  `timing_type_id` int(11) DEFAULT NULL,
  `individual_score_computation_type_id` int(11) DEFAULT NULL,
  `relay_score_computation_type_id` int(11) DEFAULT NULL,
  `team_score_computation_type_id` int(11) DEFAULT NULL,
  `meeting_score_computation_type_id` int(11) DEFAULT NULL,
  `invitation` mediumtext DEFAULT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `is_tweeted` tinyint(1) DEFAULT 0,
  `is_fb_posted` tinyint(1) DEFAULT 0,
  `is_cancelled` tinyint(1) DEFAULT 0,
  `is_pb_scanned` tinyint(1) DEFAULT 0,
  `organization_team_id` bigint(20) DEFAULT NULL,
  `do_not_update` tinyint(1) NOT NULL DEFAULT 0,
  `meeting_fee` decimal(10,2) DEFAULT NULL,
  `event_fee` decimal(10,2) DEFAULT NULL,
  `relay_fee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_meetings_on_entry_deadline` (`entry_deadline`),
  KEY `fk_meetings_seasons` (`season_id`),
  KEY `idx_meetings_header_date` (`header_date`),
  KEY `idx_meetings_code` (`code`,`edition`),
  KEY `fk_meetings_edition_types` (`edition_type_id`),
  KEY `fk_meetings_timing_types` (`timing_type_id`),
  KEY `fk_meetings_score_individual_score_computation_types` (`individual_score_computation_type_id`),
  KEY `fk_meetings_score_relay_score_computation_types` (`relay_score_computation_type_id`),
  KEY `fk_meetings_score_team_score_computation_types` (`team_score_computation_type_id`),
  KEY `fk_meetings_score_meeting_score_computation_types` (`meeting_score_computation_type_id`),
  KEY `idx_meetings_user` (`user_id`),
  KEY `index_meetings_on_organization_team_id` (`organization_team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19318 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `movement_scope_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movement_scope_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_movement_scope_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `movement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movement_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_movement_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `nation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(3) DEFAULT NULL,
  `numeric_code` varchar(3) DEFAULT NULL,
  `alpha2_code` varchar(2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_nation_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `news_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `is_friend_activity` tinyint(1) DEFAULT 0,
  `is_achievement` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_news_feeds_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `passage_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passage_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(6) DEFAULT NULL,
  `length_in_meters` mediumint(9) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_passage_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `passages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `meeting_program_id` int(11) DEFAULT NULL,
  `passage_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reaction_time` decimal(5,2) DEFAULT NULL,
  `stroke_cycles` mediumint(9) DEFAULT NULL,
  `not_swam_part_seconds` smallint(6) DEFAULT NULL,
  `not_swam_part_hundreds` smallint(6) DEFAULT NULL,
  `not_swam_kick_number` smallint(6) DEFAULT NULL,
  `breath_number` mediumint(9) DEFAULT NULL,
  `position` mediumint(9) DEFAULT NULL,
  `minutes_from_start` mediumint(9) DEFAULT NULL,
  `seconds_from_start` smallint(6) DEFAULT NULL,
  `hundreds_from_start` smallint(6) DEFAULT NULL,
  `is_native_from_start` tinyint(1) DEFAULT 0,
  `meeting_individual_result_id` int(11) DEFAULT NULL,
  `meeting_entry_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passages_x_badges` (`meeting_program_id`),
  KEY `fk_passages_passage_types` (`passage_type_id`),
  KEY `idx_passages_user` (`user_id`),
  KEY `idx_passages_meeting_individual_result` (`meeting_individual_result_id`),
  KEY `idx_passages_meeting_entry` (`meeting_entry_id`),
  KEY `idx_passages_swimmer` (`swimmer_id`),
  KEY `idx_passages_team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9983 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `pool_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(3) DEFAULT NULL,
  `length_in_meters` mediumint(9) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_suitable_for_meetings` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pool_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `presence_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presence_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(1) DEFAULT NULL,
  `value` mediumint(9) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_presence_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `rails_admin_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rails_admin_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rails_admin_histories` (`item`,`table`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `record_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_for_swimmers` tinyint(1) DEFAULT 0,
  `is_for_teams` tinyint(1) DEFAULT 0,
  `is_for_seasons` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_record_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `region_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(3) DEFAULT NULL,
  `nation_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_region_types_on_nation_type_id` (`nation_type_id`),
  KEY `index_region_types_on_code` (`code`),
  KEY `index_region_types_nation_code` (`nation_type_id`,`code`),
  CONSTRAINT `fk_rails_c58317d1ac` FOREIGN KEY (`nation_type_id`) REFERENCES `nation_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) DEFAULT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `score_computation_type_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_computation_type_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `class_name` varchar(100) DEFAULT NULL,
  `method_name` varchar(100) DEFAULT NULL,
  `default_score` decimal(10,2) DEFAULT 0.00,
  `score_computation_type_id` int(11) DEFAULT NULL,
  `score_mapping_type_id` int(11) DEFAULT NULL,
  `computation_order` bigint(20) DEFAULT 0,
  `position_limit` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_score_computation_type_rows_score_computation_types` (`score_computation_type_id`),
  KEY `idx_score_computation_type_rows_computation_order` (`computation_order`),
  KEY `idx_score_computation_type_rows_score_mapping_type` (`score_mapping_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `score_computation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_computation_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_score_computation_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `score_mapping_type_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_mapping_type_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` bigint(20) DEFAULT 0,
  `score` decimal(10,2) DEFAULT 0.00,
  `score_mapping_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_score_mapping_type_rows_score_mapping_type` (`score_mapping_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `score_mapping_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `score_mapping_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_score_mapping_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `season_personal_standards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_personal_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `minutes` mediumint(9) NOT NULL DEFAULT 0,
  `seconds` smallint(6) NOT NULL DEFAULT 0,
  `hundreds` smallint(6) NOT NULL DEFAULT 0,
  `season_id` int(11) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_season_personal_standards_season_swimmer_event_pool` (`season_id`,`swimmer_id`,`pool_type_id`,`event_type_id`),
  KEY `idx_season_personal_standards_season_id` (`season_id`),
  KEY `idx_season_personal_standards_swimmer_id` (`swimmer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16279 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `season_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `short_name` varchar(40) DEFAULT NULL,
  `federation_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_season_types_on_code` (`code`),
  KEY `fk_season_types_federation_types` (`federation_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `description` varchar(100) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `season_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `header_year` varchar(9) DEFAULT NULL,
  `edition` mediumint(9) DEFAULT 0,
  `edition_type_id` int(11) DEFAULT NULL,
  `timing_type_id` int(11) DEFAULT NULL,
  `rules` mediumtext DEFAULT NULL,
  `has_individual_rank` tinyint(1) DEFAULT 1,
  `badge_fee` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seasons_on_begin_date` (`begin_date`),
  KEY `fk_seasons_season_types` (`season_type_id`),
  KEY `fk_seasons_edition_types` (`edition_type_id`),
  KEY `fk_seasons_timing_types` (`timing_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=60487 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `var` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_settings_on_var` (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `shower_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shower_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(3) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_shower_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `stroke_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stroke_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_eventable` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_stroke_types_on_code` (`code`),
  KEY `idx_is_eventable` (`is_eventable`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `swimmer_level_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimmer_level_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `level` mediumint(9) DEFAULT 0,
  `achievement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_swimmer_level_types_on_code` (`code`),
  KEY `idx_swimmer_level_types_achievement` (`achievement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `swimmer_season_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimmer_season_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `score` decimal(10,2) DEFAULT NULL,
  `badge_id` int(11) DEFAULT NULL,
  `meeting_individual_result_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_swimmer_season_scores_on_badge_id` (`badge_id`),
  KEY `index_swimmer_season_scores_on_meeting_individual_result_id` (`meeting_individual_result_id`),
  KEY `index_swimmer_season_scores_on_event_type_id` (`event_type_id`),
  KEY `index_swimmer_season_scores_on_user_id` (`user_id`),
  KEY `swimmer_season_scores_badge_event` (`badge_id`,`event_type_id`),
  KEY `swimmer_season_scores_badge_score` (`badge_id`,`score`),
  CONSTRAINT `fk_rails_1432a7d1c3` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`id`),
  CONSTRAINT `fk_rails_a56323b1df` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`),
  CONSTRAINT `fk_rails_cf50f33b35` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_da93d4e994` FOREIGN KEY (`meeting_individual_result_id`) REFERENCES `meeting_individual_results` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `swimmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimmers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `year_of_birth` int(11) DEFAULT 1900,
  `phone_mobile` varchar(40) DEFAULT NULL,
  `phone_number` varchar(40) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `nickname` varchar(25) DEFAULT '',
  `associated_user_id` bigint(20) DEFAULT NULL,
  `gender_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `complete_name` varchar(100) DEFAULT NULL,
  `is_year_guessed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_and_year` (`complete_name`,`year_of_birth`),
  KEY `full_name` (`last_name`,`first_name`),
  KEY `index_swimmers_on_nickname` (`nickname`),
  KEY `index_swimmers_on_associated_user_id` (`associated_user_id`),
  KEY `fk_swimmers_gender_types` (`gender_type_id`),
  KEY `index_swimmers_on_complete_name` (`complete_name`),
  KEY `idx_swimmers_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40699 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `swimming_pool_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_pool_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `title` varchar(100) DEFAULT NULL,
  `entry_text` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `swimming_pool_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_swimming_pool_reviews_on_title` (`title`),
  KEY `fk_swimming_pool_reviews_swimming_pools` (`swimming_pool_id`),
  KEY `idx_swimming_pool_reviews_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `swimming_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swimming_pools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(40) DEFAULT NULL,
  `fax_number` varchar(40) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `maps_uri` varchar(255) DEFAULT NULL,
  `lanes_number` smallint(6) DEFAULT 8,
  `has_multiple_pools` tinyint(1) DEFAULT 0,
  `has_open_area` tinyint(1) DEFAULT 0,
  `has_bar` tinyint(1) DEFAULT 0,
  `has_restaurant_service` tinyint(1) DEFAULT 0,
  `has_gym_area` tinyint(1) DEFAULT 0,
  `has_children_area` tinyint(1) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `shower_type_id` int(11) DEFAULT NULL,
  `hair_dryer_type_id` int(11) DEFAULT NULL,
  `locker_cabinet_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `do_not_update` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_swimming_pools_on_nick_name` (`nick_name`),
  KEY `index_swimming_pools_on_name` (`name`),
  KEY `fk_swimming_pools_cities` (`city_id`),
  KEY `fk_swimming_pools_pool_types` (`pool_type_id`),
  KEY `fk_swimming_pools_shower_types` (`shower_type_id`),
  KEY `fk_swimming_pools_hair_dryer_types` (`hair_dryer_type_id`),
  KEY `fk_swimming_pools_locker_cabinet_types` (`locker_cabinet_type_id`),
  KEY `idx_swimming_pools_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id` (`taggable_id`),
  KEY `index_taggings_on_taggable_type` (`taggable_type`),
  KEY `index_taggings_on_tagger_id` (`tagger_id`),
  KEY `index_taggings_on_context` (`context`),
  KEY `index_taggings_on_tagger_id_and_tagger_type` (`tagger_id`,`tagger_type`),
  KEY `taggings_idy` (`taggable_id`,`taggable_type`,`tagger_id`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=537 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `taggings_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `team_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_affiliations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `number` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `must_calculate_goggle_cup` tinyint(1) DEFAULT 0,
  `team_id` int(11) DEFAULT NULL,
  `season_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_autofilled` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_team_affiliations_seasons_teams` (`season_id`,`team_id`),
  KEY `index_team_affiliations_on_name` (`name`),
  KEY `fk_team_affiliations_teams` (`team_id`),
  KEY `index_team_affiliations_on_number` (`number`),
  KEY `idx_team_affiliations_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5826 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `team_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `team_affiliation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_manager_with_affiliation` (`team_affiliation_id`,`user_id`),
  KEY `index_team_managers_on_team_affiliation_id` (`team_affiliation_id`),
  KEY `index_team_managers_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `team_passage_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_passage_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `part_order` mediumint(9) DEFAULT 0,
  `has_subtotal` tinyint(1) DEFAULT 0,
  `has_cycle_count` tinyint(1) DEFAULT 0,
  `has_breath_count` tinyint(1) DEFAULT 0,
  `has_non_swam_part` tinyint(1) DEFAULT 0,
  `has_non_swam_kick_count` tinyint(1) DEFAULT 0,
  `has_passage_position` tinyint(1) DEFAULT 0,
  `team_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `passage_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_team_passage_templates_team` (`team_id`),
  KEY `idx_team_passage_templates_event_type` (`event_type_id`),
  KEY `idx_team_passage_templates_pool_type` (`pool_type_id`),
  KEY `idx_team_passage_templates_passage_type` (`passage_type_id`),
  KEY `idx_team_passage_templates_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `name` varchar(60) DEFAULT NULL,
  `editable_name` varchar(60) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `phone_mobile` varchar(40) DEFAULT NULL,
  `phone_number` varchar(40) DEFAULT NULL,
  `fax_number` varchar(40) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `name_variations` text DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `home_page_url` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_teams_on_name` (`name`),
  KEY `index_teams_on_editable_name` (`editable_name`),
  KEY `fk_teams_cities` (`city_id`),
  KEY `idx_teams_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1322 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `time_standards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `season_id` int(11) DEFAULT NULL,
  `gender_type_id` int(11) DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `event_type_id` int(11) DEFAULT NULL,
  `category_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_time_standards_seasons` (`season_id`),
  KEY `fk_time_standards_gender_types` (`gender_type_id`),
  KEY `fk_time_standards_pool_types` (`pool_type_id`),
  KEY `fk_time_standards_event_types` (`event_type_id`),
  KEY `fk_time_standards_category_types` (`category_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16510 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `timing_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timing_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `code` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_timing_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `training_mode_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_mode_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_training_mode_types_on_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `training_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `part_order` mediumint(9) DEFAULT 0,
  `times` mediumint(9) DEFAULT 0,
  `distance` int(11) DEFAULT 0,
  `start_and_rest` int(11) DEFAULT 0,
  `pause` int(11) DEFAULT 0,
  `training_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `training_step_type_id` int(11) DEFAULT NULL,
  `group_id` mediumint(9) DEFAULT 0,
  `group_times` mediumint(9) DEFAULT 0,
  `group_start_and_rest` int(11) DEFAULT 0,
  `group_pause` int(11) DEFAULT 0,
  `arm_aux_type_id` int(11) DEFAULT NULL,
  `kick_aux_type_id` int(11) DEFAULT NULL,
  `body_aux_type_id` int(11) DEFAULT NULL,
  `breath_aux_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_training_rows_part_order` (`training_id`,`part_order`),
  KEY `fk_training_exercises` (`exercise_id`),
  KEY `fk_training_rows_training_step_types` (`training_step_type_id`),
  KEY `index_training_rows_on_group_id_and_part_order` (`group_id`,`part_order`),
  KEY `fk_training_rows_arm_aux_types` (`arm_aux_type_id`),
  KEY `fk_training_rows_kick_aux_types` (`kick_aux_type_id`),
  KEY `fk_training_rows_body_aux_types` (`body_aux_type_id`),
  KEY `fk_training_rows_breath_aux_types` (`breath_aux_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `training_step_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_step_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(1) DEFAULT NULL,
  `step_order` mediumint(9) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_training_step_types_on_code` (`code`),
  KEY `index_training_step_types_on_step_order` (`step_order`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(100) DEFAULT '',
  `description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `min_swimmer_level` mediumint(9) DEFAULT 0,
  `max_swimmer_level` mediumint(9) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_trainings_on_title` (`title`),
  KEY `idx_trainings_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `achievement_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_achievements_on_user_id_and_achievement_id` (`user_id`,`achievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `standard_points` decimal(10,2) DEFAULT 0.00,
  `meeting_points` decimal(10,2) DEFAULT 0.00,
  `rank` bigint(20) DEFAULT 0,
  `is_disqualified` tinyint(1) DEFAULT 0,
  `minutes` mediumint(9) DEFAULT 0,
  `seconds` smallint(6) DEFAULT 0,
  `hundreds` smallint(6) DEFAULT 0,
  `swimmer_id` int(11) DEFAULT NULL,
  `category_type_id` int(11) DEFAULT NULL,
  `pool_type_id` int(11) DEFAULT NULL,
  `meeting_individual_result_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `disqualification_code_type_id` int(11) DEFAULT NULL,
  `description` varchar(60) DEFAULT '',
  `event_date` date DEFAULT NULL,
  `reaction_time` decimal(10,2) DEFAULT 0.00,
  `event_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meeting_id_rank` (`meeting_individual_result_id`,`rank`),
  KEY `fk_user_results_swimmers` (`swimmer_id`),
  KEY `fk_user_results_category_types` (`category_type_id`),
  KEY `fk_user_results_pool_types` (`pool_type_id`),
  KEY `fk_user_results_event_types` (`event_type_id`),
  KEY `idx_user_results_user` (`user_id`),
  KEY `idx_user_results_disqualification_code_type` (`disqualification_code_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_swimmer_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_swimmer_confirmations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `confirmator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_swimmer_confirmator` (`user_id`,`swimmer_id`,`confirmator_id`),
  KEY `index_user_swimmer_confirmations_on_confirmator_id` (`confirmator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_training_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_training_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `part_order` mediumint(9) DEFAULT 0,
  `times` mediumint(9) DEFAULT 0,
  `distance` int(11) DEFAULT 0,
  `start_and_rest` int(11) DEFAULT 0,
  `pause` int(11) DEFAULT 0,
  `group_id` mediumint(9) DEFAULT 0,
  `group_times` mediumint(9) DEFAULT 0,
  `group_start_and_rest` int(11) DEFAULT 0,
  `group_pause` int(11) DEFAULT 0,
  `user_training_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `training_step_type_id` int(11) DEFAULT NULL,
  `arm_aux_type_id` int(11) DEFAULT NULL,
  `kick_aux_type_id` int(11) DEFAULT NULL,
  `body_aux_type_id` int(11) DEFAULT NULL,
  `breath_aux_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_training_rows_part_order` (`user_training_id`,`part_order`),
  KEY `index_user_training_rows_on_group_id_and_part_order` (`group_id`,`part_order`),
  KEY `idx_user_training_rows_exercise` (`exercise_id`),
  KEY `idx_user_training_rows_training_step_type` (`training_step_type_id`),
  KEY `idx_user_training_rows_arm_aux_type` (`arm_aux_type_id`),
  KEY `idx_user_training_rows_kick_aux_type` (`kick_aux_type_id`),
  KEY `idx_user_training_rows_body_aux_type` (`body_aux_type_id`),
  KEY `idx_user_training_rows_breath_aux_type` (`breath_aux_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=714 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_training_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_training_stories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `swam_date` date DEFAULT NULL,
  `total_training_time` mediumint(9) DEFAULT 0,
  `notes` text DEFAULT NULL,
  `user_training_id` int(11) DEFAULT NULL,
  `swimming_pool_id` int(11) DEFAULT NULL,
  `swimmer_level_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_training_stories_on_user_training_id_and_swam_date` (`user_training_id`,`swam_date`),
  KEY `idx_user_training_stories_swimming_pool` (`swimming_pool_id`),
  KEY `idx_user_training_stories_swimmer_level_type` (`swimmer_level_type_id`),
  KEY `idx_user_training_stories_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `user_trainings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_trainings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(250) DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_trainings_on_user_id_and_description` (`user_id`,`description`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lock_version` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `swimmer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT '',
  `encrypted_password` varchar(255) DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT 0,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `failed_attempts` int(11) DEFAULT 0,
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `use_email_data_updates_notify` tinyint(1) DEFAULT 0,
  `use_email_achievements_notify` tinyint(1) DEFAULT 0,
  `use_email_newsletter_notify` tinyint(1) DEFAULT 0,
  `use_email_community_notify` tinyint(1) DEFAULT 0,
  `avatar_resource_filename` varchar(250) DEFAULT NULL,
  `swimmer_level_type_id` int(11) DEFAULT NULL,
  `coach_level_type_id` int(11) DEFAULT NULL,
  `authentication_token` varchar(255) DEFAULT NULL,
  `outstanding_goggle_score_bias` int(11) DEFAULT 800,
  `outstanding_standard_score_bias` int(11) DEFAULT 800,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `year_of_birth` int(11) DEFAULT 1900,
  `facebook_uid` bigint(20) DEFAULT NULL,
  `goggle_uid` bigint(20) DEFAULT NULL,
  `twitter_uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_name` (`name`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`),
  KEY `full_name` (`last_name`,`first_name`,`year_of_birth`),
  KEY `idx_users_swimmer` (`swimmer_id`),
  KEY `idx_users_swimmer_level_type` (`swimmer_level_type_id`),
  KEY `idx_users_coach_level_type` (`coach_level_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=732 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `votable_id` int(11) DEFAULT NULL,
  `votable_type` varchar(255) DEFAULT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `voter_type` varchar(255) DEFAULT NULL,
  `vote_flag` tinyint(1) DEFAULT NULL,
  `vote_scope` varchar(255) DEFAULT NULL,
  `vote_weight` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_votes_on_votable_id_and_votable_type` (`votable_id`,`votable_type`),
  KEY `index_votes_on_voter_id_and_voter_type` (`voter_id`,`voter_type`),
  KEY `index_votes_on_voter_id_and_voter_type_and_vote_scope` (`voter_id`,`voter_type`,`vote_scope`),
  KEY `index_votes_on_votable_id_and_votable_type_and_vote_scope` (`votable_id`,`votable_type`,`vote_scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `schema_migrations` (version) VALUES
('20130225190052'),
('20130225190534'),
('20130225190617'),
('20130225191016'),
('20130225191625'),
('20130225191634'),
('20130225191641'),
('20130225191742'),
('20130225191754'),
('20130225191818'),
('20130225191828'),
('20130225191837'),
('20130225191851'),
('20130225192043'),
('20130225192114'),
('20130225192148'),
('20130226104439'),
('20130226135131'),
('20130226135205'),
('20130227101346'),
('20130227101357'),
('20130227172702'),
('20130227172720'),
('20130227172733'),
('20130227172815'),
('20130227172825'),
('20130227172834'),
('20130708095118'),
('20130708095240'),
('20130708095358'),
('20130708095500'),
('20130708095528'),
('20130708095544'),
('20130708095645'),
('20130708095719'),
('20130709111920'),
('20130715123011'),
('20130716090917'),
('20130716090949'),
('20130716104131'),
('20130726134627'),
('20130919084655'),
('20130919084716'),
('20130919084741'),
('20130919084757'),
('20130919084800'),
('20130919084832'),
('20130919084912'),
('20130925094202'),
('20130925104237'),
('20130928003148'),
('20130928003801'),
('20130930084322'),
('20131003092305'),
('20131003092401'),
('20131003092512'),
('20131003092554'),
('20131007163201'),
('20131007163307'),
('20131007183110'),
('20131007183125'),
('20131008174752'),
('20131008174846'),
('20131008175041'),
('20131008175159'),
('20131008175226'),
('20131008175427'),
('20131008175532'),
('20131008175652'),
('20131008175822'),
('20131016235422'),
('20131018163237'),
('20131018163330'),
('20131018163414'),
('20131018163507'),
('20131018163520'),
('20131018163530'),
('20131018163540'),
('20131018163642'),
('20131021070000'),
('20131021070020'),
('20131021080109'),
('20131021080212'),
('20131021094032'),
('20131021094051'),
('20131021094101'),
('20131021094110'),
('20131021094120'),
('20131021094125'),
('20131021094130'),
('20131021094137'),
('20131021094150'),
('20131021094209'),
('20131021094222'),
('20131021094305'),
('20131021094344'),
('20131021094400'),
('20131021094426'),
('20131021094445'),
('20131021094503'),
('20131021094522'),
('20131021094536'),
('20131021094558'),
('20131021094620'),
('20131022160235'),
('20131023103343'),
('20131023113447'),
('20131023120254'),
('20131023120311'),
('20131023120322'),
('20131023120515'),
('20131023120652'),
('20131023165931'),
('20131024105521'),
('20131024122320'),
('20131024123846'),
('20131024123906'),
('20131025061949'),
('20131025062053'),
('20131025075700'),
('20131025080603'),
('20131025120618'),
('20131025120639'),
('20131025120658'),
('20131027172439'),
('20131027173203'),
('20131027173431'),
('20131027173631'),
('20131028163803'),
('20131028164025'),
('20131028164136'),
('20131028164201'),
('20131029092913'),
('20131029094806'),
('20131029103736'),
('20131029113102'),
('20131030164819'),
('20131104093129'),
('20131104093426'),
('20131105120755'),
('20131105120800'),
('20131105120845'),
('20131108233944'),
('20131110230256'),
('20131110230401'),
('20140110161023'),
('20140110161132'),
('20140110161451'),
('20140114114155'),
('20140114114307'),
('20140122101501'),
('20140122102927'),
('20140124150005'),
('20140124170257'),
('20140124190256'),
('20140127181423'),
('20140127181535'),
('20140127181613'),
('20140203174630'),
('20140203174708'),
('20140203174739'),
('20140214090816'),
('20140214095636'),
('20140214100303'),
('20140214110638'),
('20140217161530'),
('20140217161531'),
('20140218191028'),
('20140218191029'),
('20140218191030'),
('20140218191035'),
('20140218191040'),
('20140219150000'),
('20140219161530'),
('20140219164000'),
('20140220175333'),
('20140220191029'),
('20140220191030'),
('20140221214229'),
('20140221220705'),
('20140221221012'),
('20140221221232'),
('20140221221412'),
('20140221221530'),
('20140226130129'),
('20140226130430'),
('20140228095907'),
('20140228095953'),
('20140228131000'),
('20140228131030'),
('20140228131031'),
('20140228150157'),
('20140228150553'),
('20140228225657'),
('20140228230153'),
('20140320113029'),
('20140320130153'),
('20140320220944'),
('20140320223319'),
('20140407105013'),
('20140407120709'),
('20140407120828'),
('20140423113704'),
('20140423120000'),
('20140423141510'),
('20140506113232'),
('20140530173953'),
('20140604102620'),
('20140604102731'),
('20140604102837'),
('20140709150857'),
('20140709151837'),
('20140709162146'),
('20140709162307'),
('20140731184057'),
('20140731184807'),
('20140807154051'),
('20140807154318'),
('20140819141523'),
('20140819142050'),
('20140819142216'),
('20140825190846'),
('20140825193626'),
('20140825195157'),
('20140825195535'),
('20140825195738'),
('20140825195946'),
('20140825195959'),
('20140826081231'),
('20140826081547'),
('20140906173122'),
('20140906173627'),
('20140909133726'),
('20140909133849'),
('20140909161231'),
('20140909161617'),
('20141009084432'),
('20141018153900'),
('20141018155522'),
('20141018160236'),
('20141105143031'),
('20141105143032'),
('20141105150001'),
('20141127150848'),
('20141127151003'),
('20141129180000'),
('20141129180100'),
('20141212180209'),
('20141212180254'),
('20141212190100'),
('20150104212756'),
('20150122234130'),
('20150122234436'),
('20150205135706'),
('20150205184853'),
('20150623125355'),
('20150623125443'),
('20150623125543'),
('20150623154850'),
('20150824183432'),
('20150824184152'),
('20151023171131'),
('20151023171631'),
('20151104110820'),
('20151104123000'),
('20151104123001'),
('20151104123002'),
('20151104123003'),
('20151104123004'),
('20151104123005'),
('20151104124225'),
('20151104133100'),
('20151106182014'),
('20151106182310'),
('20151107164914'),
('20151107165010'),
('20151202094546'),
('20151202094913'),
('20151206194922'),
('20151206195126'),
('20151206195420'),
('20160205142705'),
('20160205143425'),
('20161126161939'),
('20161126162008'),
('20161126164243'),
('20161206100533'),
('20161206100650'),
('20161206101349'),
('20161206101432'),
('20161206101453'),
('20170205104912'),
('20170205105100'),
('20170205105918'),
('20170205110347'),
('20170205123022'),
('20170205140932'),
('20170205162132'),
('20170207182200'),
('20170207222924'),
('20170209000000'),
('20170322105927'),
('20170322120700'),
('20170322122633'),
('20170324094603'),
('20170324110129'),
('20180106195157'),
('20180106195500'),
('20180606132645'),
('20180606132934'),
('20180606133037'),
('20181215094412'),
('20181215103212'),
('20181215104937'),
('20190112092730'),
('20190112092856'),
('20190213194322'),
('20190213194658'),
('20200918172329');

