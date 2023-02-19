library(mlbench)
library(caret)
library(dplyr)

w <- read.csv("WineQT.csv")

glimpse(w)
nrow(w)

#check complete cases
mean(complete.cases(w))

#create function
train_test_split <- function(data,train_size = 0.8){
  set.seed(42) 
  n <- nrow(data) 
  id <- sample(1:n, size = n*train_size) 
  train_data <- data[id,] 
  test_data <- data[-id,] 
  
  return(list(train_data,test_data))
}

#step
#split data 

set.seed(42)
split_data <- train_test_split(w)
train_data <- split_data[[1]]
test_data <- split_data[[2]]

nrow(train_data); nrow(test_data)

#train 
# K-fold cross validation
set.seed(42)
ctrl<- trainControl(method = "repeatedcv" ,
                    number = 5,
                    verboseIter = T,
                    repeats = 5 )

#regression model- 1

lm_model <- train(quality ~.,
                  data = train_data,
                  method = "lm",
                  trControl = ctrl)

#KNN model- 2

knn_model <- train(quality ~.,
                  data = train_data,
                  method = "knn",
                  metric = "kappa",
                  trControl = ctrl)

#random forest model- 3

rf_model <- train(quality ~.,
                   data = train_data,
                   method = "rf",
                   metric = "accuracy",
                   trControl = ctrl)


#scoring 

p1 <- predict(lm_model, newdata = test_data)
p2 <- predict(knn_model, newdata = test_data)
p3 <- predict(rf_model, newdata = test_data)

#4. evaluate model - p1

list_models <- list(
  logistic = lm_model,
  knn = knn_model,
  rainforest = rf_model
)

result <- resamples(list_models)

summary(result)



