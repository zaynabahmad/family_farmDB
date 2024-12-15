# family_farmDB

## Prerequisites

Before you can use this database, ensure you have the following:

- **MySQL** installed (preferably MySQL 8.0 or above).
- **MySQL Workbench** installed for easier model visualization and management (optional but recommended).

## Database Setup

### 1. Clone the Repository

If you haven’t already cloned the repository, run the following command:

```bash
git clone https://github.com/zaynabahmad/family_farmDB.git
cd family_farmDB
```

### 2. database import

```bash
mysql -u root -p FamilyFarmDB < family_farmdb.sql
```

* Replace root with your MySQL username if it's different.
* Enter your MySQL password when prompted.

### 3. to show the DataBase

```sql
SHOW TABLES;
```

#### 4. adding data example

```sql
INSERT INTO Sensor_Reading_Fact (
    Sensor_Reading_ID, Sensor_ID, Reading_Value, Timestamp, Sensor_Type,
    Anomaly_Label, Alarm_Level, Condition_ID, Plant_ID, Unit_ID
) VALUES (
    1, 101, 23.5, '2024-11-23 12:00:00', 'Temperature', FALSE, 'Low', 2, 10, 3
);
```

### 5. some querying examples

```sql
SELECT * FROM Sensor_Reading_Fact WHERE Timestamp BETWEEN '2024-11-01' AND '2024-11-23';
```

### new data base

#### the query : new_db.sql

#### insert

*run the query insert_data.sql*

![data base image ](images/image.png)
