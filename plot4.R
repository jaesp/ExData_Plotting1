dat <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)

dat4 <- as.data.frame(cbind(DateTime= paste(dat$V1, dat$V2), dat$V3, dat$V4, dat$V5, dat$V6, dat$V7, dat$V8, dat$V9), stringsAsFactors = TRUE)

dat4$V2 <- as.numeric(as.character(dat4$V2))
dat4$V3 <- as.numeric(as.character(dat4$V3))
dat4$V4 <- as.numeric(as.character(dat4$V4))
dat4$V5 <- as.numeric(as.character(dat4$V5))
dat4$V6 <- as.numeric(as.character(dat4$V6))
dat4$V7 <- as.numeric(as.character(dat4$V7))
dat4$V8 <- as.numeric(as.character(dat4$V8))

names(dat4) <- c("Date_Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

dat4$Date_Time <- strptime(dat4$Date_Time, "%d/%m/%Y %H:%M:%S")


png(file="plot4.png", width = 480, height = 480, units = "px")

par(mfrow= c(2,2), mar= c(4,4,2,1), oma= c(0,0,2,0))
with(dat4, {
    plot(Date_Time, Global_active_power, type= "l", ylab = "Global Active Power", xlab = "")
    plot(Date_Time, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Date_Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    lines(Date_Time, Sub_metering_2, col="red")
    lines(Date_Time, Sub_metering_3, col="blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")
    plot(Date_Time, Global_reactive_power, type= "l", ylab = "Global_reactive_power", xlab = "datetime")
})

dev.off()