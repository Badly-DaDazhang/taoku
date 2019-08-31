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
CREATE TABLE tk_receiver_adderss(
	aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名
  is_default BOOLEAN          #是否为当前用户的默认收货地址

); 
/**购物车条目**/
CREATE TABLE tk_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);
/**商品家族镖 */
CREATE TABLE tk_goods_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32),
  img VARCHAR(128)
);
-- 添加家族分类数据
INSERT INTO tk_goods_family VALUES
  ('1001','家用电器','category-pic-888.jpg'),
  ('1002','手机数码','category-pic-430.jpg'),
  ('1003','电脑办公/图书/文娱','category-pic-730.jpg'),
  ('1004','美妆护肤/个人护理','category-pic-1244.jpg'),
  ('1005','女装/内衣/服饰配件','category-pic-256.jpg'),
  ('1006','男装/户外/运动用品','category-pic-1116.jpg'),
  ('1007','箱包皮具/男鞋/女鞋','category-pic-1117.jpg'),
  ('1008','珠宝首饰','category-pic-1483.jpg'),
  ('1009','母婴玩具','category-pic-959.jpg'),
  ('1010','食品生鲜/酒水/饮料','category-pic-593.jpg'),
  ('1011','医药保健/计生/情趣','category-pic-825.jpg'),
  ('1012','家居用品/家纺/餐具','category-pic-1057.jpg'),
  ('1013','家具建材/卫浴/灯饰','category-pic-530.jpg'),
  ('1014','汽车/汽车用品/装饰','category-pic-662.jpg'),
  ('1015','进口商品','category-pic-1065.jpg'),
  ('1016','超市/便利店/到家服务','category-pic-1757.jpg')
;
/**商品子家族分类 */
CREATE TABLE tk_goods_family_member(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT ,
  fname VARCHAR(32)
);

/**商品详情表**/
CREATE TABLE tk_goods(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属商品家族编号
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  sub_price DECIMAL(10,2),    #辅价格
  promise VARCHAR(64),        #服务承诺
  spec VARCHAR(64),           #规格/颜色
  evaluation INT ,						#商品测评数量
  gname VARCHAR(32),          #商品名称
  memory VARCHAR(32),         #内存容量
  resolution VARCHAR(32),     #分辨率
  video_card VARCHAR(32),     #显卡型号
  cpu VARCHAR(32),            #处理器
  video_memory VARCHAR(32),   #显存容量
  category VARCHAR(32),       #所属分类
  disk VARCHAR(32),           #硬盘容量及类型
  details VARCHAR(1024),      #产品详细说明

  shelf_time BIGINT,          #上架时间
  sold_count INT,             #已售出的数量
  is_onsale BOOLEAN           #是否促销中
);
/**商品图片**/
CREATE TABLE tk_goods_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);
CREATE TABLE tk_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

CREATE TABLE tk_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);