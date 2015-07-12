## Read file into data frame using the read.table function
## Assumed that the file household_power_consumption.txt file is in the working directory
## The file ";" separated and hence the argument sep = ";"
## The file includes headers and thus the argument header = TRUE 

powerConsumptionData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE, stringsAsFactors = FALSE)

## Get data for just two days 2007/02/01 and 2007/02/02
twoDaysPowerConsumptionData <- powerConsumptionData[powerConsumptionData$Date %in% c("1/2/2007","2/2/2007"), ]

## Delete "powerConsumptionData" from memory as it is no longer required
rm(powerConsumptionData)

## Create a new column DateTime which combines the Date and Time Columns using the strptime function 
twoDaysPowerConsumptionData$DateTime <- strptime(paste(twoDaysPowerConsumptionData$Date, twoDaysPowerConsumptionData$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

## Open Graphics Device
png(file = "plot2.png", width = 480, height = 480)

## plot the graph
plot((twoDaysPowerConsumptionData$DateTime), twoDaysPowerConsumptionData$Global_active_power, type = "l",ylab="Global Active Power (kilowatts)",xlab="")


## close the connection to graphocs device 
dev.off()
