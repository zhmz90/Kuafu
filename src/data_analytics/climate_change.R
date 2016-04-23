
climate = read.csv("climate_change.csv")
str(climate)
summary(climate)

train = subset(climate, climate$Year <= 2006)
test  = subset(climate, climate$Year > 2006)

model1 = lm(Temp ~ MEI + CO2 + CH4 + N2O + CFC.11 + CFC.12 + TSI + Aerosols, data=train)
summary(model1)

model2 = lm(Temp ~ MEI + N2O + TSI + Aerosols, data=train)
summary(model2)

model3 = step(model1)

modelCL = lm(Temp ~ ., data=train)
model3 = step(model1)
summary(model3)

d = predict(model3,newdata=test)
SSE = sum((d - test$Temp)^2)
SST = sum((mean(test$Temp) - test$Temp)^2)
1 - SSE/SST

climateStep = model3
tempPredict = predict(climateStep, newdata = test)

SSE = sum((tempPredict - test$Temp)^2)

SST = sum( (mean(train$Temp) - test$Temp)^2)

R2 = 1 - SSE/SST






