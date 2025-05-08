#!/usr/bin/env python
# coding: utf-8

# Natalia Arteaga, May, 2025
# Welcome to my AML Machine Learning Model!
# In this model, I go through credit card data and predict whether a transaction will be fraudulent or not

# In[1]:


#I will start by doing some basic imports 
# Step 1: Imports
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report, confusion_matrix, roc_auc_score


# In[9]:


#Now, I'll load my data

file_path = "creditcard.csv" 
creditcard = pd.read_csv(file_path)
creditcard


# In[11]:


# I will do some minor feature engineering
# Drop Time column
if 'Time' in creditcard.columns:
    creditcard.drop('Time', axis=1, inplace=True)

# Separate features and target
X = creditcard.drop('Class', axis=1)
y = creditcard['Class']

# Standardize 'Amount' column
scaler = StandardScaler()
X['Amount'] = scaler.fit_transform(X['Amount'].values.reshape(-1, 1))
creditcard


# In[12]:


# Now I will train split my data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, stratify=y, random_state=42)


# In[13]:


# Now I will train my model using logistic regression
log_model = LogisticRegression(class_weight='balanced', random_state=42)
log_model.fit(X_train, y_train)
y_pred_log = log_model.predict(X_test)


# In[14]:


#I will also train my model using random forrests 
rf_model = RandomForestClassifier(class_weight='balanced', random_state=42)
rf_model.fit(X_train, y_train)
y_pred_rf = rf_model.predict(X_test)


# In[22]:


# Lastly, I will train my model with XGBoost
xgb_model = XGBClassifier(scale_pos_weight=(len(y_train) - sum(y_train)) / sum(y_train), use_label_encoder=False, eval_metric='logloss', random_state=42)
xgb_model.fit(X_train, y_train)
y_pred_xgb = xgb_model.predict(X_test)


# In[23]:


#Next, I will evaluate my model efficacy using a ROC AUC curve
from xgboost import XGBClassifier

print("\nLogistic Regression")
print(classification_report(y_test, y_pred_log))
print("ROC AUC:", roc_auc_score(y_test, log_model.predict_proba(X_test)[:, 1]))

print("\nRandom Forest")
print(classification_report(y_test, y_pred_rf))
print("ROC AUC:", roc_auc_score(y_test, rf_model.predict_proba(X_test)[:, 1]))

print("\nXGBoost")
print(classification_report(y_test, y_pred_xgb))
print("ROC AUC:", roc_auc_score(y_test, xgb_model.predict_proba(X_test)[:, 1]))


# In[29]:


#The XGBoost model offers the most balanced model.
#Next, I will plot the ROC curves

from sklearn.metrics import classification_report, confusion_matrix, roc_auc_score, roc_curve
import matplotlib.pyplot as plt



fpr_log, tpr_log, _ = roc_curve(y_test, log_model.predict_proba(X_test)[:, 1])
fpr_rf, tpr_rf, _ = roc_curve(y_test, rf_model.predict_proba(X_test)[:, 1])
fpr_xgb, tpr_xgb, _ = roc_curve(y_test, xgb_model.predict_proba(X_test)[:, 1])

plt.figure(figsize=(8, 6))
plt.plot(fpr_log, tpr_log, label='Logistic Regression')
plt.plot(fpr_rf, tpr_rf, label='Random Forest')
plt.plot(fpr_xgb, tpr_xgb, label='XGBoost')
plt.plot([0, 1], [0, 1], 'k--', label='Random Chance')
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('ROC Curve Comparison')
plt.legend()
plt.grid(True)
plt.show()


# In[ ]:


#I can see in the above that the XGBoost model is indeed the most balanced model. 


# In[30]:


#Next, I will plot the confusion matrix
import seaborn as sns
fig, axs = plt.subplots(1, 3, figsize=(18, 5))

cm_log = confusion_matrix(y_test, y_pred_log)
cm_rf = confusion_matrix(y_test, y_pred_rf)
cm_xgb = confusion_matrix(y_test, y_pred_xgb)

sns.heatmap(cm_log, annot=True, fmt='d', cmap='Blues', ax=axs[0])
axs[0].set_title('Logistic Regression')
axs[0].set_xlabel('Predicted')
axs[0].set_ylabel('Actual')

sns.heatmap(cm_rf, annot=True, fmt='d', cmap='Greens', ax=axs[1])
axs[1].set_title('Random Forest')
axs[1].set_xlabel('Predicted')
axs[1].set_ylabel('Actual')

sns.heatmap(cm_xgb, annot=True, fmt='d', cmap='Oranges', ax=axs[2])
axs[2].set_title('XGBoost')
axs[2].set_xlabel('Predicted')
axs[2].set_ylabel('Actual')

plt.tight_layout()
plt.show()


# In summary:
# 
# Logistic Regression
# Catches almost all frauds (high recall)
# But 1,887 false positives (non-frauds marked as frauds)
# 
# Random Forest
# Very few false positives (only 3)
# But misses 44 frauds → lower recall
# 
# XGBoost
# Best balance: only 32 false negatives and 16 false positives
# Highest F1 score in previous results
# 
# “In high-risk environments like banking, I would recommend XGBoost for production due to its strong balance of recall and precision. However, for use cases where catching every possible fraud is worth the cost of false positives, Logistic Regression might be preferable.”

# In[ ]:




