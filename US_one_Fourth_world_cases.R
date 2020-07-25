# Import John Hopkins COVID-19 Data
# 
# Create three (3) data frames
# 1. Whole world
# 2. World minus the US
# 3. US only
#
rm(list=ls())
JH <- read.csv("../DATA/JHUDATA.csv")
JH$date <- as.Date(JH$date)
summary(JH)
str(JH) 
#
NOUS <- subset(JH,country !="US")
summary(NOUS)
US <- subset(JH,country=="US")
summary(US)


# World World
# 
plot(JH$date,JH$confirmed,typ="l", main="World Cumulative Cases")
plot(JH$date,JH$deaths,typ="l",main="World Cumulative Deaths ")
# 
# World Minus the US
#
plot(NOUS$date,NOUS$confirmed,type="l",main="World minus the US Cumulative Cases ")
plot(NOUS$date,NOUS$deaths,type="l",main="World minus the US Cumulative Deaths ")
#
# US Only 
#
plot(US$date,US$confirmed,type="l",main="The US Cumulative Cases ")
plot(US$date,US$deaths,type="l",main="The US Cumulative Deaths ")
#
# Calculate Daily Cumulative Totals CASES for Whole World.
# 
daily_cases <- aggregate(x=JH$confirmed,by=list(JH$date),FUN=sum)
plot(daily_cases$Group.1,daily_cases$x,type="l")
#
# Calculate Daily Cumulative Totals Deaths for Whole World.
#
daily_deaths <- aggregate(x=JH$deaths,by=list(JH$date),FUN=sum)
plot(daily_cases$Group.1,daily_deaths$x,type="l")
#
## 
# World Minus The US
#
# Calculate Daily Cumulative Totals CASES for Whole World.
# 
nous_cases<- aggregate(x=NOUS$confirmed,by=list(NOUS$date),FUN=sum)
plot(nous_cases$Group.1,nous_cases$x,type="l")
#
# Calculate Daily Cumulative Totals Deaths for Whole World.
#
nous_cases <- aggregate(x=NOUS$confirmed,by=list(NOUS$date),FUN=sum)
plot(nous_cases$Group.1,nous_deaths$x,type="l")
#
##
# Calculate Daily Cumulative Totals Deaths for Whole World.
#
nous_deaths <- aggregate(x=NOUS$deaths,by=list(NOUS$date),FUN=sum)
plot(nous_deaths$Group.1,nous_deaths$x,type="l")
#
##
# Combined data frames
#
daily_cases <- colnames(daily_cases) <- c("date","cases")
daily_deaths <- colnames(daily_deaths) <- c("date","deaths")
DF <- cbind(US,daily_cases)
#
#
# Legend thanks to Alan Kinene @ Slack
plot(US$date,round(US$confirmed,digits = 0),type="l",col="red",
     main="USA and World Cumulative Cases",
     xlab="Date Confirmed",ylab="Cumulative Cases"
  )
lines(daily_cases$Group.1,daily_cases$x,col="blue")
legend("bottomright",
       c("US","World"),
       col=c("red","blue"),
       lty = c(1, 1),
       cex = 0.8)
grid()
#
## Plot of World's Cases w/ US and w/o US
colnames(daily_cases) <- c("Date","Cases")
colnames(nous_cases) <- c("Date","Cases")

# Legend thanks to Alan Kinene @ Slack
plot(daily_cases$Date,daily_cases$Cases,type="l",col="red",
     main="World COVID-19 Cases w/US and w/o US",
     xlab="Date Confirmed",ylab="Cumulative Cases"
)
lines(nous_cases$Date,nous_cases$Cases,col="blue")
legend("bottomright",
       c("World","World w/o US"),
       col=c("red","blue"),
       lty = c(1, 1),
       cex = 0.8)
grid()