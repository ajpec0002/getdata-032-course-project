## CodeBook

## Raw Data

The raw data for this project is accelerometer and gyroscope data collected from the Samsung Galaxy S II smartphone:

Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

features.txt
Contains the 561 variable names for all the accelerometer and gyroscope measurements

There are 3 types of files:

X: rows of feature measurements
y: the activity labels corresponding to each row of X. Encoded as numbers.
subject: the subjects on which each row of X was measured. Encoded as numbers.
In addition, to determine which features are required, we look at the list of features:



activity_labels.txt
Data load

The Y, S and X data is loaded from each of the training and test datasets, directly as their final type.
Only the columns of interest from X are loaded, that is the mean() and sd() columns. We determine the columns by examining the feature names (from features.txt) for patterns “-mean()” or “-std()”.
All of these files are fixed format text files.

Transformation

The activity descriptions are joined to the activity label data (y).
The corresponding training and test datasets are concatenated, and then columns for subject and activitylabel (description) are appended (by row number) to the data.
This result is output as result_combinedDataSet.csv.

The data is further subsetted to only include the activity, subject, and the mean() features. Again these are determined by looking for “-mean()” in the feature name.
The data is then reduced with ddply() to (activity,subject) -> colMeans()
As it was not specified, missing combinations of activity and subject are output, with value NA.
The column names are tidied by removing the “mean()” string, etc.
This result is output as result_meanByActivityAndSubject.csv
