library(sqldf)
dt <- file("household_power_consumption.txt")
df <- sqldf("select * from dt where Date == '1/2/2007' or Date == '2/2/2007'", 
            file.format = list(header = TRUE, sep = ";"))

date_time <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y%H:%M:%S")
GAP <- as.numeric(df$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(date_time, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
