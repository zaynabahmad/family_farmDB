-- Create the database
CREATE DATABASE IF NOT EXISTS UserDatabase;

-- Use the database
USE UserDatabase;

-- Create the users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique ID for each user
    username VARCHAR(50) NOT NULL UNIQUE,   -- Unique username
    password VARCHAR(255) NOT NULL,         -- Password (hashed for security)
    database_name VARCHAR(50) NOT NULL,     -- User's database name
    DBUser VARCHAR(50) NOT NULL,     -- User's database user
	DBHost VARCHAR(50) NOT NULL,     -- User's database host
	DBPassword VARCHAR(50) NOT NULL,     -- User's database password
    email VARCHAR(100) NOT NULL UNIQUE,     -- Unique email address
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for when the user was created
);

-- Add index on email (for fast lookup)
CREATE INDEX idx_email ON Users (email);


INSERT INTO Users (username, password, database_name, DBUser, DBHost, DBPassword, email)
VALUES 
('user1', 'hashed_password1', 'USER1_db', 'user1_db_user', 'localhost', 'hashed_db_password1', 'user1@example.com'),
('user2', 'hashed_password2', 'user2_db', 'user2_db_user', 'localhost', 'hashed_db_password2', 'user2@example.com');

INSERT INTO Users (username, password, database_name, DBUser, DBHost, DBPassword, email)
VALUES 
('user3', 'hashed_password3', 'USER3_db', 'user3_db_user', 'localhost', 'hashed_db_password3', 'user3@example.com'),
('user4', 'hashed_password4', 'USER4_db', 'user4_db_user', 'localhost', 'hashed_db_password4', 'user4@example.com'),
('user5', 'hashed_password5', 'USER5_db', 'user5_db_user', 'localhost', 'hashed_db_password5', 'user5@example.com'),
('user6', 'hashed_password6', 'USER6_db', 'user6_db_user', 'localhost', 'hashed_db_password6', 'user6@example.com'),
('user7', 'hashed_password7', 'USER7_db', 'user7_db_user', 'localhost', 'hashed_db_password7', 'user7@example.com'),
('user8', 'hashed_password8', 'USER8_db', 'user8_db_user', 'localhost', 'hashed_db_password8', 'user8@example.com');

