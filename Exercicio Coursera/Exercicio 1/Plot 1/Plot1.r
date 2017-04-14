data<-read.table("household_power_consumption.txt", header=TRUE,sep=";", stringsAsFactors=F)

data$fDate<-as.Date( as.character(data$Date), "%e/%m/%Y")
data$fTime <- format(strptime(as.character(data$Time), "%H:%M:%S"),"%H:%M:%S")

subData<-data[data$fDate <= as.Date("2007-02-02"),]
subData<-subData[subData$fDate >= as.Date("2007-02-01"),]

subData$Global_active_power<- as.numeric(subData$Global_active_power)

hist(main="Global Active Power",subData$Global_active_power, xlab="Global active power", col="red")
