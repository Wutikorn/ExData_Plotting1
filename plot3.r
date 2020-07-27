powerCons <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")
powerCons$Date <- paste(powerCons$Date, powerCons$Time, sep = " ")
powerCons$Date <- strptime(powerCons$Date, format = "%d/%m/%Y %H:%M:%S")
powerCons <- subset(powerCons, Date>="2007-02-01" & Date<"2007-02-03")

with(powerCons, plot(Date, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(powerCons, lines(Date, Sub_metering_2, col = "Red"))
with(powerCons, lines(Date, Sub_metering_3, col = "Blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.copy(png,'plot3.png')
dev.off()
