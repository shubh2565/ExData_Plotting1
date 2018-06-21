fileLocation <- '/home/shubham/data_science/exploratory_data_analysis/household_power_consumption.txt'
data1 <- read.table(fileLocation, header = TRUE, sep = ';', na.strings = '?', stringsAsFactors = FALSE)
data_subset <- data1[data1$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(data_subset$Global_active_power)
png("/home/shubham/data_science/exploratory_data_analysis/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

