let express = require("express");
let axios = require("axios");
let { Pool } = require("pg");
let bcrypt = require("bcrypt");
let env = require("../env_db.json");

let apiFile = require("../env_api.json");
let apiKey = apiFile["api_key"];
let apiID = apiFile["api_id"];
let baseUrl = apiFile["api_url"];

let hostname = "localhost";
let port = 3000;
let app = express();

app.use(express.json());
app.use(express.static("public"));

let pool = new Pool(env);
pool.connect().then(() => {
    console.log("Connected to database");
});

let saltRounds = 10;
app.post("/signup", (req, res) => {
    console.log("body: ",req.body);
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
                        res.status(200).send();
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

//recipe request handler
app.get("/defunct", (req, res) => {
    
    //let zip = req.query.zip;
    //let url = `${baseUrl}?zip=${zip}&appid=${apiKey}`;
    
    const options = {
        method: 'GET',
        url: 'https://tasty.p.rapidapi.com/recipes/list',
        params: {from: '0', size: '20', tags: 'under_30_minutes'},
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
        }
      };
      //'under_30_minutes'
      axios.request(options).then(function (response) {
          //console.log(response.data);
          res.json(response.data);
      }).catch(function (error) {
          console.error(error);
      });
});

app.get("/recipe", (req, res) => {
    let ingredients = req.ingredients; 
    let q = "";
    for (x of ingredients) {
        q += x + ",";
    }
    let url = `${baseUrl}?type=public&beta=false&q=${q}&app_id=${apiID}&app_key=${apiKey}`;

    //let zip = req.query.zip;


    //&diet=balanced&mealType=Dinner&imageSize=REGULAR&field=uri&field=label&field=image&field=images&field=source&field=url&field=shareAs&field=yield&field=dietLabels&field=healthLabels&field=cautions&field=ingredientLines&field=ingredients&field=calories&field=glycemicIndex&field=totalCO2Emissions&field=co2EmissionsClass&field=totalWeight&field=totalTime&field=cuisineType&field=mealType&field=dishType&field=totalNutrients&field=totalDaily&field=digest&field=tags`;
   

    axios.get(url).then((response) => {
        console.log("Received response:", response.data);
        let response_ingredients = response.data.hits[0].recipe.ingredients;
        let required_ingredients = [];
        for (let name of response_ingredients) {
            required_ingredients.push(name.food);
        }
        //TODO split into two list: what the user has and what the user doesn't have
        res.json(response.data);
    });
});
app.listen(port, hostname, () => {
    console.log(`http://${hostname}:${port}`);
});
