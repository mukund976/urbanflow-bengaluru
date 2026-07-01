-- UrbanFlow Bengaluru: Business Analysis SQL Queries
USE urbanflow_bengaluru;

-- 1. Executive KPI summary
SELECT
    COUNT(*) AS total_traffic_records,
    ROUND(AVG(vehicle_count), 2) AS avg_vehicle_count,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index,
    ROUND(AVG(travel_reliability_score), 3) AS avg_travel_reliability_score,
    ROUND(SUM(CASE WHEN accident_reported = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS accident_rate_pct
FROM traffic_analytics;

-- 2. Top congestion hotspots
SELECT
    area,
    road_type,
    COUNT(*) AS records,
    ROUND(AVG(vehicle_count), 0) AS avg_vehicle_count,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min
FROM traffic_analytics
GROUP BY area, road_type
ORDER BY avg_congestion_index DESC
LIMIT 10;

-- 3. Peak traffic hours
SELECT
    hour,
    COUNT(*) AS records,
    ROUND(AVG(vehicle_count), 0) AS avg_vehicle_count,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min
FROM traffic_analytics
GROUP BY hour
ORDER BY avg_vehicle_count DESC;

-- 4. Day-of-week traffic volume ranking
SELECT
    day_of_week,
    ROUND(AVG(vehicle_count), 0) AS avg_vehicle_count,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph
FROM traffic_analytics
GROUP BY day_of_week
ORDER BY avg_vehicle_count DESC;

-- 5. Rush hour vs non-rush hour impact
SELECT
    rush_hour_flag,
    ROUND(AVG(vehicle_count), 0) AS avg_vehicle_count,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index
FROM traffic_analytics
GROUP BY rush_hour_flag;

-- 6. Route performance ranking
SELECT
    route_name,
    area,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index,
    ROUND(AVG(road_efficiency_score), 2) AS avg_road_efficiency_score,
    ROUND(AVG(travel_reliability_score), 3) AS avg_travel_reliability_score
FROM traffic_analytics
GROUP BY route_name, area
ORDER BY avg_travel_reliability_score DESC, avg_road_efficiency_score DESC;

-- 7. Rainfall impact on travel time and speed
SELECT
    CASE
        WHEN rainfall_mm = 0 THEN 'No Rain'
        WHEN rainfall_mm < 5 THEN 'Light Rainfall'
        WHEN rainfall_mm < 15 THEN 'Moderate Rainfall'
        ELSE 'Heavy Rainfall'
    END AS rainfall_band,
    COUNT(*) AS records,
    ROUND(AVG(rainfall_mm), 2) AS avg_rainfall_mm,
    ROUND(AVG(vehicle_count), 0) AS avg_vehicle_count,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index
FROM traffic_analytics
GROUP BY rainfall_band
ORDER BY avg_rainfall_mm;

-- 8. Weather condition impact analysis
SELECT
    weather_condition,
    COUNT(*) AS records,
    ROUND(AVG(weather_severity_index), 2) AS avg_weather_severity,
    ROUND(AVG(vehicle_count), 0) AS avg_vehicle_count,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min,
    ROUND(AVG(travel_reliability_score), 3) AS avg_reliability_score
FROM traffic_analytics
GROUP BY weather_condition
ORDER BY avg_travel_time_min DESC;

-- 9. Accident hotspot identification
SELECT
    area,
    route_name,
    COUNT(*) AS total_records,
    SUM(CASE WHEN accident_reported = 'Yes' THEN 1 ELSE 0 END) AS accident_count,
    ROUND(SUM(CASE WHEN accident_reported = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS accident_rate_pct,
    ROUND(AVG(accident_risk_score), 2) AS avg_accident_risk_score,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index
FROM traffic_analytics
GROUP BY area, route_name
HAVING accident_count > 0
ORDER BY accident_count DESC, avg_accident_risk_score DESC
LIMIT 10;

-- 10. Accident severity distribution
SELECT
    accident_severity,
    COUNT(*) AS incident_records,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_share
FROM traffic_analytics
WHERE accident_reported = 'Yes'
GROUP BY accident_severity
ORDER BY incident_records DESC;

-- 11. Monthly traffic and congestion trend
SELECT
    year,
    month,
    month_name,
    ROUND(AVG(vehicle_count), 0) AS avg_vehicle_count,
    ROUND(AVG(average_speed_kmph), 2) AS avg_speed_kmph,
    ROUND(AVG(travel_time_min), 2) AS avg_travel_time_min,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index,
    SUM(CASE WHEN accident_reported = 'Yes' THEN 1 ELSE 0 END) AS accident_count
FROM traffic_analytics
GROUP BY year, month, month_name
ORDER BY year, month;

-- 12. Map-ready congestion layer
SELECT
    area,
    ROUND(AVG(latitude), 6) AS latitude,
    ROUND(AVG(longitude), 6) AS longitude,
    ROUND(AVG(congestion_index), 3) AS avg_congestion_index,
    ROUND(AVG(traffic_density_score), 2) AS avg_density_score,
    ROUND(AVG(accident_risk_score), 2) AS avg_accident_risk_score,
    CASE
        WHEN AVG(congestion_index) >= 1.15 THEN 'Severe'
        WHEN AVG(congestion_index) >= 0.90 THEN 'High'
        WHEN AVG(congestion_index) >= 0.65 THEN 'Moderate'
        ELSE 'Low'
    END AS congestion_zone
FROM traffic_analytics
GROUP BY area
ORDER BY avg_congestion_index DESC;
