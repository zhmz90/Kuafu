

elantra = read.csv("elantra.csv")
str(elantra)
train = subset(elantra, Year<= 2012)
test  = subset(elantra, Year >= 2013)
str(train)
str(test)

model1 = lm(ElantraSales ~ Unemployment+CPI_all+CPI_energy+Queries, data = train)
summary(model1)

model2 = lm(ElantraSales ~ Month+Unemployment+CPI_all+CPI_energy+Queries, data = train)
summary(model2)

train$Month = as.factor(train$Month)
test$Month = as.factor(test$Month)

cor(elantra[c("Unemployment","Month","Queries","CPI_energy","CPI_all")])

model2 = lm(ElantraSales ~ Month+Unemployment+CPI_all+CPI_energy, data = train)
summary(model2)

p2 = predict(model2,test)
SSE = sum((p2-test$ElantraSales)^2)
SST = sum((mean(train$ElantraSales) - test$ElantraSales)^2)
1 - SSE/SST












