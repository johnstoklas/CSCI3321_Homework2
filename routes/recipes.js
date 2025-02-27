var express = require('express');
var router = express.Router();
var connection = require('../database/connection').databaseConnection;

// GET recipes page
router.get('/', function(req, res, next) {
  let sql = 'SELECT * FROM recipes';
  connection.query(sql, (err, result) => {
    if (err) throw err;
    //console.log(result);
    //res.render('recipes', { recipes: result });
  });
});

// Get a single recipe by ID
router.get('/:id', function(req, res, next) {
    let recipeId = req.params.id;
    let recipeInfo = 'SELECT * FROM recipes WHERE recipe_id = ?';
    
    connection.query(recipeInfo, [recipeId], (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        let recipeSteps = 'SELECT * FROM recipe_steps WHERE recipe_id = ? ORDER BY step_number ASC';
        connection.query(recipeSteps, [recipeId], (err, stepsResult) => {
            if (err) throw err;
          
            let recipeIngredients = `
            SELECT i.ingredient_name, i.ingredient_fact
            FROM recipe_ingredients ri
            JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
            WHERE ri.recipe_id = ?;
            `;

            connection.query(recipeIngredients, [recipeId], (err, ingredientsResult) => {
              let recipe = result[0]; 

              //console.log(recipe);
              //console.log(stepsResult);
              //console.log(ingredientsResult);
              res.render('recipes', { recipe: recipe, steps: stepsResult, ingredients: ingredientsResult });
            });
        });
      } else {
        res.status(404).send('Recipe not found');
      }
    });
  });

module.exports = router;
