let usernameInput = document.getElementById("username");
let passwordInput = document.getElementById("password");
let result = document.getElementById("result");

document.getElementById("login").addEventListener("click", () => {
	fetch("/signin", {
		method: "POST",
		headers: {
			"Content-Type": "application/json"
		},
		body: JSON.stringify({
			username: usernameInput.value,
			plaintextPassword: passwordInput.value,
		})
	}).then((response) => {
		if (response.status === 200) {

			result.textContent = "Login successful"

            window.location.href = "index.html";


			result.classList.remove("error");
		} else {
			result.textContent = "Login failed";
			result.classList.add("error");
		}
	});
});