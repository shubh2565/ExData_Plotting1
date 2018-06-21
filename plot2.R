setwd('/home/shubham/data_science/exploratory_data_analysis')
fileName <- 'household_power_consumption.txt'
data1 <- read.table(fileName, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
data_subset <- data1[data1$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(data_subset$Global_active_power)
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()