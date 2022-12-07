

function displayRecipes(recipe_json, pantry_arr)
{
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
    td1.textContent = recipeName;
    link_a.href = directions_link;
    link_a.textContent = "How-to Directions";

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
    for (let i = 0; i < justTheIngredientsArr.length; i++)
    {
        if (!pantry_arr.includes(justTheIngredientsArr[i].food))
        {
            let li = document.createElement("li");
            ul3.append(li);
            li.textContent = justTheIngredientsArr[i].food;
        }
    }

    let td4 = document.createElement("td");
    tr.append(td4);
    td4.style.border = '1px solid black';
    td4.textContent = calories;

    let td5 = document.createElement("td");
    tr.append(td5);
    td5.style.border = '1px solid black';
    
    

    

    
    
}

function clearScreen()
{
    let tbody = document.getElementById("tbody");
    while (tbody.children.length)
    {
        tbody.lastElementChild.remove();
    }
}

