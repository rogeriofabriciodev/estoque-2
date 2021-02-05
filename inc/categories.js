let conn = require('./db');
let path = require('path');

module.exports = {

  getCategories(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT * FROM tb_categories ORDER BY title
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

      if (!req.title) {

        reject("Preencha o Título.");

      } else {
  
        conn.query(`
          INSERT INTO tb_categories(title) values (?)
        `, [
            req.title
          ], (err, results) => {
  
            if (err) {
              reject("Preencha o Título.");
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
        DELETE FROM tb_categories WHERE id = ? 
      `, [
        id
      ], (err, results) => {

        if (err) {
          reject(err);
        } else {
          resolve(results);
        }

      });

    });
  }

};