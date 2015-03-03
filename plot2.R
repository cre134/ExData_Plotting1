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

# Plot 2 #
png(file='plot2.png')

plot(BothDays$Date_Time, BothDays$Global_active_power, xlab= '',ylab='Global Active Power (kilowatts)',type='n')
lines(BothDays$Date_Time, BothDays$Global_active_power)


dev.off()
