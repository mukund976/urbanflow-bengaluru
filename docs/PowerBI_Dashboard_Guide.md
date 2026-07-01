# UrbanFlow Bengaluru — BI Dashboard Guide

This guide converts the UrbanFlow dataset into a SQL + BI analytics project suitable for a portfolio/resume data analytics project.

## 1. Data Model

Recommended table:

- `traffic_analytics` — fact table containing traffic, weather, route, geospatial, and accident fields.

Optional dimensional model for advanced dashboarding:

- `DimDate`: Date, Year, Month, Month Name, Day of Week, Weekend Flag
- `DimArea`: Area, Latitude, Longitude, Road Type, Road Capacity
- `DimRoute`: Route Name, Area
- `DimWeather`: Weather Condition, Weather Severity Index
- `FactTraffic`: Vehicle Count, Speed, Travel Time, Congestion, Accident fields

For a student/portfolio project, a single flat table is acceptable and easier to demonstrate.

## 2. Dashboard Import Steps

1. Open your preferred BI/reporting tool.
2. Import `data/urbanflow_bengaluru_traffic.csv`.
3. Alternatively, connect to the database after running `sql/01_schema_mysql.sql` and importing the CSV.
4. During data preparation:
   - Set `date` as Date.
   - Set `time` as Time.
   - Set latitude/longitude as Decimal Number.
   - Ensure measures such as vehicle count, speed, travel time, rainfall, and KPI scores are numeric.
5. Create the KPI measures below.
6. Build six report pages using the layout suggestions.

## 3. Core KPI Measures

```DAX
Total Traffic Records = COUNTROWS(traffic_analytics)

Total Vehicle Count = SUM(traffic_analytics[vehicle_count])

Average Vehicle Count = AVERAGE(traffic_analytics[vehicle_count])

Average Speed = AVERAGE(traffic_analytics[average_speed_kmph])

Average Travel Time = AVERAGE(traffic_analytics[travel_time_min])

Congestion Index = AVERAGE(traffic_analytics[congestion_index])

Traffic Density Score = AVERAGE(traffic_analytics[traffic_density_score])

Road Efficiency Score = AVERAGE(traffic_analytics[road_efficiency_score])

Travel Reliability Score = AVERAGE(traffic_analytics[travel_reliability_score])

Accident Count =
CALCULATE(
    COUNTROWS(traffic_analytics),
    traffic_analytics[accident_reported] = "Yes"
)

Accident Rate % =
DIVIDE([Accident Count], [Total Traffic Records], 0) * 100

Average Accident Risk Score = AVERAGE(traffic_analytics[accident_risk_score])

Rainfall Impact Travel Time =
CALCULATE(
    [Average Travel Time],
    traffic_analytics[rainfall_mm] > 0
)
-
CALCULATE(
    [Average Travel Time],
    traffic_analytics[rainfall_mm] = 0
)

Rush Hour Avg Vehicle Count =
CALCULATE(
    [Average Vehicle Count],
    traffic_analytics[rush_hour_flag] = "Yes"
)

Non Rush Hour Avg Vehicle Count =
CALCULATE(
    [Average Vehicle Count],
    traffic_analytics[rush_hour_flag] = "No"
)
```

## 4. Calculated Columns

```DAX
Rainfall Band =
SWITCH(
    TRUE(),
    traffic_analytics[rainfall_mm] = 0, "No Rain",
    traffic_analytics[rainfall_mm] < 5, "Light Rainfall",
    traffic_analytics[rainfall_mm] < 15, "Moderate Rainfall",
    "Heavy Rainfall"
)

Speed Band =
SWITCH(
    TRUE(),
    traffic_analytics[average_speed_kmph] < 15, "Very Slow",
    traffic_analytics[average_speed_kmph] < 25, "Slow",
    traffic_analytics[average_speed_kmph] < 40, "Moderate",
    "Fast"
)

Delay Minutes =
traffic_analytics[travel_time_min] - traffic_analytics[expected_travel_time_min]
```

## 5. Dashboard Pages

### Page 1 — Executive Overview

**Cards/KPIs**

- Total Traffic Records
- Average Vehicle Count
- Average Speed
- Congestion Index
- Travel Reliability Score
- Accident Rate %

**Visuals**

- Line chart: Average Vehicle Count by Month
- Bar chart: Top 10 Congested Areas by Congestion Index
- Donut chart: Congestion Category share
- Matrix: Area, Avg Speed, Avg Travel Time, Congestion Index, Accident Risk Score

**Slicers**

- Date
- Area
- Weather Condition
- Rush Hour Flag
- Weekend Flag

### Page 2 — Traffic Analytics

**Visuals**

- Column chart: Vehicle Count by Hour
- Heatmap/matrix: Day of Week vs Hour with Avg Vehicle Count
- Bar chart: Area-wise Traffic Distribution
- Line chart: Monthly Traffic Trend
- Stacked column: Congestion Category by Road Type

**Insight focus**

Identify peak hours, recurring congestion, and high-volume corridors.

### Page 3 — Mobility Insights

**Visuals**

- Bar chart: Average Travel Time by Area
- Scatter plot: Congestion Index vs Average Speed, size by Vehicle Count
- Ranking table: Route Name, Avg Speed, Avg Travel Time, Road Efficiency Score, Reliability Score
- Line chart: Travel Reliability Score by Month

**Insight focus**

Compare route reliability and road efficiency.

### Page 4 — Weather Impact Analytics

**Visuals**

- Scatter plot: Rainfall mm vs Travel Time
- Column chart: Weather Condition vs Avg Speed
- Column chart: Rainfall Band vs Avg Travel Time
- Line chart: Monthly Rainfall and Congestion Index

**Insight focus**

Quantify how rain and severe weather increase delays.

### Page 5 — Safety & Risk Analytics

**Visuals**

- Bar chart: Accident Count by Area
- Bar chart: Accident Risk Score by Route
- Donut chart: Accident Severity distribution
- Matrix: Area, Accident Count, Accident Rate %, Avg Congestion Index, Avg Risk Score

**Insight focus**

Find accident hotspots and weather/congestion-related risk areas.

### Page 6 — Geospatial Analytics

**Visuals**

- Map visual: Latitude/Longitude, size by Vehicle Count, color by Congestion Category
- Filled/point map: Accident Risk Score by Area
- Tooltip fields: Area, Route, Avg Speed, Congestion Index, Accident Count, Rainfall

**Insight focus**

Show congestion zones, high-risk areas, and route performance geographically.

## 6. Recommended Dashboard Theme

- Primary color: Dark blue `#0B1F3A`
- Accent color: Traffic orange `#F97316`
- Risk color: Red `#DC2626`
- Success color: Green `#16A34A`
- Background: Light grey `#F8FAFC`

## 7. Project Storyline

1. Bengaluru traffic is highly uneven across corridors.
2. Peak-hour congestion is concentrated around IT and arterial routes.
3. Rainfall reduces speed and increases travel time.
4. Certain routes show consistently poor reliability.
5. Accident risk increases with congestion density and adverse weather.
6. Data-driven decisions can improve travel planning and urban mobility management.
