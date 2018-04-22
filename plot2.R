library(dplyr)

data <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))

filtered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
filtered <- mutate(filtered, Global_active_power = as.numeric(as.character(Global_active_power)))
filtered <- mutate(filtered, DateTime = as.POSIXct(strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S")))

png(file = "plot2.png")
plot(filtered$DateTime, filtered$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()