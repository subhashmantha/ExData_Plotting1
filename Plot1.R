## Read the file from Current work directory
x<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?")
x$Time<-strptime(paste(x$Date,x$Time),format='%d/%m/%Y %H:%M:%S')
x$Date<-as.Date(x$Date,format='%d/%m/%Y')
xs<-subset(x,x$Date >= as.Date('01/02/2007',format='%d/%m/%Y') & x$Date <= as.Date( '02/02/2007',format='%d/%m/%Y'))

## Generate Plot1. Histogram
png(filename="Plot1.png",width = 480, height = 480, units = "px")
hist(xs$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()
