# Read data
data <- read.csv("./data/household_power_consumption.txt", header=T, 
                 sep=';', na.strings="?", nrows=70000, check.names=F, 
                 stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data
sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates
datetime <- paste(sub_data$Date, sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

# Draw Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0), cex.lab=0.9, cex.axis=0.9)
with(sub_data, {
  # Graph 1
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  # Graph 2
  plot(Voltage~Datetime, type="l", ylab="Voltage")
  # Graph 3
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='red')
  lines(Sub_metering_3~Datetime,col='blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         cex=0.9)
  # Graph 4
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power")
})

# Save to file
dev.copy(png, file="plot4.png", height=600, width=600)
dev.off()