run_analysis <- function() {

## check for the required packages and install if missing
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}


## load packages
require("data.table")
require("reshape2")

## Load activity labels
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]


## Load variable names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]


## Get the the mean and standard deviation for each measurement.
extractfeatures <- grepl("mean|std", features)


## Load and process X_test & y_test data.
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(Xtest) <- features


## Get mean and standard deviation for each measurement.
Xtest <- Xtest[,extractfeatures]


## Get activity labels
ytest[,2] <- activitylabels[ytest[,1]]
names(ytest) <- c("Activity_ID", "Activity_Label")
names(subjecttest) <- "subject"


## Bind data column
testdata <- cbind(as.data.table(subjecttest), ytest, Xtest)


## Load and process X_train & y_train data.
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(Xtrain) <- features


## Get the mean and standard deviation for each measurement.
Xtrain <- Xtrain[,extractfeatures]


## Get activity data
ytrain[,2] <- activitylabels[ytrain[,1]]
names(ytrain) <- c("Activity_ID", "Activity_Label")
names(subjectTrain) <- "subject"


## Bind data column
traindata <- cbind(as.data.table(subjectTrain), ytrain, Xtrain)


## Merge test and train data
data <- rbind(testdata, traindata)


idlabel <- c("subject", "Activity_ID", "Activity_Label")
datalabel <- setdiff(colnames(data), idlabel)
meltdata  <- melt(data, id = idlabel, measure.vars = datalabel)


# Apply mean function to dataset using dcast function
tidy_data <- dcast(meltdata, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
}
