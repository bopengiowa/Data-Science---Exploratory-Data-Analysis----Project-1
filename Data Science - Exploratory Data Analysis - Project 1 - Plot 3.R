hw1 = read.table("household_power_consumption.txt",
	sep =";", 
	col.names =
	c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
	"Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	fill=FALSE,
	strip.white=TRUE)


hw1$NewDate = as.Date(hw1$Date, format = "%d/%m/%Y")
newdata = subset(hw1, NewDate >= "2007-02-01" & NewDate <= "2007-02-02" ) 

Plot3 = 1
Plot3 = Plot3[!1]
Plot3$Sub_metering_1 = as.numeric(paste(newdata$Sub_metering_1))
Plot3$Sub_metering_2 = as.numeric(paste(newdata$Sub_metering_2))
Plot3$Sub_metering_3 = as.numeric(paste(newdata$Sub_metering_3))
str(Plot3)

plot(Plot3$Sub_metering_1, type= "l", ylab = "Energy sub metering", xlab ="",xaxt='n')
lines(Plot3$Sub_metering_2, type = "l", col = "red")
lines(Plot3$Sub_metering_3, type = "l", col = "blue")
axis(1, at=seq(0,2880,by=1439),
labels=c("Thur","Fri","Sat"), las = 2)
legend("topright", names(Plot3)[-8], lty=1, col=c('black','red','blue'),cex=.75)

dev.copy(png,filename="plot3.png");
dev.off ();


