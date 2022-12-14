//takes a tag and a list of recipes as arguments

//recipe.health label
function filter(recipes, filter) {
    let filtered = [];
    for (let recipe of recipes) {
        let labels = recipe.healthLabels;
        for (let label of labels) {
            if (label === filter) {
                filtered.push(recipe);
            }
        }
    }
    return filtered;
}

//calculates how many more ingredients are needed compared to what is in the pantry
function ingredient_disparity(recipes, ingredient_list) {
    for (let recipe of recipes) {
        let required_ingredients = [];
        for (let recipe_ingredient of recipe.ingredients) {
            let disparity = recipe.ingredients.length();
            let initial = disparity;
            for (let ingredient of ingredient_list) {
                if (recipe_ingredient === ingredient) {
                    disparity -= 1;
                } 
            }
            if (disparity === initial) {
                required_ingredients.push(recipe_ingredient);
            }
        }
        recipe["disparity"] = disparity;
        recipe["shopping_list"] = required_ingredients;
    }
}


//adds macros to recipe
function get_macros(recipe) {
    let nuts = recipe.totalNutrients;
    let carbs = nuts.CHOCDF;
    let fat = nuts.FAT;
    let protein = nuts.PROCNT;
    recipe["carbs"] = carbs.quantity;
    recipe["fat"] = fat.quantity;
    recipe["protein"] = protein.quantity;
    
}
