CREATE DATABASE IF NOT EXISTS vertical_farm2;
USE vertical_farm2;


CREATE TABLE IF NOT EXISTS Units (
    unit_id INT AUTO_INCREMENT PRIMARY KEY,
    unit_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS Planting_Methods (
    planting_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS Plates (
    plate_id INT AUTO_INCREMENT PRIMARY KEY,
    unit_id INT,
    plate_name VARCHAR(255) NOT NULL,
    planting_method_id INT,
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id) ON DELETE CASCADE,
    FOREIGN KEY (planting_method_id) REFERENCES Planting_Methods(planting_method_id)
);


CREATE TABLE IF NOT EXISTS Plants (
    plant_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_name VARCHAR(255) NOT NULL,
    growth_stage INT NOT NULL,
    plate_id INT,
    FOREIGN KEY (plate_id) REFERENCES Plates(plate_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Desired_Conditions (
    condition_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_id INT,
    growth_stage INT NOT NULL,
    temperature FLOAT NOT NULL,
    humidity FLOAT NOT NULL,
    red_light FLOAT NOT NULL,  
    blue_light FLOAT NOT NULL,  
    far_red FLOAT NOT NULL,  
    nutrient_level FLOAT NOT NULL,
    ph FLOAT NOT NULL,  
    watering_frequency_per_day INT NOT NULL,  
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Sensor_Readings (
    reading_id INT AUTO_INCREMENT PRIMARY KEY,
    plate_id INT,
    anomly_detection INT,
    timestamp DATETIME NOT NULL,
    temperature FLOAT NOT NULL,
    humidity FLOAT NOT NULL,
    light_intensity FLOAT NOT NULL,
    nutrient_level FLOAT NOT NULL,
    ph FLOAT NOT NULL,  
    ec FLOAT NOT NULL,  
    FOREIGN KEY (plate_id) REFERENCES Plates(plate_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Actuators (
    actuator_id INT AUTO_INCREMENT PRIMARY KEY,
    unit_id INT,
    actuator_type VARCHAR(255) NOT NULL,  
    start_time DATETIME NOT NULL,
    end_time DATETIME,  
    status VARCHAR(50) NOT NULL, 
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    plate_id INT,
    
    message VARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL,
    FOREIGN KEY (plate_id) REFERENCES Plates(plate_id) ON DELETE CASCADE
    
);
