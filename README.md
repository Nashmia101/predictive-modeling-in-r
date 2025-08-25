# predictive-modeling-in-r
Built predictive models in R using regression, decision trees, logistic regression, and k-NN to analyse real-world datasets (concrete strength, heart disease, mass spectrometry) with cross-validation and bootstrap inference
---

## Overview
This project demonstrates practical skills in statistical modelling, predictive analytics, and machine learning.  
The work is divided into three main parts:

### 1. Concrete Strength Prediction (Regression)
- Built a **multiple linear regression model** to predict compressive strength from mixture components.  
- Applied **Bonferroni correction** for statistical significance testing.  
- Used **stepwise selection with BIC** to identify the best subset of predictors.  
- Predicted compressive strength for a new concrete mix and compared it to the existing industry standard.  

### 2. Heart Disease Prediction (Classification)
- Fitted a **decision tree** using cross-validation to identify key predictors of heart disease.  
- Built a **logistic regression model with stepwise selection (BIC)**.  
- Compared both models on test data using **custom prediction statistics**.  
- Calculated patient-specific odds and used **bootstrap confidence intervals** to assess differences between individuals.  

### 3. Mass Spectrometry Data Smoothing (k-NN)
- Implemented **k-nearest neighbours (k-NN)** regression to smooth noisy mass spectrometry data.  
- Measured performance with **mean squared error (MSE)** and selected optimal `k` via cross-validation.  
- Evaluated trade-offs between background noise smoothing and accurate peak detection.  
- Applied **bootstrap resampling** to estimate confidence intervals for predicted intensities.  

---

## Results
- Delivered **interpretable and accurate predictive models** across regression, classification, and smoothing tasks.  
- Logistic regression proved more reliable than decision trees for heart disease prediction.  
- k-NN successfully smoothed noisy mass spectrometry signals, with `k` choice critical to balancing accuracy vs. noise.  
- Applied **bootstrap methods** to provide statistical confidence in model predictions.  

---

## Skills & Tools
- **Languages & Libraries:** R, glm, rpart, randomForest, glmnet, kknn, boot  
- **Techniques:** Regression, Classification, Decision Trees, Logistic Regression, Cross-Validation, Stepwise Selection, k-NN, Bootstrapping  
- **Applications:** Predictive modelling, medical diagnostics, materials science, signal smoothing  

---

## Author
**Nashmia Shakeel**  
