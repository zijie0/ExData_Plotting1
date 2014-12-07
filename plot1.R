# Read data
data <- read.csv("./data/household_power_consumption.txt", header=T, 
                 sep=';', na.strings="?", nrows=70000, check.names=F, 
                 stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data
sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

# Draw Plot 1
par(cex.lab=0.9, cex.main=0.9, cex.axis=0.9)
hist(sub_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save to file
dev.copy(png, file="plot1.png", height=600, width=600)
dev.off()