# UrbanFlow BI Dashboard Build Instructions

This guide documents the dashboard implementation assets: CSV dataset, KPI measures, theme configuration, schema, and page-level wireframes.

## Files to Use

- Dataset: `downloads/urbanflow_bengaluru_traffic.csv`
- Theme: `powerbi/UrbanFlow_Theme.json`
- DAX: `powerbi/UrbanFlow_DAX_Measures.dax`
- SQL: `sql/01_schema_mysql.sql`, `sql/02_business_analysis_queries.sql`

## Step-by-Step

1. Open your preferred BI/reporting tool.
2. Import the CSV dataset.
3. Select `urbanflow_bengaluru_traffic.csv`.
4. Confirm data types:
   - `date`: Date
   - `time`: Time
   - `latitude`, `longitude`: Decimal number
   - speed, traffic, rainfall, KPI scores: Decimal/Whole number
5. Apply the included theme configuration `UrbanFlow_Theme.json` where supported.
6. Create the KPI measures:
   - Add a dedicated measures section/table
   - Name it `Measures`
   - Add measures from `UrbanFlow_DAX_Measures.dax`.
7. Build the pages below.

## Dashboard Pages

### 1. Executive Command Center

**Top KPI cards**

- Total Traffic Records
- Average Vehicle Count
- Average Speed
- Average Travel Time
- Congestion Index
- Accident Rate %

**Visuals**

- Line chart: Average Vehicle Count by Month Name
- Bar chart: Congestion Index by Area
- Donut: Congestion Category share
- Matrix: Area, Avg Speed, Travel Time, Congestion Index, Reliability, Risk

### 2. Traffic Pulse Analytics

**Visuals**

- Column chart: Average Vehicle Count by Hour
- Matrix heatmap: Day of Week vs Hour, value = Average Vehicle Count
- Stacked bar: Congestion Category by Road Type
- Line chart: Average Vehicle Count by Date

### 3. Mobility & Route Reliability

**Visuals**

- Ranking table: Route Name, Avg Speed, Avg Travel Time, Road Efficiency, Reliability, Route Performance Score
- Scatter: Congestion Index vs Average Speed, size = Vehicle Count, legend = Road Type
- Bar: Average Travel Time by Area
- Gauge/card: Travel Reliability Score

### 4. Weather Disruption Intelligence

**Visuals**

- Scatter: Rainfall mm vs Travel Time
- Bar: Weather Condition vs Avg Speed
- Bar: Weather Condition vs Travel Time
- Card: Rainfall Delay Impact

### 5. Safety & Accident Risk

**Visuals**

- Bar: Accident Count by Area
- Map: Accident Risk Score by Latitude/Longitude
- Donut: Accident Severity
- Matrix: Area, Accident Count, Accident Rate %, Risk Score, Congestion Index

### 6. Geospatial Mobility Map

**Visuals**

- Azure Maps or Map visual:
  - Latitude = latitude
  - Longitude = longitude
  - Size = Vehicle Count
  - Color/Legend = Congestion Category
  - Tooltips = Area, Route Name, Average Speed, Congestion Index, Accident Risk Score

## Suggested Layout Style

- Page background: `#07111F`
- Visual background: `#0D1B2F`
- Accent orange: `#F97316`
- Blue: `#38BDF8`
- Red risk: `#EF4444`
- Green success: `#22C55E`

## Publishing

1. Save the report as `UrbanFlow_Bengaluru_Dashboard`.
2. Sign in to your publishing workspace.
3. Publish the report to the selected workspace.
4. Use the platform’s public sharing option if available.
5. Copy the public link and add it to the website if needed.

> Note: Public sharing can be restricted in some organizations. If restricted, use the included browser-based dashboard page for presentation.
