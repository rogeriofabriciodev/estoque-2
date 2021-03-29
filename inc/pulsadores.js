let conn = require('./db');
var Pagination = require("./../inc/pagination");

module.exports = {

  // getPulsadores(){
  //   return new Promise((resolve, reject) => {

  //     conn.query(`
  //       SELECT * FROM tb_pulsador ORDER BY name
  //       `, (err, results) => {
  //         if (err) {
  //           reject(err);
  //         } else {
  //           resolve(results);
  //         }
  //     });
  //   });
  // },


  getPulsadores(req){

    return new Promise ((resolve, reject) => {

      let page = req.query.page;
      let dtstart = req.query.start;
      let dtend = req.query.end;

      if(!page) page = 1;

      let params = [];

      if (dtstart && dtend) params.push(dtstart, dtend);

      let pag = new Pagination(

        `
          SELECT SQL_CALC_FOUND_ROWS * 
          FROM tb_pulsador
          ${(dtstart && dtend) ? 'WHERE date BETWEEN ? AND ?' : ''} 
          ORDER BY name LIMIT ?, ?
        `,
        params
      );

      pag.getPage(page).then(data => {

        resolve({
          data,
          links: pag.getNavigation(req.query)
        })
      });

    });
    
  },

  
  save(fields) {

    return new Promise((resolve, reject) => {

      let query, params = [
        fields.name,
        fields.qtButtons,
        fields.colorButtons,
        fields.button1,
        fields.button2,
        fields.button3,
        fields.button4,
        fields.button5,
        fields.button6,
      ];

      let urlPhoto = `aql-` + fields.qtButtons + `-` + fields.colorButtons;
      params.push(urlPhoto);

      if (parseInt(fields.urlPhoto) > 0 ) {

        query = `
          UPDATE tb_pulsador
          SET
            name = ?
          WHERE id = ?
        `;
        params.push(fields.id);

      } else {

        query = `
          INSERT INTO tb_pulsador (name, qtButtons, colorButtons, button1, button2, button3, button4, button5, button6, urlPhoto)
          VALUES(?,?,?,?,?,?,?,?,?,?)
          `; 
      }
      
      conn.query(query, params, (err, results) => {

        if (err) {
          reject(err);
          console.log("error ", err)
        } else {
          resolve(results);
          console.log("OK ", results)
        }

      });

    });
    
  },


  // delete(id) {

  //   return new Promise((resolve, reject) => {

  //     conn.query(`
  //       DELETE FROM tb_brands WHERE id = ? 
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