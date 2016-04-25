library(data.table)
setwd("C:/WorkingData/RK/Exploratory Data Analysis/Week-1/Data and Programs")
DataSet <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
D2U <- DataSet[DataSet$Date %in% c("1/2/2007","2/2/2007") ,]

GAP <- as.numeric(D2U$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## hist(GAP, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", xlim = c(0, 12), ylim = c(0, 1200), col = "red1")
dev.off()