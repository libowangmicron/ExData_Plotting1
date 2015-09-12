### readin power data
library(dplyr)
setwd('F:/Education/Exploratory Data Analysis/Week1/exdata-data-household_power_consumption')
power <- read.table("household_power_consumption.txt", head=T, , sep=';',stringsAsFactor=F)
power1 <- subset(power, Date %in% c('2/2/2007','1/2/2007'))


DateTime <- paste(power1$Date, power1$Time)
DateTime1 <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
DateTime2 <- as.Date(DateTime1)

power2 <- mutate(power1, DateTime=DateTime2, Global_active_power=as.numeric(Global_active_power))

### plot4
par(mfcol=c(2,2))

# 1st plot
plot(DateTime1, power2$Global_active_power, type = 'n', xlab='', ylab='Global Active Power (kilowatts)')
lines(DateTime1, power2$Global_active_power)

# 2nd plot
plot(DateTime1, power2$Sub_metering_1, type = 'n', xlab='', ylab='Energy sub metering')
lines(DateTime1, power2$Sub_metering_1)
lines(DateTime1, power2$Sub_metering_2, col = 'red')
lines(DateTime1, power2$Sub_metering_3, col = 'blue')
legend('topright', lty = 1, col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex=1)

# 3rd plot
plot(DateTime1, power2$Voltage, type = 'n', xlab = 'datatime', ylab='Voltage')
lines(DateTime1, power2$Voltage)

# 4th plot
plot(DateTime1, power2$Global_reactive_power, type = 'n', xlab = 'datatime', ylab='Global_reactive_power')
lines(DateTime1, power2$Global_reactive_power)

dev.copy(png, width = 480, height = 480, file = 'plot4.png')
dev.off()