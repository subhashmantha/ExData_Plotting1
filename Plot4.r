## Read the file from Current work directory
x<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?")
x$Time<-strptime(paste(x$Date,x$Time),format='%d/%m/%Y %H:%M:%S')
x$Date<-as.Date(x$Date,format='%d/%m/%Y')
xs<-subset(x,x$Date >= as.Date('01/02/2007',format='%d/%m/%Y') & x$Date <= as.Date( '02/02/2007',format='%d/%m/%Y'))

## Generate Plot4. 4 separate Plots in the same frame
png(filename="Plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(xs$Time,xs$Global_active_power,ylab="Global Active Power(kilowatts)",xlab=" ",type='l')
plot(xs$Time,xs$Voltage,ylab="Voltage",xlab="datetime",type='l')
plot(xs$Time,xs$Sub_metering_1,ylab="Energy sub metering",xlab=" ",type='l',col='black')
lines(xs$Time,xs$Sub_metering_2,col='red')
lines(xs$Time,xs$Sub_metering_3,col='blue')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
plot(xs$Time,xs$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type='l')
dev.off()


