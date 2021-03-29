const mysql = require('mysql2');

// create the connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  port: 3306,
  user: 'root2',
  database: 'estoque',
  password: 'secret1234',
  multipleStatements: true
});


module.exports = connection;