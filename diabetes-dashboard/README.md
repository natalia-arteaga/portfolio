# Diabetes Insights Dashboard: Population Risk & Care Opportunities

This project uses Tableau visualizations to highlight risk stratification and care gap identification among diabetic patients.

🔍 **Key Views Include:**
- Risk Tier Classification by Age Group
- Care Gap Analysis based on Glucose Thresholds
- Positive Diagnosis Distribution
- Summary of Key Patient Metrics (KPIs)

📊 **Data Source**: Kaggle Diabetes Dataset  https://www.kaggle.com/datasets/mathchi/diabetes-data-set
🧰 **Tools Used**: Tableau Public  
📎 **View Dashboard**: [See it on Tableau Public]([https://public.tableau.com/app/profile/natalia.arteaga6342/viz/DiabetesDashboard/](https://public.tableau.com/app/profile/natalia.arteaga6342/viz/DiabetesDashboard_17479128443060/Dashboard))

📁 **Purpose**:  

To support healthcare professionals in identifying high-risk diabetic populations and prioritize outreach for improved outcomes.

## 🤖 Machine Learning

We used a cleaned version of the Kaggle diabetes dataset to train several classification models. Logistic Regression provided the best trade-off between sensitivity and specificity. Key steps included:

- Data Cleaning and EDA
- Train/Test Split
- Model Comparison: Logistic Regression, Random Forest, XGBoost
- Evaluation: ROC-AUC, Precision, Recall, F1 Score

📓 [View Jupyter Notebook](notebooks/diabetes_ml_model.ipynb)
