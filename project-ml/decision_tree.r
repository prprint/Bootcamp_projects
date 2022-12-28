#decision tree

tree_model <- train(diabetes ~ . ,
      data = train_data,
      method = "rpart") #complexity cp ลดค่าoverfitting
library(rpart.plot)
rpart.plot(tree_model$finalModel)

varImp(tree_model)

#randomforest
crtl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

grid <- data.frame(mtry = c(3,5,7,9))
rf_model <- train(diabetes ~ . ,
                    data = train_data,
                    method = "rf",
                  tuneGrid = grid) #mtry
