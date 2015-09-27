## Code Book

1. The raw data for this project comes from the following url: <br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. A full description of the dataset is available at the following url: <br>
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

3. Once you downloaded the raw data and extracted it, you will find a file named "features_info.txt" under the main folder. This file contains the description of each variable or feature that was measured in the dataset.

4. The output tidy dataset contains the summary of the mean and standard deviation variables. This is extracted based on the definition of mean and standard deviation in "features_info.txt".<br>
E.g. <br>
mean(): Mean value<br>
std(): Standard deviation<br>

The variables were formatted slightly to make them valid R variable names.<br>


Here's a sample extract for subject 1 for activity name "LAYING". It highlights the variable names used and the value format in the tidy dataset. Please refer to the "features_info.txt" for the meaning of each measurement variable.<br>
<table>
<tr>
<td><b>Variable Name</b></td>
<td><b>Variable Value</b></td>
</tr>
<tr>
<td>subject</td>
<td>Variable Value</td>
</tr>
<tr>
<td>activity_Name</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tBodyAcc_mean_X</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tBodyAcc_mean_Y</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tBodyAcc_mean_Z</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tBodyAcc_std_X</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tBodyAcc_std_Y</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tBodyAcc_std_Z</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tGravityAcc_mean_X</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tGravityAcc_mean_Y</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tGravityAcc_mean_Z</td>
<td>Variable Value</td>
</tr>
<tr>
<td>tGravityAcc_std_X</td>
<td>Value</td>
</tr>
<tr>
<td>tGravityAcc_std_Y</td>
<td>Value</td>
</tr>
<tr>
<td>tGravityAcc_std_Z</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerk_mean_X</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerk_mean_Y</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerk_mean_Z</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerk_std_X</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerk_std_Y</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerk_std_Z</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyro_mean_X</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyro_mean_Y</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyro_mean_Z</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyro_std_X</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyro_std_Y</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyro_std_Z</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerk_mean_X</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerk_mean_Y</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerk_mean_Z</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerk_std_X</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerk_std_Y</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerk_std_Z</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>tGravityAccMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>tGravityAccMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerkMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyAccJerkMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerkMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>tBodyGyroJerkMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAcc_mean_X</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAcc_mean_Y</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAcc_mean_Z</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAcc_std_X</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAcc_std_Y</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAcc_std_Z</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccJerk_mean_X</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccJerk_mean_Y</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccJerk_mean_Z</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccJerk_std_X</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccJerk_std_Y</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccJerk_std_Z</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyGyro_mean_X</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyGyro_mean_Y</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyGyro_mean_Z</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyGyro_std_X</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyGyro_std_Y</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyGyro_std_Z</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyAccMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyBodyAccJerkMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyBodyAccJerkMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyBodyGyroMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyBodyGyroMag_std</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyBodyGyroJerkMag_mean</td>
<td>Value</td>
</tr>
<tr>
<td>fBodyBodyGyroJerkMag_std</td>
<td>Value</td>
</tr>
</table>



