plot3 <- function() {
  ##to plot the 3rd graph which has multiple lines to be plotted
  
  ##setting up working directory
  setwd("C:/Ramesh/Personal/Training/DataScience/ExploratoryDataAnalysis/ExData_Plotting1")
  ## loading the required external libraries
  library(lubridate)
  library(dplyr)
  ##reading raw data from the text file
  data1 <- read.table("../household_power_consumption.txt",sep=";",header=TRUE)
  ## converting the date fileds from vector to character
  data1$Date <- as.character(data1$Date)
  data1$Time <- as.character(data1$Time)
  ##subsetting the dataset for the required date range 
  data2<- subset(data1,Date=="2/1/2007" | Date=="2/2/2007")
  ## adding a new column which is Date Time and then formating to the Date/Time object
  data2 <- mutate(data2, datatime=paste(Date,Time,sep=" "))
  data2$datatime = mdy_hms(data2$datatime)
  
  ##converting the variables from vector to numeric for plotting
  data2$Global_active_power <- as.numeric(data2$Global_active_power)
  data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
  data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)
  data2$Sub_metering_3 <- as.numeric(data2$Sub_metering_3)
  
  ##finding the plotting range for the x and y axis
  xrange <- range(data2$datatime) 
  yrange <- range(data2$Sub_metering_1,data2$Sub_metering_2,data2$Sub_metering_3) 
  
  ##Opening the png file for plotting the graph
  png(file="plot3.png")
  plot(xrange,yrange,type="n",ylab="Energy sub metering",xlab="")
  lines(data2$datatime,data2$Sub_metering_1,type="l",col="black")
  lines(data2$datatime,data2$Sub_metering_2,type="l",col="red")
  lines(data2$datatime,data2$Sub_metering_3,type="l",col="blue")
  legend("topright", pch = "-", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  ##closing the png file
  dev.off()
}