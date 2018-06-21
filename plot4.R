setwd('/home/shubham/data_science/exploratory_data_analysis')
fileName <- 'household_power_consumption.txt'
data1 <- read.table(fileName, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
data_subset <- data1[data1$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data_subset$Global_active_power)
globalReactivePower <- as.numeric(data_subset$Global_reactive_power)
Voltage <- as.numeric(data_subset$Voltage)
subMetering1 <- as.numeric(data_subset$Sub_metering_1)
subMetering2 <- as.numeric(data_subset$Sub_metering_2)
subMetering3 <- as.numeric(data_subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()