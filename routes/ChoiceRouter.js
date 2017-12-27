require('babel-polyfill');
require('body-parser');
let express=require('express');
let router=express.Router();
let ChoiceDB=require('../db/ChoiceDB');

router.post('/findCorrect',(req,resp)=>{
    console.log(req.body);
    ChoiceDB.findCorrect(req.body.id).then((data)=>{
        //console.log("0-1",data);
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    });
})
/*class Selectradio{
    constructor(id,content,correct,subject_id){
        this.id=id;
        this.content=content;
        this.correct=correct;
        this.subject_id=subject_id;
    }
}*/
router.post('/saveSelectRadio',(req,resp)=>{
    //let selectradio=new Selectradio();
    console.log(req.body);
    //因为从前面传过来的是数组,所以要遍历他拿到数组的项再存到数据库表中   
    var contentchoice=req.body.content;
    var correctchoice=req.body.correct;
    var subject_id=req.body.subject_id;
    for(var i=0;i<contentchoice.length;i++){
        var content=contentchoice[i];
        console.log(content);
        var correct=correctchoice[i];
        console.log(correct);
    }
    ChoiceDB.saveSelectRadio(content,correct,subject_id).then((data)=>{
        resp.send(data);
    }).catch((error)=>{
        resp.send(error);
    })
})
module.exports=router;