
IBM = read.csv("IBMStock.csv")
GE = read.csv("GEStock.csv")
ProcterGamble = read.csv("ProcterGambleStock.csv")
CocaCola = read.csv("CocaColaStock.csv")
Boeing = read.csv("BoeingStock.csv")

str(IBM)

IBM$Date = as.Date(IBM$Date, "%m/%d/%y")
GE$Date = as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date = as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date = as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date = as.Date(Boeing$Date, "%m/%d/%y")


str(IBM)

plot(CocaCola$Date,CocaCola$StockPrice, col="red")
#lines(CocaCola$Date, CocaCola$StockPrice,col="green",lty=2)
lines(ProcterGamble$Date, ProcterGamble$StockPrice,col="blue",lty=10)
abline(v=as.Date(c("1983-01-01")), lwd=2)
abline(v=as.Date(c("1983-12-31")), lwd=2)


plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210))
lines(ProcterGamble$Date[301:432],ProcterGamble$StockPrice[301:432],col="blue")
lines(IBM$Date[301:432],IBM$StockPrice[301:432],col="green")
lines(GE$Date[301:432],GE$StockPrice[301:432],col="purple")
lines(Boeing$Date[301:432],Boeing$StockPrice[301:432],col="orange")
abline(v=as.Date(c("2004-01-01")),lwd=2)
abline(v=as.Date(c("2005-12-31")),lwd=2)





















