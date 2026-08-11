# Predictive Modelling in R

Built predictive models in R using regression, decision trees, logistic regression, and k-NN to analyse real-world datasets (concrete strength, heart disease, mass spectrometry), applying cross-validation and bootstrap inference throughout for model evaluation and confidence estimation.

---

## Overview

This project demonstrates practical skills in statistical modelling, predictive analytics, and machine learning, divided into three parts.

### 1. Concrete Strength Prediction (Regression)

- Built a **multiple linear regression model** to predict compressive strength from mixture components (cement, blast furnace slag, fly ash, water, superplasticizer, coarse/fine aggregate, age)
- Applied a **Bonferroni correction** (α/8) for statistical significance testing across predictors
- Used **stepwise selection with BIC** (`step()` with `k = log(n)`) to identify the optimal subset of predictors
- Predicted compressive strength for a new concrete mix using the pruned model, with a 95% confidence interval

### 2. Heart Disease Prediction (Classification)

- Fitted a **decision tree** using 10-fold cross-validation to identify key predictors of heart disease
- Built a **logistic regression model** with stepwise selection (BIC) for comparison
- Evaluated both models on held-out test data using custom prediction statistics
- Calculated patient-specific odds for individual test cases and used **bootstrap confidence intervals** (BCa method, 5,000 resamples) to assess differences in predicted risk between individuals

### 3. Mass Spectrometry Data Smoothing (k-NN)

- Implemented **k-nearest neighbours (k-NN)** regression (optimal kernel) to smooth noisy mass spectrometry intensity data against MZ (mass-to-charge ratio)
- Measured performance via **mean squared error (MSE)** across k = 1 to 25, and selected the optimal k using `train.kknn` cross-validation
- Visualised smoothing behaviour at k = 2, 6, 12, and 25 to evaluate the trade-off between noise suppression and peak detection accuracy
- Applied **bootstrap resampling** (5,000 resamples, BCa confidence intervals) at multiple k values to estimate confidence intervals around the predicted peak intensity

---

## Tools & Techniques

- **Language:** R
- **Libraries:** `glmnet`, `rpart`, `randomForest`, `kknn`, `boot`
- **Techniques:** Multiple linear regression, Bonferroni correction, stepwise BIC selection, decision trees, logistic regression, k-fold cross-validation, k-NN regression, bootstrap resampling (BCa intervals)
- **Applications:** Materials science (concrete strength), medical diagnostics (heart disease), signal processing (mass spectrometry)

---

## Files

- `R_script_question_1.R` — concrete strength regression analysis
- `R_script_question_2.R` — heart disease classification (decision tree vs. logistic regression)
- `question_3_R_script.R` — mass spectrometry k-NN smoothing and bootstrap intervals

---

## Author

Nashmia Shakeel
