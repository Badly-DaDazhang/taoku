SET NAMES UTF8 ;
DROP DATABASE IF EXISTS taoku ;
CREATE DATABASE taoku CHARSET UTF8 ;
USE taoku ;
CREATE TABLE tk_user(
	uid INT PRIMARY KEY AUTO_INCREMENT ,
	user_name VARCHAR(12) ,
	email VARCHAR(32),
	uname varchar(12),
	phone VARCHAR(16),
	avatar VARCHAR(128),
	gender INT,
	qq_num VARCHAR(12),
	ali_num VARCHAR(32)
);
INSERT INTO tk_user VALUES(
	'10001','one','1760063136@123.com','张大大','15103862070','null',1,1760063166,15103862070
);

CREATE TABLE tk_index_carousel(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(64),
	title VARCHAR(32),
	href VARCHAR(64)
);
INSERT INTO tk_index_carousel VALUES
	('1','images/index/web-101-101-2.jpg','免费开网店，上淘库商城！','javascript:;'),
	('2','images/index/web-101-101-5.jpg','皇家龙船酒业品牌专营店','javascript:;'),
	('3','images/index/web-101-101-4.jpg','健康鼠智能品牌旗舰店','javascript:;'),
	('4','images/index/web-101-101-1.jpg','盛世无线充电品牌工厂店','javascript:;'),
	('5','images/index/web-101-101-3.jpg','邦辰生活品牌超级店','javascript:;')
;