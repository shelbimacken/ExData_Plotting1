#Read in Data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

data<- read.csv("/Users/shelbimacken/Desktop/ExData_Plotting1_SM/data/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

library(dplyr)
library(lubridate)

#subset data
data2<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
as.Date(data2$Date, format="%d/%m/%Y")
strptime(data2$Time, "%H:%M:%S")


data2$datetime <-paste(data2$Date, data2$Time, sep = " ")
data2$datetime<-as.POSIXct(data2$datetime, format= "%d/%m/%Y %H:%M:%S")


#make plot
png("plot2.png", width=480, height=480)
with(data2, plot(datetime, Global_active_power, type = "l", xlab = "", ylab= "Global Active Power (kilowatts)"))
dev.off()