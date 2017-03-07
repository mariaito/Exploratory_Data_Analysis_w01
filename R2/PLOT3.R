###PLEASE NOTE: Qui, Sex, and Sáb are the equivalent to Thu, Fri, and Sat in Portuguese

table<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors = F)
library(dplyr)
a<-subset(table, table$Date %in% c("1/2/2007","2/2/2007"))
a$posix<-strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#open png device
png("plot3.png",height=400,width=500)
#change Sub_metering_1 and Sub_metering_2 classes to numeric
a$Sub_metering_1<-as.numeric(a$Sub_metering_1)
a$Sub_metering_2<-as.numeric(a$Sub_metering_2)
#plot different lines in the same chart
plot(a$posix,a$Sub_metering_1,type="l",ylim=c(0,40),xlab='',ylab="Energy Sub Metering")
par(new=T)
plot(a$posix,a$Sub_metering_2,type="l",col="red",ylim=c(0,40), xlab='', ylab='', axes=F)
par(new=T)
plot(a$posix,a$Sub_metering_3,type="l",col="blue",ylim=c(0,40), xlab='', ylab='', axes=F)
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#close device
dev.off()