CREATE TABLE `Library_Books` (
  `ISBN` varchar2 PRIMARY KEY,
  `Book_name` varchar2
);

CREATE TABLE `Borrowed_Books` (
  `id` integer PRIMARY KEY,
  `ISBN` varchar2,
  `lib_card_id` integer,
  `date_borrowed` date,
  `date_to_return` date,
  `is_late` boolean,
  `late_fee` currency
);

CREATE TABLE `Borrowers` (
  `lib_card_id` integer PRIMARY KEY,
  `borrower_name` varchar2,
  `borrower_st_num` integer,
  `borrower_st_add` varchar2,
  `borrower_zip` integer,
  `borrower_state` varchar2(2)
);

CREATE TABLE `Staff` (
  `staff_id` integer PRIMARY KEY,
  `first_name` varchar2,
  `last_name` varchar2
);

CREATE TABLE `Staff_Role` (
  `staff_role_id` integer PRIMARY KEY,
  `staff_id` integer,
  `role_name` varchar2
);

CREATE TABLE `Roles` (
  `role_name` varchar2 PRIMARY KEY,
  `role_description` varchar2
);

CREATE TABLE `Role_Privilege` (
  `role_privilege_id` integer PRIMARY KEY,
  `role_name` varchar2,
  `privilege_name` varchar2
);

CREATE TABLE `Privileges` (
  `privilege_name` varchar2 PRIMARY KEY,
  `privilege_description` varchar2
);

ALTER TABLE `Borrowed_Books` ADD CONSTRAINT `Borrowed_Books_Library_Books` FOREIGN KEY (`ISBN`) REFERENCES `Library_Books` (`ISBN`);

ALTER TABLE `Borrowed_Books` ADD CONSTRAINT `Borrowed_Books_Borrowers` FOREIGN KEY (`lib_card_id`) REFERENCES `Borrowers` (`lib_card_id`);

ALTER TABLE `Staff_Role` ADD CONSTRAINT `Staff_Role_Staff` FOREIGN KEY (`staff_id`) REFERENCES `Staff` (`staff_id`);

ALTER TABLE `Staff_Role` ADD CONSTRAINT `Staff_Role_Role` FOREIGN KEY (`role_name`) REFERENCES `Roles` (`role_name`);

ALTER TABLE `Role_Privilege` ADD CONSTRAINT `Role_Privilege_Role` FOREIGN KEY (`role_name`) REFERENCES `Roles` (`role_name`);

ALTER TABLE `Role_Privilege` ADD CONSTRAINT `Role_Privilege_Privilege` FOREIGN KEY (`privilege_name`) REFERENCES `Privileges` (`privilege_name`);
