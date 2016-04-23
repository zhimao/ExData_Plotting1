# Plots over two days

# Read file
fileName <- "household_power_consumption.txt";
powerData <- read.table(fileName, sep=";", header=TRUE, na.strings = "?")

# Fix the date to date class
powerData$Date <- strptime(powerData$Date, "%d/%m/%Y")
# Subset data by date range
twoDaysData<-subset(powerData, Date>="2007-02-01" & Date<="2007-02-02")
# Create a new column as DateTime
twoDaysData$DateTime <- strptime(paste(twoDaysData$Date, twoDaysData$Time),"%Y-%m-%d %H:%M:%S")

# Save in a png file
png("plot4.png", width=480, height=480)

# Set plot grid, two by two, and margin
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# First plot: Active powr over two days
with(twoDaysData, plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab = "", type = "l"))

# Second plot: voltage over two days
with(twoDaysData, plot(DateTime, Voltage, ylab = "Voltage", xlab = "datetime", type = "l"))


# Third plot: sub metering use over two days
plotRange <- range(c(twoDaysData$Sub_metering_1, twoDaysData$Sub_metering_2, twoDaysData$Sub_metering_3))
with(twoDaysData, plot(DateTime, Sub_metering_1, type = "l", ylab = "", xlab = "",  ylim = plotRange))
par(new=TRUE)
with(twoDaysData, plot(DateTime, Sub_metering_2, type = "l", col = "red",  ylab = "", xlab = "", ylim = plotRange))
par(new=TRUE)
with(twoDaysData, plot(DateTime, Sub_metering_3, type = "l", col = "blue", ylab="Energy sub meeting", xlab = "", ylim = plotRange))

# Add legend with no box line
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1, bty = "n")

# Global reactive power over two days
with(twoDaysData, plot(DateTime, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l"))

# Close device
dev.off()
