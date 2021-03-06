# Clean the Slate
rm(list=ls())

# Set WD
setwd("C:/Users/Jamey/OneDrive/Documents/GitHub/ExData_Plotting1")

# Load Libraries
library(tidyverse)
library(lubridate)

# Read Data using read.csv
hpc <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
hpc <- tbl_df(hpc)
head(hpc)
str(hpc)

# Create Date Time Column
hpc$datetime <- paste(hpc$Date, hpc$Time)
hpc$datetime <- dmy_hms(hpc$datetime)

# Convert Date column to Date datatype using dmy in lubridate
hpc$Date = dmy(hpc$Date)
str(hpc)


# Filter to 
hpc <- filter(hpc,Date %in% c(dmy("1/2/2007"),dmy("2/2/2007")))

# Plot 3
png(file = "plot3.png", width = 480, height = 480, units = "px")
with(hpc, plot(Sub_metering_1 ~ datetime, type = "n",
               ylab = "Energy sub metering", xlab = NA))
lines(hpc$datetime, hpc$Sub_metering_1, col = "black")
lines(hpc$datetime, hpc$Sub_metering_2, col = "red")
lines(hpc$datetime, hpc$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
