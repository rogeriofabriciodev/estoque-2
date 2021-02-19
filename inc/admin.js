var conn = require('./db');

module.exports = {

  dashboard(){

    return new Promise((resolve, reject) => {

      conn.query(`
        SELECT
          (SELECT
              COUNT(*)
            FROM
              tb_products) AS nrproducts,
          (SELECT
              COUNT(*)
            FROM
              tb_providers) AS nrproviders,
          (SELECT
              COUNT(*)
            FROM
              tb_brands) AS nrbrands,
          (SELECT
              COUNT(*)
            FROM
              tb_users) AS nrusers
      `, (err, results) => {
          if (err) {
            reject(err);
          } else {
            resolve(results[0]);
          }
      });
    });

  },

  getParams(req, params){
    return Object.assign({}, {
      menus: req.menus,
      user: req.session.user
    }, params);
  },

  getMenus(req) {
    let menus = [
      {
        text: "Tela Inicial",
        href: "/admin/",
        icon: "home",
        active: false
      },
      {
        text: "Entrada de NF",
        href: "/admin/invoice-entry",
        icon: "codepen",
        active: false
      },
      {
        text: "Produtos",
        href: "/admin/products",
        icon: "codepen",
        active: false
      },
      {
        text: "Categorias",
        href: "/admin/categories",
        icon: "calendar-check-o",
        active: false
      },
      {
        text: "Sub-Categorias",
        href: "/admin/subcategories",
        icon: "calendar-check-o",
        active: false
      },
      {
        text: "Marcas",
        href: "/admin/brands",
        icon: "cubes",
        active: false
      },
      {
        text: "Fornecedores",
        href: "/admin/providers",
        icon: "gg",
        active: false
      },
      // {
      //   text: "Contatos",
      //   href: "/admin/contacts",
      //   icon: "comments",
      //   active: false
      // },
      {
        text: "Usuários",
        href: "/admin/users",
        icon: "users",
        active: false
      },
      // {
      //   text: "E-mails",
      //   href: "/admin/emails",
      //   icon: "envelope",
      //   active: false
      // }
    ];

    menus.map(menu => {

      if (menu.href === `/admin${req.url}`) menu.active = true;
      
    });

    return menus;
  }

};