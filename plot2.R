## Exploratory Data Analysis, Assignment 1 - Plot 2

## Read the data file
## Notes
## 1. Only interested in data for 01FEB2007 and 02FEB2007.
## 2. Data contains Date and Time values, so treat and format accordingly.
hpc <- read.csv2("household_power_consumption.txt", na.strings = "?", nrows = 2075260 , dec = ".", colClasses = c( rep("character",2) , rep("numeric",7)))
hpc <- subset(hpc, (Date == "1/2/2007") | (Date == "2/2/2007"))
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") ## Results in Date format


## Make the plot (Plot 2)
## Notes
## 1. Plot to be placed in a PNG file 480 x 480
png(filename = "plot2.png")
par(mfrow = c(1, 1)) ## (1) L -> R ; (2) T -> B;
plot(hpc$Time, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() ## Don't forget to close the PNG device!
## Finished