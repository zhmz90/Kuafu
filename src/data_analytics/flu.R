
train = read.csv("FluTrain.csv")
str(train)
summary(train)

train$Week[which.max(train$ILI)]
train$Week[which.max(train$Queries)]

plot(train$Queries,log(train$ILI))
plot(train$Queries, train$ILI)

plot(log(train$ILI), train$Queries)

FluTrend1 = lm(log(ILI) ~ Queries, data = train)
summary(FluTrend1)

c = cor(log(train$ILI),train$Queries)
R2 = c^2


test = read.csv("FluTest.csv")
str(test)
summary(test)

PredTest1 = exp(predict(FluTrend1, newdata=test))

SSE = sum((PredTest1 - test$ILI)^2)
RMSE = sqrt(SSE/nrow(test))

library(zoo)
ILILag2 = lag(zoo(train$ILI),-2,na.pad = TRUE)
train$ILILag2 = coredata(ILILag2)

plot(log(train$ILILag2),log(train$ILI))

FluTrend2 = lm(log(ILI) ~ Queries + log(ILILag2), data = train)
summary(FluTrend2)

test$ILILag2 = coredata(lag(zoo(test$ILI),-2,na.pad = TRUE))

#fill NAs in test$ILILag2
test$ILILag2[1] = train$ILI[416]
test$ILILag2[2] = train$ILI[417]

PredTest2 = exp(predict(FluTrend2, newdata=test))

SSE = sum((PredTest2 - test$ILI)^2)
RMSE = sqrt(SSE/nrow(test))
RMSE

