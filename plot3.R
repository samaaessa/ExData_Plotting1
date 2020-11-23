# read data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep = ';',header = T)

#plot 3
#Global Active Power per days


## Create column in table with date and time merged together
fullDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, fullDate)

#casting global active power to numeric 
data$Global_active_power <- as.numeric(data$Global_active_power)

#casting Dates and Time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")

#casting sub_metering to numeric values
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)



#data subsetting
subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")


#open png file
png("/home/samaaessa/Desktop/DS coursera/course 4/plot3.png",width = 480,height = 480)

#plotting
with(subsetdata,plot(fullDate, Sub_metering_1 ,xlab = "",type="l",ylab = "GEnergy sub metering"))
lines(subsetdata$fullDate, subsetdata$Sub_metering_2 ,type="l",col = "red")
lines(subsetdata$fullDate, subsetdata$Sub_metering_3 ,type="l",col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))


#close png
dev.off()

