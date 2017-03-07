table<-read.table("household_power_consumption.txt",sep=";",header=T)
library(dplyr)
a<-subset(table, table$Date %in% c("1/2/2007","2/2/2007"))
a$Global_active_power<-as.numeric(as.character(a$Global_active_power))
#open png device
png("plot1.png",height=400,width=500)
hist(a$Global_active_power,breaks=12,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#close device
dev.off()