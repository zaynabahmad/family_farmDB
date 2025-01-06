-- Create the database
CREATE DATABASE UserDatabase;

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

