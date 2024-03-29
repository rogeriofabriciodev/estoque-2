let conn = require('./db');

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

  
  save(fields) {

    return new Promise((resolve, reject) => {

      let query, params = [
        fields.title
      ];

      if (parseInt(fields.id) > 0 ) {

        query = `
          UPDATE tb_categories
          SET
            title = ?
          WHERE id = ?
        `;
        params.push(fields.id);

      } else {

        query = `
          INSERT INTO tb_categories (title)
          VALUES(?)
          `; 
      }
      
      conn.query(query, params, (err, results) => {

        if (err) {
          reject(err);
        } else {
          resolve(results);
        }

      });

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