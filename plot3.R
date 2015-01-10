#read from file and load required data
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
inputData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#get what needs to be plotted
datetime <- strptime(paste(inputData$Date, inputData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(inputData$Global_active_power)
subMetering1 <- as.numeric(inputData$Sub_metering_1)
subMetering2 <- as.numeric(inputData$Sub_metering_2)
subMetering3 <- as.numeric(inputData$Sub_metering_3)

#open PNG device
png("plot3.png", width=480, height=480)

#plot and lines and then legend
plot(datetime, subMetering1, type = "l", ylab="Global Active Power (kilowatts)")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#close device
dev.off()