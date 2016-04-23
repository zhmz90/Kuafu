# VIDEO 2

# Read in data
baseball = read.csv("baseball.csv")
str(baseball)

# Subset to only include moneyball years
moneyball = subset(baseball, Year < 2002)
str(moneyball)

# Compute Run Difference
moneyball$RD = moneyball$RS - moneyball$RA
str(moneyball)

# Scatterplot to check for linear relationship
plot(moneyball$RD, moneyball$W)

# Regression model to predict wins
WinsReg = lm(W ~ RD, data=moneyball)
summary(WinsReg)


# VIDEO 3

str(moneyball)

# Regression model to predict runs scored
RunsReg = lm(RS ~ OBP + SLG + BA, data=moneyball)
summary(RunsReg)

RunsReg = lm(RS ~ OBP + SLG, data=moneyball)
summary(RunsReg)


player = data.frame()
rownames(player) = c("Eric Chavez","")
player$OBP = c(0.338,0.391,0.369,0.313,0.361)
player = data.frame(OBP=c(0.338,0.391,0.369,0.313,0.361), SLG=c(0.54,0.45,0.374,0.447,0.5),Salary=c(1400,1065,295,800,300))
predict(RunsReg,player)


