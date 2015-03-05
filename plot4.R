library(dplyr)
library(lubridate)

object.size('household_power_consumption.txt')

data<-read.csv('household_power_consumption.txt', sep=';', na.strings='?')
D1<-filter(data, Date == '1/2/2007')
D2<-filter(data, Date == '2/2/2007')

BothDays<-rbind(D1,D2)

#### Convert day formate ####
BothDays$Date<-dmy(BothDays$Date)
BothDays$Date_Time<- as.POSIXct(paste(BothDays$Date, BothDays$Time), format="%Y-%m-%d %H:%M:%S")

png(file='plot4.png', height = 480, width = 480)

#### Set number of graphs for Figure ####
par(mfrow=c(2,2))

#### Plot Topleft ####
plot(BothDays$Date_Time, BothDays$Global_active_power, xlab= '',ylab='Global Active Power',type='n')
lines(BothDays$Date_Time, BothDays$Global_active_power)

#### Plot Topright ####
plot(BothDays$Date_Time, BothDays$Voltage, xlab= 'datetime',ylab='Voltage',type='n')
lines(BothDays$Date_Time, BothDays$Voltage)

#### Plot Bottomleft ####

plot(BothDays$Date_Time, BothDays$Sub_metering_1, xlab= '',ylab='Energy sub metering',type='n')
lines(BothDays$Date_Time, BothDays$Sub_metering_1, col='black')
lines(BothDays$Date_Time, BothDays$Sub_metering_2, col='red')
lines(BothDays$Date_Time, BothDays$Sub_metering_3, col='blue')
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), pch = c('_','_','_'), col=c('black','red','blue'))


#### Plot Bottomright ####
plot(BothDays$Date_Time, BothDays$Global_reactive_power, xlab= 'datetime',ylab='Global_reactive_power',type='n')
lines(BothDays$Date_Time, BothDays$Global_reactive_power)

dev.off()
