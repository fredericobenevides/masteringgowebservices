ALTER TABLE `users`
 ADD UNIQUE INDEX `user_email` (`user_email`);

CREATE TABLE `users_relationships` (
  `users_relationship_id` INT(13) NOT NULL,
  `from_user_id` INT(10) NOT NULL,
  `to_user_id` INT(10) unsigned NOT NULL,
  `users_relationship_type` VARCHAR(10) NOT NULL,
  `users_relationship_timestamp` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_relationship_id`),
  INDEX `from_user_id` (`from_user_id`),
  INDEX `to_user_id` (`to_user_id`),
  INDEX `from_user_id_to_user_id` (`from_user_id`, `to_user_id`),
  INDEX `from_user_id_to_user_id_users_relationship_type` (`from_user_id`, `to_user_id`, `users_relationship_type`)
)
