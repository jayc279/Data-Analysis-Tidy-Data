# check_packages ----------------------------------------------------------
# if package is not installed, install and load into session
## Load libraries "dplyr" and "data.table"
if (!require("data.table")) install.packages("data.table")
library(data.table)

if (!require("dplyr")) install.packages("dplyr")
library(dplyr)


## set some defaults
options(tab.width = 4)
options(width=105)

# Read Zip File ----------------------------------------------------------
zipFile = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./UCI HAR Dataset.zip")){
  download.file(zipFile,"./UCI HAR Dataset.zip", mode = "wb")
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}

# List of files needed for Analysis ----------------------------------------------------------
## 'features_info.txt': Shows information about the variables used on the feature vector.
## 'features.txt': List of all features.
## 'activity_labels.txt': Links the class labels with their activity name.
## 'train/X_train.txt': Training set.
## 'train/y_train.txt': Training labels.
## 'test/X_test.txt': Test set.
## 'test/y_test.txt': Test labels.
## 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

# Training, Test, Subject data ----------------------------------------------------------
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.csv("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = " ")
train_subject <- read.csv("./UCI HAR Dataset/train/subject_train.txt",header = FALSE, sep = " ")

test_X <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = " ")
test_subject <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = " ")

## Create a TRAINING  dataframe including subject who performed the activity, labels, dataset
train_data <-  data.frame(train_subject, train_y, train_X)

## File "features.txt" from dataset has no header and columns values are separated by <spaces>
## Column one contains increasing order of numeric values, and column 2 contains feature names
features <- read.csv("./UCI HAR Dataset/features.txt", header = FALSE, sep = " ")

## Convert "data.frame" class to "character" class
features <- as.character(features[,2])

## Add Column Names for the new TRAINING dataframe
names(train_data) <- c(c("subject", "activity"), features)

## Similarly for TEST dataframe
## Create dataframe including subject who performed the activity, labels, dataset
test_data <-  data.frame(test_subject, test_y, test_X)

## Add Column Names for the new TEST dataframe
names(test_data) <- c(c("subject", "activity"), features)

## 1. Merges the training and the test sets to create one data set.
## Since both data sets match in names of column names, use "rbind" to combine dataframes
full_data_set <- rbind(train_data, test_data)

# Mean and Standardard Deviation ----------------------------------------------------------
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## grep columns mean -OR- std from features variables in list
measure_mean_sd <- grep("mean|std", features)

## Create a data.frame with only the first 2 columns and "measure_mean_std" - integer class
## Add '2' since we have added "subject" and "activity" columns to "full_data_set" data.frame
data_mean_sd <- full_data_set[,c(1,2,measure_mean_sd + 2)]

# Get Descriptive Names ----------------------------------------------------------
## 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

## Get "column 2" values and convert to character class
activity_labels <- as.character(activity_labels[,2])
data_mean_sd$activity <- activity_labels[data_mean_sd$activity]

# Appropriate Labels for DataSet ----------------------------------------------------------
## 4. Appropriately labels the data set with descriptive variable names.
## Capture names to a new vector to clean up and create descriptive names
new_names <- names(data_mean_sd)

## Remove all open/close braces (), "-" -to- "_", ^f to Frequency_Domain_
## ^t -to- Time_Domain_, Acc -to- Accelerometer, etc...
new_names <- gsub("[(][)]", "", new_names)
new_names <- gsub("-", "_", new_names)
new_names <- gsub("^t", "Time_Domain_", new_names)
new_names <- gsub("^f", "Frequency_Domain_", new_names)
new_names <- gsub("Acc", "Accelerometer", new_names)
new_names <- gsub("Gyro", "Gyroscope", new_names)
new_names <- gsub("Mag", "Magnitude", new_names)
new_names <- gsub("mean", "Mean", new_names)
new_names <- gsub("std", "StandardDeviation", new_names)

## Overwrite column names of "data_mean_sd" data.frame
names(data_mean_sd) <- new_names

# Tidy Data Set with Average for each Variable ----------------------------------------------------------
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(data_mean_sd[,3:81], by = list(activity = data_mean_sd$activity, subject = data_mean_sd$subject),FUN = mean)
write.table(x = tidy_data, file = "tidy_data.txt", row.names = FALSE)


