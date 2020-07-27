powerCons <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")
powerCons$Date <- paste(powerCons$Date, powerCons$Time, sep = " ")
powerCons$Date <- strptime(powerCons$Date, format = "%d/%m/%Y %H:%M:%S")
powerCons <- subset(powerCons, Date>="2007-02-01" & Date<"2007-02-03")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

hist(powerCons$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

with(powerCons, plot(Date, Voltage, type = "l", ylab = "Voltage", xlab = "datatime"))

with(powerCons, plot(Date, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(powerCons, lines(Date, Sub_metering_2, col = "Red"))
with(powerCons, lines(Date, Sub_metering_3, col = "Blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2, cex = 0.5, bty = "n")

with(powerCons, plot(Date, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datatime"))

dev.copy(png,'plot4.png')
dev.off()