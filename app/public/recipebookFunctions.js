function get_macros(recipe) {
    let nuts = recipe.totalNutrients;
    let carbs = nuts.CHOCDF;
    let fat = nuts.FAT;
    let protein = nuts.PROCNT;
    recipe["carbs"] = carbs.quantity;
    recipe["fat"] = fat.quantity;
    recipe["protein"] = protein.quantity;
    }

function displayRecipes(recipe_json, pantry_arr)
{
    get_macros(recipe_json);
    let recipeName = recipe_json.label;
    let ingredientsArr = recipe_json.ingredientLines;
    let justTheIngredientsArr = recipe_json.ingredients;
    let calories = Math.round(recipe_json.calories);
    let directions_link = recipe_json.url;
    let divMain = document.getElementById("main");
    let tbody = document.getElementById("tbody");
    let table = document.getElementById("data-table");
    let tr = document.createElement("tr");
    tbody.append(tr);

    table.style.border = '1px solid black';
    table.style.borderCollapse = 'collapse';
    table.style.padding = '3px';
    table.style.tableLayout = 'fixed';
    tr.style.border = '1px solid black';


    let td1 = document.createElement("td");
    tr.append(td1);
    td1.style.border = '1px solid black';
    let link_a = document.createElement("a");
 
    td1.append(link_a);
    link_a.href = directions_link;
    console.log(directions_link);
    link_a.textContent = recipeName;
    link_a.target = '_blank';

    let td2 = document.createElement("td");
    tr.append(td2);
    td2.style.border = '1px solid black';
    let ul = document.createElement("ul");
    td2.append(ul);
    for (let i = 0; i < ingredientsArr.length; i++)
    {
        let li = document.createElement("li");
        ul.append(li);
        li.textContent = ingredientsArr[i];
    }

    let td3 = document.createElement("td");
    tr.append(td3);
    td3.style.border = '1px solid black';
    let ul3 = document.createElement("ul");
    td3.append(ul3);
    let count = 0;
    for (let i = 0; i < justTheIngredientsArr.length; i++)
    {
        if (!pantry_arr.includes(justTheIngredientsArr[i].food))
        {
            let li = document.createElement("li");
            ul3.append(li);
            li.textContent = justTheIngredientsArr[i].food;
            count += 1;
        }
    }
    console.log(calories, count);
    if (count == 0) {
        console.log("Got here");
        let li = document.createElement("li");
        li.textContent = "All ingredients in Pantry!";
        li.style.color = "green";
        ul3.append(li);
    }

    let td4 = document.createElement("td");
    tr.append(td4);
    td4.style.border = '1px solid black';
    td4.textContent = calories;

    let td5 = document.createElement("td");
    tr.append(td5);
    td5.style.border = '1px solid black';
    let can = document.createElement("canvas");
    td5.append(can);
    
    //can.setAttribute("id", "canva" + i.toString());
    can.style.width = "100%";
    can.style.maxWidth = "600px";
    //var ctx = document.getElementById(can.id).getContext('2d');
    var ctx = can.getContext('2d');
    var barColors = [
        "#b91d47",
        "#00aba9",
        "#1e7145"
        ];
    new Chart(ctx, {
        type: "pie",
        data: {
            labels: ["Carbs", "Fats", "Proteins"],
            datasets: [{
            backgroundColor: barColors,
            data: [recipe_json.carbs, recipe_json.fat, recipe_json.protein]
            }]
        },
        options: {
            title: {
            display: false,
            text: "Nutrition Breakdown"
            }
        }
        });
    
    
    
}

function clearScreen()
{
    let tbody = document.getElementById("tbody");
    while (tbody.children.length)
    {
        tbody.lastElementChild.remove();
    }
}

