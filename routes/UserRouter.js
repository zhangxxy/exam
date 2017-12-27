let express=require('express');
let router=express.Router();
let UserDB=require('../db/UserDB');

router.get('/getAllStudents',(req,resp)=>{
    UserDB.getAllStudents().then((data)=>{
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})
//未完成
router.post('/saveStudent',(req,resp)=>{
    UserDB.saveStudent().then((data)=>{
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})
module.exports=router;