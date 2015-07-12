plot2 <- function() {
  ##to plot the 2nd graph which is a x,y graph
  
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
  
  ##Opening the png file for plotting the graph
  png(file="plot2.png",width = 480, height = 480)
  plot(data2$datatime,data2$Global_active_power,type="n",ylab="Global Active Power(Kilowatts)",xlab="")
  lines(data2$datatime,data2$Global_active_power,type="l")
  ##closing the png file
  dev.off()
}