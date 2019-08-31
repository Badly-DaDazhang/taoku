const express = require('express');
const pool = require('../pool.js');
var router = express.Router();


router.get("/cal",(req,res)=>{
  var sql="select * from tk_index_carousel";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send(result);
  });
});
router.get("/getcate",(req,res)=>{
  var sql="select fname,img from tk_goods_family"
  pool.query(sql,(err,result)=>{
    if(err)throw err ;
    res.send(result);
  })
})

module.exports=router;