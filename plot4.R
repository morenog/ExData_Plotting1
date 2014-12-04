## Exploratory Data Analysis, Assignment 1 - Plot 1

## Read the data file
## Notes
## 1. Only interested in data for 01FEB2007 and 02FEB2007.
## 2. Data contains Date and Time values, so treat and format accordingly.
hpc <- read.csv2("household_power_consumption.txt", na.strings = "?", nrows = 2075260 , dec = ".", colClasses = c( rep("character",2) , rep("numeric",7)))
hpc <- subset(hpc, (Date == "1/2/2007") | (Date == "2/2/2007"))
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") ## Results in Date format


## Make the plot (Plot 4)
## Notes
## 1. Plot to be placed in a PNG file 480 x 480
## 2. There are four charts to be maded in a 2x2 grid
png(filename = "plot4.png")
par(mfrow = c(2, 2)) ## (1) L -> R ; (2) T -> B;
## Plot 1, Top Left
plot(hpc$Time, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Plot 2, Top Right
with(hpc, plot(Time, Voltage, type = "l", xlab = "datetime"))

## Plot 3, Bottom, Left
plot(hpc$Time, hpc$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_2, col = "red")
lines(hpc$Time, hpc$Sub_metering_3, col = "blue")
legend("topright", pch = -0x2015  , bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4, Bottom Right
with(hpc, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off() ## Don't forget to close the PNG device!
## Finished