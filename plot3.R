# Plot for three sub meters numbers over two days

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
png("plot3.png", width=480, height=480)
# Create a plot with type "l"
plotRange <- range(c(twoDaysData$Sub_metering_1, twoDaysData$Sub_metering_2, twoDaysData$Sub_metering_3))

with(twoDaysData, plot(DateTime, Sub_metering_1, type = "l", ylab = "", xlab = "",  ylim = plotRange))
par(new=TRUE)
with(twoDaysData, plot(DateTime, Sub_metering_2, type = "l", col = "red",  ylab = "", xlab = "", ylim = plotRange))
par(new=TRUE)
with(twoDaysData, plot(DateTime, Sub_metering_3, type = "l", col = "blue", ylab="Energy sub meeting", xlab = "", ylim = plotRange))

# Add legend
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
# Close device
dev.off()
