library(dplyr)

data <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))

filtered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
filtered <- mutate(filtered, Global_active_power = as.numeric(as.character(Global_active_power)))
filtered <- mutate(filtered, DateTime = as.POSIXct(strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S")))

png(file = "plot3.png")
with(filtered, plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(filtered, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(filtered, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1))
dev.off()