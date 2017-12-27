let express=require('express');
let router=express.Router();
let TopicDB=require('../db/TopicDB');

router.get('/getAllTopics',(req,resp)=>{
    TopicDB.getAllTopics().then((data)=>{
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})

router.get('/getDepartmentTopics',(req,resp)=>{
    console.log(req.query);
    TopicDB.getDepartmentTopics(req.query.id).then((data)=>{
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})

module.exports=router;