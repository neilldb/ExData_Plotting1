## Exploratory Data Analysis Course Project 1 - Plot 4
## This script creates a plot of four subplots from the household_power_consumption.txt
## data for date range Feb 1-2, 2007
##
## Read data into R from local copy previously downlowned and unzipped
## NAs expected as "?" in this data set
##
        class <- c(rep("character",2),rep("numeric",7))
        power <- read.table("household_power_consumption.txt",sep = ";",
                header = TRUE,na.strings = "?",colClasses = class)
## Select only desired date range and assign to power2
## Convert Date and Time into new 'datetime' variable in POSIXlt
##
        power2 <- power[which(power[,1]=="1/2/2007" | power[,1]=="2/2/2007"),]
        datetime <- strptime(paste(power2[,1],power2[,2]),format="%d/%m/%Y %H:%M:%S")
        power2 <- cbind(datetime,power2)
## Create desired plot as a PNG file "plot4.png"
        png(file = "plot4.png")
        par(mfrow = c(2, 2))
        with(power2, {
                plot(datetime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
                plot(datetime, Voltage, type="l")
                plot(datetime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
                legend("topright", lwd=1, bty="n", legend = c("Sub_metering_1","Sub_metering_2", 
                                                    "Sub_metering_3"),col = c("black","red", "blue"))
                points(datetime, Sub_metering_2, type="l", col=2)
                points(datetime, Sub_metering_3, type="l", col=4)
                plot(datetime, Global_reactive_power, type = "l")
        })
        dev.off()
##