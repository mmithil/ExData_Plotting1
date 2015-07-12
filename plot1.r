## Read file into data frame using the read.table function
## Assumed that the file household_power_consumption.txt file is in the working directory
## The file ";" separated and hence the argument sep = ";"
## The file includes headers and thus the argument header = TRUE 

powerConsumptionData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE)

## Get data for just two days 2007/02/01 and 2007/02/02
twoDaysPowerConsumptionData <- powerConsumptionData[powerConsumptionData$Date %in% c("1/2/2007","2/2/2007"), ]

## Delete "powerConsumptionData" from memory as it is no longer required
rm(powerConsumptionData)
## open the Graphics Device 
png(file = "plot1.png", width = 480, height = 480)

## plot the histogram in red with title and x-lable
hist(as.numeric(twoDaysPowerConsumptionData$Global_active_power),col= "red",xlab = "Global Active Power (killowatts)", main = "Global Active Power")

## close the connection to graphocs device 
dev.off()
