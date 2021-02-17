let conn = require('./db');

module.exports = {

  getSubcategories(){
    return new Promise((resolve, reject) => {

        conn.query(`
          SELECT tb_subcategories.id, tb_subcategories.title, tb_categories.title as category
          FROM tb_subcategories INNER JOIN tb_categories 
          ON (tb_categories.id = tb_subcategories.id_category)
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
      console.log("aqui: ", fields.category);
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