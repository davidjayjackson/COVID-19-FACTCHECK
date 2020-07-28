EU <-read.csv("../DATA/EU_top_10_pop..csv")
EU$Country <- as.factor(EU$Country)
barplot(Population~Country,EU, main="Top 10 EU Counties by Population")
#
covid <- read.csv("../DATA/COVID-19-2020-07-27.csv")
covid$dateRep <- gsub("/","-",covid$dateRep)
covid$dateRep <- as.Date(covid$dateRep,format="%m-%d-%Y")
spain <- subset(covid,geoId =="ES")
plot(spain$dateRep,spain$cases,type="l", main="Spain: Total Daily Cases")
plot(spain$dateRep,spain$deaths,type="l", main="Spain: Total Daily Deaths")
# EU GeoID codes
# Spain = ES; Germany = DE, France = FR, Britain = UK, Italy = IT
# Poland = PL, Romania = RO, Netherlands = NL, Belgium = BE, Greece = EL