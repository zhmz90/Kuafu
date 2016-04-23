
#
#state = read.csv("statedata.csv")

data(state)
statedata = cbind(data.frame(state.x77), state.abb, state.area, state.center,  state.division, state.name, state.region)
str(statedata)

model1 = lm(Life.Exp ~ Population + Income + Illiteracy + Murder + HS.Grad + Frost + Area, data = statedata)
summary(model1)

plot(statedata$Income, statedata$Life.Exp)

model1 = lm(Life.Exp ~ Population  + Murder + HS.Grad + Frost, data = statedata)
summary(model1)

sort(predict(model1))

statedata$state.name[which.max(statedata$Life.Exp)]

p = predict(model1)

statedata$state.name[which.max((model1$residuals)^2)]
