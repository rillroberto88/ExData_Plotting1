# Read data into R.
# After analyzing it I saw that the relevant data for the 2007-02-01 and 2007-02-02 dates 
# starts after 66637 rows, and is 2880 rows long. Since the "skip" parameter skips the header too 
# (first row in file), I added the column names with the "col.names" parameter.
# This procedure makes the data reading much faster.
# The data reading and preprocessing is the same in all files.
data <- read.table("household_power_consumption.txt", sep=";", 
		na.strings = "?", skip = 66637, nrows = 2880, 
		col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
		"Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# concatenate the Date and Time columns and convert it to Date type.
data$Date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
# remove unnecessary time column (since it is included in the date column)
data$Time <- NULL

hist(data$Global_active_power, col = "red", 
	xlab = "Global Active Power (kilowatts)", 
	ylab = "Frequency", 
	main = "Global Active Power")
	
# save to PNG file
dev.copy(png, filename="plot1.png");
dev.off();