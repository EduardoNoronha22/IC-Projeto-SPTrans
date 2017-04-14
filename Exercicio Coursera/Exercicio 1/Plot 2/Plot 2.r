data<-read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=F)

data$fDate<-as.Date( as.character(data$Date), "%e/%m/%Y")
data$fTime <- format(strptime(as.character(data$Time), "%H:%M:%S"),"%H:%M:%S")

subData2<-data[data$fDate <= as.Date("2007-02-02"),]
subData2<-subData2[subData2$fDate >= as.Date("2007-02-01"),]

subData2$Global_active_power<- as.numeric(subData2$Global_active_power)

Datetime<- paste(subData2$fDate, subData2$fTime)
Datetime2<- as.POSIXct(Datetime)

plot(Datetime2, xlab = "", subData2$Global_active_power, ylab="Global active power(killowatts)",
     type="l")
