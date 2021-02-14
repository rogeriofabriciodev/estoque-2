let conn = require('./db');

module.exports = {

  getSubcategories(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT * FROM tb_subcategories ORDER BY title
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
        fields.title,
        fields.idCategory
      ];
      console.log("aqui: ", fields.idCategory);
      if (parseInt(fields.id) > 0 ) {

        query = `
          UPDATE tb_subcategories
          SET
            title = ?,
            id_category = ?
          WHERE id = ?
        `;
        params.push(fields.id);

      } else {

        query = `
          INSERT INTO tb_subcategories (title, id_category)
          VALUES(?, ?)
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
        DELETE FROM tb_subcategories WHERE id = ? 
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