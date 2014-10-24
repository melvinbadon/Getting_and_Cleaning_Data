##Code Book

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

###The data

1. Original data: (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Original description of the dataset: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###The data

**The dataset includes the following files:**

* *README.txt*

* *features_info.txt*: describes the variables used on the feature vector.

* *features.txt*: List of all features.

* *activity_labels.txt*: List of activity names.

* *train/X_train.txt*: Training set.

* *train/y_train.txt*: Training labels.

* *test/X_test.txt*: Test set.

* *test/y_test.txt*: Test labels.


**The following files are available for the train and test data. Their descriptions are as follows.**

* *train/subject_train.txt*: represents the subject who performed the activity for each window sample, with a range 1 to 30.

* *train/Inertial Signals/total_acc_x_train.txt*: X-axis component of the acceleration signal from the smartphone's accelerometer in standard gravity units **"g"** which is a vector of 128 elements.

* *total_acc_y_train.txt*: Y-axis component of the acceleration signal from the smartphone's accelerometer in standard gravity units **"g"** which is a vector of 128 elements.

* *total_acc_z_train.txt*: Z-axis component of the acceleration signal from the smartphone's accelerometer in standard gravity units **"g"** which is a vector of 128 elements.

* *train/Inertial Signals/body_acc_x_train.txt*: actual body acceleration signal derived by subtracting the acceleration due to gravity from the total acceleration.

* *train/Inertial Signals/body_gyro_x_train.txt*: The angular velocity vector measured by the gyroscope for each window sample in radians/second.

###Transformation details

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###How run_analysis.R implements the above steps:

* Load libraries **reshape2** and **data.table**.
* Load **test** and **train data**
* Load **features** and **activity labels**.
* Extract the mean and standard deviation, column names, and data.
* Process the data. There are two parts:
    + process test data.
    + process train data.
* Merge the data sets.