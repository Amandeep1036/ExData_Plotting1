read_data <- "household_power_consumption.txt"
data <- read.table(read_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(sub_data$Global_active_power)
global_reactive_power <- as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)
subMetering_1 <- as.numeric(sub_data$Sub_metering_1)
subMetering_2 <- as.numeric(sub_data$Sub_metering_2)
subMetering_3 <- as.numeric(sub_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()