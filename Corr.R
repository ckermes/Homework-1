corr <- function(directory, threshold = 0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations 
  
  source('complete.R')
  
  debug=FALSE
  
  dirFileList <- list.files(path = directory, full.names = TRUE, pattern = "*.csv")
  
  completeObs <- complete(directory)
 
  thresholdobs <- subset(completeObs, nobs > threshold, select = c(id))
    if (debug == FALSE){
          print("csv IDs at or above threshold")
          print(thresholdobs)
    }
  
  fileNames <- dirFileList[as.integer(unlist(thresholdobs))]
  if (debug == FALSE){
      print('csv file names at or above threshold')
      print(length(fileNames))
          print(fileNames)
          
  corvector <- vector(mode = 'numeric')
  if(length(fileNames)){
    for(i in 1:length(fileNames)){
      tmpdf <- read.csv(fileNames[i])
      corvector <- c(corvector, cor(tmpdf$sulfate, tmpdf$nitrate, use = "complete.obs"))
    }
  }
    
  if(debug == FALSE){
    print('Correlation vector for obs above threshold')
    print(corvector)
  }
  
  return(corvector)
  
  }
}

corr('specdata')

