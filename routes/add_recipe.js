var express = require('express');
var router = express.Router();
var connection = require('../database/connection').databaseConnection;

router.get('/', function(req, res, next) {
    let ingredients = 'SELECT * FROM ingredients';
    connection.query(ingredients, (err, result) => {
        if (err) throw err;
        //console.log(result);
        res.render('add_recipe', { title: 'Add Recipe', ingredients: result });
    });
});

router.post('/submit', function(req, res) {
    console.log(req.body['ingredients[]']);
    const { recipe_name, recipe_image, recipe_description, recipe_steps, protein_type } = req.body;
    //console.log(ingredients);
    const selectedIngredients = req.body['ingredients[]'] || [];

    console.log(selectedIngredients);

    const addRecipe = 'INSERT INTO recipes (recipe_name, recipe_image, recipe_description, protein_type) VALUES (?, ?, ?, ?)';
    
    connection.query(addRecipe, [recipe_name, recipe_image, recipe_description, protein_type], (err, result) => {
        if (err) {
            console.error("Error inserting recipe:", err);
            return res.status(500).send("Database error");
        }

        const recipeId = result.insertId; 

        const stepsArray = recipe_steps.split("\n").map((step, index) => [recipeId, index+1, step.trim()]);
        console.log(stepsArray);
        const recipeSteps = 'INSERT INTO recipe_steps (recipe_id, step_number, step_description) VALUES ?';
        
        connection.query(recipeSteps, [stepsArray], (err) => {
            if (err) console.error("Error while inserting recipe steps: ", err);
        });

        //const addedIngredientIds = 'SELECT ingredient_id FROM ingredients WHERE ingredient_id IN (?)';
        const recipeIds = selectedIngredients.map(ingredientId => [recipeId, parseInt(ingredientId, 10)]);
        console.log(recipeIds);

        if(recipeIds.length > 0) {                
            const recipeIngredientsInsert = 'INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES ?';

            connection.query(recipeIngredientsInsert, [recipeIds], (insertErr) => {
                if (insertErr) {
                    console.error("Error inserting into recipe_ingredients.");
                    return res.status(500).send("Error inserting ingredients into recipe.");
                }
            });
        }
    });
    res.redirect('/all_recipes'); 
});

module.exports = router;
