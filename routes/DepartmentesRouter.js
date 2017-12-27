var express=require('express');
var router=express.Router();
var DepartmentesDB=require('../db/DepartmentesDB');

router.get('/getAllDepartmentes',(req,resp)=>{
    DepartmentesDB.getAllDepartmentes().then((data)=>{
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})
module.exports=router;