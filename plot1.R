## Course 4. Exploratory Data Analysis
## Week 1 project 

## Plot 1


## checks if dataset is in working directory
if (!file.exists("./household_power_consumption.txt")) {
    cat("File not found. Downloading and unzipping file now.")
    fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl,destfile="./hpc.zip") 
    unzip("./hpc.zip")
    cat("File has been downloaded and unzipped to your working directory")
}

## reads dataset and subsets for the 2 dates specified in assignment instructions
hpc <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, )
hpcsubset <- subset(hpc, Date== "1/2/2007" | Date == "2/2/2007")

## sets plotting area to accommodate 1 graph
par(mfrow = c(1, 1))


## plots histogram and copies to png file
png("plot1.png", width=480, height=480) 
hist(as.numeric(hpcsubset$Global_active_power), breaks = 12, col ="red",
     xlab="Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()
