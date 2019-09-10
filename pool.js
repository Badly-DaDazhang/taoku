//引入数据库
const mysql = require('mysql');
//声明连接池
var pool = mysql.createPool({
	host:'localhost',
	port:'3306',
	user:'root',
	password:'zhangsql',
	database:'taoku',
	connectLimit:20
});
//导出
module.exports = pool;