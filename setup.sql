CREATE DATABASE munchlaxatmidnight;
\c munchlaxatmidnight;
CREATE TABLE users (
    username VARCHAR(25),
    hashed_password CHAR(60)
);
CREATE TABLE pantry (
	id SERIAL PRIMARY KEY,
	item_name VARCHAR(25),
	have_status BOOLEAN
);
CREATE TABLE recipebook(
    id SERIAL PRIMARY KEY,
    recipe_info JSON,
    folder_name VARCHAR(50),
    rating INT
);


