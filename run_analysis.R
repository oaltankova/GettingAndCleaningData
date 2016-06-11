## Source data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## The goal is to prepare 2 tidy data sets that can be used for later analysis:
## - tidyData data set: 1. Merges the training and the test sets
##                      2. Extracts only the measurements on the mean and 
##                         standard deviation for each measurement
##                      3. Uses descriptive activity names to name 
##                         the activities in the data set
##                      4. Appropriately labels the data set with descriptive
##                         variable names
## - avgTidyData.txt text file:average of each variable for each activity 
##                             and each subject from the tidyData data set
print("Load packages")
## Used packages
if (!library(data.table, logical.return = TRUE)){
        install.packages("data.table")
        library(data.table)
}
if (!library(reshape2, logical.return = TRUE)){
        install.packages("reshape2")
        library(reshape2)
}

print("Downloading zip file")
## Download and unzip file with source data
if(file.exists("SourceDataset.zip")) {
        file.remove("SourceDataset.zip")
}

if(dir.exists("./UCI HAR Dataset")) {
        unlink("./UCI HAR Dataset", recursive = TRUE)
}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile="SourceDataset.zip")
print("Unzip file")
unzip(zipfile = "SourceDataset.zip")
file.remove("SourceDataset.zip")

## Get feature names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
## Get activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
##Features to be selected
selected_features <- grep("(mean\\(\\)|std\\(\\))", features)

## Function for processing all test/train data files.
## Returns data frame with processed test/train data
processDataFiles <- function (xtest, ytest, subjects){
        names(xtest) <- features
        
        # 2. Extracts only the measurements on the mean and standard 
        #    deviation for each measurement
        xtest <- subset(xtest, select=selected_features)
        
        # 3. Uses descriptive activity names to name the activities 
        #    in the data set
        cbind("subjectid" = subjects[,1], 
              "activityname" = activity_labels[ytest[,1]], 
              xtest)
}

print("Get and process test data")
## Get and process test data
testData <- processDataFiles(
        xtest = read.table("./UCI HAR Dataset/test/X_test.txt"),
        ytest = read.table("./UCI HAR Dataset/test/y_test.txt"),
        subjects = read.table("./UCI HAR Dataset/test/subject_test.txt")
)

print("Get and process train data")
## Get and process train data  
trainData <- processDataFiles(
        xtest = read.table("./UCI HAR Dataset/train/X_train.txt"),
        ytest = read.table("./UCI HAR Dataset/train/y_train.txt"),
        subjects = read.table("./UCI HAR Dataset/train/subject_train.txt")
)

print("Merges the training and the test sets to create one tidyData data set")
## 1. Merges the training and the test sets to create one tidyData data set
tidyData <- merge(trainData, testData, all = TRUE)

print("Remove objects that will not be used")  
#remove objects that will not be used
remove(testData, trainData, features, activity_labels, selected_features)

print("Appropriately labels the tidyData data set with descriptive variable names")  
## 4. Appropriately labels the tidyData data set with descriptive variable names
names <- names(tidyData)
names <- gsub("mean\\(\\)", "Mean", names)
names <- gsub("std\\(\\)", "STD", names)
names <- gsub("^t([BG])", "time\\1", names)
names <- gsub("^f([BG])", "frequency\\1", names)
names <- gsub("Gyro([A-Z]|(\\-))", "Gyroscope\\1", names)
names <- gsub("Acc([A-Z]|(\\-))", "Accelerometer\\1", names)
names <- gsub("Mag([A-Z]|(\\-))", "Magnitude\\1", names)
names <- gsub("BodyBody", "Body", names)
names(tidyData) <- names
remove(names)

print("Creates a second, independent secondTidyData tidy data set with the  
      average of each variable for each activity and each subject.")  
## 5. Creates a second, independent tidy data set with the average of
##    each variable for each activity and each subject.
##    The second tidy data 
meltdata<-melt(tidyData, id=1:2, measure.var=3:ncol(tidyData))
secondTidyData <- dcast(meltdata, subjectid+activityname~variable, mean)