CREATE DATABASE munchlaxatmidnight;
\c munchlaxatmidnight;
CREATE TABLE users (
    username VARCHAR(25),
    hashed_password CHAR(60)
);
