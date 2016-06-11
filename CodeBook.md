# GettingAndCleaningData - Code Book
author: O.Altankova

## Data source
Source data for analysis is downloaded from the below URL
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

More description of the original dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Used data source files
1. features.txt - List of all features
2. activity_labels.txt - Links the class labels with their activity name
3. Training data:
  + train/X_train.txt - Training set
  + train/y_train.txt - Training labels (id of the activities)
  + train/subject_train.txt - Each row identifies the subject (selected for generating the training data) who performed the activity for each window sample.

4. Test data:
  + test/X_test.txt - Test set
  + test/y_test.txt - Test labels (id of the activities)
  + test/subject_test.txt - Each row identifies the subject (selected for generating the test data) who performed the activity for each window sample.
  
## Transformation details
1. Transform training data: 
  + 1.1. extract from X_train.txt only the measurements on the mean and standard deviation for each measurement
  + 1.2 merge exctracted from from X_train.txt with subjectid from subject_train.txt and activityname (column 2) from activity_labels.txt. 
2. Transform test data: 
  + 2.1. extract from X_test.txt only the measurements on the mean and standard deviation for each measurement
  + 2.2 merge exctracted from from X_test.txt with subjectid from subject_test.txt and activityname (column 2) from activity_labels.txt.
3. Merge data sets from steps 1 and 2 in **tidyData** data frame - merge ALL data
4. Appropriately labels the data set with descriptive variable names:
  + 4.1 Replace "mean()" with "Mean"
  + 4.2 Replace "std()" with "STD"
  + 4.3 Replace leading t with "time"  
  + 4.4 Replace leading f with "frequency"
  + 4.5 Replace "Gyro" with "Gyroscope"
  + 4.6 Replace "Acc" with "Accelerometer"
  + 4.7 Replace "Mag" with "Magnitude"
  + 4.8 Replace "BodyBody" with "Body"
 5. Creates a second, independent **secondTidyData** data frame - tidy data set with the average of each variable for each activityname and each subjectid
 
## Data dictionary
* subjectid - id of the subject who performed the activity
* activityname - activity name that the subject performed. Activities are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

**_Features:_**

* timeBodyAccelerometer-Mean-X - Mean for time doman Body Accelration in X direction
* timeBodyAccelerometer-Mean-Y - Mean for time doman Body Accelration in Y direction
* timeBodyAccelerometer-Mean-Z - Mean for time doman Body Accelration in Z direction
* timeBodyAccelerometer-STD-X - Standard deviation for time doman Body Accelration in X direction
* timeBodyAccelerometer-STD-Y - Standard deviation for time doman Body Accelration in Y direction
* timeBodyAccelerometer-STD-Z - Standard deviation for time doman Body Accelration in Z direction
* timeGravityAccelerometer-Mean-X - Mean for time doman Gravity Accelration in X direction
* timeGravityAccelerometer-Mean-Y - Mean for time doman Gravity Accelration in Y direction
* timeGravityAccelerometer-Mean-Z - Mean for time doman Gravity Accelration in Z direction
* timeGravityAccelerometer-STD-X - Standard deviation for time doman Gravity Accelration in X direction
* timeGravityAccelerometer-STD-Y - Standard deviation for time doman Gravity Accelration in Y direction
* timeGravityAccelerometer-STD-Z - Standard deviation for time doman Gravity Accelration in Z direction
* timeBodyAccelerometerJerk-Mean-X - Mean for time doman Body Accelration Jerk in X direction
* timeBodyAccelerometerJerk-Mean-Y - Mean for time doman Body Accelration Jerk in Y direction
* timeBodyAccelerometerJerk-Mean-Z - Mean for time doman Body Accelration Jerk in Z direction
* timeBodyAccelerometerJerk-STD-X - Standard deviation for time doman Body Accelration Jerk in X direction
* timeBodyAccelerometerJerk-STD-Y - Standard deviation for time doman Body Accelration Jerk in Y direction
* timeBodyAccelerometerJerk-STD-Z - Standard deviation for time doman Body Accelration Jerk in Z direction
* timeBodyGyroscope-Mean-X - Mean for time doman Body Gyroscope in X direction
* timeBodyGyroscope-Mean-Y - Mean for time doman Body Gyroscope in Y direction
* timeBodyGyroscope-Mean-Z - Mean for time doman Body Gyroscope in Z direction
* timeBodyGyroscope-STD-X - Standard deviation for time doman Body Gyroscope in X direction
* timeBodyGyroscope-STD-Y - Standard deviation for time doman Body Gyroscope in Y direction
* timeBodyGyroscope-STD-Z - Standard deviation for time doman Body Gyroscope in Z direction
* timeBodyGyroscopeJerk-Mean-X - Mean for time doman Body Gyroscope Jerk in X direction
* timeBodyGyroscopeJerk-Mean-Y - Mean for time doman Body Gyroscope Jerk in Y direction
* timeBodyGyroscopeJerk-Mean-Z - Mean for time doman Body Gyroscope Jerk in Z direction
* timeBodyGyroscopeJerk-STD-X - Mean for time doman Body Gyroscope Jerk in X direction
* timeBodyGyroscopeJerk-STD-Y - Mean for time doman Body Gyroscope Jerk in Y direction
* timeBodyGyroscopeJerk-STD-Z - Mean for time doman Body Gyroscope Jerk in Z direction
* timeBodyAccelerometerMagnitude-Mean - Mean Value for time doman Body Accelration magnitude
* timeBodyAccelerometerMagnitude-STD - Standard deviation Value for time doman Body Accelration magnitude
* timeGravityAccelerometerMagnitude-Mean - Mean Value for time doman Gravity Accelration magnitude
* timeGravityAccelerometerMagnitude-STD - Standard deviation Value for time doman Gravity  Accelration magnitude
* timeBodyAccelerometerJerkMagnitude-Mean - Mean Value for time doman Body Accelration Jerk magnitude
* timeBodyAccelerometerJerkMagnitude-STD - Standard deviation Value for time doman Body Accelration Jerk magnitude
* timeBodyGyroscopeMagnitude-Mean - Mean Value for time doman Body Gyroscope magnitude
* timeBodyGyroscopeMagnitude-STD - Standard deviation Value for time doman Body Gyroscope magnitude
* timeBodyGyroscopeJerkMagnitude-Mean - Mean Value for time doman Body Gyroscope Jerk magnitude
* timeBodyGyroscopeJerkMagnitude-STD - Standard deviation Value for time doman Body Gyroscope Jerk magnitude          
* frequencyBodyAccelerometer-Mean-X - Mean for frequency doman Body Accelration in X direction
* frequencyBodyAccelerometer-Mean-Y - Mean for frequency doman Body Accelration in Y direction
* frequencyBodyAccelerometer-Mean-Z - Mean for frequency doman Body Accelration in Z direction
* frequencyBodyAccelerometer-STD-X - Standard deviation for frequency doman Body Accelration in X direction
* frequencyBodyAccelerometer-STD-Y - Standard deviation for frequency doman Body Accelration in Y direction
* frequencyBodyAccelerometer-STD-Z - Standard deviation for frequency doman Body Accelration in Z direction      
* frequencyBodyAccelerometerJerk-Mean-X - Mean for frequency doman Body Accelration Jerk in X direction
* frequencyBodyAccelerometerJerk-Mean-Y - Mean for frequency doman Body Accelration Jerk in Y direction
* frequencyBodyAccelerometerJerk-Mean-Z - Mean for frequency doman Body Accelration Jerk in Z direction      
* frequencyBodyAccelerometerJerk-STD-X - Standard deviation for frequency doman Body Accelration Jerk in X direction
* frequencyBodyAccelerometerJerk-STD-Y - Standard deviation for frequency doman Body Accelration Jerk in Y direction
* frequencyBodyAccelerometerJerk-STD-Z - Standard deviation for frequency doman Body Accelration Jerk in Z direction    
* frequencyBodyGyroscope-Mean-X - Mean for frequency doman Body Gyroscope in X direction
* frequencyBodyGyroscope-Mean-Y - Mean for frequency doman Body Gyroscope in Y direction
* frequencyBodyGyroscope-Mean-Z - Mean for frequency doman Body Gyroscope in Z direction   * frequencyBodyGyroscope-STD-X - Standard deviation for frequency doman Body Gyroscope in X direction
* frequencyBodyGyroscope-STD-Y - Standard deviation for frequency doman Body Gyroscope in Y direction
* frequencyBodyGyroscope-STD-Z - Standard deviation for frequency doman Body Gyroscope in Z direction   
* frequencyBodyAccelerometerMagnitude-Mean - Mean Value for frequency doman Body Accelration magnitude
* frequencyBodyAccelerometerMagnitude-STD - Standard deviation Value for frequency doman Body Accelration magnitude   
* frequencyBodyAccelerometerJerkMagnitude-Mean - Mean Value for frequency doman Body Accelration Jerk magnitude
* frequencyBodyAccelerometerJerkMagnitude-STD - Standard deviation Value for frequency doman Body Accelration Jerk magnitude     
Accelration Jerk magnitude
* frequencyBodyGyroscopeMagnitude-Mean - Mean Value for frequency doman Body Gyroscope magnitude
* frequencyBodyGyroscopeMagnitude-STD - Standard deviation Value for frequency doman Body Gyroscope magnitude
* frequencyBodyGyroscopeJerkMagnitude-Mean - Mean Value for time doman Body Gyroscope Jerk magnitude
* frequencyBodyGyroscopeJerkMagnitude-STD - Standard deviation Value for time doman Body Gyroscope Jerk magnitude    

**tidyData:**
Contains the data described above for each window.

**secondTidyData:**
Contains the data described above, but aggregated with the average of each feature for each activityname and each subjectid.

