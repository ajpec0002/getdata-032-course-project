## Introduction

The goal of this course project is to clean and transform a raw dataset into a tidy data set.
It uses the <i>Human Activity Recognition Using Smartphones Data Set</i> from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. 

Here are the specific requirements:


1. Merge the train and test datasets.

2. Extract only the measurements on the mean and standard deviation for each measurement. 

3. Use descriptive activity names to name the activities in the data set.

4. Label the data set with descriptive variable names. 

5. Get the average for each variable grouped by activity and subject and write the output to a file.

## Included Files 

* <b>run_analysis.R</b> This is the R script that implements the steps to generate the tidy data.

* <b>CodeBook.md</b> Describes the raw data and the transformation or work that was performed to clean up the data.

## A Closer Look On run_analysis.R

The R script run_analysis.R consists of several functions that works together to implement the specified requirements for tidy data:

* <b>main()</b> This is the main entry point of the program. It calls the sub-functions that process the raw data to generate the required tidy data.

* <b>extractRawData()</b> This function extracts the UCI HAR Dataset.zip in the current working directory. It will try to download the zip file from the url specified in the course project in case the zip file is not present in the current working directory.

* <b>getMergedDataSet()</b> This function combines the X_ (accelerometer and gyroscope readings), y_ (type of activity), and subject_ (the subject performing the activity) variables given the dataset type (either "train" or "test"). This function will be called two times; once for "train" and "test". The two results will then be combined to create the merged dataset specified in requirement # 1.

* <b>getMeanAndStdDataSet()</b> This function extracts the Mean and Standard Deviation variables from the merged dataset (requirement # 2). It uses the following logic to determine the mean and standard deviation variables: <br>
<ol>
  <li>mean: all variables containing "mean()" in the name</li>
  <li>std: all variables containing "std()" in the name</li>
</ol>
Note: There are other variables with string "mean" or "std" in them but they are excluded. Only the exact match to the condition above is included.<br>
This function also handles the formatting of the variable names so they will be more readable (requirement # 4).

* <b>addActivityName()</b> This function adds the activity name in the output dataset (requirement # 3).

* <b>generateTidyData()</b> This function generates the tidy dataset and write the output to a file (requirement # 5).







