CREATE DATABASE IF NOT EXISTS USER1_db;
USE USER1_db;


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



CREATE TABLE Plants (
    plant_id INT NOT NULL, 
    plant_name VARCHAR(255) NOT NULL,
    age_in_weeks INT NOT NULL DEFAULT 0, 
    plate_id INT,
    harvested BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (plant_id, age_in_weeks), 
    FOREIGN KEY (plate_id) REFERENCES Plates(plate_id) ON DELETE CASCADE
);

ALTER TABLE Plants ADD COLUMN harvest_timestamp DATETIME NULL;



CREATE TABLE IF NOT EXISTS Desired_Conditions (
    condition_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_id INT,
    growth_age_week INT NOT NULL,
    light_time_day INT NOT NULL,
    temperature_min FLOAT NOT NULL,
    temperature_max FLOAT NOT NULL,
    humidity_min FLOAT NOT NULL,
    humidity_max FLOAT NOT NULL,
    red_light FLOAT NOT NULL,  
    blue_light FLOAT NOT NULL,  
    far_red FLOAT NOT NULL,
    air_flow VARCHAR(255) NOT NULL,
    solution_level FLOAT NOT NULL,
    ph_min FLOAT NOT NULL,
    ph_max FLOAT NOT NULL,
    ec_min FLOAT NOT NULL,
    ec_max FLOAT NOT NULL,
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
    red_light_intensity FLOAT ,
    blue_light_intensity FLOAT ,
    far_red_light_intensity FLOAT ,
    air_flow_level FLOAT ,
    CO2 FLOAT,
    solution_level FLOAT NOT NULL,
    ph FLOAT NOT NULL,  
    ec FLOAT NOT NULL,  
    FOREIGN KEY (plate_id) REFERENCES Plates(plate_id) ON DELETE CASCADE
);

-- state any change in any state -- 
CREATE TABLE IF NOT EXISTS Actuators_feedback (
    actuator_id INT AUTO_INCREMENT PRIMARY KEY,
    timestamp DATETIME NOT NULL,
    unit_id INT,
    actuator_type VARCHAR(255) NOT NULL,    
    state VARCHAR(50) NOT NULL,  -- on or off -- 
    FOREIGN KEY (unit_id) REFERENCES Units(unit_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    plate_id INT,    
    message VARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL,
    FOREIGN KEY (plate_id) REFERENCES Plates(plate_id) ON DELETE CASCADE
    
);



CREATE TABLE IF NOT EXISTS Disease_Detection_Results (
    detection_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_id INT,
    detection_timestamp DATETIME NOT NULL,
    disease_detected BOOLEAN NOT NULL,
    disease_name VARCHAR(255),
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Historical_Data (
    historical_data_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_id INT,
    plate_id INT,
    timestamp DATETIME NOT NULL,
    temperature FLOAT NOT NULL,
    humidity FLOAT NOT NULL,
    light_intensity FLOAT NOT NULL,
    nutrient_level FLOAT NOT NULL,
    ph FLOAT NOT NULL,  
    ec FLOAT NOT NULL,
    alerts VARCHAR(255), 
    diseases_detected VARCHAR(255), 
    harvested BOOLEAN DEFAULT FALSE, 
    FOREIGN KEY (plate_id) REFERENCES Plates(plate_id) ON DELETE CASCADE,
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id) ON DELETE CASCADE
);

ALTER TABLE Historical_Data MODIFY alerts TEXT;

CREATE TABLE IF NOT EXISTS Plant_Quality (   -- insert feeh just harvested plants 
    quality_id INT AUTO_INCREMENT PRIMARY KEY,
    plant_id INT,
    harvest_timestamp DATETIME ,
    weight FLOAT ,  -- Weight of the plant in grams or kilograms
    active_ingredient_level FLOAT,  -- Level of active ingredients (e.g., medicinal compounds)
    visual_quality VARCHAR(255),  -- Description of visual quality (e.g., "Excellent", "Good", "Poor")
    additional_notes TEXT,  -- Optional field for extra details about quality
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id) ON DELETE CASCADE
);


-- ////////////////////////////////////-- 
-- add trigger to the plant data to move to the historical data  --
DELIMITER $$

CREATE TRIGGER after_plant_harvest
AFTER UPDATE ON Plants
FOR EACH ROW
BEGIN
    -- Check if the plant was just harvested
    IF NEW.harvested = TRUE AND OLD.harvested = FALSE THEN

        -- Insert historical data for the harvested plant
        INSERT INTO Historical_Data (   
            plant_id, 
            plate_id, 
            timestamp, 
            temperature, 
            humidity, 
            light_intensity, 
            nutrient_level, 
            ph, 
            ec, 
            alerts, 
            diseases_detected, 
            harvested
        )
        SELECT 
            NEW.plant_id, 
            sr.plate_id, 
            sr.timestamp, 
            sr.temperature, 
            sr.humidity, 
            sr.light_intensity, 
            sr.solution_level, 
            sr.ph, 
            sr.ec, 
            -- Concatenate alerts and disease data
            (SELECT GROUP_CONCAT(a.message SEPARATOR '; ') FROM Alerts a WHERE a.plate_id = sr.plate_id) AS alerts,
            (SELECT GROUP_CONCAT(d.disease_name SEPARATOR '; ') FROM Disease_Detection_Results d WHERE d.plant_id = NEW.plant_id) AS diseases_detected,
            NEW.harvested
        FROM Sensor_Readings sr
        WHERE sr.plant_id = NEW.plant_id;

        -- Insert default quality record for the harvested plant
        INSERT INTO Plant_Quality (
            plant_id, 
            harvest_timestamp, 
            weight, 
            visual_quality
        )
        VALUES (
            NEW.plant_id, 
            NOW(), -- Use the current timestamp
            NULL,  -- Default value; can be updated later
            NULL   -- Default value; can be updated later
        );

        -- Delete related sensor readings for the harvested plant
        DELETE FROM Sensor_Readings WHERE plant_id = NEW.plant_id;

        -- Delete disease detection results for the harvested plant
        DELETE FROM Disease_Detection_Results WHERE plant_id = NEW.plant_id;

        -- Delete alerts related to the plant's plate
        DELETE FROM Alerts WHERE plate_id IN (SELECT plate_id FROM Plates WHERE plate_id = NEW.plate_id);
    END IF;
END$$

DELIMITER ;



-- lsa moshkelt eno msh b esave just ely had diseases not saved the others 



ALTER TABLE Sensor_Readings
ADD COLUMN plant_id INT AFTER plate_id;

ALTER TABLE Sensor_Readings
ADD CONSTRAINT fk_plant_id
FOREIGN KEY (plant_id) REFERENCES Plants(plant_id) ON DELETE CASCADE;


  
DELIMITER $$

CREATE TRIGGER before_insert_disease_detection
BEFORE INSERT ON Disease_Detection_Results
FOR EACH ROW
BEGIN
    IF NEW.disease_name IS NOT NULL AND TRIM(NEW.disease_name) <> '' THEN
        SET NEW.disease_detected = TRUE;
    ELSE
        SET NEW.disease_detected = FALSE;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER before_update_disease_detection
BEFORE UPDATE ON Disease_Detection_Results
FOR EACH ROW
BEGIN
    IF NEW.disease_name IS NOT NULL AND TRIM(NEW.disease_name) <> '' THEN
        SET NEW.disease_detected = TRUE;
    ELSE
        SET NEW.disease_detected = FALSE;
    END IF;
END$$

DELIMITER ;

ALTER TABLE Desired_Conditions
ADD COLUMN predictive_yield FLOAT;

