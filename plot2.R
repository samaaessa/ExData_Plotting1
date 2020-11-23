# read data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep = ';',header = T)

#plot 2
#Global Active Power per days

#cast global active power to numeric 
data$Global_active_power <- as.numeric(data$Global_active_power)

## Create column in table with date and time merged together
fullDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, fullDate)

#casting 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")



#data subsetting
subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")


#open png file
png("/home/samaaessa/Desktop/DS coursera/course 4/plot2.png",width = 480,height = 480)

#poltting
with(subsetdata,plot(fullDate, Global_active_power,xlab = "",type="l",ylab = "Global Active Power (kilowatts)"))

#close png
dev.off()

