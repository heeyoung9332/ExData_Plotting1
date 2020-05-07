##Load data file 
hpc <- read.table("./household_power_consumption.txt", header=TRUE,sep=";",
                  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                  na.strings="?")
hpc[,1]<-as.Date(hpc[,1],'%d/%m/%Y')
# only using data from the dates "2007-02-01" and "2007-02-02"
hpc_dat <- subset(hpc,Date == "2007-02-01" |Date == "2007-02-02")
# paste Date and Time 
hpc_dat$DT <- strptime(paste(hpc_dat$Date,hpc_dat$Time), "%Y-%m-%d %H:%M:%S")
# Save a PNG file 
png(filename = "plot3.png", width = 480, height = 480)
# Make a plot 
plot(hpc_dat$DT,hpc_dat$Sub_metering_1,type='l',xlab="",ylab="Energy Sub metering")
lines(hpc_dat$DT,hpc_dat$Sub_metering_2,col='red')
lines(hpc_dat$DT,hpc_dat$Sub_metering_3,col='blue')
legend("topright",lty=1,col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Device off
dev.off()
