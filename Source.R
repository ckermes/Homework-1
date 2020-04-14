for (k in 1:length(listcsv)){
  
  AggData[[k]] <- read.csv(listcsv[k])
  
}

ldf <- list() # creates a list
listcsv <- dir(pattern = "*.csv") # creates the list of all the csv files in the directory
for (k in 1:length(listcsv)){
  ldf[[k]] <- read.csv(listcsv[k])
}
str(ldf[[1]])


pollutantmean <- function(directory, pollutant, id = 1:332){
  
}
pollutantmean(AggData, sulphate, id = 1:332)  
library(data.table)
files <- list.files(pattern = ".csv")
temp <- lapply(files, read.csv, sep = ",")
data <- rbind( temp )

meanfunc <- function()
  
  
  pollutantmean <- function(directory, pollutant, id = 1:332){
    #gets rid of na values
    pol <- is.na(pollutant)   
    clean <- na.omit(pollutant)
    
    #finds the mean
    temp <- sum(clean)/length(clean) 
    
    #prints the mean
    temp 
    
  }







