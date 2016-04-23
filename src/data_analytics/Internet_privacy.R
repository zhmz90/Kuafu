
poll = read.csv("AnonymityPoll.csv")
str(poll)

str(subset(poll,poll$Internet.Use == 0 & poll$Smartphone == 1))

table(is.na(poll$Smartphone))


limited = subset(poll, poll$Internet.Use==1 | poll$Smartphone == 1)
str(limited)

table(limited$Privacy.Laws.Effective)

plot(jitter(limited$Age),jitter(limited$Info.On.Internet))

