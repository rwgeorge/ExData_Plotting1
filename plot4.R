## plot4.R
##
## Bob George  https://github.com/rwgeorge
###############################################################################
## Coursera Exploratory Data analysis (exdata-012)
## Course Project 1
## https://github.com/rwgeorge/ExData_Plotting1
###############################################################################

## Global Active Power Plot 4
library(dplyr)
myData <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat <- tbl_df(myData)
dat <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %T")
png(file = "plot4.png")
par(mfcol = c(2, 2))
with(dat, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(dat, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering"))
with(dat, lines(DateTime, Sub_metering_1))
with(dat, lines(DateTime, Sub_metering_2, col = "red"))
with(dat, lines(DateTime, Sub_metering_3, col = "blue"))
with(dat, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(dat, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()