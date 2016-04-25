library(data.table)
setwd("C:/WorkingData/RK/Exploratory Data Analysis/Week-1/Data and Programs")
DataSet <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
D2U <- DataSet[DataSet$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(D2U$Date, D2U$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(D2U$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()