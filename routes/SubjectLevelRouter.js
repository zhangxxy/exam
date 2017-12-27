var express=require('express');
var router=express.Router();
var SubjectLevelDB=require('../db/SubjectLevelDB');

router.get('/getAllSubjectLevel',function(req, resp){
    SubjectLevelDB.getAllSubjectLevel().then(function(data){
        resp.send(data);
    }).catch(function(error){
        resp.send(error);
    })
})
module.exports=router;