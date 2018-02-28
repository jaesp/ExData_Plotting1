dat <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)

dat3 <- as.data.frame(cbind(DateTime= paste(dat$V1, dat$V2), dat$V3, dat$V4, dat$V5, dat$V6, dat$V7, dat$V8, dat$V9), stringsAsFactors = TRUE)

dat3$V2 <- as.numeric(as.character(dat3$V2))
dat3$V3 <- as.numeric(as.character(dat3$V3))
dat3$V4 <- as.numeric(as.character(dat3$V4))
dat3$V5 <- as.numeric(as.character(dat3$V5))
dat3$V6 <- as.numeric(as.character(dat3$V6))
dat3$V7 <- as.numeric(as.character(dat3$V7))
dat3$V8 <- as.numeric(as.character(dat3$V8))


names(dat3) <- c("Date_Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

dat3$Date_Time <- strptime(dat3$Date_Time, "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width = 480, height = 480, units = "px")

plot(dat3$Date_Time, dat3$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dat3$Date_Time, dat3$Sub_metering_2, col="red")
lines(dat3$Date_Time, dat3$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()