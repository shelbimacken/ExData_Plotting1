#Read in Data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

data<- read.csv("/Users/shelbimacken/Desktop/ExData_Plotting1_SM/data/household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

#subset data
data2<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
as.Date(data2$Date, format="%d/%m/%Y")
strptime(data2$Time, "%H:%M:%S")

#create plot

hist(data2$Global_active_power, col ="red", main= "Global Active Power", xlab= "Global Active Power (kilowatts)")
