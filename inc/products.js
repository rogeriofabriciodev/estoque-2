let conn = require('./db');
let path = require('path');

module.exports = {

  getProducts(){
    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT tb_products.id, tb_products.name, tb_products.model, tb_products.productCode, tb_brands.name as brand, tb_providers.name as provider, tb_products.description, tb_products.profitMargin, tb_categories.title as category, tb_subcategories.title as subcategory, tb_products.price, tb_products.photo FROM tb_products
        INNER JOIN tb_brands ON tb_brands.id = tb_products.id_brand
        INNER JOIN tb_providers ON tb_providers.id = tb_products.id_provider
        INNER JOIN tb_categories ON tb_categories.id = tb_products.id_category
        INNER JOIN tb_subcategories ON tb_subcategories.id = tb_products.id_sub_category
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
        fields.model,
        fields.productCode,
        fields.idBrand,
        fields.idProvider,
        fields.description,
        fields.profitMargin,
        fields.idCategory,
        fields.idSubCategory,
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
              model = ?,
              productCode = ?,
              id_brand = ?,
              id_provider = ?,
              description = ?,
              profitMargin = ?,
              id_category = ?,
              id_sub_category = ?,
              price = ?
              ${queryPhoto}
          WHERE id = ?
        `;

      } else {

        if (!files.photo.name) {
          reject('Envie a foto do produto.');
        }

        query = `
          INSERT INTO tb_products(name, model, productCode, id_brand, id_provider, description, profitMargin, id_category, id_sub_category, price, photo)
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