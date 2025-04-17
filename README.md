# 🌿 Smart Plant Growth Monitoring & Optimization System Database Schema

This document provides a comprehensive explanation of the **Smart Hydroponic Vertical Farming System** database schema. It is designed to manage, monitor, and optimize medical plant growth conditions using real-time sensor data, computer vision models, and actuator control feedback. This database ensures traceability, historical analysis, and support for reinforcement learning (RL)-based optimization.

---

##  Overview

This database schema is created **per user**, i.e., each user has a separate database with this exact structure.

**Project Goals:**

- Enable precise environmental control for hydroponic vertical farms.
- Facilitate disease detection via vision models.
- Optimize plant growth through historical data analysis and ML/RL models.
- Track harvesting and plant quality for feedback loops.

---

##  Key Tables & Purposes

### 🔹 `Units`

Stores metadata about farming units (unit id , location , etc ).

### 🔹 `Planting_Methods`

Describes the techniques used for planting

### 🔹 `Plates`

Represents growing trays associated with a unit and a planting method.

### 🔹 `Plants`

Tracks plant types and growth status within plates. It includes `harvested` flags and timestamp logs for harvesting.

### 🔹 `Desired_Conditions`

Stores optimal environmental parameters for each plant at specific growth stages (weekly).

Includes:

- Light schedule & spectrum
- Temperature & humidity ranges
- pH & EC thresholds
- Airflow and nutrient solution requirements

Also contains `predictive_yield`, used for yield forecasting models.

### 🔹 `Sensor_Readings`

Logs real-time sensor measurements per plant and plate, including:

- Temperature
- Humidity
- CO₂
- pH / EC
- Light spectrums
- Nutrient levels

Supports anomaly detection and traceability. ( will be working on )

### 🔹 `Actuators_feedback`

Logs state changes (ON/OFF) of environmental control components (lights, fans, pumps, etc.).

### 🔹 `Alerts`

Contains messages to be shown on the dashboard when conditions deviate from desired ranges.

### 🔹 `Disease_Detection_Results`

Stores results from CV models for disease detection (e.g., Septoria, Botrytis).

### 🔹 `Historical_Data`

Records all plant and environment data after harvest, including:

- Conditions during growth
- Alerts & diseases
- Status (harvested or not)

Used for offline training, analytics, and RL simulation.

### 🔹 `Plant_Quality`

Captures post-harvest evaluation:

- Weight
- Active ingredients
- Visual quality
- Notes

---

## 🔁 Triggers (Automation)

### ✅ `after_plant_harvest`

Triggered when a plant is marked as harvested:

- Moves data to `Historical_Data`
- Logs default `Plant_Quality`
- Deletes sensor data, alerts, and disease results
- Deletes the plant from `Plants` to clean the active workspace

### ✅ `before_insert_disease_detection` & `before_update_disease_detection`

Automatically set `disease_detected = TRUE` if a disease name is present.

---

## ⚙️ How to Use

### 🔧 1. Create the Database

Run the main schema file (for example `create_user1.sql`) in your MySQL server:

```bash
mysql -u your_user -p < create_user1.sql

```

 this will create a database for user1  
> the main schema for all users

### how it is going 
for each new user register in the application it it will store his data in usersDB which have 

username , password , database_name (will be auto generated with his name ) , DBUser, DBHost , DBPassword (auto generated ),email and the time it register in 

after this it will create for him a database with the main schema 

### to try test some data 
```bash
mysql -u your_user -p < create_userdb.sql

```
will create the database for the users 

```bash
mysql -u your_user -p < final_db_ec2.sql

```

will create a database for a user1 

```bash
mysql -u your_user -p < insert_data.sql

```
will insert some data in the database 





