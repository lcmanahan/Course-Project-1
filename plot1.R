setwd("C:/Users/Louise/Documents/Louise/Coursera/Exploratory Data Analysis by John Hopkins University/Quiz/Project 1")

# load data into R
power_alldata <- "./exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"
power_alldata <- read.table(power_alldata, header=TRUE, sep=";", na.strings = "?")
head(power_alldata,10)
str(power_alldata)

# filter only needed data
power_alldata$Date <- as.Date(power_alldata$Date, format="%d/%m/%Y")
power_data <- subset(power_alldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plot 1
hist(power_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# saving png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
