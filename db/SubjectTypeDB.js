let pool=require('./pool.js');

module.exports={
    getAllSubjectType(){
        var sql="select * from tbl_exam_subjecttype";
        return pool.execute(sql);
    }
    
}