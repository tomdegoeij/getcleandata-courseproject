## Download data files
##download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip",method="curl")

## Unpack data files
##unzip("data.zip")

## Read labels from files
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("Number","Label"))
Features <- read.table("UCI HAR Dataset/features.txt", col.names=c("Number", "Label"))

## Read data from files and apply column names
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="Subject")
XTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=Features$Label)
YTest <- read.table("UCI HAR Dataset/test/y_test.txt",col.names="Activity")
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="Subject")
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=Features$Label)
YTrain <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity")

## Combine data
TotalTest <- cbind(SubjectTest,YTest,XTest)
TotalTrain <- cbind(SubjectTrain, YTrain, XTrain)
DataSet <- rbind(TotalTest,TotalTrain)

## Apply descriptive activity names
DataSet$Activity <- ActivityLabels$Label[match(DataSet$Activity,ActivityLabels$Number)]

## Only include data on means and standard deviations
DataSet <- DataSet[,c("Subject", "Activity", grep(".meanFreq",grep(".mean|.std", names(DataSet), value = TRUE),value=TRUE, invert=TRUE))]

## Create tidy data set
TidyDataSet <- 

## Remove unnecesary objects
##rm(XTest, YTest, XTrain, YTrain, ActivityLabels,Features,SubjectTest, SubjectTrain, TotalTest, TotalTrain)