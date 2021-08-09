---
output:
  html_document:
    theme: journal
    toc: true
title: Getting and Cleaning Data
---

## CodeBook
This is a CodeBook of run_analysis.R listing steps taken to complete the project

## DataSet and Contents
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

### Getting Started - List of steps to complete project
1. create a R script "run_analysis.R"
2. Load dependencies
    1. data.table
    2. dplyr
3. code to unzip data in file
    1.  Raw Data in zip format is being kept [d396qusza40orc.cloudfront.net](https://d396qusza40orc.cloudfront.net%2Fgetdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
4. Merges the training and the test sets to create one data set.
5. Add column names subject, activity, and from features.txt file
6. combine both train and test dataframes
7.  Extracts only the measurements on the mean and standard deviation for each measurement.
8.  Uses descriptive activity names to name the activities in the data set
9.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.
10. Write tidy data to a file

