dat <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)

names(dat) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

png(file="plot1.png", width = 480, height = 480, units = "px")
hist(dat$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()