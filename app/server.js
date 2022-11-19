let axios = require("axios");
let {Pool} = require("pg");
let express = require("express");
let app = express();
app.use(express.static("public"));
app.use(express.json());

let apiFile = require("../env.json");
let apiKey = apiFile["api_key"];
let apiID = apiFile["api_id"];
let baseUrl = apiFile["api_url"]; 

const db_info = require("../env_db.json");
const pool = new Pool(db_info);
pool.connect().then(function () {
    console.log(`Connected to database ${db_info.database}`);
});

let port = 3000;
let hostname = "localhost";

// don't change code above this line

app.get("/recipe", (req,res) => {
    //let url = `${baseUrl}?api_id=${apiID}&api_key=${apiKey}&q=chicken`;
    //let url= 'https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=chicken&app_id=26492307&app_key=85a7c28e6d4af555ba4231133767fed9&diet=balanced&mealType=Dinner&imageSize=REGULAR&field=uri&field=label&field=image&field=images&field=source&field=url&field=shareAs&field=yield&field=dietLabels&field=healthLabels&field=cautions&field=ingredientLines&field=ingredients&field=calories&field=glycemicIndex&field=totalCO2Emissions&field=co2EmissionsClass&field=totalWeight&field=totalTime&field=cuisineType&field=mealType&field=dishType&field=totalNutrients&field=totalDaily&field=digest&field=tags';
    let q_value = req.query.search;
    let meal_value = req.query.mealtype;
    
    let url= `${baseUrl}?type=public&q=${q_value}&app_id=${apiID}&app_key=${apiKey}&mealType=${meal_value}&exclude=desserts`;
    console.log(q_value, meal_value, url);

    axios.get(url)
    .then((response) => {
        //console.log("Received response: ", response.data);
        res.json(response.data);
    });
});

app.post('/pantry', (req,res) => {
    console.log(req.body);
    let n_items = req.body.items.split(",").length - 1;
    let items = req.body.items.split(",");
    
    for (let i = 0; i < n_items; i++)
    {
        let item_name = items[i];
        console.log(item_name);

        pool.query(
            `INSERT INTO pantry(item_name, have_status) VALUES($1, $2)`,
            [item_name, true]
        )

        
    }

    
    


});

app.get("/viewpantrylist", (req,res) => {
    pool.query("SELECT * FROM pantry")
        .then((result) => {
            //console.log(result);
            for (let i = 0; i < result.rows.length; i++)
            {
                console.log(result.rows[i]);
            }
            return res.json(result);
            
        })
});

app.get("/shopping", (req,res) => {
    let item_cmp = req.query.compare.split(",");


    let items_str = ``;
    for (let i = 0; i < item_cmp.length - 1; i++)
    {
        items_str += `'${item_cmp[i]}', `;
    }
    items_str = items_str.substring(0,items_str.length-2);
    let q_str = `SELECT item_name FROM pantry WHERE item_name IN (${items_str})`;
    console.log(q_str);
    pool.query(q_str)
    .then((result) => {
        return res.json(result);
    });
    
    
});


app.post("/saverecipe", (req,res) => {
    console.log(req.body.recipe.label);
    let recipe_json = req.body.recipe;
    let folder_name = req.body.folder_name;
    console.log(folder_name);
    let rating = -1;
    let q_str = `INSERT INTO recipebook(recipe_info,folder_name, rating) VALUES ($1, $2, $3)`;
    pool.query(q_str, [recipe_json, folder_name, rating]);
});

app.get("/saved", (req,res) => {
    let q_str = `SELECT * FROM recipebook`;
    pool.query(q_str)
    .then((result) => {
        for (let i = 0; i < result.rows.length; i++)
        {
            console.log(result.rows[i].id, result.rows[i].recipe_info.label, result.rows[i].folder_name);
        }
        
        return res.json(result);
    });
    
});

app.delete("/delete", (req,res) => {
    let prim_id = req.query.q;
    
    prim_id = prim_id.split(",");
    prim_id.pop();
    //console.log(prim_id);

    let q_str = `DELETE FROM recipebook WHERE id = $1`;
    
    for (let i = 0; i < prim_id.length; i++)
    {
        pool.query(q_str, [prim_id[i]])
        .then((result) => {
            return res.json(result);
        });
    }
    
    
});

app.listen(port, hostname, () => {
    console.log(`http://${hostname}:${port}`);
});
