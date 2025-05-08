# Uncovering Credit Card Fraud Risk Patterns

This project explores time-based and transaction-level trends in credit card fraud using SQL and Tableau.

## Project Overview

Using a real-world anonymized dataset of over 280,000 transactions found on Kaggle, this dashboard identifies:

- When fraud is most likely to occur (2–4 AM)
- How risk varies across transaction sizes (Low, Medium, High)
- Which combinations of time and amount show the highest fraud rates

The data was cleaned and transformed using PostgreSQL, including feature engineering such as `amount_level` and `hour_of_day`. The resulting visuals were created in Tableau Public using a clean, data-science-aligned style.

Additionally, a machine learning model was built to predict fraud using Python. Three models were evaluated: Logistic Regression, Random Forest, and XGBoost. 

- **XGBoost** achieved the best balance between precision and recall, making it an excellent candidate for real-time fraud detection in a banking environment.
- **Logistic Regression**, with its high recall, could be preferred for pre-screening systems where catching all possible fraud—even with some false positives—is critical.
- **Random Forest** delivered the fewest false positives, favoring customer experience but missing some fraud cases.

### Dataset URL:
[Credit Card Fraud Detection – Kaggle](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)

## 📊 Dashboard Preview

[View the interactive Tableau dashboard](https://public.tableau.com/app/profile/natalia.arteaga6342/viz/AMLProjectDashboard/Dashboard1?publish=yes)

## Tools Used

- **PostgreSQL** — data cleaning, aggregation, and feature creation
- **Tableau Public** — interactive dashboard design and visualization
- **Python (Pandas, Scikit-Learn, XGBoost)** — ML modeling and evaluation

## Files

- `fraud_by_amount_and_hour.csv`: Aggregated output used in Tableau
- `/images`: Contains static screenshots of each Tableau visual
- `README.md`: Overview and structure of the project

##  Design

Fonts: Georgia (headings), Calibri (labels)

## Author

**Natalia Arteaga**  
Data Scientist & Analytics Professional  
 [narteagae.com](https://narteagae.com)
"""

# Save to file
updated_readme_path = "/mnt/data/README_updated.md"
with open(updated_readme_path, "w") as f:
    f.write(updated_readme)

updated_readme_path
