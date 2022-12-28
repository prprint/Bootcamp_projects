library(caret)

#stat
model1 <- lm(mpg ~ hp + wt,
             data = mtcars)
model1

#caret train()
#mpg target
model2 <- train(mpg ~ hp + wt,
      data = mtcars,
      method = "lm") #lm (linear model) Algorithm
#rpart tree
model2
model2$finalModel

#########################################

#ML basic pipeline
# 1.prepare/split data

sample(1:6, size = 3)
sample(1:6, size = 10, replace = T)

# set.seed(42)
# n <- nrow(mtcars)
# id <- sample(1:n, size=n*0.8)
# train_data <- mtcars[id, ]
# test_data <- mtcars[-id, ]
split_data <- train_test_split(mtcars)
train_data <- split_data[[1]]
test_data <- split_data[[2]]

# 2.train model
#cv = K-Fold Cross Validation Gloden stand.
#if you have time you can use repeatedcv Super Gloden Stand.
ctrl <- trainControl(method = "repeatedcv", number = 5,
                     repeats = 4,
                     verboseIter = TRUE)

model <- train(mpg ~ hp + wt,
               data = train_data,
               method = "lm",
               trControl = ctrl)

# 3.score model / prediction
p_mpg <- predict(model, newdata = test_data)

# 4.evaluate model
error <- p_mpg - test_data$mpg
(test_rmse <- sqrt(mean(error**2)))

#5. save model
saveRDS(model,"linearReg_Model.RDS")
