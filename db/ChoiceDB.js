let pool=require('./pool.js');
require('babel-polyfill');
module.exports={
    findCorrect(subject_id){
        var sql="select * from tbl_exam_choice where subject_id="+subject_id;
        return pool.execute(sql);
    },
    //保存答案
    saveSelectRadio(content,correct,subject_id){
        var sql="insert into tbl_exam_choice values(null,'"+content+"','"+correct+"','"+subject_id+"')";
        return pool.execute(sql);
    }
}