################################################################################################################################################################################################################
##
## Description:
## 
## This R script generates a tidy dataset from the "Human Activity Recognition Using Smartphones Data Set" 
## The tidy dataset contains the average of all the mean and standard deviation variables grouped by Subject and Activity.
##
################################################################################################################################################################################################################


#load dplyr library
library(dplyr)

#This function extracts the UCI HAR dataset zip in the current working directory.
#In case the zip does not exists yet, it will try to download it using the url specified in the course project.
extractRawData <- function() {
  print("calling extractRawData() ...")
  
  #UCI HAR Dataset Folder
  #This is the name of the folder when the UCI HAR dataset is unzipped
  uciHarDataSetFolder <-  "UCI HAR Dataset"
  
  # Get the absolute path of the UCI HAR dataset zip
  zipFileDataSet <- paste(getwd(),paste(uciHarDataSetFolder,"zip",sep="."),sep="/")
  
  # Check if UCI HAR dataset zip already exists
  if(!file.exists(zipFileDataSet)) {
    
    #Try to download it if it does not exists yet
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = zipFileDataSet, method = "curl")
 
   }
  
  #Extract the UCI HAR dataset zip
  unzip(zipFileDataSet)

  #Set the current working directory to the folder generated from unzipping the UCI HAR dataset zip
  setwd(paste(getwd(),uciHarDataSetFolder,sep="/"))
}

# This function combines the X_ (accelerometer and gyroscope readings), y_ (type of activity), 
# and subject_ (the subject performing the activity) variables given the dataset type (either "train" or "test").
# It returns the merged dataset.
getMergedDataSet <- function(dataSetType) {
  
  print(paste("calling getMergedDataSet(",dataSetType,") ..."),sep="")
  
  # Read the X_ (accelerometer and gyroscope readings) variables for the given dataset type
  xDF <- read.table(paste(getwd(),dataSetType,paste("X_",dataSetType,".txt",sep=""),sep="/"))
  
  # Read the y_ (type of activity) variables for the given dataset type
  yDF <- read.table(paste(getwd(),dataSetType,paste("y_",dataSetType,".txt",sep=""),sep="/"))
  
  # Read the subject_ (the subject performing the activity)  variables for the given dataset type
  subjectDF <- read.table(paste(getwd(),dataSetType,paste("subject_",dataSetType,".txt",sep=""),sep="/"))
  
  # Merge the three datasets
  mergedDF <- cbind(subjectDF,yDF,xDF)
  
  # Return the merged dataset
  mergedDF
  
}

# This function extracts the Mean and Standard Deviation variables from the merged dataset.
# It uses the following logic to determine the mean and standard deviation variables:
# mean: all variables containing "mean()" in the name
# std: all variables containing "std()" in the name
getMeanAndStdDataSet <- function(mergedDF) {
  
  print("calling getMeanAndStdDataSet() ...")
  
  # Read the features dataset
  featuresDF <- read.table(paste(getwd(),"features.txt",sep="/"))
  
  # Get the column names of the features
  colNamesDF <- featuresDF$V2
  
  # An arbitrary replace string. Any string that is not present in the features column names can be used.
  # It is used to create a tidy variable name and extract the mean and standard deviation columns
  regexReplaceSTR <- "DUMMY"
  
  # Replace the "()" with the replace string
  colNamesDF <- gsub("*std\\(\\)*",paste("std",regexReplaceSTR,sep=""),colNamesDF)
  colNamesDF <- gsub("*mean\\(\\)*",paste("mean",regexReplaceSTR,sep=""),colNamesDF)
  
  # Format the feature column names into a valid one using make.names()
  colNamesDF <- make.names(colNamesDF, unique = TRUE)
  
  
  # Set the column names for the merged dataset using the formatted columns names from features dataset
  # The subject and activity id column names are also added in front respectively since the merged dataset already contains these two columns as well
  # These two columns are also appended with the replace string so they will also be included in the extraction in the next step
  names(mergedDF) <- c(paste("subject",regexReplaceSTR,sep=""),paste("activity.Id",regexReplaceSTR,sep=""),colNamesDF)
  
  # Select the columns that contains the replace string. These are the subject, activity id, mean and standard deviation columns
  meanAndStdDF <- select(mergedDF, contains(regexReplaceSTR))
  
  # Remove the replace string from the column names. They are no longer needed at this point.
  names(meanAndStdDF) <- gsub(regexReplaceSTR,"",names(meanAndStdDF)) 
  
  # Return the dataset containing the subject, activity id, mean and standard deviation columns
  meanAndStdDF
}

# This function adds the activity name from the activity_labels dataset.
addActivityName <- function(meanAndStdDF) {
  
  print("calling addActivityName() ...")
  
  # Read the activity labels dataset
  activityLabelsDF <- read.table(paste(getwd(),"activity_labels.txt",sep="/"))
  
  # Set the column names to "activity.Id","activity.Name"
  names(activityLabelsDF) <- c("activity.Id","activity.Name")
  
  # Merge the mean and std dataset  with the activity labels dataset using the activity id 
  meanAndStdDF <- merge(meanAndStdDF,activityLabelsDF,by.x="activity.Id",by.y = "activity.Id",all=TRUE)
  
  # Drop the activity id column as it is no longer needed.
  meanAndStdDF$activity.Id <- NULL
  
  # Return the mean and std dataset with the activity name included
  meanAndStdDF
  
  
}

# This function generate the tidy dataset and write it to a file
generateTidyData <- function(meanAndStdDF){
  
  print("calling generateTidyData() ...")
  
  # Set tidy dataset
  tidyDF <- meanAndStdDF %>% 
            # Group by subject and activity name
            group_by(subject,activity.Name) %>% 
            # Get the mean of each variables
            summarise_each(funs(mean)) %>% 
            # Sort result by subject and activity name
            arrange(subject,activity.Name)

  # Tidy data name
  tidyDataFileName <- "tidydata.txt"
  
  # Write the tidy data to a file
  write.table(tidyDF,file=tidyDataFileName,row.names=FALSE)
  
  print(paste("Tidy data generated successfully :",paste(getwd(),tidyDataFileName,sep="/")))

}

# The main function
main <- function() {
  
  print("Starting analysis...")
  
  workDirPath <- "/Users/adrian/tmp"
  setwd(workDirPath)
  
  print(paste("Using current working directory :", getwd()))
  
  #Call extractRawData
  extractRawData()
  
  #Call getMergedDataSet for "train"
  trainMergedDF <- getMergedDataSet("train")
  
  #Call getMergedDataSet for "test"
  testMergedDF <- getMergedDataSet("test")
  
  # Combine the train and test merged datasets
  mergedDF <- rbind(trainMergedDF,testMergedDF)
  
  # Call getMeanAndStdDataSet
  meanAndStdDF <- getMeanAndStdDataSet(mergedDF) 
  
  # Call addActivityName
  meanAndStdDF <- addActivityName (meanAndStdDF)
  
  # Call generateTidyData
  generateTidyData(meanAndStdDF)

  print("Done!")
}

# Run the program
main()



