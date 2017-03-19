library(sqldf)
dt <- file("household_power_consumption.txt")
df <- sqldf("select * from dt where Date == '1/2/2007' or Date == '2/2/2007'", 
            file.format = list(header = TRUE, sep = ";"))

png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Killowatts)", ylab = "Frequency")
# dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
