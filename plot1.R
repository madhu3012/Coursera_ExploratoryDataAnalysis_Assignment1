# Loading data into R
File <- "Coursera_Exploratory_Data_Analysis_Assignment1/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subsetting and using data only from the dates 2007-02-01 and 2007-02-02
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Constructing Plot1 - Global Active Power 
GlobalActivePower <- as.numeric(subSetData$Global_active_power)

# Saving to a PNG file
png("plot1.png", width=480, height=480)

# Plotting a histogram
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Writing plot to the PNG file
dev.off()
