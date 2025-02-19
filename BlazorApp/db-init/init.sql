CREATE DATABASE IF NOT EXISTS blazorapp;
       
CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150)
)