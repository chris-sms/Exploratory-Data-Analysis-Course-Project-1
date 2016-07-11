# Exploratory Data Analysis
# Course Project 1
# plot2.R
# 7/11/2016

# Download and read data from the Electic Power Consumption dataset from the UC Irvine 
# Machine Learning Repository.  Generate a line graph showing the time series of global 
# active power for the two-day period 2/1/2007 to 2/2/2007.  Output file: plot2.png.

# Download and read in the data file
if(!file.exists("./data")){dir.create("./data")}
fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/exdata_data_household_power_consumption.zip")
unzip("./data/exdata_data_household_power_consumption.zip",exdir="data")
hpower<-read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
hpower$datetime<-strptime(paste(hpower$Date,hpower$Time),format=,"%d/%m/%Y %H:%M:%S")

# Subset to selected date range (could not figure out how to only read in selected dates directly)
hpowersubset<-subset(hpower,as.Date(datetime)>="2007-02-01"&as.Date(datetime)<="2007-02-02")

# Reset plot parameters by shutting down device
dev.off()

# Create plot 2
with(hpowersubset,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Copy to PNG file
dev.copy(png, file = "plot2.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
