let pool=require('./pool');

module.exports={
    getAllSubjects(){
        var sql="select * from tbl_exam_subject";
        return pool.execute(sql);
    },
    findByIdSubject(department_id,subjectLevel_id,topic_id,subjectType_id){
        var sql="select * from tbl_exam_subject where department_id="+department_id+" and subjectLevel_id="+subjectLevel_id+" and subjectType_id="+subjectType_id+" and topic_id="+topic_id;
        return pool.execute(sql);
    },
    findAnswer(id){
        var sql="select answer from tbl_exam_subject where id="+id;
        return pool.execute(sql);
    },
    //保存题目,未完成
    saveSubject(subject){
        var sql="insert into tbl_exam_subject values(null,'"+subject.analysis+"','"+subject.answer+"','"+subject.checkState+"','"+subject.stem+"',null,'"+subject.department_id+"','"+subject.subjectLevel_id+"','"+subject.subjectType_id+"','"+subject.topic_id+"',null)";
        return pool.execute(sql);
        console.log(sql);
    },
    //通过id删除题目
    delSubject(){

    },
    //审查通过
    checkSubject(id,checkState){
        var sql="update tbl_exam_subject set checkState='"+checkState+"' where id="+id;
        console.log(sql);
        return pool.execute(sql);
    }
}