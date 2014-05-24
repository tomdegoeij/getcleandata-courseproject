## Read labels from files
ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("Number","Label"))
Features <- read.table("UCI HAR Dataset/features.txt", col.names=c("Number", "Label"))

## Read data from files and apply column names
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="Subject")
XTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=gsub("[^a-zA-Z]", "", Features$Label, perl=TRUE))
YTest <- read.table("UCI HAR Dataset/test/y_test.txt",col.names="Activity")
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="Subject")
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names=gsub("[^a-zA-Z]", "", Features$Label, perl=TRUE))
YTrain <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity")

## Combine data
TotalTest <- cbind(SubjectTest,YTest,XTest)
TotalTrain <- cbind(SubjectTrain, YTrain, XTrain)
DataSet <- rbind(TotalTest,TotalTrain)

## Apply descriptive activity names
DataSet$Activity <- ActivityLabels$Label[match(DataSet$Activity,ActivityLabels$Number)]

## Only include data on means and standard deviations
DataSet <- DataSet[,c("Subject", "Activity", grep(".meanFreq",grep(".mean|.std", names(DataSet), value = TRUE),value=TRUE, invert=TRUE))]

## Create empty tidy data set
TidyDataSet <- DataSet[0,]

## Split data set by subjects and activities
DataSetSplit <- split(DataSet, list(DataSet$Subject, DataSet$Activity))

## Calculate means for every combination of subjects and activities and add to tidy data set
for (i in 1:(length(DataSetSplit))) {
        ListItem <- colMeans(DataSetSplit[[i]][3:68],na.rm=TRUE)
        ListItem <- cbind(DataSetSplit[[i]][1,1:2],t(as.data.frame(ListItem)))
        TidyDataSet <- rbind(TidyDataSet,ListItem)
}

## Apply descriptive row and column names
row.names(TidyDataSet) <- NULL
AvgColNames <- paste("Avg",colnames(TidyDataSet), sep="")
colnames(TidyDataSet)[3:68] <- AvgColNames[3:68]

## Remove unnecesary objects
rm(XTest, YTest, XTrain, YTrain, ActivityLabels,Features,SubjectTest, SubjectTrain, TotalTest, TotalTrain, ListItem, DataSetSplit, i, AvgColNames)