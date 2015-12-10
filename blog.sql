CREATE DATABASE blog CHARACTER SET utf8;

CREATE TABLE USER (
	user_id VARCHAR (100) NOT NULL UNIQUE,
	user_name VARCHAR (100),
	user_pwd VARCHAR (20),
	email VARCHAR (50),
	status bit,
	header blob,
	create_date TIMESTAMP
);

CREATE TABLE roles (
	role_id INT NOT NULL UNIQUE,
	role_name VARCHAR (100)
);

CREATE TABLE FUNCTION (
	function_id INT NOT NULL UNIQUE,
	function_name VARCHAR (100),
	parent_id INT
);

CREATE TABLE user_roles (
	user_id VARCHAR (100) NOT NULL,
	role_id INT NOT NULL
);

CREATE TABLE function_roles (
	function_id INT NOT NULL,
	role_id INT NOT NULL
);

CREATE TABLE category (
	category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id VARCHAR (50),
	category_name VARCHAR (100),
	category_order INT,
	status INT,
	create_date TIMESTAMP
);

-- category order field is auto_increment
CREATE TRIGGER category_order_trigger BEFORE INSERT ON category FOR EACH ROW
BEGIN
DECLARE c_order INT;
SET c_order = (
	SELECT
		(max(category_id) + 1)
	FROM
		category
);
SET NEW.category_order = c_order;
END;

CREATE TABLE articles (
	id VARCHAR (50) NOT NULL PRIMARY KEY,
	user_id VARCHAR (50),
	category_id INT,
	title VARCHAR (1000),
	type VARCHAR (100),
	content LONGTEXT,
	tags VARCHAR (1000),
	reference VARCHAR (1000),
	digest VARCHAR (1000),
	is_hide bit,
	allow_comment bit,
	auto_index bit,
	is_top bit,
	create_date TIMESTAMP,
	update_date TIMESTAMP,
	page_view bigint,
	article_order INT
);

CREATE TABLE article_attachment (
	id VARCHAR (36) UNIQUE, -- uuid
	user_id VARCHAR (50),
	file_type VARCHAR (20),
	file_name VARCHAR (200),
	content LONGBLOB,
	file_size LONG,
	upload_time TIMESTAMP
);

CREATE TABLE article_comment (
	comment_id INT,
	article_id INT,
	user_id VARCHAR (50),
	comment_content LONGTEXT,
	comment_date TIMESTAMP
);


insert into roles values(1,'ROLE_ADMIN');
insert into roles values(2,'ROLE_USER');

insert into function values(1,'test_function',null);
insert into function values(2,'user_role_function',null);

insert into function_roles values(1,1);
insert into function_roles values(2,2);