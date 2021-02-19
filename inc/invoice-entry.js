let conn = require('./db');
let path = require('path');

module.exports = {

  getInvoice(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT * FROM tb_invoice_entry
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
        fields.origin,
        fields.issuanceDate,
        fields.idProvider,
        fields.idProduct,
        fields.quantity,
        fields.price
      ];

      if (files.photo.name) {

        queryPhoto = ',photo = ?';

        params.push(fields.photo);

      }

      if (parseInt(fields.id) > 0) {

        params.push(fields.id);

        query = `
          UPDATE tb_invoice_entry
          SET origin = ?,
              issuance_date = ?,
              id_provider = ?,
              id_product = ?,
              quantity = ?,
              price = ?
              ${queryPhoto}
          WHERE id = ?
        `;

      } else {

        if (!files.photo.name) {
          reject('Envie a foto do produto.');
        }

        query = `
          INSERT INTO tb_invoice_entry(origin, issuance_date, id_provider, id_product, quantity, price, photo)
          VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
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
        DELETE FROM tb_invoice_entry WHERE id = ? 
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