## Exploratory Data Analysis Course Project 1 - Plot 1
## This script creates a histogram of Global Active Power data for date range Feb 1-2, 2007
##
## Read data into R from local copy previously downlowned and unzipped
## NAs expected as "?" in this data set
##
        class <- c(rep("character",2),rep("numeric",7))
        power <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",colClasses = class)
## Select only desired date range and assign to power2
## Convert Date and Time into new 'datetime' variable in POSIXlt
        power2 <- power[which(power[,1]=="1/2/2007" | power[,1]=="2/2/2007"),]
        datetime <- strptime(paste(power2[,1],power2[,2]),format="%d/%m/%Y %H:%M:%S")
        power2 <- cbind(datetime,power2)
## Create desired histogram as a PNG file "plot1.png"
        png(file = "plot1.png")
        hist(power2$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col=2)
        dev.off()
##