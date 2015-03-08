## plot2.R
##
## Bob George  https://github.com/rwgeorge
###############################################################################
## Coursera Exploratory Data analysis (exdata-012)
## Course Project 1
## https://github.com/rwgeorge/ExData_Plotting1
###############################################################################

## Global Active Power Plot 2
library(dplyr)
myData <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat <- tbl_df(myData)
dat <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %T")
png(file = "plot2.png")
with(dat, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()