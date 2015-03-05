library(dplyr)
library(lubridate)

object.size('household_power_consumption.txt')

data<-read.csv('household_power_consumption.txt', sep=';', na.strings='?')
D1<-filter(data, Date == '1/2/2007')
D2<-filter(data, Date == '2/2/2007')

BothDays<-rbind(D1,D2)

#### Convert day formate ####

BothDays$Date<-dmy(BothDays$Date)

#### Combine Date and Time into one Field ####
BothDays$Date_Time<- as.POSIXct(paste(BothDays$Date, BothDays$Time), format="%Y-%m-%d %H:%M:%S")

# Plot 3 #
png(file='plot3.png', height = 480, width = 480)

plot(BothDays$Date_Time, BothDays$Sub_metering_1, xlab= '',ylab='Energy sub metering',type='n')
lines(BothDays$Date_Time, BothDays$Sub_metering_1, col='black')
lines(BothDays$Date_Time, BothDays$Sub_metering_2, col='red')
lines(BothDays$Date_Time, BothDays$Sub_metering_3, col='blue')
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), pch = c('_','_','_'), col=c('black','red','blue'))

dev.off()
