let pool=require('./pool');

module.exports={
    getAllTopics(){
        var sql="select * from tbl_exam_topic";
        return pool.execute(sql);
    },
    getDepartmentTopics(department_id){
        var sql="select * from tbl_exam_topic where id="+department_id;
        return pool.execute(sql);
    }
}