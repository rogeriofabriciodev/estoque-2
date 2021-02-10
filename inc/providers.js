let conn = require('./db');

module.exports = {

  getProviders(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT * FROM tb_providers ORDER BY name
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
          UPDATE tb_providers
          SET
            name = ?
          WHERE id = ?
        `;
        params.push(fields.id);

      } else {

        query = `
          INSERT INTO tb_providers (name)
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
        DELETE FROM tb_providers WHERE id = ? 
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