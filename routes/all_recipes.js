var express = require('express');
var router = express.Router();
var connection = require('../database/connection').databaseConnection;

router.get('/', async function(req, res, next) {
  const proteinTypes = ['Beef', 'Chicken', 'Grains']; 
  let queries = proteinTypes.map(type => {
      return new Promise((resolve, reject) => {
          let sql = 'SELECT * FROM recipes WHERE protein_type = ?';
          connection.query(sql, [type], (err, results) => {
              if (err) reject(err);
              resolve({ type, recipes: results });
          });
      });
  });

  try {
      let categorizedRecipes = await Promise.all(queries);
      console.log(categorizedRecipes)
      console.log(categorizedRecipes[0].recipes);
      res.render('all_recipes', { title: "All Recipes", categorizedRecipes });
  } catch (error) {
      next(error);
  }
});


module.exports = router;
