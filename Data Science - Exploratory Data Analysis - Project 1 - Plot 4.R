hw1 = read.table("household_power_consumption.txt",
	sep =";", 
	col.names =
	c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
	"Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	fill=FALSE,
	strip.white=TRUE)

hw1$NewDate = as.Date(hw1$Date, format = "%d/%m/%Y")
newdata = subset(hw1, NewDate >= "2007-02-01" & NewDate <= "2007-02-02" ) 

newdata$active_power = as.numeric(paste(newdata$Global_active_power))
newdata$voltage = as.numeric(paste(newdata$Voltage))
newdata$reactive_power = as.numeric(paste(newdata$Global_reactive_power))
Plot3 = 1
Plot3 = Plot3[!1]
Plot3$Sub_metering_1 = as.numeric(paste(newdata$Sub_metering_1))
Plot3$Sub_metering_2 = as.numeric(paste(newdata$Sub_metering_2))
Plot3$Sub_metering_3 = as.numeric(paste(newdata$Sub_metering_3))
str(Plot3)


par(mfrow=c(2,2))

plot(newdata$active_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab ="",xaxt='n')
axis(1, at=seq(1,2880,by=1439),
labels=c("Thur","Fri","Sat"), las = 2)

plot(newdata$voltage, type= "l", ylab = "Voltage", xlab ="datetime",xaxt='n')
axis(1, at=seq(1,2880,by=1439),
labels=c("Thur","Fri","Sat"), las = 2)

plot(Plot3$Sub_metering_1, type= "l", ylab = "Energy sub metering", xlab ="",xaxt='n')
lines(Plot3$Sub_metering_2, type = "l", col = "red")
lines(Plot3$Sub_metering_3, type = "l", col = "blue")
axis(1, at=seq(0,2880,by=1439),
labels=c("Thur","Fri","Sat"), las = 2)
legend("topright", names(Plot3)[-8], lty=1, col=c('black','red','blue'),cex=.75)


plot(newdata$reactive_power, type= "l", ylab = "Global_reactive_power", xlab ="datetime",xaxt='n')
axis(1, at=seq(1,2880,by=1439),
labels=c("Thur","Fri","Sat"), las = 2)



dev.copy(png,filename="plot4.png");
dev.off ();

