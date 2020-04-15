complete <- function(directory, id = 1:332){
  
  ##'directory' is a character vector of length 1
  ##indicating the location of the CSV files
  
  ##id is an integer vector indicating the monitor ID 
  ##numbers to be used
  
  
  dirFiles <- list.files(path = directory, full.names = TRUE, pattern = "*.csv")
  
  #keep only the files that are selected in the id parameter
  fileNames <- list()
  fileNames <- dirFiles[id]
  
  #Read each CSV file 
  obsDataFrame <- data.frame()
  csvCol <- c("Date","sulfate", "nitrate","ID")
  for (i in 1:length(fileNames)) {
    tmpDF <- read.csv(fileNames[i])
    obsDataFrame <- rbind(obsDataFrame, c(tmpDF$ID[1],nrow(tmpDF[complete.cases(tmpDF[csvCol]), csvCol])))
  }
  ##Return a data frame of the form:
  ##id  nobs
  ##1   117
  ##2   1041
  ##......
  ##where 'id' is the monitor id number and 'nobs' is the 
  ##number of complete cases
  
  colnames(obsDataFrame) <- c("id", "nobs")
  return (obsDataFrame)
  
}

complete("specdata")




