powerCons <- read.table("household_power_consumption.txt", na.strings = "?", header = TRUE, sep = ";")
powerCons$Date <- as.Date(powerCons$Date, "%d/%m/%Y")
powerCons <- subset(powerCons, Date>="2007-02-01" & Date<="2007-02-02")
hist(powerCons$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png,'plot1.png')
dev.off()