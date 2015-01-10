#read from file and load required data
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
inputData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#get what needs to be plotted
datetime <- strptime(paste(inputData$Date, inputData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(inputData$Global_active_power)
globalReactivePower <- as.numeric(inputData$Global_reactive_power)
subMetering1 <- as.numeric(inputData$Sub_metering_1)
subMetering2 <- as.numeric(inputData$Sub_metering_2)
subMetering3 <- as.numeric(inputData$Sub_metering_3)
voltage <- as.numeric(inputData$Voltage)

#open PNG device
png("plot4.png", width=480, height=480)

#Get 4 parts on the screen, to be filled column-wise
par(mfcol = c(2, 2)) 

#part1 (goes to row-1, column-1)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

#part2 (goes to row-2, column-1)
plot(datetime, subMetering1, type="l", xlab = "", ylab="Energy Submetering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))

#part3 (goes to row-1, column-2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#part4 (goes to row-2, column-2)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#close device
dev.off()
