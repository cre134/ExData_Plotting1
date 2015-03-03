library(dplyr)

object.size('household_power_consumption.txt')

data<-read.csv('household_power_consumption.txt', sep=';', na.strings='?')
D1<-filter(data, Date == '1/2/2007')
D2<-filter(data, Date == '2/2/2007')

BothDays<-rbind(D1,D2)

# Plot 1 #
png(file='plot1.png')

hist(BothDays$Global_active_power, col = 'red', xlab='Global Active Power (kilowatts)', main='Global Active Power')

dev.off()
