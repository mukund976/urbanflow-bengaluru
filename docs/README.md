# UrbanFlow: Bengaluru Traffic Analytics & Mobility Insights
https://mukund976.github.io/urbanflow-bengaluru/

https://mukund976.github.io/urbanflow-bengaluru/dashboard.html

UrbanFlow is a data analytics and business intelligence project that analyzes Bengaluru traffic, weather, road, and accident patterns to identify congestion hotspots, route performance, travel reliability, weather impact, and accident-prone locations.

This version is built as a **SQL + BI-ready analytics project** and includes an analytics-ready Bengaluru traffic dataset with 100,000 records for portfolio demonstration.

## Project Objectives

- Analyze traffic patterns across Bengaluru locations.
- Identify congestion hotspots and high-delay corridors.
- Measure the impact of rainfall and weather on traffic flow.
- Evaluate route efficiency and travel reliability.
- Detect accident-prone areas and high-risk routes.
- Create dashboard-ready KPIs for business intelligence reporting.

## Folder Structure

```text
urbanflow_bengaluru/
├── data/
│   └── urbanflow_bengaluru_traffic.csv
├── docs/
│   └── PowerBI_Dashboard_Guide.md
├── sql/
│   ├── 01_schema_mysql.sql
│   └── 02_business_analysis_queries.sql
└── README.md
```

## Dataset

File: `data/urbanflow_bengaluru_traffic.csv`

Rows: 100,000 demonstration records

### Key Columns

- Date/time: `date`, `time`, `year`, `month`, `day_of_week`, `hour`
- Location: `area`, `route_name`, `latitude`, `longitude`, `road_type`
- Traffic: `vehicle_count`, `traffic_volume`, `average_speed_kmph`, `travel_time_min`
- Weather: `weather_condition`, `temperature_c`, `rainfall_mm`
- Safety: `accident_reported`, `accident_severity`
- Engineered KPIs: `congestion_index`, `traffic_density_score`, `road_efficiency_score`, `travel_reliability_score`, `accident_risk_score`

## Bengaluru Areas Covered

- Silk Board
- Marathahalli
- Whitefield
- KR Puram
- Electronic City
- Hebbal
- MG Road
- Indiranagar
- Jayanagar
- Yeshwanthpur
- Koramangala
- Banashankari

## KPI Definitions

### Congestion Index

```text
Congestion Index = Vehicle Count / Road Capacity
```

Measures road load compared to available capacity.

### Traffic Density Score

```text
Traffic Density Score = Congestion Index × 100
```

Converts congestion into a percentage-style density score.

### Road Efficiency Score

```text
Road Efficiency Score = Average Speed / Congestion Index
```

Higher values indicate better road performance under traffic load.

### Travel Reliability Score

```text
Travel Reliability Score = Expected Travel Time / Actual Travel Time
```

A score closer to 1 means actual travel time is close to expected travel time.

### Accident Risk Score

Composite score based on:

- Traffic density
- Weather severity
- Road type
- Accident occurrence

## Business Questions Answered

### Traffic Analysis

- Which Bengaluru locations experience the highest congestion?
- Which hours have the highest vehicle counts?
- Which days of the week experience the highest traffic volume?

### Mobility Insights

- Which routes are most reliable?
- Which areas have the longest average travel times?
- Which locations experience recurring delays?

### Weather Impact

- How does rainfall affect travel time?
- Which weather conditions reduce average speed the most?

### Safety Insights

- Which locations are accident hotspots?
- Which routes have the highest accident risk scores?

## SQL Usage

1. Open MySQL Workbench.
2. Run `sql/01_schema_mysql.sql` to create the database and table.
3. Import `data/urbanflow_bengaluru_traffic.csv` into the `traffic_analytics` table.
4. Run `sql/02_business_analysis_queries.sql` for analysis outputs.

## BI Dashboard Usage

1. Open the included browser dashboard or your preferred BI tool.
2. Import the CSV directly or connect to the database.
3. Create KPI measures from `docs/PowerBI_Dashboard_Guide.md`.
4. Build or review six dashboard pages:
   - Executive Overview
   - Traffic Analytics
   - Mobility Insights
   - Weather Impact Analytics
   - Safety & Risk Analytics
   - Geospatial Analytics

## Dashboard KPIs

- Total Traffic Records
- Average Vehicle Count
- Average Speed
- Average Travel Time
- Congestion Index
- Road Efficiency Score
- Travel Reliability Score
- Accident Count
- Accident Rate %
- Accident Risk Score

## Expected Insights

The analytics dataset is structured so that typical analysis reveals:

- Silk Board, Marathahalli, Whitefield, KR Puram, and Electronic City as major congestion corridors.
- Peak traffic during morning and evening commute hours.
- Rainfall and fog reducing speed and increasing travel time.
- Higher accident risk during congested and adverse-weather conditions.
- Route reliability varying significantly by area and road type.

## Resume Bullet Points

- Built a SQL and BI-ready Bengaluru traffic analytics project using 100,000 transportation records to analyze congestion, mobility, weather impact, and accident risk.
- Designed database schema, business analysis queries, KPI calculations, and dashboard-ready metrics for urban mobility intelligence.
- Developed BI dashboard blueprint covering executive KPIs, traffic trends, route reliability, weather impact, safety analytics, and geospatial insights.
- Created analytical features including congestion index, road efficiency score, travel reliability score, weather severity index, and accident risk score.

## Tools & Skills Demonstrated

- SQL
- SQL / Relational Databases
- Business Intelligence Dashboards
- DAX
- Data Cleaning
- Data Modeling
- KPI Design
- Business Intelligence
- Dashboard Development
- Traffic Analytics
- Geospatial Analytics
- Storytelling with Data
