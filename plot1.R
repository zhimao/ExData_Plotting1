# Histogram of Global active power

# Read file
fileName <- "household_power_consumption.txt";
powerData <- read.table(fileName, sep=";", header=TRUE, na.strings = "?")

# Subset data by date range
library(lubridate)
powerData$Date <- dmy(powerData$Date)
twoDaysData<-subset(powerData, Date>="2007-02-01" & Date<="2007-02-02")

# Create plot
hist(twoDaysData$Global_active_power, col="red", xlab="Global Acitve Power (kilowatts)", ylab="Frequency", main="Global Active Power")
# Copy to png file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
