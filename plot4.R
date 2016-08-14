# Loading data into R
File <- "Coursera_Exploratory_Data_Analysis_Assignment1/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subsetting and using data only from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Data for plotting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
GlobalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Saving to a PNG file
png("plot4.png", width=480, height=480)

# Plotting graphs in 2 rows and 2 columns
par(mfrow = c(2, 2)) 

# Global Active Power Graph
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Voltage Graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Energy Sub Metering Graph
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Global Reactive Power Graph
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Writing plot to the PNG file
dev.off()
