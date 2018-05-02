CREATE TABLE `poc_tables` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`facility_id` INT(11) NOT NULL,
	`district_id` INT(11) NOT NULL,
	`gender` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`age` FLOAT(8,2) NULL DEFAULT NULL,
	`exp_no` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`caretaker_number` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`entry_point` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`mother_name` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`provisional_diagnosis` TINYTEXT NULL COLLATE 'utf8_unicode_ci',
	`infant_pmtctarv` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`infant_name` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`breastfeeding_status` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`mother_hiv_status` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`collection_date` DATE NOT NULL,
	`received_by` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`dob` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`opdid` VARCHAR(50) NOT NULL COLLATE 'utf8_unicode_ci',
	`pcr_level` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`pmtctarv` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`clinician_phone` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`created_by` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`pmtct_antenatal` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`pmtct_delivery` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`pmtct_postnatal` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`admission_date` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`sample_id` VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`mother_pmtctarv` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`created_at` TIMESTAMP NULL DEFAULT NULL,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	`deleted_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=MyISAM
;
CREATE TABLE `poc_results` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`patient_id` INT(10) UNSIGNED NOT NULL,
	`results` ENUM('Negative','Positive','Error') NOT NULL COLLATE 'utf8_unicode_ci',
	`error_code` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`reviewed_by` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`review_date` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`testing_device` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_unicode_ci',
	`test_date` DATE NOT NULL,
	`test_time` TIME NOT NULL,
	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_at` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	INDEX `poc_results_patient_id_foreign` (`patient_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=MyISAM
;
