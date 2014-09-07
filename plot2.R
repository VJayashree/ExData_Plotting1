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
plot(reqd_powerdata1$Timestamp,as.numeric(as.character(reqd_powerdata1$Global_active_power)), type = "l",  ylab="Global Active Power(kilowatts)", xlab="")
dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!
