---
output:
  html_document:
    theme: journal
    toc: true
title: Getting and Cleaning Data
---

## Readme
Demonstrate ability to **Collect**, **Work with**, and **Clean** a data set.

### Project Status:
Completed

### Project Intro/Objective
The purpose of this project is to demonstrate ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can be
used for later analysis.

Completion of [Getting and Cleaning Data
course](https://www.coursera.org/learn/data-cleaning/) towards [Data
Science Specialization
Certification](https://www.coursera.org/specializations/jhu-data-science)

Data processing/transformation scripts are being kept at [GitHub](https://github.com/jayc279/ds-getting-cleaning-data)

### Course Project
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

### Dataset Description
1.  The dataset includes the following files:
    1.  ‘README.txt’
    2.  ‘features_info.txt’: Shows information about the variables used
        on the feature vector.
    3.  ‘features.txt’: List of all features.
    4.  ‘activity_labels.txt’: Links the class labels with their
        activity name.
    5.  ‘train/X_train.txt’: Training set.
    6.  ‘train/y_train.txt’: Training labels.
    7.  ‘test/X_test.txt’: Test set.
    8.  ‘test/y_test.txt’: Test labels.
2.  The following files are available for the train and test data. Their
    descriptions are equivalent.
    1.  ‘train/subject_train.txt’: Each row identifies the subject who
        performed the activity for each window sample. Its range is from
        1 to 30.
    2.  ‘train/Inertial Signals/total_acc_x\_train.txt’: The
        acceleration signal from the smartphone accelerometer X axis in
        standard gravity units ‘g’. Every row shows a 128 element
        vector. The same description applies for the
        ‘total_acc_x\_train.txt’ and ‘total_acc_z\_train.txt’ files for
        the Y and Z axis.
    3.  ‘train/Inertial Signals/body_acc_x\_train.txt’: The body
        acceleration signal obtained by subtracting the gravity from the
        total acceleration.
    4.  ‘train/Inertial Signals/body_gyro_x\_train.txt’: The angular
        velocity vector measured by the gyroscope for each window
        sample. The units are radians/second.

### Repository overview
-   README.md  
-   CodeBook.md  
-   run_analysis.R

## About
[UCI Machine Learning Repository - Human Activity Recognition Using
Smart
Phones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Abstract:** Human Activity Recognition database built from the
recordings of 30 subjects performing activities of daily living (ADL)
while carrying a waist-mounted smartphone with embedded inertial
sensors.

| Data Set Characteristics:  | Multivariate, Time-Series  | Number of Instances:  | 10299 | Area:               | Computer   |
|----------------------------|----------------------------|-----------------------|-------|---------------------|------------|
| Attribute Characteristics: | N/A                        | Number of Attributes: | 561   | Date Donated        | 2012-12-10 |
| Associated Tasks:          | Classification, Clustering | Missing Values?       | N/A   | Number of Web Hits: | 1147512    |

*Refer to site “For Data Set Information”*

### Source

-   Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
-   Smartlab - Non Linear Complex Systems Laboratory
-   DITEN - Università degli Studi di Genova.
-   Via Opera Pia 11A, I-16145, Genoa, Italy.
-   [For more information about this dataset
    contact:](activityrecognition@smartlab.ws)
-   [Smartlab](www.smartlab.ws)

### License:

Use of this dataset in publications must be acknowledged by referencing
the following publication (1)

1.  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
    Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones
    using a Multiclass Hardware-Friendly Support Vector Machine.
    International Workshop of Ambient Assisted Living (IWAAL 2012).
    Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.
November 2012.
