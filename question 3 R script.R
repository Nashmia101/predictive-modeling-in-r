# Nashmia Shakeel 34091904
# 34091904.Q3.R
# 34091904.Q3.1.R
source("my.prediction.stats.R")
source("wrappers.R")
library(glmnet)
library(rpart)
library(randomForest)
library(kknn)
library (boot)
getwd()
train= read.csv("ms.train.2024.csv")
test = read.csv("ms.test.2024.csv")
values = c()
for (k in 1:25){
  knn = (fitted(kknn(intensity ~ MZ, train, test, k=k, kernel="optimal")))
  values[k] <- mean((knn - test$intensity)^2)
}
plot(1:25, values, type = "b", col = "blue",pch=19,
     xlab = "k (Number of Neighbors)", ylab = "Mean Squared Error",
     main = "mean-squared errors vs k-values")  
# 34091904.Q3.2.R
k_values <- c(2, 6, 12, 25)
for (k in k_values){
  knn_graphs = (fitted(kknn(intensity ~ MZ, train, test, k=k, kernel="optimal")))
  plot(train$MZ, train$intensity, col = "blue", pch = 20, 
       xlab = "MZ", ylab = "Intensity", main = paste("k =", k))
  
  lines(test$MZ, test$intensity, col = "green", lwd = 2)
  
  lines(test$MZ, knn_graphs, col = "red", lwd = 2, lty = 2)
  
  legend("topleft", legend = c("Training Data", "True Spectrum", "Estimated Spectrum"),
         col = c("blue", "green", "red"), lty = c(NA, 1, 2), pch = c(20, NA, NA), lwd = c(NA, 2, 2),cex = 0.8)
}
# 34091904.Q3.3.R
k_values <- c(2, 6, 12, 25)
mse_results <- sapply(k_values, function(k) {
  knn_3 <-(fitted(kknn(intensity ~ MZ, train, test, k = k, kernel = "optimal")))
  mean(mean((knn_3 - test$intensity)^2))
})
print(mse_results)
# 34091904.Q3.4.R
set.seed(123)  
knn_cv <- train.kknn(intensity ~ MZ, train, kmax = 25, kernel = "optimal")
first_k <-knn_cv$best.parameters$k
print(first_k)
# 34091904.Q3.5.R
knn_4 <-(fitted(kknn(intensity ~ MZ, train, test, k = 6, kernel = "optimal")))
sd_value = (sd((knn_4 - test$intensity)))
print(sd_value)
# 34091904.Q3.7.R
max_speculated = max(knn_graphs)
max_actual <- test$MZ[knn_graphs == max_speculated]
print("Maximum estimated intensity:")
print(max_speculated)
print("MZ corresponding to the maximum estimated intensity:")
print(max_actual)
# 34091904.Q3.8.R
max_value = 5790.8
boot.data_2 = function(data, indices, k, max_value)
{
  d_2 = data[indices,]
  boot_2 <- (fitted(kknn(intensity ~ MZ, train = d_2, test, k = k, kernel = "optimal"))[test$MZ == max_value])
  return(boot_2)
}
limit <- 5000
k <- 6  
boot_six <- boot(data = train, statistic = function(data, indices) {
  boot.data_2(data, indices, k, max_value)
}, R = limit)
first_boot_interval <- boot.ci(boot_six, conf = 0.95, type = "bca")
print("for k=6 the interval is:")
print(first_boot_interval)
k <- 3 
limit <- 5000
boot_three <- boot(data = train, statistic = function(data, indices) {
  boot.data_2(data, indices, k, max_value)
}, R = limit)
second_boot_interval <- boot.ci(boot_three, conf = 0.95, type = "bca")
print("for k=3 the interval is:")
print(second_boot_interval)
k <- 20
limit <- 5000
boot_twen <- boot(data = train, statistic = function(data, indices) {
  boot.data_2(data, indices, k, max_value)
}, R = limit)
third_boot_interval <- boot.ci(boot_twen, conf = 0.95, type = "bca")
print("for k=20 the interval is:")
print(third_boot_interval)
