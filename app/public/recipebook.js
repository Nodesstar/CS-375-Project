let name = document.getElementById("name");
        let user = '';
        fetch("/home")
            .then((response) => {
                return response.text();
            }).then((body) => {
                if (body == "Error") {
                    window.location.href = "login.html";
                } else {
                    user = body;
                    name.textContent = user;
                }
        });

let viewFoldersBtn = document.getElementById("view-folders");
//let addFolderBtn = document.getElementById("add-folder");
let deleteFolderBtn = document.getElementById("delete-folder");
let folderInput = document.getElementById("myFolders");
let addDeleteFolderInput = document.getElementById("target-folder");
let error = document.getElementById("err");

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
            error.textContent = "";
            clearScreen();
            fetch(`/getRecipesForFolders?username=${username}`)
            .then((response) => {
                response.json()
                .then((body) => {

                    fetch(`/getPantryListinDB?username=${username}`)
                    .then((response) => {
                        response.json()
                        .then((body2) => {
                            if (body2[0] === undefined)
                            {
                                alert("Fill out your Pantry profile before clicking further.");
                            }
                            else
                            {
                                console.log(body);
                                console.log(body2);
                                let pantry_str = body2[0].item_name.items;
                                let pantry_arr = pantry_str.split(",");
                                
                                let count = 0;
                                for (let i = 0; i < body.length; i++)
                                {
                                    if (body[i].folder_name === folderInput.value)
                                    {
                                        displayRecipes(body[i].recipe_info, pantry_arr);
                                        count += 1;
                                    }
                                }
                                if (count == 0) {
                                    error.textContent = "No recipes in folder";
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
    error.textContent = "";
    
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

