#reading data
txtfile <- "C:/Users/Mahesh/Desktop/R Programming/household_power_consumption.txt"
data <- read.table(txtfile, header=TRUE, sep=";", stringsAsFactors=FALSE)

#assign date class
dt$Date = as.Date(dt$Date)

#subset data accoding to 02 days given
dt <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#setting the date & time together
datetime <- strptime(paste(dt$Date, dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#creating png & plot as per the picture in github repo
GAP <- as.numeric(dt$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime,GAP, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()
