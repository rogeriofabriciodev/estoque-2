let conn = require('./db');
let path = require('path');

module.exports = {

  getProducts(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT * FROM tb_products ORDER BY name
        `, (err, results) => {
          if (err) {
            reject(err);
          } else {
            resolve(results);
          }
      });

    });
  },

  save(fields, files) {

    return new Promise((resolve, reject) => {

      fields.photo = `images/${path.parse(files.photo.path).base}`;

      let query, queryPhoto = '', params = [
        fields.name,
        fields.description,
        fields.category,
        fields.price
      ];

      if (files.photo.name) {

        queryPhoto = ',photo = ?';

        params.push(fields.photo);

      }

      if (parseInt(fields.id) > 0) {

        params.push(fields.id);

        query = `
          UPDATE tb_products
          SET name = ?,
              description = ?,
              category = ?,
              price = ?
              ${queryPhoto}
          WHERE id = ?
        `;

      } else {

        if (!files.photo.name) {
          reject('Envie a foto do produto.');
        }

        query = `
          INSERT INTO tb_products(name, description, category, price, photo)
          VALUES(?, ?, ?, ?, ?)
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
        DELETE FROM tb_products WHERE id = ? 
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