let conn = require('./db');
let path = require('path');

module.exports = {

  getEmails(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT * FROM tb_emails ORDER BY email
        `, (err, results) => {
          if (err) {
            reject(err);
          } else {
            resolve(results);
          }
      });

    });
  },

  save(req) {

    return new Promise((resolve, reject) => {

      if (!req.fields.email) {

        reject("Preencha o E-mail.");

      } else {
  
        conn.query(`
          INSERT INTO tb_emails (email) values (?)
        `, [
            req.fields.email
          ], (err, results) => {
  
            if (err) {
              reject("Preencha o E-mail.");
            } else {
              resolve(results);
            }
  
        });
    
      }

    });

  },

  delete(id) {

    return new Promise((resolve, reject) => {

      conn.query(`
        DELETE FROM tb_emails WHERE id = ? 
      `, [
        id
      ], (err, results) => {

        if (err) {
          reject(err.message);
        } else {
          resolve(results);
        }

      });

    });
  }

};