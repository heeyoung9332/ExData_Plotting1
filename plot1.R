##Load data file 
hpc <- read.table("./household_power_consumption.txt", header=TRUE,sep=";",
                  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                  na.strings="?")
hpc[,1]<-as.Date(hpc[,1],'%d/%m/%Y')
# only using data from the dates "2007-02-01" and "2007-02-02"
hpc_dat <- subset(hpc,Date == "2007-02-01" |Date == "2007-02-02")
# Save a PNG file 
png(filename = "plot1.png", width = 480, height = 480)
# Make a histogram (Global Active Power (killowatts)/ Frequency)
hist(hpc_dat$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
# Device off
dev.off()
