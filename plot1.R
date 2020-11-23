# read data
data <- read.table("/home/samaaessa/Desktop/DS coursera/course 4/exdata_data_household_power_consumption/household_power_consumption.txt",sep = ';',header = T)

#plot 1
#histogram of Global Active Power

#castting
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


#data subsetting
subsetdata <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

#open png file
png("/home/samaaessa/Desktop/DS coursera/course 4/plot1.png",width = 480,height = 480)

#plotting
hist(subsetdata$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

#close png
dev.off()

