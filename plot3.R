## Exploratory Data Analysis Course Project 1 - Plot 3
## This script creates a plot of energy sub metering data for date range Feb 1-2, 2007
##
## Read data into R from local copy previously downlowned and unzipped
## NAs expected as "?" in this data set
##
        class <- c(rep("character",2),rep("numeric",7))
        power <- read.table("household_power_consumption.txt",sep = ";",
                    header = TRUE,na.strings = "?",colClasses = class)
## Select only desired date range and assign to power2
## Convert Date and Time into new 'datetime' variable in POSIXlt
        power2 <- power[which(power[,1]=="1/2/2007" | power[,1]=="2/2/2007"),]
        datetime <- strptime(paste(power2[,1],power2[,2]),format="%d/%m/%Y %H:%M:%S")
        power2 <- cbind(datetime,power2)
## Create desired plot as a PNG file "plot3.png"
        png(file = "plot3.png")
        plot(power2$datetime,power2$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
        legend("topright", lwd=1,legend = c("Sub_metering_1","Sub_metering_2", 
                "Sub_metering_3"),col = c("black","red", "blue"))
        points(power2$datetime,power2$Sub_metering_2, type="l", col=2)
        points(power2$datetime,power2$Sub_metering_3, type="l", col=4)
        dev.off()
##