## plot3.R
##
## Bob George  https://github.com/rwgeorge
###############################################################################
## Coursera Exploratory Data analysis (exdata-012)
## Course Project 1
## https://github.com/rwgeorge/ExData_Plotting1
###############################################################################

## Global Active Power Plot 3
library(dplyr)
myData <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat <- tbl_df(myData)
dat <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %T")
png(file = "plot3.png")
with(dat, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(dat, lines(DateTime, Sub_metering_1))
with(dat, lines(DateTime, Sub_metering_2, col = "red"))
with(dat, lines(DateTime, Sub_metering_3, col = "blue"))
dev.off()