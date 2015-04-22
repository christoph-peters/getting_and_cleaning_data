#Getting and Cleaning Data Course Project (cousera)

The file run_analysis.R contains the solution for the course project.

##Workflow
1. Download `run_analysis.R` or check out the git repository.
2. In the folder that contains the `run_analysis.R` download the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
   So that the folder data is in the same folder as `run_analysis.R`.
3. Start R and check using getwd() if the working directory is set to the one containing `run_analysis.R` and the dataset. If not run setwd("PathToFolder"). Where "PathToFolder" is the full path to the folder containing the files.
4. Run the script using `source("run_analysis.R")`

##What the script does
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
6. Writes a file containing the tidy dataset.
