## Read the file from Current work directory
x<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?")
x$Time<-strptime(paste(x$Date,x$Time),format='%d/%m/%Y %H:%M:%S')
x$Date<-as.Date(x$Date,format='%d/%m/%Y')
xs<-subset(x,x$Date >= as.Date('01/02/2007',format='%d/%m/%Y') & x$Date <= as.Date( '02/02/2007',format='%d/%m/%Y'))



## Generate Plot3. A single plot with Multiple series
png(filename="Plot3.png",width = 480, height = 480, units = "px")
plot(xs$Time,xs$Sub_metering_1,ylab="Energy sub metering",xlab="Time",type='l',col='black')
lines(xs$Time,xs$Sub_metering_2,col='red')
lines(xs$Time,xs$Sub_metering_3,col='blue')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
dev.off()


