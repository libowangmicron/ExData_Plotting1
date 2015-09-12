### readin power data
library(dplyr)
setwd('F:/Education/Exploratory Data Analysis/Week1/exdata-data-household_power_consumption')
power <- read.table("household_power_consumption.txt", head=T, , sep=';',stringsAsFactor=F)
power1 <- subset(power, Date %in% c('2/2/2007','1/2/2007'))


DateTime <- paste(power1$Date, power1$Time)
DateTime1 <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
DateTime2 <- as.Date(DateTime1)

power2 <- mutate(power1, DateTime=DateTime2, Global_active_power=as.numeric(Global_active_power))

### plot1

hist(power2$Global_active_power,col='red',xlab='Global Active Power (kilowatts)', main='Global Active Power')
dev.copy(png, file = 'plot1.png')
dev.off()