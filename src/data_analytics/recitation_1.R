USDA  = read.csv("USDA.csv")
USDA

MVT = read.csv("mvtWeek1.csv")

top5 = subset(MVT, MVT$LocationDescription == "STREET" |  
            MVT$LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)" |
            MVT$LocationDescription == "ALLEY" |
            MVT$LocationDescription == "GAS STATION" |
            MVT$LocationDescription == "DRIVEWAY - RESIDENTIAL" )
table(top5$LocationDescription)
Top5 = top5
Top5$LocationDescription = factor(Top5$LocationDescription)


ratio_of_location <- function(Top5, location){
  
    Top5_location <- subset(Top5,Top5$LocationDescription == location)
    #cat("nrow of arr == true:", nrow(subset(Top5_location, Top5_location$Arrest == "TRUE" )),"\n")
    #cat("nrow of Top5_location", nrow(Top5_location),"\n")
    rate <- nrow(subset(Top5_location, Top5_location$Arrest == "TRUE" )) / nrow(Top5_location)
    return(rate)
}

for (loc in unique(factor(Top5$LocationDescription))){
  cat("loc is ",loc, "ratio is ", ratio_of_location(Top5, loc), "\n")
}

mvt = MVT

num_thefts_at_gasstation_on_day<-function(mvt,day){
  DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
  mvt$Month = months(DateConvert)
  mvt$Weekday = weekdays(DateConvert)
  mvt$Date = DateConvert
  
  gas = subset(mvt, mvt$LocationDescription == "DRIVEWAY - RESIDENTIAL")
  table(gas$Weekday)
}

num_thefts_at_gasstation_on_day(mvt, "Monday")




  


