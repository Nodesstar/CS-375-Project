let axios = require("axios");
let {Pool} = require("pg");
let express = require("express");
let app = express();
app.use(express.static("public"));
app.use(express.json());

let apiFile = require("../env_api.json");
let apiKey = apiFile["api_key"];
let apiID = apiFile["api_id"];
let baseUrl = apiFile["api_url"]; 

let session = require('express-session');
let path = require("path");
let bcrypt = require("bcrypt");

const db_info = require("../env_db.json");
const pool = new Pool(db_info);
pool.connect().then(function () {
    console.log(`Connected to database ${db_info.database}`);
});

let port = 3000;
let hostname = "localhost";

app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'static')));

// don't change code above this line

let saltRounds = 10;

app.get('/', function(req, res) {
	res.sendFile(path.join(__dirname + '/public/login.html'));
});
app.post("/signup", (req, res) => {
    let username = req.body.username;
    
    let plaintextPassword = req.body.plaintextPassword;
    if (typeof username !== 'string' || typeof plaintextPassword !== 'string' || username.length < 1 || username.length > 25 && plaintextPassword.length < 5 || plaintextPassword.length > 36) {
        res.sendStatus(401);
    }
    pool.query("SELECT username FROM users WHERE username = $1", [
        username,
    ]).then((result) => {
        if (result.rows.length > 0) {
            
            return res.status(401).send();
        }});

    bcrypt
        .hash(plaintextPassword, saltRounds)
        .then((hashedPassword) => {
            pool.query(
                "INSERT INTO users (username, hashed_password) VALUES ($1, $2)",
                [username, hashedPassword]
            )
                .then(() => {
                    // account created
                    console.log(username, "account created");
                    res.status(200).send();
                })
                .catch((error) => {
                    // insert failed
                    console.log(error);
                    res.status(500).send();
                });
        })
        .catch((error) => {
            // bcrypt crashed
            console.log(error);
            res.status(500).send();
        });
});

app.post("/signin", (req, res) => {
    let username = req.body.username;
    let plaintextPassword = req.body.plaintextPassword;
    pool.query("SELECT hashed_password FROM users WHERE username = $1", [
        username,
    ])
        .then((result) => {
            if (result.rows.length === 0) {
                // username doesn't exist
                return res.status(401).send();
            }
            let hashedPassword = result.rows[0].hashed_password;
            bcrypt
                .compare(plaintextPassword, hashedPassword)
                .then((passwordMatched) => {
                    if (passwordMatched) {
                        req.session.loggedin = true;
                        req.session.username = username;
                        res.redirect('/home');
                    } else {
                        res.status(401).send();
                    }
                })
                .catch((error) => {
                    // bcrypt crashed
                    console.log(error);
                    res.status(500).send();
                });
        })
        .catch((error) => {
            // select crashed
            console.log(error);
            res.status(500).send();
        });
});
app.get('/home', function(req, res) {
	// If the user is loggedin
	if (req.session.loggedin) {
		// Output username
		res.send(req.session.username);
	} else {
		res.send('Error');
	}
	res.end();
});

app.get("/recipe", (req,res) => {
    //let url = `${baseUrl}?api_id=${apiID}&api_key=${apiKey}&q=chicken`;
    //let url= 'https://api.edamam.com/api/recipes/v2?type=public&beta=false&q=chicken&app_id=26492307&app_key=85a7c28e6d4af555ba4231133767fed9&diet=balanced&mealType=Dinner&imageSize=REGULAR&field=uri&field=label&field=image&field=images&field=source&field=url&field=shareAs&field=yield&field=dietLabels&field=healthLabels&field=cautions&field=ingredientLines&field=ingredients&field=calories&field=glycemicIndex&field=totalCO2Emissions&field=co2EmissionsClass&field=totalWeight&field=totalTime&field=cuisineType&field=mealType&field=dishType&field=totalNutrients&field=totalDaily&field=digest&field=tags';
    	let q_value = req.query.search;
    	let meal_value = req.query.mealtype;
        let health_value = req.query.health;
        let x = 0;

	if (q_value.length == 0) {
		res.status(400);
		return res.json({ err: "Please enter a valid search query" });
	}
	if (meal_value.length == 0) {
		res.status(400);
		return res.json({ err: "Please select a meal type" });
	}
        let url= ""
        if (health_value !== "none") {
            url= `${baseUrl}?type=public&q=${q_value}&app_id=${apiID}&app_key=${apiKey}&mealType=${meal_value}&exclude=desserts&health=${health_value}`;
        } else {
            url= `${baseUrl}?type=public&q=${q_value}&app_id=${apiID}&app_key=${apiKey}&mealType=${meal_value}&exclude=desserts`;
        }

    	axios.get(url)
    	.then((response) => {
		let link = response.data._links.next.href;

		//AVERY 11/20/2022
		axios.get(link)
		.then((response2) => {
			res.json({ data1: response.data, data2: response2.data });
		}).catch((error) => {
			res.json({ err: error });
		});
    	});
});

//AVERY 11/20/2022 - Grabs ingredient list from API
app.get("/ingredients", (req,res) => {
	pool.query("SELECT * FROM ingredients")
      .then((result) => {
            return res.json(result);  
     	})
});

app.get("/test", (req,res) => {
	let vals = ["coi", "er", "whip", "dough", "gh", "po", "ool", "lik", "ji", "pl", "tr"];
	
	for (let val = 0; val < vals.length; vals++) {	

	let url = `${baseUrl}?type=public&q=${vals[val]}&app_id=${apiID}&app_key=${apiKey}&mealType=Lunch&exclude=desserts`;

	axios.get(url)
	.then((response) => {
		let hits = response.data.hits;
		for (let i = 0; i < hits.length; i++) {
			for (let j = 0; j < hits[i].recipe.ingredients.length; j++) {
			pool.query(
            	`INSERT INTO ingredients(item_name) 
				SELECT  $1
				WHERE   NOT EXISTS 
        				(   	SELECT  1
        		    			FROM    ingredients 
          		  			WHERE   item_name = $1 
        				);`,
            		[hits[i].recipe.ingredients[j].food.toLowerCase()]
        		)
			}
		}
		
	});

	}
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
            /*for (let i = 0; i < result.rows.length; i++)
            {
                console.log(result.rows[i]);
            }*/
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
