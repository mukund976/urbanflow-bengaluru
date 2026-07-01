-- UrbanFlow Bengaluru Traffic Analytics
-- MySQL schema for importing data/urbanflow_bengaluru_traffic.csv

CREATE DATABASE IF NOT EXISTS urbanflow_bengaluru;
USE urbanflow_bengaluru;

DROP TABLE IF EXISTS traffic_analytics;

CREATE TABLE traffic_analytics (
    record_id INT PRIMARY KEY,
    date DATE,
    time TIME,
    year INT,
    month INT,
    month_name VARCHAR(10),
    day_of_week VARCHAR(15),
    hour INT,
    area VARCHAR(100),
    route_name VARCHAR(150),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    road_type VARCHAR(50),
    road_capacity INT,
    vehicle_count INT,
    traffic_volume INT,
    average_speed_kmph DECIMAL(6,2),
    travel_time_min DECIMAL(8,2),
    expected_travel_time_min DECIMAL(8,2),
    weather_condition VARCHAR(50),
    temperature_c DECIMAL(5,1),
    rainfall_mm DECIMAL(8,2),
    accident_reported VARCHAR(5),
    accident_severity VARCHAR(20),
    rush_hour_flag VARCHAR(5),
    weekend_flag VARCHAR(5),
    traffic_density_score DECIMAL(8,2),
    congestion_index DECIMAL(8,3),
    congestion_category VARCHAR(20),
    weather_severity_index DECIMAL(5,2),
    road_efficiency_score DECIMAL(10,2),
    travel_reliability_score DECIMAL(8,3),
    accident_risk_score DECIMAL(8,2)
);

-- Recommended indexes for analytics performance
CREATE INDEX idx_area ON traffic_analytics(area);
CREATE INDEX idx_route ON traffic_analytics(route_name);
CREATE INDEX idx_date ON traffic_analytics(date);
CREATE INDEX idx_hour ON traffic_analytics(hour);
CREATE INDEX idx_weather ON traffic_analytics(weather_condition);
CREATE INDEX idx_congestion ON traffic_analytics(congestion_category);
CREATE INDEX idx_accident ON traffic_analytics(accident_reported);

-- Import option 1: MySQL Workbench Table Data Import Wizard
-- Import option 2: LOAD DATA LOCAL INFILE. Update the path before running.
/*
LOAD DATA LOCAL INFILE '/absolute/path/urbanflow_bengaluru_traffic.csv'
INTO TABLE traffic_analytics
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/
