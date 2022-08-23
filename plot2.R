#Reading Individual household electric power consumption Data Set
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".")

#Subset data from the dates 2007-02-01 and 2007-02-02
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Construct the plot1
plot(datetime, datasubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Save the plot2 to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()