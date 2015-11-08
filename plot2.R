## Getting full dataset
data1 <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(data1, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data1)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Generating Plot 2
png(filename='plots/plot2.png',width=480,height=480,units='px')
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
x<-dev.off()