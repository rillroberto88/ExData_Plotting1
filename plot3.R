data <- read.table("household_power_consumption.txt", sep=";", 
		na.strings = "?", skip = 66637, nrows = 2880, 
		col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
		"Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data$Date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Time <- NULL

# Now we plot more graphs onto the same graphics device.
with(data, {
	plot(Date, Sub_metering_1, type = "l", 
		xlab = "", ylab = "Energy sub metering")
	lines(Date, Sub_metering_2, col = "red")
	lines(Date, Sub_metering_3, col = "blue")
})
# add legend also
legend("topright", lty = "solid", col = c("black", "red", "blue"), 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
dev.copy(png, filename="plot3.png");
dev.off();