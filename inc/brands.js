let conn = require('./db');

module.exports = {

  getBrands(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT * FROM tb_brands ORDER BY name
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
        fields.name
      ];

      if (parseInt(fields.id) > 0 ) {

        query = `
          UPDATE tb_brands
          SET
            name = ?
          WHERE id = ?
        `;
        params.push(fields.id);

      } else {

        query = `
          INSERT INTO tb_brands (name)
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
        DELETE FROM tb_brands WHERE id = ? 
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