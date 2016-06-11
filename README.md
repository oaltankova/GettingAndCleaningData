# Getting And Cleaning Data - readme.md
author: O.Altankova

## Synopsis
The purpose of this project is to prepare two sets of tidy data that can be used for later analysis. 
Source data for analysis is downloaded from the below URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The requirement is to create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The [CodeBook.md](https://github.com/oaltankova/GettingAndCleaningData/blob/master/CodeBook.md) file explains details around what files are used to prepare the data sets, the processing steps. It also contains data dictionary for the prepared tidy data sets.

## Running the script
To run the script, you just have to download the file **run_analysis.R ** in your working directory in R and execute the command:
```{r}
source(run_analysis.R)
```
**_Note:The script will create in your working directory a new directory named "UCI HAR Dataset". It will will contain unzip files from the [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)._**

## Dependencies
The script file used packages `data.table` and `reshape2`. If you do not have them, then the script `source("run_analysis.R")` will install them automatically.