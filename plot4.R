setwd("c:\\rdataassignment")
library(dplyr) ## load dplyr
library(lubridate) ## load lubridate
powerdata<-read.table(".\\data\\household_power_consumption.txt", sep = ";", header = TRUE)
head(powerdata)
powerdata_f<-tbl_df(powerdata)
rm("powerdata")
reqd_start<-dmy("01/02/2007")
reqd_start
reqd_end<-dmy("02/02/2007")
reqd_end
reqd_powerdata <- filter(powerdata_f, dmy(Date) >= reqd_start , dmy(Date) <= reqd_end)
reqd_powerdata1 <- mutate(reqd_powerdata, Timestamp = dmy_hms(paste(Date, Time)))    
par(mfrow = c(2, 2))
plot(reqd_powerdata1$Timestamp,as.numeric(as.character(reqd_powerdata1$Global_active_power)), type = "l",  ylab="Global Active Power(kilowatts)", xlab="")
plot(reqd_powerdata1$Timestamp,as.numeric(as.character(reqd_powerdata1$Voltage)), type = "l",  ylab="Voltage", xlab = "datetime")
plot(reqd_powerdata1$Timestamp,as.numeric(as.character(reqd_powerdata1$Sub_metering_1)), type = "l",  ylab="Energy Sub metering", xlab = "")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                                      pch = NA, lty = 1 , col = c("black", "red", "blue"))
lines(reqd_powerdata1$Timestamp,as.numeric(as.character(reqd_powerdata1$Sub_metering_2)),  col = "red")
lines(reqd_powerdata1$Timestamp,as.numeric(as.character(reqd_powerdata1$Sub_metering_3)),  col = "blue")
plot(reqd_powerdata1$Timestamp,as.numeric(as.character(reqd_powerdata1$Global_reactive_power)), type = "l",  ylab="Global Reactive Power", xlab = "datetime")
dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!
