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
	('1','images/index/web-101-101-2.jpg','免费开网店,上淘库商城！','set_up_shop.html'),
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
  is_checked BOOLEAN #是否已勾选,确定购买
);
/**商品家族镖 */
CREATE TABLE tk_goods_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32),
  img VARCHAR(128),
  hotgoods VARCHAR(128)
);
-- 添加家族分类数据
INSERT INTO tk_goods_family VALUES
  ('1001','家用电器','category-pic-888.jpg','热水器,电热毯,油烟机,消毒柜,绞肉机,小厨宝,其他'),
  ('1002','手机数码','category-pic-470.jpg','智能手表,智能手环,智能健康,智能家居'),
  ('1003','电脑办公/图书/文娱','category-pic-730.jpg',null),
  ('1004','美妆护肤/个人护理','category-pic-1244.jpg','洗发水,牙膏,牙刷'),
  ('1005','女装/内衣/服饰配件','category-pic-256.jpg',null),
  ('1006','男装/户外/运动用品','category-pic-1116.jpg',null),
  ('1007','箱包皮具/男鞋/女鞋','category-pic-1117.jpg',null),
  ('1008','珠宝首饰','category-pic-1483.jpg',null),
  ('1009','母婴玩具','category-pic-959.jpg',null),
  ('1010','食品生鲜/酒水/饮料','category-pic-593.jpg','休闲零食,饼干,巧克力,糕点点心'),
  ('1011','医药保健/计生/情趣','category-pic-825.jpg',null),
  ('1012','家居用品/家纺/餐具','category-pic-1057.jpg',null),
  ('1013','家具建材/卫浴/灯饰','category-pic-530.jpg',null),
  ('1014','汽车/汽车用品/装饰','category-pic-662.jpg',null),
  ('1015','进口商品','category-pic-1065.jpg',null),
  ('1016','超市/便利店/到家服务','category-pic-1757.jpg','瓶装水,酒水饮料,地方特产')
;
/**商品子家族分类 */
CREATE TABLE tk_goods_family_member(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT ,
  fname VARCHAR(32),
  fnember VARCHAR(128)
);
INSERT INTO tk_goods_family_member VALUES
  ('1101','1001','家用电器','电视空调,洗衣机,热水器,冰箱,电热毯,电熨斗,取暖器,除湿机,冷藏柜,其他');
INSERT INTO tk_goods_family_member (fid,fname,fnember) VALUES
  ('1001','厨房大电','三件套,烟灶套装,油烟机,燃气灶,消毒柜,洗碗机,集成灶,其他'),
  ('1001','中式厨房','电压力锅/汤锅,电磁炉,浄水器/饮水机,电饭煲/豆浆机,电热水壶,电饼铛,平底锅/炒锅/电煮锅,绞肉机,小厨宝,其他'),
  ('1001','西式厨房','碎冰杯,打蛋器,料理碗,电蒸箱,烤肉锅,原汁机配件,厨师机配件,磨豆机,冰淇淋机,奶泡机,烤箱,料理机,微波炉,榨汁机,面包机/面条机,咖啡机'),
  ('1001','生活电器','挂烫机,吸尘器,床垫护理,清洁布,吸尘器配件,食谱芯片,清洁机配件,扫地机器人,刮刀棒,网锅,主锅底座,空气净化器配件,空气净化器,其他'),
  ('1001','个护健康','体重称,按摩器械,剃须刀,电动牙刷,电吹风,按摩器,理发器,足浴盆,足疗机,按摩椅,其他'),
  ('1002','手机','新品特卖,实惠精选,手机配件'),
  ('1002','智能设备','智能手机,智能手表,智能手环,VR眼镜,智能摄影,智能健康,智能家居,其他'),
  ('1002','摄影摄像','相机配件,清洁套装,光学仪器,耳机耳麦,相机,单反,摄像机,拍立得,镜头,自拍杆'),
  ('1002','硬件存储','无线网卡,显示器,机械键盘,固体硬盘,CPU,显卡,主板,高速U盘,路由器'),
  ('1003','电脑','笔记本,平板电脑,台式机一体机,DIY,游戏本,服务器'),
  ('1003','电脑配件','鼠标,键盘,鼠键套装,主机'),
  ('1003','办公设备','打印机,点验钞机,装订机,考勤机,过塑机,投影仪,传真机,复印机,碎纸机,扫描仪,塑封膜一体机,保险箱,保管箱,其他'),
  ('1003','办公用纸','打印纸,复印纸,标签打印紙/条码纸相,片纸,收银纸,卡纸,传真纸,彩激纸'),
  ('1003','文学小说','散文诗集,青春文学,传记,动漫,科幻,武侠,悬疑推理,世界名著'),
  ('1004','护肤品','面膜,护肤套装,乳液面霜,护手霜,爽肤水,洁面眼霜/眼膜/眼部精华,身体乳,精油芳疗,卸妆,身体护理,面部喷雾,去角质,敏感修护,精华液,祛痘'),
  ('1004','彩枚','遮瑕,香水,BB霜,化枚工具,口红/唇彩,防晒/隔离,粉底,粉饼,指甲油,美甲工具,眉笔/眉粉,睫毛膏,眼线,眼影,蜜粉/腮红,彩妆套装'),
  ('1004','男士护肤','洁面,爽肤水,乳液/面霜,护理套装,面膜,面部精华,眼部护理,防晒,唇部护理'),
  ('1004','美发护发','洗发水,护发素,发膜,洗护套装,护发精油,头发造型,弹力素,染发霜'),
  ('1004','口腔护理','牙膏,牙刷,漱口水,口气清新剂,口腔美白'),
  ('1004','个人护理','沐浴露,香皂,泡澡浴盐,洗手液,剃须刀,卫生巾,吹风机,直/卷发器,美容仪,其他'),
  ('1005','精选上装','夹克,羊线衫,T恤,衬衫,毛衣/件织衫,毛呢外套,羽线服,雪纺衫,外套/风衣,小西装,卫衣,皮衣/皮草'),
  ('1005','浪漫裙装','印花连衣裙,A字裙,蕾丝连衣裙,牛仔裙,百褶裙,包腎裙'),
  ('1005','女士下装','休闲裤,牛仔裤,哈伦裤,背带裤,小脚裤,西装裤,打底裤,阔腿裤,短裤'),
  ('1005','文胸塑身','聚拢文胸,运动文胸,性感蕾丝,无钢圈,塑身衣'),
  ('1005','袜类','隐形船袜,连裤袜,瘦身袜,男袜,女袜'),
  ('1005','特色女装','职业套装,大码女装,旗袍,礼服,婚纱'),
  ('1005','家居服','睡衣,少女居家服,睡袍,情侣家居服,真丝家居服,男士居家服'),
  ('1005','内裤背心','内裤,吊帯背心,男士背心,秋衣裤'),
  ('1005','服饰配件','眼罩,帽子,丝巾/围巾,手套,皮带'),
  ('1006','男土外套','风衣,皮衣,夹克/棒球衫,单西,大衣/棉服,西装套装'),
  ('1006','男士内搭','神衫,T恤/polo衫,卫衣,针织衫/毛衣,马甲/肯心'),
  ('1006','男士裤装','休闲裤,牛仔裤,西裤,小脚/紧身裤,短裤'),
  ('1006','特色男装','民族服装,中山装,套装'),
  ('1006','运动鞋','运动鞋,板鞋,运动拖鞋,篮球鞋,足球鞋,健步鞋'),
  ('1006','运动服','运动套装,运动T恤,运动裤,运动短裤,运动外套'),
  ('1006','户外鞋服','沖锋衣,防晒衣,速干T恤,速干裤,登山鞋,潜水服'),
  ('1006','户外用品','望远镜,钓竿,户外包,帐篷,手电筒,防潮垫,刀具'),
  ('1006','动用品','美腰机,多功能健身器材,健身轮,钢丝绳,健身椅,动感单车,户外篮球架,泳衣,跑步机/踏步机,篮球/足球,自行车,瑜伽垫,滑轮,羽毛球拍,运动护具/配件'),
  ('1007','时尚女鞋','休闲鞋,短靴,马丁靴,雪地靴,长筒靴,凉鞋,拖鞋帆,布鞋,平底单鞋,高跟单鞋,坡跟单鞋,豆豆鞋,乐福鞋'),
  ('1007','潮流男鞋','休闲鞋,正装皮鞋,休闲皮鞋,运动休闲,高帮鞋,靴子,帆布鞋/板鞋,乐福鞋,豆豆鞋,棉鞋'),
  ('1007','潮流女包','女士钱包,手拿包,单肩包,手提包,斜跨包,腰包,胸包,双肩包,化妆包'),
  ('1007','精品男包','男士钱包,斜掊包/单肩包,腰包,手提包,手拿包,胸包,双肩包'),
  ('1007','功能箱包','旅行箱,万向轮箱,旅行袋,大容量'),
  ('1008','钻石珠宝','钻戒,钻石耳饰,钻石吊坠,钻石手链,天然宝石'),
  ('1008','珍珠玉翠','珍珠项链,珍珠耳钉,珍珠吊坠,和田玉,翡翠摆件,翡翠手镯,翡翠项链,翡翠戒指,琥珀饰品,珍珠手链'),
  ('1008','潮流饰品','银饰,木手串,石榴石手链,项链,发饰,手镯,戒指,吊坠,合金饰物'),
  ('1008','腕表','机械表,石英表,运动手表,情侣表,儿童手表'),
  ('1008','眼镜','太阳镜/墨镜,近视眼镜,老花镜,眼镜框'),
  ('1008','铂金首饰','项链吊坠,手链,戒指,耳饰'),
  ('1008','水晶宝石','钻石吊坠,水晶手链'),
  ('1008','黄金首饰','耳钉,黄金项链,黄金对戒,耳饰,项链吊坠,婚嫁套饰,黄金手镯/手链'),
  ('1009','童装','套装,连体衣,内衣裤/沫子,婴儿礼盒,棉/羽绒服,上衣,裤子,外套,居家服,毛衣,肚兜/帽子'),
  ('1009','童鞋','运动鞋,学步鞋,帆布鞋,皮鞋,拖鞋,雨靴,靴子/雪地靴,凉鞋'),
  ('1009','车床用品','婴儿推车,学步车,安全座椅,婴儿背带/腰凳,婴儿床/床垫,餐椅,抱被/床品套件,推车配件'),
  ('1009','喂养','奶瓶,奶嘴,水杯,餐具,消毒锅,铺食机,吸奶/暖奶/调奶器,围嘴'),
  ('1009','洗护','纸尿裤,毛巾/浴巾,脸盆/脚盆,尿布/尿片,洗发/沐浴,润肤,浴盆,湿巾,洗衣皂/液,理发器,驱虫止痒'),
  ('1009','玩具','毛线/玩具,自行车/滑板车,电动车,积木,电动遥控,儿童箱包/文具用品'),
  ('1009','其他用品','奶瓶收纳盒,儿童小便用品,清洁棉签,儿童衣架,爬行垫,宝宝坐便器,儿童手表'),
  ('1010','进口食品','进口零食,进口巧克力,进口牛奶,进口饮料,进口酒'),
  ('1010','休闲零食','蜜钱果干,休闲零食,海苔,鹵味熟食,坚果果仁,饼干,红枣,巧克力,膨化食品,糖果,肉脯海味,糕点点心'),
  ('1010','酒类','冰酒,干红,干白,白酒,红酒,洋酒,啤酒,責酒,保健酒'),
  ('1010','茶叶','普洱,西湖龙井,安吉白茶,铁观音,大红袍,绿茶,红茶,花茶'),
  ('1010','乳品冲饮','蜂室,牛奶/酸奶,藕粉/芝麻糊,奶粉,咖啡,麦片,奶茶,水/果汁/汽水,柚子茶,即食食品'),
  ('1010','粮油速食','冻品,即时食品,罐头,五谷杂粮,南北干货,方便面/坡萨,粽子/油炸食品,调味品'),
  ('1010','生鲜水果','水果,蔬菜,蛋类,肉类,海鲜水产,精选干货'),
  ('1011','中西医药','滋补调养,家庭常备,男科用药,妇科用药'),
  ('1011','保健品','辣木片,松花粉片,减肥,美容养颜,芦荟,玛卡,胶原蛋白,维生素,保健食品,鱼油,三七口服液'),
  ('1012','家纺','床上用品,布艺,地毯,窗帘,靠垫,浴巾,厨房纺织'),
  ('1012','纸品清洁','纸巾,洗衣液,洗洁精,消毒液,洁厕剂,驱蚊驱虫,清洁用品,管道疏通,除湿防潮,清洁剂'),
  ('1013','客厅餐厅','雪茄柜,小凳,六件套,斗柜,博古架,储物柜,沙发,电视柜,茶几,鞋柜,餐桌/椅,酒柜,玄关柜,其他'),
  ('1013','卧室家具','衣柜,化枚台,餐桌/椅,衣柜密码箱,茶几,床头柜,衣帽架,书桌,床尾凳,床,床垫,乳胶床垫'),
  ('1014','汽车','小轿车,中型车,MPV,SUV,跑车,新能原汽车'),
  ('1014','美容清洗','洗车机,水枪,车蜡,玻璃水/清洁剂,汽油添加剂,镀晶,补漆笔'),
  ('1015','美妆个护','洁面,乳液/面霜,爽肤水,面部护理套装,精华液,眼部护理,面膜,香水,口红,唇膏,睫毛膏,指甲油,BB霜,腮红,粉饼,遮瑕,彩妆套装,个人护理,美容工具'),
  ('1015','食品保健','膳食保健品,进口食品,进口饮料'),
  ('1015','母婴用品','宝宝食品,宝宝用品,宝宝洗护用品,孕产妇用品,宝宝服饰/玩具'),
  ('1015','服饰箱包','运动户外,箱包/鞋靴,饰品/手表,女装/女士内衣,男装/男士内衣'),
  ('1015','生活数码','家用电器,厨房餐具/烹饪用品,数码音箱,家居生活'),
  ('1015','其他进口','汽车'),
  ('1016','社区团购','酒水饮料,粮油调味,休闲零食,日用清洁,护肤美枚,地方特产,进口商品,其他商品'),
  ('1016','送水到家','桶装水,瓶装水,罐装水,酒水/忺料,其他'),
  ('1016','生鲜到家','水果,蔬菜,蛋类,肉类,海鲜,水产,冻品,其他'),
  ('1016','外卖到家','牛排,咖啡,奶茶,果汁,下午茶,中餐,西餐,地方小吃,其他'),
  ('1016','蛋糕到家','生日蛋糕,节日蛋糕,纪念日蛋糕,婚庆蛋糕,商务蛋糕,其他'),
  ('1016','鲜花到家','爱情鲜花,生日鲜花,友情鲜花,祝贺鲜花,婚庆鲜花,道兼歉鲜花,商务鲜花,其他'),
  ('1016','家政到家','搬家,保洁清洗,洗衣维护,鲜花绿植,家电维修,数码维修,二手回收,其他'),
  ('1016','商务到家','软件服务,硬件服务,中介服务,金融服务,广告服务,财务服务,电信服务,其他')
  ;


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