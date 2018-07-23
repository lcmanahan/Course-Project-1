setwd("C:/Users/Louise/Documents/Louise/Coursera/Exploratory Data Analysis by John Hopkins University/Quiz/Project 1")

# load data into R
power_alldata <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
power_alldata <- read.table(power_alldata, header=TRUE, sep=";", na.strings = "?")
head(power_alldata,10)
str(power_alldata)

# filter only needed data
power_alldata$Date <- as.Date(power_alldata$Date, format="%d/%m/%Y")
power_data <- subset(power_alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# conversion of date/time
datetime <- paste(as.Date(power_data$Date), power_data$Time)
power_data$Datetime <- as.POSIXct(datetime)

# Plot 4
par(mfrow=c(2,2))
with(power_data, {
        plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
        plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
        plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="")
})

# saving png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
