let express=require('express');
let router=express.Router();
let SubjectDB=require('../db/SubjectDB');
class Subject{
    constructor(id,analysis,answer,checkState,stem,uploadTime=null,department_id,subjectLevel_id,subjectType_id,topic_id,user_id=null){
        this.id=id;
        this.analysis=analysis;
        this.answer=answer;
        this.checkState=checkState;
        this.stem=stem;
        this.uploadTime=uploadTime;
        this.department_id=department_id;
        this.subjectLevel_id=subjectLevel_id;
        this.subjectType_id=subjectType_id;
        this.topic_id=topic_id;
        this.user_id=user_id;
        
    }
}
//查找所有的题目信息
router.get('/getAllSubjects',(req,resp)=>{
    SubjectDB.getAllSubjects().then((data)=>{
        resp.send(data);

    }).catch((error)=>{
        resp.send(error);
    })
})
//通过方向,难易程度,类型,知识点的id查找题目
router.post('/findByIdSubject',(req,resp)=>{
    //console.log(req.query);
    var department_id=req.body.department_id;
    var subjectLevel_id=req.body.subjectLevel_id;
    var subjectType_id=req.body.subjectType_id;
    var topic_id=req.body.topic_id;
    SubjectDB.findByIdSubject(department_id,subjectLevel_id,topic_id,subjectType_id).then((data)=>{
        //console.log(data);
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})

//查找题目答案,返回数组结构对象
router.post('/findAnswer',(req,resp)=>{
    SubjectDB.findAnswer(req.body.id).then((data)=>{
        //console.log("后台答案",data);
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})
//审核是否通过
router.post('/checkSubject',(req,resp)=>{
    //console.log(req.body);
    var id=req.body.id;
    var checkState=req.body.checkState;
    SubjectDB.checkSubject(id,checkState).then((data)=>{
        //console.log(data);
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})
//未完成

router.post('/saveSubject',(req,resp)=>{
    let subject=new Subject();
    Object.assign(subject,req.body);
    SubjectDB.saveSubject(subject).then((data)=>{
        //console.log(data.insertId);
        resp.json(data);
    }).catch((error)=>{
        resp.send(error);
    })
})
module.exports=router;