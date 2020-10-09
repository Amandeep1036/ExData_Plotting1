
read_data <- "household_power_consumption.txt"
data <- read.table(read_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()