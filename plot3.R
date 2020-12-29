## Course 4. Exploratory Data Analysis
## Week 1 project 

## Plot 3


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

## sets plotting area to accommodate 1 graph
par(mfrow = c(1, 1))

## Converts Date and Time variables to classes "POSIXlt"/"POSIXct" 
hpcsubset$datetime <- strptime(paste(hpcsubset$Date, hpcsubset$Time), 
                               format="%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480) 

## plots line graph 
with(hpcsubset, plot(datetime, Sub_metering_1, type = "l", ylab = "Sub-metering"))

## adds additional lines to the graph 
lines(hpcsubset$datetime, hpcsubset$Sub_metering_2, col="red")
lines(hpcsubset$datetime, hpcsubset$Sub_metering_3, col="blue")

## adds legend
legend("topright", lty = rep(1,3), col=c("black", "red", "blue"), 
       legend = names(hpcsubset)[7:9])

dev.off()
