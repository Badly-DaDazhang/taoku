const express = require('express');
const pool = require('../pool.js');
var router = express.Router();
	router.get("/user/login/:uname&:upwd",(req,res)=>{
		//获取参数
		var $uname=req.params.uname;
		var $upwd=req.params.upwd;
		//查询数据库
		var sql="select * from tk_user where uname=? and upwd=?";
		pool.query(sql,[$uname,$upwd],(err,result)=>{
			if(err) throw err;
			if(result.length>0){
				res.send("1");
			}else{
				res.send("0");
			}
		});
	});
	//2.userlist 查 get不需要参数
	router.get("/user/userlist",(req,res)=>{
		var sql="select * from tk_user";
		pool.query(sql,(err,result)=>{
			if(err) throw err;
			res.send(result);
		});
	});
	//3.根据uid删除用户
	router.delete("/user/deluser/:uid",(req,res)=>{
		var $uid=req.params.uid;
		var sql="delete from tk_user where uid=?";
		pool.query(sql,[$uid],(err,result)=>{
			if(err) throw err;
			res.send("1");
		});
	});	
	//4.根据uid查询某一个用户信息
	//restful--get
	router.get("/user/queryuser/:uid",(req,res)=>{
		//获取uid
		var $uid=req.params.uid;
		//查询数据库
		var sql="select * from tk_user where uid=?";
		pool.query(sql,[$uid],(err,result)=>{
			if(result.length>0){
				res.send(result);
			}else{
				res.send("0");
			}
		});
	});
	//5.修改用户信息的接口 put
	//put方法基本上跟post一样
	router.put("/user/updateuser",(req,res)=>{
	//1.接收前端传过来的数据
		var $uid=req.body.uid;
		var $uname=req.body.uname;
		var $upwd=req.body.upwd;
		var $phone=req.body.phone;
		var $email=req.body.email;
		var $user_name=req.body.user_name;
		var $gender=req.body.gender;
		var $qq_num=req.body.qq_num;
		var $ali_num=req.body.ali_num;
	//2.写sql语句
		var sql="update tk_user set uname=?,upwd=?,email=?,phone=?,user_name=?,gender=?,qq_num=?,ali_num=? where uid=?";
	//3.连接池进行数据操作
	    pool.query(sql,[$uname,$upwd,$email,$phone,$user_name,$gender,$uid,$],(err,result)=>{
			if(err) throw err;
			res.send("1");
		});
	
	});
module.exports=router;
