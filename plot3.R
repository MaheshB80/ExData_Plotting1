#reading data
txtfile <- "C:/Users/Mahesh/Desktop/R Programming/household_power_consumption.txt"
data <- read.table(txtfile, header=TRUE, sep=";", stringsAsFactors=FALSE)

#assign date class
dt$Date = as.Date(dt$Date)

#subset data accoding to 02 days given
dt <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#setting the date & time together
datetime <- strptime(paste(dt$Date, dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#chage the class to numeric
s1 <- as.numeric(dt$Sub_metering_1)
s2 <- as.numeric(dt$Sub_metering_2)
s3 <- as.numeric(dt$Sub_metering_3)

#creating png & plot as per the picture in github repo
png("plot3.png", width = 480, height = 480)
plot(datetime, s1, type = "l", ylab="Enegy sub metering", xlab = "")
lines(datetime, s2, type = "l", col = "red")
lines(datetime, s3, type = "l", col = "blue")
legend("topright", c("sub_metering_1","sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2, col = c("black","red", "blue"))
dev.off()

