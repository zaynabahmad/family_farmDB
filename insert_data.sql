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


INSERT INTO Plants (plant_id, plant_name, growth_stage, plate_id)
VALUES 
(1, 'Lavender', 1, 1),   -- Growth stage at 1 week
(2, 'Lavender', 2, 1),   -- Growth stage at 2 weeks
(3, 'Lavender', 3, 1),   -- Growth stage at 3 weeks
(4, 'Lavender', 4, 1),   -- Growth stage at 4 weeks
(5, 'Lavender', 5, 1),   -- Growth stage at 5 weeks
(6, 'Lavender', 6, 1),   -- Growth stage at 6 weeks
(7, 'Lavender', 7, 1),   -- Growth stage at 7 weeks
(8, 'Lavender', 8, 1),   -- Growth stage at 8 weeks
(9, 'Sunflower', 0, 2),  -- Seedling stage at 0 weeks
(10, 'Sunflower', 1, 2),  -- Growth stage at 1 week
(11, 'Sunflower', 2, 2),  -- Growth stage at 2 weeks
(12, 'Sunflower', 3, 2),  -- Growth stage at 3 weeks
(13, 'Sunflower', 4, 2),  -- Growth stage at 4 weeks
(14, 'Sunflower', 5, 2),  -- Growth stage at 5 weeks
(15, 'Sunflower', 6, 2),  -- Growth stage at 6 weeks
(16, 'Sunflower', 7, 2),  -- Growth stage at 7 weeks
(17, 'Sunflower', 8, 2);  -- Growth stage at 8 weeks


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
(1, 1, 22.0, 65.0, 100.0, 150.0, 20.0, 1.5, 6.2, 3),   -- نبات "لافندر" في المرحلة 1
(1, 2, 22.5, 64.0, 110.0, 160.0, 25.0, 1.6, 6.3, 3),   -- نبات "لافندر" في المرحلة 2
(1, 3, 23.0, 63.0, 120.0, 170.0, 30.0, 1.7, 6.4, 3),   -- نبات "لافندر" في المرحلة 3
(1, 4, 23.5, 62.0, 130.0, 180.0, 35.0, 1.8, 6.5, 3),   -- نبات "لافندر" في المرحلة 4
(1, 5, 24.0, 61.0, 140.0, 190.0, 40.0, 1.9, 6.6, 3),   -- نبات "لافندر" في المرحلة 5
(1, 6, 24.5, 60.0, 150.0, 200.0, 45.0, 2.0, 6.7, 3),   -- نبات "لافندر" في المرحلة 6
(1, 7, 25.0, 59.0, 160.0, 210.0, 50.0, 2.1, 6.8, 3),   -- نبات "لافندر" في المرحلة 7
(1, 8, 25.5, 58.0, 170.0, 220.0, 55.0, 2.2, 6.9, 3),   -- نبات "لافندر" في المرحلة 8
(2, 0, 20.0, 75.0, 80.0, 100.0, 15.0, 1.3, 6.0, 4),   -- نبات "دوار الشمس" في مرحلة البذرة
(2, 1, 21.0, 70.0, 90.0, 110.0, 20.0, 1.4, 6.1, 4),   -- نبات "دوار الشمس" في المرحلة 1
(2, 2, 21.5, 68.0, 100.0, 120.0, 25.0, 1.5, 6.2, 4),   -- نبات "دوار الشمس" في المرحلة 2
(2, 3, 22.0, 65.0, 110.0, 130.0, 30.0, 1.6, 6.3, 4),   -- نبات "دوار الشمس" في المرحلة 3
(2, 4, 22.5, 63.0, 120.0, 140.0, 35.0, 1.7, 6.4, 4),   -- نبات "دوار الشمس" في المرحلة 4
(2, 5, 23.0, 60.0, 130.0, 150.0, 40.0, 1.8, 6.5, 4),   -- نبات "دوار الشمس" في المرحلة 5
(2, 6, 23.5, 58.0, 140.0, 160.0, 45.0, 1.9, 6.6, 4),   -- نبات "دوار الشمس" في المرحلة 6
(2, 7, 24.0, 55.0, 150.0, 170.0, 50.0, 2.0, 6.7, 4),   -- نبات "دوار الشمس" في المرحلة 7
(2, 8, 24.5, 53.0, 160.0, 180.0, 55.0, 2.1, 6.8, 4);   -- نبات "دوار الشمس" في المرحلة 8


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







