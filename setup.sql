CREATE DATABASE munchlaxatmidnight;
\c munchlaxatmidnight;
CREATE TABLE users (
    username VARCHAR(25),
    hashed_password CHAR(60)
);
CREATE TABLE pantry (
	id SERIAL PRIMARY KEY,
    username VARCHAR(25) REFERENCES users(username),
	item_name JSON,
	have_status BOOLEAN
);
CREATE TABLE recipebook(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) REFERENCES users(username),
    recipe_info JSON,
    folder_name VARCHAR(50),
    rating INT
);
CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    item_name TEXT
);


