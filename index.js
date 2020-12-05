const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');
const port = 7000;

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

var db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'study'
});   
db.connect();

// user’s list with pagination 
app.get('/UserByPage',(req,res)=>{
    page = req.query.page_number;
    Users_perpage = 5;
    start = (page - 1) * Users_perpage;
    db.query(`SELECT * from tb_user limit ${start},${Users_perpage}`, function (error, results, fields) {
        if (error){
            return res.json({
                success:0,
                Message:error
            })  
        }
        else{
            return res.json({
                success:1,
                Data:results
            })   
        }
      });
})

// users who are having user_id either 1 or 5 or 7
app.get('/UserById',(req,res)=>{
    let user_id = [1,5,7];
    db.query(`SELECT * from tb_user where user_id in (${user_id})`, function (error, results, fields) {
        if (error){
            return res.json({
                success:0,
                Message:error
            })  
        }
        else{
            return res.json({
                success:1,
                Data:results
            })   
        }
      });
})

// user whose admin has at least 3 users
app.get('/UserByAdminCount',(req,res)=>{
    let admin = []
    db.query(`SELECT admin_id, count(*) AS Counts FROM tb_user group by admin_id having count(*)>2`, function (error, results, fields) {
        if (error){
            return res.json({
                success:0,
                Message:error
            })  
        }        
        else{
            for(var i=0;i<results.length;i++){
                admin.push(results[i].admin_id)
            }
            db.query(`SELECT * FROM tb_user where admin_id in (${admin}) group by user_name`, function (error, results, fields) {
                if (error){
                    return res.json({
                        success:0,
                        Message:error
                    })  
                }
                else{
                    admin=[];
                    return res.json({
                        success:1,
                        Data:results
                    })   
                }
            })
        }
      });
})

app.listen(port,()=>{console.log('server is running on port 7000')})
