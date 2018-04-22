library(dplyr)

data <- read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))

filtered <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
filtered <- mutate(filtered, Global_active_power = as.numeric(as.character(Global_active_power)))

png(file = "plot1.png")
hist(filtered$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()