const express = require('express');
//引入中0间件
const bodyParser = require('body-parser');
const userRouter = require('./routes/user.router.js');
const indexRouter = require('./routes/index.router.js')
//创建服务器
var app = express();
//设置app的接口
app.listen(8848);
//服务器挂载到public
app.use(express.static('public'));
//不使用中间件属性
app.use(bodyParser.urlencoded({
	extended:false
}));
//user 请求挂载到user路由器
app.use('/user',userRouter);
app.use('/index1',indexRouter);
