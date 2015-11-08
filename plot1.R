
data1 <- read.table(text = grep("^[1,2]/2/2007", readLines(file("household_power_consumption.txt")), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

if (!file.exists('plots')) {
  dir.create('plots')
}
# Generating Plot 1
png(filename='plots/plot1.png',width=480,height=480,units='px')
hist(data1$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
x<-dev.off()