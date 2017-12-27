let mysql=require('mysql');

let pool=global.pool;
if(!pool){
    pool=mysql.createPool({
        database:'exam',
        user:'root',
        password:'root'
    });
    global.pool=pool;
}
//获取连接
function getConnection(){
    return new Promise(function(resolve,reject){
        pool.getConnection(function(err,conn){
            if(!err){
                resolve(conn);
            }else{
                reject(err);
            }
        })
    })
}

//执行mysql
function execute(sql){
    return new Promise(function(resolve,reject){
        var connection;
        getConnection().then(function(conn){
            connection=conn;
            conn.query(sql,function(err,result){
                if(!err){
                    resolve(result);
                }else{
                    reject(err);
                }
            })
        }).catch(function(err){
            reject(err);
        }).finally(function(err){
            if(connection){
                connection.release();
            }
        })
    })
}
module.exports={
    getConnection,
    execute
}