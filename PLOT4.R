###PLEASE NOTE: Qui, Sex, and Sáb are the equivalent to Thu, Fri, and Sat in Portuguese

table<-read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors = F)
library(dplyr)
a<-subset(table, table$Date %in% c("1/2/2007","2/2/2007"))
#fix date and time
a$posix<-strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png",height=500,width=600)
#place four charts in a single one
par(mfrow=c(2,2))
#=====================================================
#chart 1
a$Global_active_power<-as.numeric(a$Global_active_power)
plot(a$posix,a$Global_active_power,type="l",xlab='',ylab="Global Active Power")

#=====================================================
#chart 2
a$Voltage<-as.numeric(a$Voltage)
plot(a$posix,a$Voltage,type="l",xlab="datetime",ylab="Voltage")
#=====================================================
#chart 3
a$Sub_metering_1<-as.numeric(a$Sub_metering_1)
a$Sub_metering_2<-as.numeric(a$Sub_metering_2)
plot(a$posix,a$Sub_metering_1,type="l",ylim=c(0,40),xlab='',ylab="Energy Sub Metering")
par(new=T)
plot(a$posix,a$Sub_metering_2,type="l",col="red",ylim=c(0,40), xlab='', ylab='', axes=F)
par(new=T)
plot(a$posix,a$Sub_metering_3,type="l",col="blue",ylim=c(0,40), xlab='', ylab='', axes=F)
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#=====================================================
#chart 4
a$Global_reactive_power<-as.numeric(a$Global_reactive_power)
plot(a$posix,a$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
