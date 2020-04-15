

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332){
  #creates a list of full names and where data is sourcing from
   dirlist <- list.files('specdata',pattern = ".csv", full.names = TRUE) 
   #creates a holder with all of the individual .csv files
    filenames <- dirlist[id]
    #unlist(temp)
    csvDataList <- vector(mode = 'list', length = length(filenames))
    
    csvDataList <- lapply(filenames, read.csv)
    
    obsDataFrame <- data.frame()
    obsDataFrame <- do.call(rbind,csvDataList)
    #rbinds all the .csv files together into one file
    
    if (pollutant == 'sulfate'){
        mymean <- mean(obsDataFrame$sulfate, na.rm = TRUE)
    } else{
        mymean <- mean(obsDataFrame$nitrate, na.rm = TRUE)
    }
    
    return(mymean)

  }


pollutantmean(specdata)





