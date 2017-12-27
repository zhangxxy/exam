var express=require('express');
var router=express.Router();
var SubjectTypeDB=require('../db/SubjectTypeDB');

router.get('/getAllSubjectType',function(req, resp){
    SubjectTypeDB.getAllSubjectType().then(function(data){
        resp.send(data);
    }).catch(function(error){
        resp.send(error);
    })
})
module.exports=router;