#Classification
#Accuracy the most : better
data("PimaIndiansDiabetes") #เบาหวาน
df <- PimaIndiansDiabetes
head(df)

#Target Diabetes
glimpse(df)

df %>% 
  count(diabetes) %>%
  mutate(pct = n/sum(n))

mean(complete.cases(df))

#Build Model
split_data <- train_test_split(df)
train_data <- split_data[[1]]
test_data <- split_data[[2]]


nrow(train_data)
nrow(test_data)

set.seed(34)
crtl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

# build knn model
knn_model <- train(diabetes ~ . ,
               data = train_data,
               method = "knn",
               metric = "Accuracy",
               trControl = crtl)
p1 <- predict(model, newdata = test_data)

mean(p1 == test_data$diabetes)

# build another model 
set.seed(45)
rf_model <- train(diabetes ~ . ,
               data = train_data,
               method = "rf",
               metric = "Accuracy",
               trControl = crtl)
p2 <- predict(rf_model, newdata = test_data)

mean(p2 == test_data$diabetes)


# build decision tree model 
set.seed(45)
rp_model <- train(diabetes ~ . ,
                  data = train_data,
                  method = "rpart",
                  metric = "Accuracy",
                  trControl = crtl)
p3 <- predict(rp_model, newdata = test_data)

mean(p3 == test_data$diabetes)


# build logistic regression model 
set.seed(45)
logit_model <- train(diabetes ~ . ,
                  data = train_data,
                  method = "glm",
                  metric = "Accuracy",
                  trControl = crtl)
p4 <- predict(logit_model, newdata = test_data)

mean(p4 == test_data$diabetes)

## evaluate models

list_models <- list(
  knn = knn_model,
  logistic = logit_model,
  tree = rp_model,
  randomForest = rf_model
)

result <- resamples(list_models)
summary(result)

logit_model$finalModel
logit_model$finalModel %>% coefficients()
