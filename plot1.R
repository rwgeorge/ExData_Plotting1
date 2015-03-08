## plot1.R
##
## Bob George  https://github.com/rwgeorge
###############################################################################
## Coursera Exploratory Data analysis (exdata-012)
## Course Project 1
## https://github.com/rwgeorge/ExData_Plotting1
###############################################################################

## Global Active Power Plot 1
library(dplyr)
myData <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dat <- tbl_df(myData)
dat <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot1.png")
hist(as.numeric(dat$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()