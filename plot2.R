#read from file and load required data
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
inputData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#get what needs to be plotted
datetime <- strptime(paste(inputData$Date, inputData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(inputData$Global_active_power)

#open PNG device
png("plot2.png", width=480, height=480)
#plot
plot(datetime, globalActivePower, type = "l", xlab = "" ,ylab="Global Active Power (kilowatts)")
#close device
dev.off()