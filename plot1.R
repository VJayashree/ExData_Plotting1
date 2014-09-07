setwd("c:\\rdataassignment")
library(dplyr) ## load dplyr
library(lubridate) ## load lubridate
powerdata<-read.table(".\\data\\household_power_consumption.txt", sep = ";", header = TRUE, stringAsFactors=FALSE)
head(powerdata)
powerdata_f<-tbl_df(powerdata)
rm("powerdata")
reqd_start<-dmy("01/02/2007")
reqd_start
reqd_end<-dmy("02/02/2007")
reqd_end
reqd_powerdata <- filter(powerdata_f, dmy(Date) >= reqd_start , dmy(Date) <= reqd_end)
reqd_powerdata
hist(as.numeric(as.character(reqd_powerdata$Global_active_power)), main=paste("Global Active Power"), col="red", xlab="Global Active Power(kilowatts)")
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!
