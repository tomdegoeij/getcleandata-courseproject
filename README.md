getcleandata-courseproject
==========================

Description
-----------
This is a repository supporting the [Getting and Cleaning Data course on Coursera](https://class.coursera.org/getdata-003). run_analysis.R can be used when the contents of the zipped UCI HAR dataset as provided on the Coursera project page is in the working directory of R.

Usage
-----
Load the R script in R using the following command:
`source("run_analysis.R")
This will use the data from the UCI HAR dataset to create two data frames:
* DataSet: A data frame containing all observations in both the training subjects and test subjects, for all six types of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Only the variables that contain information regarding the mean or standard deviation for a given measurement are taken into account. The first column in the dataset contains the subject ID, the second column contains the activity name, the columns 3 to 68 contain the means and standard deviations of the various measuremens.
* TidyDataSet: Same as DataSet, but for every unique combination of subject and activity there is only one record, containing the means of the measurements from DatSet. In other words: the means of the mean measurements and the means of the standard deviation, per unique combination of subject and activity.