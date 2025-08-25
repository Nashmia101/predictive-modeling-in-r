# Nashmia Shakeel 34091904
source("my.prediction.stats.R")
source("wrappers.R")
library(glmnet)
library(rpart)
library(randomForest)
library(kknn)
library (boot)
getwd()
# 34091904.Q2.R
# 34091904.Q2.1.R
heart.train = read.csv("heart.train.ass3.2024.csv")
heart.test = read.csv("heart.test.ass3.2024.csv")
cv = learn.tree.cv(HD ~.,heart.train,nfolds=10,m=5000)
print(cv$best.tree)
# 34091904.Q2.2.R
plot(cv$best.tree)
text(cv$best.tree, pretty = 12)
# 34091904.Q2.5.R
heart.train$HD <- as.factor(heart.train$HD)
model_HD <- glm(HD ~.,heart.train, family = binomial)
final_log <- step(model_HD,k=log(nrow(heart.train)),direction = "both")
summary(final_log)
# 34091904.Q2.6.R
final_log$coefficients
# 34091904.Q2.7.R
heart.test$HD <- as.factor(heart.test$HD)
my.pred.stats(predict(cv$best.tree, heart.test)[,2], heart.test$HD)
my.pred.stats(predict(final_log, heart.test, type="response"), heart.test$HD)
# 34091904.Q2.8.R
tree_60 <-predict(cv$best.tree, heart.test[60,])[,2]
tree_odds <- tree_60/(1-tree_60)
print(tree_odds)
reg_60 <-predict(final_log, heart.test[60,],type="response")
reg_odds <- reg_60/(1-reg_60)
print(reg_odds)
# 34091904.Q2.9.R
boot.data = function(data, indices, patient_num)
{
  d = data[indices,]
  fit = glm(HD ~ EXANG + SLOPE + CA + THAL, data = d, family = binomial)
  boot_prob = predict(fit, heart.test[patient_num, ], type = "response")
  return(boot_prob)
}
set.seed(123) 
bs_65 = boot(data = heart.train, statistic = boot.data, R = 5000, patient_num = 65)
boot_65 <- boot.ci(bs_65, type = "bca")
print(boot_65)
set.seed(123) 
bs_66 = boot(data = heart.train, statistic = boot.data, R = 5000, patient_num = 66)
boot_66 <- boot.ci(bs_66, type = "bca")
print(boot_66)
