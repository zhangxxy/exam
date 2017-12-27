let pool=require('./pool.js');

module.exports={
    getAllSubjectLevel(){
        var sql="select * from tbl_exam_subjectlevel";
        return pool.execute(sql);
    }
    
}