# Diabetes Insights Dashboard: Population Risk & Care Opportunities

This project uses Tableau visualizations to highlight risk stratification and care gap identification among diabetic patients.

🔍 **Key Views Include:**
- Risk Tier Classification by Age Group
- Care Gap Analysis based on Glucose Thresholds
- Positive Diagnosis Distribution
- Summary of Key Patient Metrics (KPIs)

📊 **Data Source**: Kaggle Diabetes Dataset  https://www.kaggle.com/datasets/mathchi/diabetes-data-set
🧰 **Tools Used**: Tableau Public  
📎 **View Dashboard**: [See it on Tableau Public] https://public.tableau.com/app/profile/natalia.arteaga6342/viz/DiabetesDashboard_17479128443060/Dashboard


📁 **Purpose**:  

To support healthcare professionals in identifying high-risk diabetic populations and prioritize outreach for improved outcomes.

## 🤖 Machine Learning

We used a cleaned version of the Kaggle diabetes dataset to train several classification models. Logistic Regression provided the best trade-off between sensitivity and specificity. Key steps included:

- Data Cleaning and EDA
- Train/Test Split
- Model Comparison: Logistic Regression, Random Forest, XGBoost
- Evaluation: ROC-AUC, Precision, Recall, F1 Score

## Diabetes Prediction Model Performance

This binary classification model (Logistic Regression baseline) was trained on the Pima Indians Diabetes Dataset to identify patients at risk of diabetes. Below are the key evaluation metrics on the held-out test set:

| Metric      | Score  | Interpretation                                                                                                                                      |
|-------------|:------:|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Accuracy**  | 0.72   | The model correctly classifies 72% of all patients. This modestly exceeds a naïve majority-class baseline (~65%).                                   |
| **Precision** | 0.59   | Of patients predicted as diabetic, 59% truly have diabetes. There are roughly 4 false positives for every 10 positive predictions.                   |
| **Recall**    | 0.75   | The model detects 75% of actual diabetes cases, missing about 1 in 4 patients who do have diabetes.                                                   |
| **F₁ Score**  | 0.66   | Harmonic mean of precision and recall, reflecting the trade-off: good sensitivity but room to reduce false alarms.                                     |
| **ROC-AUC**   | 0.73   | Fair ability to discriminate between diabetic and non-diabetic patients across all classification thresholds (1.0 = perfect, 0.5 = random guessing). |

### Next Steps
- **Threshold tuning:** Adjust the decision threshold to balance precision vs. recall for your use case.  
- **Feature engineering:** Add or transform features (e.g., interactions, polynomial terms) to boost discriminatory power.  
- **Model experimentation:** Try tree-based models (Random Forest, XGBoost) or regularized logistic regression with hyperparameter tuning via `GridSearchCV` or `RandomizedSearchCV`.  
- **Cross-validation:** Implement k-fold cross-validation to ensure stability of performance estimates.


📓 [View Jupyter Notebook](notebooks/diabetes_ml_model.ipynb)
