library(data.table)
setwd("C:/WorkingData/RK/Exploratory Data Analysis/Week-1/Data and Programs")
DataSet <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
D2U <- DataSet[DataSet$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(D2U$Date, D2U$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(D2U$Global_active_power)
GRP <- as.numeric(D2U$Global_reactive_power)
VLTG <- as.numeric(D2U$Voltage)
SMR1 <- as.numeric(D2U$Sub_metering_1)
SMR2 <- as.numeric(D2U$Sub_metering_2)
SMR3 <- as.numeric(D2U$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, VLTG, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, SMR1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, SMR2, type="l", col="red")
lines(datetime, SMR3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
