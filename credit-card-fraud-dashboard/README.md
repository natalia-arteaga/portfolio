# Uncovering Credit Card Fraud Risk Patterns

This project explores time-based and transaction-level trends in credit card fraud using SQL and Tableau.

## Project Overview

Using a real-world anonymized dataset of over 280,000 transactions, this dashboard identifies:

- When fraud is most likely to occur (2–4 AM)
- How risk varies across transaction sizes (Low, Medium, High)
- Which combinations of time and amount show the highest fraud rates

The data was cleaned and transformed using PostgreSQL, including feature engineering such as `amount_level` and `hour_of_day`. The resulting visuals were created in Tableau Public using a clean, data-science-aligned style.

## Dashboard Preview

 [View the interactive Tableau dashboard](https://public.tableau.com/app/profile/natalia.arteaga6342/viz/AMLProjectDashboard/Dashboard1?publish=yes) 

**Screenshots:**
![heatmap](images/heatmap.png)
![dual-axis](images/dual_axis.png)
![area](images/area_chart.png)

## Tools Used

- **PostgreSQL** — data cleaning, aggregation, and feature creation
- **Tableau Public** — interactive dashboard design and visualization
- **Python (Pandas)** — used for CSV export prep 

## Files

- `fraud_by_amount_and_hour.csv`: Aggregated output used in Tableau
- `/images`: Contains static screenshots of each Tableau visual
- `README.md`: Overview and structure of the project

## Design

Fonts: Georgia (headings), Calibri (labels)  

## Author

**Natalia Arteaga**  
Data Scientist & Analytics Professional  
🔗 [narteagae.com](https://narteagae.com)
