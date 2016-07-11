# Exploratory Data Analysis
# Course Project 1
# plot4.R
# 7/11/2016

# Download and read data from the Electic Power Consumption dataset from the UC Irvine 
# Machine Learning Repository.  Generate a 4x4 array of line graphs showing the time series
# of global active power, voltage, submeter power, and global reactive power for the two-day 
# period 2/1/2007 to 2/2/2007.  Output file: plot4.png.

# Download and read in the data file
if(!file.exists("./data")){dir.create("./data")}
fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/exdata_data_household_power_consumption.zip")
unzip("./data/exdata_data_household_power_consumption.zip",exdir="data")
hpower<-read.table("./data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
hpower$datetime<-strptime(paste(hpower$Date,hpower$Time),format=,"%d/%m/%Y %H:%M:%S")

# Subset to selected date range (could not figure out how to only read in selected dates directly)
hpowersubset<-subset(hpower,as.Date(datetime)>="2007-02-01"&as.Date(datetime)<="2007-02-02")

# Set output device to png file
png(file="plot4.png",width=480,height=480)

# Set 4x4 plot array
par(mfrow=c(2,2))

# Create plot for Global Active Power
with(hpowersubset,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Create plot for Voltage
with(hpowersubset,plot(datetime,Voltage,type="l",ylab="Voltage"))

# Create plot for energy sub metering
with(hpowersubset,{
    plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    points(datetime,Sub_metering_2,type="l",col="red")
    points(datetime,Sub_metering_3,type="l",col="blue")
})
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Create plot for Global Reactive Power
with(hpowersubset,plot(datetime,Global_reactive_power,type="l"))

# Close png output device
dev.off() ## Don't forget to close the PNG device!
