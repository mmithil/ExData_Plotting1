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

##open the graphics device 
png(file = "plot3.png", width = 480, height = 480)

## Initialize the plotting area without plotting
plot((twoDaysPowerConsumptionData$DateTime), twoDaysPowerConsumptionData$Sub_metering_1, type = 'n', xlab = "", ylab = "Energy sub metering" )

## Add Legend to the plotting area
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = c(2.5,2.5),col = c("black","red","blue"))

## plot the graph for Sub_metering_1
lines((twoDaysPowerConsumptionData$DateTime), twoDaysPowerConsumptionData$Sub_metering_1, col="black")

## plot the graph for Sub_metering_2
lines((twoDaysPowerConsumptionData$DateTime), twoDaysPowerConsumptionData$Sub_metering_2, col="red")

## plot the graph for Sub_metering_3
lines((twoDaysPowerConsumptionData$DateTime), twoDaysPowerConsumptionData$Sub_metering_3, col="blue")

## close the connection to graphocs device 
dev.off()



