require('babel-polyfill');
var SubjectTypeDB=require('./SubjectTypeDB.js');

/*SubjectTypeDB.getAllSubjectType().then(function(data){
    console.log(data);
}).catch(function(error){
    console.log(error);
})*/
SubjectTypeDB.getAllSubjectLevel().then(function(data){
    console.log(data);
}).catch(function(error){
    console.log(error);
})