dat <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879)

dat2 <- as.data.frame(cbind(DateTime= paste(dat$V1, dat$V2), dat$V3, dat$V4, dat$V5, dat$V6, dat$V7, dat$V8, dat$V9), stringsAsFactors = TRUE)

dat2$V2 <- as.numeric(as.character(dat2$V2))
dat2$V3 <- as.numeric(as.character(dat2$V3))
dat2$V4 <- as.numeric(as.character(dat2$V4))
dat2$V5 <- as.numeric(as.character(dat2$V5))
dat2$V6 <- as.numeric(as.character(dat2$V6))
dat2$V7 <- as.numeric(as.character(dat2$V7))
dat2$V8 <- as.numeric(as.character(dat2$V8))


names(dat2) <- c("Date_Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

dat2$Date_Time <- strptime(dat2$Date_Time, "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width = 480, height = 480, units = "px")
plot(dat2$Date_Time, dat2$Global_active_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()