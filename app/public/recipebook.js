let viewFoldersBtn = document.getElementById("view-folders");
//let addFolderBtn = document.getElementById("add-folder");
let deleteFolderBtn = document.getElementById("delete-folder");
let folderInput = document.getElementById("myFolders");
let addDeleteFolderInput = document.getElementById("target-folder");

let username = '';
fetch("/home")
.then((response) => {
    return response.text();
}).then((body) => {
    if (body == "Error") 
    {
        window.location.href = "login.html";
    } 
    else 
    {
        username = body;
        //name.textContent = username;
        viewFoldersBtn.addEventListener("click", () => {
            clearScreen();
            fetch(`/getRecipesForFolders?username=${username}`)
            .then((response) => {
                response.json()
                .then((body) => {

                    fetch(`/getPantryListinDB?username=${username}`)
                    .then((response) => {
                        response.json()
                        .then((body2) => {
                            console.log(body);
                            console.log(body2);
                            let pantry_str = body2[0].item_name.items;
                            let pantry_arr = pantry_str.split(",");
                            
                            for (let i = 0; i < body.length; i++)
                            {
                                if (body[i].folder_name === folderInput.value)
                                {
                                    displayRecipes(body[i].recipe_info, pantry_arr);
                                }
                                
                            }
                        });
                    });

                    
                });
            });
        });
    }
});

// addFolderBtn.addEventListener("click", () => {
//     fetch(`storeFolderNamesinDB?username=${username}`, {
//         method: "POST",
//         headers: {
//             "Content-Type": "application/json"
//         },
//         body: JSON.stringify({
//             folder: addDeleteFolderInput.value
//         })
//     })
//     .then((response) => {
//         response.json()
//         .then(body => {
//             console.log(body);
//         });
//     });
// });

deleteFolderBtn.addEventListener("click", () => {
    
    console.log("deleteFolderusername", username);
    let store_recipe = ""
	

    fetch(`/saverecipe?username=${username}&deleteBtn=true`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },    
        body: JSON.stringify({
            recipe: store_recipe,
            folder_name: folderInput.value
        })
        })
        .then((response) => {
            response.text();
        }).then((body) => {
            viewFoldersBtn.click();
            console.log("success");
        });
});

