# Plot for Global active power usage over two days

# Read file
fileName <- "household_power_consumption.txt";
powerData <- read.table(fileName, sep=";", header=TRUE, na.strings = "?")

# Fix the date to date class
powerData$Date <- strptime(powerData$Date, "%d/%m/%Y")
# Subset data by date range
twoDaysData<-subset(powerData, Date>="2007-02-01" & Date<="2007-02-02")
# Create a new column as DateTime
twoDaysData$DateTime <- strptime(paste(twoDaysData$Date, twoDaysData$Time),"%Y-%m-%d %H:%M:%S")

# Create a plot with type "l"
with(twoDaysData, plot(DateTime, Global_active_power, ylab = "Global Active Power (Kilowatts)", xlab = "", type = "l"))

# Copy to png file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
