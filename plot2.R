data <- read.table("household_power_consumption.txt", sep=";", 
		na.strings = "?", skip = 66637, nrows = 2880, 
		col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
		"Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data$Date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Time <- NULL

plot(data$Date, data$Global_active_power, type = "l", 
	xlab = "", ylab = "Global Active Power (kilowatts)")
	
dev.copy(png, filename="plot2.png");
dev.off();