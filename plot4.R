#reading data
txtfile <- "C:/Users/Mahesh/Desktop/R Programming/household_power_consumption.txt"
data <- read.table(txtfile, header=TRUE, sep=";", stringsAsFactors=FALSE)

#assign date class
dt$Date = as.Date(dt$Date)

#subset data accoding to 02 days given
dt <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#chage the class to numeric
GAP <- as.numeric(dt$Global_active_power)
s1 <- as.numeric(dt$Sub_metering_1)
s2 <- as.numeric(dt$Sub_metering_2)
s3 <- as.numeric(dt$Sub_metering_3)
Voltage <- as.numeric(dt$Voltage)
GRP <- as.numeric(dt$Global_reactive_power)

#setting the date & time together
datetime <- strptime(paste(dt$Date, dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#creating png & plots as per the picture in github repo
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(datetime,GAP, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
plot(datetime, Voltage, type="l", ylab="Voltage", xlab = "datetime" )
plot(datetime, s1, type = "l", ylab="Enegy sub metering", xlab = "")
lines(datetime, s2, type = "l", col = "red")
lines(datetime, s3, type = "l", col = "blue")
legend("topright", c("sub_metering_1","sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2, col = c("black","red", "blue"))
plot(datetime, GRP, type="l", ylab="Global_reactive_power", xlab = "datetime")

dev.off()


