let pool=require('./pool.js');

module.exports={
    getAllStudents(){
        var sql="select * from tbl_exam_user";
        return pool.execute(sql);
    },
    //未完成保存学生
    saveStudent(){
        var sql="";
        return pool.execute(sql);
    }
}
