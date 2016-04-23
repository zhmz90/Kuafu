
CPS = read.csv("CPSData.csv")
str(CPS)
summary(CPS)

sort(tapply(is.na(CPS$MetroAreaCode), CPS$State, mean))


MetroAreaMap = read.csv("MetroAreaCodes.csv")
str(MetroAreaMap)

CountryMap = read.csv("CountryCodes.csv")
str(CountryMap)


CPS = merge(CPS, MetroAreaMap, by.x="MetroAreaCode", by.y="Code", all.x=TRUE)
str(CPS)

table(tapply(CPS$Race == "Asian", CPS$MetroArea, mean) >= 0.2)

sort(tapply(CPS$Education == "No high school diploma", CPS$MetroArea, mean, na.rm=TRUE))

CPS = merge(CPS,CountryMap,by.x="CountryOfBirthCode",by.y="Code",all.x=TRUE)
CPS

sort(tapply(CPS$Country == "Somalia", CPS$MetroArea, sum, na.rm=TRUE))








