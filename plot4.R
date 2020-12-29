## Course 4. Exploratory Data Analysis
## Week 1 project 

## Plot 4

## checks if dataset is in working directory
if (!file.exists("./household_power_consumption.txt")) {
    cat("File not found. Downloading and unzipping file now.")
    fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl,destfile="./hpc.zip") 
    unzip("./hpc.zip")
    cat("File has been downloaded and unzipped to your working directory")
}

## reads dataset  
hpc <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

##subsets for the 2 specified dates in assignment instructions
hpcsubset <- subset(hpc, Date== "1/2/2007" | Date == "2/2/2007")

## sets plotting area to accommodate 4 graphs and adjusts margins
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))  

## Converts Date and Time variables to classes "POSIXlt"/"POSIXct" 
hpcsubset$datetime <- strptime(paste(hpcsubset$Date, hpcsubset$Time), 
                               format="%d/%m/%Y %H:%M:%S") 


## plots top left graph

with(hpcsubset, plot(datetime, Global_active_power, ylab="Global Active Power (kilowatts)",
                     xlab="",type = "l"))

## plots top right graph

with(hpcsubset, plot(datetime, Voltage, ylab="Voltage", xlab="",type = "l"))

## plot bottom left graph 
with(hpcsubset, plot(datetime, Sub_metering_1, type = "l", ylab = "Sub-metering"))
lines(hpcsubset$datetime, hpcsubset$Sub_metering_2, col="red")
lines(hpcsubset$datetime, hpcsubset$Sub_metering_3, col="blue")
legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), 
       legend = names(hpcsubset)[7:9], cex=0.6, bty="n")

##plots bottom left graph
with(hpcsubset, plot(datetime, Global_reactive_power, ylab="Global Reactive Power",type = "l"))

dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()
