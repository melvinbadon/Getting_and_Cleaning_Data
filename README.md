#Getting and Cleaning Data

###A Course Project

---

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


###Steps to work on this course project

1. Download the [project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and exract it into your R working directory. A sub-folder named **UCI HAR Dataset** will be created in the working diectory. Check that inside the **UCI HAR Dataset** sub-folder you will find two (2) sub-folders named **test** and **train**.
2. Make sure that the file **run_analysis.R** is in the **R** working directory.
3. On the **R prompt** type **source("run_analysis.R")**
4. Type the **run_analysis()** on the **R prompt**. After executing the code a new file ***tiny_data.txt*** will be generated in the working directory.

###Dependencies

**run_analysis.R** require the packages **reshape2** and **data.table**. It will check if the required packages are already installed. If not yet installed, it will install the required packages automatically.