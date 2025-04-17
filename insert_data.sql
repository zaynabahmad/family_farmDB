use vertical_farm2 ;

-- mock data  

-- show tables;

-- DESCRIBE Units;
-- DESCRIBE Planting_Methods;
-- DESCRIBE Plates;
-- DESCRIBE Plants;
-- DESCRIBE Sensor_Readings;
-- DESCRIBE Alerts;
-- DESCRIBE Actuators;


INSERT INTO Units (unit_id, unit_name, location)
VALUES 
(1, 'Unit A', 'Location 1'),
(2, 'Unit B', 'Location 2');


INSERT INTO Planting_Methods (planting_method_id, method_name)
VALUES 
(1, 'Fully Grown'),
(2, 'Microgreens');


INSERT INTO Plates (plate_id, unit_id, plate_name, planting_method_id)
VALUES 
(1, 1, 'Plate 1', 1),
(2, 1, 'Plate 2', 2);

-- for updating weekly -- 
-- UPDATE Plants 
-- SET age_in_weeks = age_in_weeks + 1 
-- WHERE harvested = FALSE;



INSERT INTO Sensor_Readings (reading_id, plate_id,anomly_detection, timestamp, temperature, humidity, light_intensity, nutrient_level, ph, ec)
VALUES 
(1, 1,0, '2024-12-10 10:00:00', 21.5, 64.0, 290.0, 1.4, 6.1, 1.3),
(2, 2,0, '2024-12-10 10:05:00', 23.0, 61.0, 330.0, 1.7, 6.4, 1.5),
(3, 1,0, '2024-12-10 10:10:00', 19.5, 72.0, 280.0, 1.5, 6.2, 1.4),
(4, 1,0, '2024-12-10 10:15:00', 22.0, 67.0, 310.0, 1.6, 6.3, 1.6),
(5, 2,1,'2024-12-10 10:20:00', 20.5, 70.0, 275.0, 1.3, 6.0, 1.2),
(6, 2,0, '2024-12-10 10:25:00', 23.0, 63.0, 340.0, 1.7, 6.5, 1.7),
(7, 1,1, '2024-12-10 10:30:00', 21.0, 69.0, 285.0, 1.4, 6.2, 1.3),
(8, 2,0, '2024-12-10 10:35:00', 22.5, 68.0, 320.0, 1.6, 6.4, 1.5),
(9, 2,0, '2024-12-10 10:40:00', 20.0, 71.0, 270.0, 1.2, 6.1, 1.4),
(10,1,0, '2024-12-10 10:45:00', 24.0, 60.0, 350.0, 1.8, 6.6, 1.6);

INSERT INTO Desired_Conditions (plant_id, growth_stage, temperature, humidity, red_light, blue_light, far_red, nutrient_level, ph, watering_frequency_per_day)
VALUES 
(1, 1, 22.0, 65.0, 100.0, 150.0, 20.0, 1.5, 6.2, 3),  
(1, 2, 22.5, 64.0, 110.0, 160.0, 25.0, 1.6, 6.3, 3),  
(1, 3, 23.0, 63.0, 120.0, 170.0, 30.0, 1.7, 6.4, 3),   
(1, 4, 23.5, 62.0, 130.0, 180.0, 35.0, 1.8, 6.5, 3),   
(1, 5, 24.0, 61.0, 140.0, 190.0, 40.0, 1.9, 6.6, 3),   
(1, 6, 24.5, 60.0, 150.0, 200.0, 45.0, 2.0, 6.7, 3),   
(1, 7, 25.0, 59.0, 160.0, 210.0, 50.0, 2.1, 6.8, 3),   
(1, 8, 25.5, 58.0, 170.0, 220.0, 55.0, 2.2, 6.9, 3),  
(2, 0, 20.0, 75.0, 80.0, 100.0, 15.0, 1.3, 6.0, 4),   
(2, 1, 21.0, 70.0, 90.0, 110.0, 20.0, 1.4, 6.1, 4),   
(2, 2, 21.5, 68.0, 100.0, 120.0, 25.0, 1.5, 6.2, 4),
(2, 3, 22.0, 65.0, 110.0, 130.0, 30.0, 1.6, 6.3, 4),   
(2, 4, 22.5, 63.0, 120.0, 140.0, 35.0, 1.7, 6.4, 4),   
(2, 5, 23.0, 60.0, 130.0, 150.0, 40.0, 1.8, 6.5, 4),   
(2, 6, 23.5, 58.0, 140.0, 160.0, 45.0, 1.9, 6.6, 4),   
(2, 7, 24.0, 55.0, 150.0, 170.0, 50.0, 2.0, 6.7, 4),   
(2, 8, 24.5, 53.0, 160.0, 180.0, 55.0, 2.1, 6.8, 4);   


INSERT INTO Alerts (alert_id, plate_id, message, timestamp)
VALUES 
(1, 1, 'Temperature too low', '2024-12-10 11:00:00'),
(2, 2, 'Humidity too high', '2024-12-10 11:05:00'),
(3, 2, 'Nutrient level too low', '2024-12-10 11:10:00'),
(4, 2, 'pH value out of range', '2024-12-10 11:15:00'),
(5, 2, 'Light intensity too low', '2024-12-10 11:20:00'),
(6, 1, 'Temperature too high', '2024-12-10 11:25:00'),
(7, 1, 'Nutrient level too high', '2024-12-10 11:30:00'),
(8, 1, 'Humidity too low', '2024-12-10 11:35:00'),
(9, 1, 'Light intensity too high', '2024-12-10 11:40:00'),
(10,1, 'EC level too high', '2024-12-10 11:45:00');

INSERT INTO Actuators (actuator_id, unit_id, actuator_type, status, start_time, end_time)
VALUES 
(1, 1, 'Pump', 'On', '2024-12-10 09:00:00', '2024-12-10 10:00:00'),
(2, 1, 'Mixer', 'Off', '2024-12-10 09:05:00', '2024-12-10 10:05:00'),
(3, 1, 'Valve', 'On', '2024-12-10 09:10:00', '2024-12-10 10:10:00'),
(4, 1, 'Drain', 'Off', '2024-12-10 09:15:00', '2024-12-10 10:15:00'),
(5, 1, 'Pump', 'Off', '2024-12-10 09:20:00', '2024-12-10 10:20:00'),
(6, 1, 'Mixer', 'On', '2024-12-10 09:25:00', '2024-12-10 10:25:00'),
(7, 1, 'Valve', 'Off', '2024-12-10 09:30:00', '2024-12-10 10:30:00'),
(8, 1, 'Drain', 'On', '2024-12-10 09:35:00', '2024-12-10 10:35:00'),
(9, 1, 'Pump', 'On', '2024-12-10 09:40:00', '2024-12-10 10:40:00'),
(10,1, 'Mixer', 'Off', '2024-12-10 09:45:00', '2024-12-10 10:45:00');


SELECT * FROM Units;
SELECT * FROM Planting_Methods;
SELECT * FROM Plates;
SELECT * FROM Plants;
SELECT * FROM Sensor_Readings;
SELECT * FROM Alerts;
SELECT * FROM Actuators;
SELECT * FROM Desired_Conditions;
SELECT * FROM Disease_Detection_Results;



-- //////////////////////////////////////////////////// -- 

INSERT INTO Plants (plant_id, plant_name , age_in_weeks, plate_id, harvested)
VALUES 
(1, 'Lavender', 1, 1, FALSE),
(1, 'Lavender', 2, 1, FALSE), 
(2, 'Rosemary', 1, 2, FALSE);



INSERT INTO Sensor_Readings (plate_id, plant_id, timestamp, temperature, humidity, light_intensity, nutrient_level, ph, ec, anomly_detection) 
VALUES 
(1, 1, NOW(), 25.5, 65, 1200, 6.5, 6.8, 2.3, 0),
(2, 2, NOW(), 22.0, 70, 1100, 5.8, 6.2, 2.1, 0);

INSERT INTO Alerts (plate_id, message, timestamp) 
VALUES 
(1, 'Low humidity', NOW()),
(2, 'High temperature', NOW());

INSERT INTO Disease_Detection_Results (plant_id, disease_name, detection_timestamp) 
VALUES 
(1, 'Fungal infection', NOW()),
(2, 'Bacterial wilt', NOW());

SELECT @@sql_mode;
SET GLOBAL sql_mode = REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', '');
SELECT @@GLOBAL.sql_mode;



UPDATE Plants 
SET harvested = true 
WHERE Plants.plant_id = 1;


-- DROP TRIGGER IF EXISTS after_plant_harvest;


SELECT * FROM Historical_Data;

-- SET FOREIGN_KEY_CHECKS = 0;

-- DROP TABLE IF EXISTS Plants;

-- SET FOREIGN_KEY_CHECKS = 1;




DESCRIBE Plants;

SELECT * FROM Plants WHERE plant_id = 1;
SELECT * FROM Plants WHERE harvested = FALSE;











-- INSERT INTO Disease_Detection_Results (plant_id, disease_name ,detection_timestamp) 
-- VALUES 
-- (1, 'Powdery Mildew',NOW()), 
-- (2, '' ,NOW()); -- السطر الثاني سيجعل `disease_detected` = FALSE









