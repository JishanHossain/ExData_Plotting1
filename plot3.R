library(sqldf)
dt <- file("household_power_consumption.txt")
df <- sqldf("select * from dt where Date == '1/2/2007' or Date == '2/2/2007'", 
            file.format = list(header = TRUE, sep = ";"))

date_time <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y%H:%M:%S")
GAP <- as.numeric(df$Global_active_power)
Sub_metering_1 <- as.numeric(df$Sub_metering_1)
Sub_metering_2 <- as.numeric(df$Sub_metering_2)
Sub_metering_3 <- as.numeric(df$Sub_metering_3)    

png("plot3.png", width = 480, height = 480)   
plot(date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, Sub_metering_2, type = "l", col = "red")
lines(date_time, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"), 
       x.intersp = 0.2, y.intersp = 0.75, text.font = 6)

# dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
