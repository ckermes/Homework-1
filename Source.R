#reads data into the environment
library(data.table)
files <- list.files('specdata',pattern = ".csv", full.names = TRUE) #creates a list of full names and where data is sourcing from
temp <- lapply(files, read.csv, sep = ",")  #creates a holder with all of the individual .csv files
data <- rbind( temp ) #rbinds all the .csv files together into one file

meanfunc <- function()
  

    dat_subset <- data[which(data[pollutant,] == pollutant)]


pollutantmean <- function(directory, pollutant, id = 1:332){
  #creates a list of full names and where data is sourcing from
   files <- list.files('specdata',pattern = ".csv", full.names = TRUE) 
   #creates a holder with all of the individual .csv files
    temp <- lapply(files, read.csv, sep = ",") 
    unlist(temp)
    #rbinds all the .csv files together into one file
    data <- rbind( temp )
    #subsets data into the right variable
    for(i in id){
      data1<-data[,pollutant]
      
      data2<-data1[!is.na(data1)]
    }
  
    
    #creates median with no na values
    median(data2$pollutant)
    
  }


pollutantmean(data, sulphate, id)




