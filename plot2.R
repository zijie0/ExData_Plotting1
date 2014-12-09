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

# Draw Plot 2
par(cex.axis=0.9)
plot(sub_data$Global_active_power~sub_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save to file
dev.copy(png, file="plot2.png", height=600, width=600)
dev.off()