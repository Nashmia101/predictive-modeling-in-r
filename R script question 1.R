# Nashmia Shakeel 34091904
source("my.prediction.stats.R")
source("wrappers.R")
library(glmnet)
library(rpart)
library(randomForest)
library(kknn)
library (boot)
getwd()
# 34091904.Q1.R
# 34091904.Q1.1.R
first = read.csv("concrete.ass3.2024.csv")
fit = lm(Strength ~., first)
summary(fit)
# 34091904.Q1.2.R
pval <- coefficients(summary(fit))[,4]  
pval < 0.05/8
# 34091904.Q1.4.R
pruned_fit <- step(fit, k = log(nrow(first)), direction="both")
summary(pruned_fit)
print(pruned_fit)
# 34091904.Q1.5.R
new_concrete_mix = data.frame(
  Cement = 491,  Blast.Furnace.Slag = 26,  Fly.Ash = 123,  Water = 210,  Superplasticizer = 3.9,  Coarse.Aggregate = 882,   Fine.Aggregate = 699,  Age = 28)
predict(pruned_fit, new_concrete_mix, interval = 'confidence',level = 0.95)
