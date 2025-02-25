CREATE DATABASE IF NOT EXISTS blazorapp;
       
CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    password VARCHAR(256),
    role VARCHAR(20) DEFAULT 'user'
)

CREATE TYPE status_enum AS ENUM ('NotStarted', 'Started', 'Completed', 'Bug', 'Deleted');

CREATE TABLE Tasks (
                       Id SERIAL PRIMARY KEY,
                       task_name VARCHAR(255) NOT NULL,
                       _Status status_enum NOT NULL DEFAULT 'NotStarted',
                       description TEXT,
                       userId INT NOT NULL,
                       FOREIGN KEY (userId) REFERENCES Users(Id) ON DELETE CASCADE
);
