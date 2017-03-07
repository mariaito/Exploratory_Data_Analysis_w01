###PLEASE NOTE: Qui, Sex, and Sáb are the equivalent to Thu, Fri, and Sat in Portuguese

table<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors = F)
library(dplyr)
a<-subset(table, table$Date %in% c("1/2/2007","2/2/2007"))
a$Global_active_power<-as.numeric(a$Global_active_power)
a$posix<-strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#open png device
png("plot2.png",height=400,width=500)
plot(a$posix,a$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#close device
dev.off()