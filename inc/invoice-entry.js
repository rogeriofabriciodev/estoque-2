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

  // save(fields, files) {

  //   return new Promise((resolve, reject) => {

  //     fields.photo = `images/${path.parse(files.photo.path).base}`;

  //     let query, queryPhoto = '', params = [
  //       fields.name,
  //       fields.model,
  //       fields.productCode,
  //       fields.idBrand,
  //       fields.idProvider,
  //       fields.description,
  //       fields.profitMargin,
  //       fields.idCategory,
  //       fields.idSubCategory,
  //       fields.price
  //     ];

  //     if (files.photo.name) {

  //       queryPhoto = ',photo = ?';

  //       params.push(fields.photo);

  //     }

  //     if (parseInt(fields.id) > 0) {

  //       params.push(fields.id);

  //       query = `
  //         UPDATE tb_products
  //         SET name = ?,
  //             model = ?,
  //             productCode = ?,
  //             id_brand = ?,
  //             id_provider = ?,
  //             description = ?,
  //             profitMargin = ?,
  //             id_category = ?,
  //             id_sub_category = ?,
  //             price = ?
  //             ${queryPhoto}
  //         WHERE id = ?
  //       `;

  //     } else {

  //       if (!files.photo.name) {
  //         reject('Envie a foto do produto.');
  //       }

  //       query = `
  //         INSERT INTO tb_products(name, model, productCode, id_brand, id_provider, description, profitMargin, id_category, id_sub_category, price, photo)
  //         VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  //       `;

  //     }

  //     conn.query(query, params, (err, results) => {
        
  //       if (err) {
  //         reject(err);
  //       } else {
  //         resolve(results);
  //       }
  //     });

  //   });

  // },

  // delete(id) {

  //   return new Promise((resolve, reject) => {

  //     conn.query(`
  //       DELETE FROM tb_products WHERE id = ? 
  //     `, [
  //       id
  //     ], (err, results) => {

  //       if (err) {
  //         reject(err);
  //       } else {
  //         resolve(results);
  //       }

  //     });

  //   });
  // }

};