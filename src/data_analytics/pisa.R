
train = read.csv("pisa2009train.csv")
test  = read.csv("pisa2009test.csv")
str(train)
summary(train)

train = na.omit(train)
test  = na.omit(test)
str(train)
str(test)

train$raceeth = relevel(train$raceeth, "White")
test$raceeth  = relevel(test$raceeth,  "White")

lmScore = lm(readingScore ~ ., data=train)
summary(lmScore)

SSE = sum((lmScore$residuals)^2)
RMSE = sqrt(SSE/nrow(train))
RMSE


predTest = predict(lmScore, newdata=test)
summary(predTest)

SSE = sum((predTest - test$readingScore)^2)
SST = sum((mean(train$readingScore) -test$readingScore)^2)
1 - SSE / SST
RMSE = sqrt(SSE/nrow(test))
RMSE

















