let pool=require('./pool');

module.exports={
    getAllDepartmentes(){
        var sql="select * from tbl_exam_epartment";
        return pool.execute(sql);
    }
}